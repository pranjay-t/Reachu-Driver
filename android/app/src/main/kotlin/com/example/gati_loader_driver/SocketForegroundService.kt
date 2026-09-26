package com.reachu.driver

import android.Manifest
import android.app.Notification
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.location.Location
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkRequest
import android.os.Build
import android.os.IBinder
import android.os.Looper
import android.os.PowerManager
import android.net.wifi.WifiManager
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.ServiceCompat
import com.google.android.gms.location.*
import io.socket.client.IO
import io.socket.client.Socket
import org.json.JSONObject
import com.google.firebase.crashlytics.FirebaseCrashlytics
import com.reachu.driver.BuildConfig
import com.example.gati_loader_driver.SafeOverlayService
import java.net.URI
import java.text.SimpleDateFormat
import java.util.*

/**
 * Native Android Foreground Service that maintains a Socket.IO connection
 * to the ride server even when the Flutter app is killed.
 */
class SocketForegroundService : Service() {

    companion object {
        private const val TAG = "SocketFGService"

        // Notification IDs & channels (channels created in ReachuDriverApplication.kt)
        const val STATUS_NOTIFICATION_ID = 1
        const val RIDE_NOTIFICATION_ID = 900
        const val CHAT_NOTIFICATION_ID = 950
        const val STATUS_CHANNEL_ID = "reachu_driver_foreground_service"
        const val RIDE_CHANNEL_ID = "ride_request_channel_v10"
        const val CHAT_CHANNEL_ID = "general_notifications_channel"

        // Location update interval (ms)
        private const val LOCATION_INTERVAL_MS = 5000L
        private const val LOCATION_FASTEST_MS = 3000L

        // WakeLock timeout: 30 minutes. Re-acquired periodically.
        private const val WAKELOCK_TIMEOUT_MS = 30 * 60 * 1000L

        // Socket reconnection cap
        private const val MAX_SOCKET_RECONNECT_ATTEMPTS = 200

        // Pref keys — MUST match Flutter's SharedPreferences keys exactly
        private const val PREFS_NAME = "FlutterSharedPreferences"
        private const val PREF_AUTH_TOKEN = "flutter.auth_token"
        private const val PREF_DRIVER_ID = "flutter.driver_userid"
        private const val PREF_DRIVER_NAME = "flutter.driver_name"
        private const val PREF_VEHICLE_TYPE = "flutter.vehicle_type_id"
        private const val PREF_VEHICLE_SUB_TYPE = "flutter.vehicle_SubType"
        private const val PREF_VEHICLE_NUMBER = "flutter.vehicle_id"
        private const val PREF_VEHICLE_IMAGE = "flutter.driver_image"
        private const val PREF_FLEET_ID = "flutter.fleet_id"
        private const val PREF_IS_RIDE_IN_PROGRESS = "flutter.is_ride_in_progress"
        private const val PREF_ACTIVE_RIDE_ID = "flutter.active_ride_id"
        private const val PREF_LAST_RIDE_REQUEST = "flutter.last_ride_request"
        private const val PREF_PENDING_ACCEPT_ORDER_ID = "flutter.pending_accept_order_id"
        private const val PREF_PENDING_DECLINE_ORDER_ID = "flutter.pending_decline_order_id"
        private const val PREF_SOCKET_URL = "flutter.socket_url"

        // Extra keys for intent
        const val EXTRA_ACTION = "action"
        const val ACTION_STOP = "stop"
        const val ACTION_UPDATE = "update"
        const val ACTION_SET_APP_STATE = "set_app_state"
        const val ACTION_ACCEPT_RIDE = "accept_ride"
        const val ACTION_DECLINE_RIDE = "decline_ride"
        const val EXTRA_APP_STATE = "app_state"
        const val EXTRA_TITLE = "title"
        const val EXTRA_BODY = "body"
        const val EXTRA_ORDER_ID = "order_id"
    }

    // Socket
    private var socket: Socket? = null
    private var isSocketConnected = false
    private var isForegroundActive = false

    // Location
    private var fusedLocationClient: FusedLocationProviderClient? = null
    private var locationCallback: LocationCallback? = null
    private var currentLat = 0.0
    private var currentLng = 0.0

    // Locks
    private var wakeLock: PowerManager.WakeLock? = null
    private var wifiLock: WifiManager.WifiLock? = null

    // State
    private var isOnDuty = false
    private var appState = "Foreground" // Foreground | Background | Killed

    // Timers
    private var onlineTimer: Timer? = null
    private var locationEmitTimer: Timer? = null
    private var wakeLockRefreshTimer: Timer? = null

    private val isoDateFormat: SimpleDateFormat by lazy {
        SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US).apply {
            timeZone = TimeZone.getTimeZone("UTC")
        }
    }

    // Network Callback
    private var networkCallback: ConnectivityManager.NetworkCallback? = null

    override fun onCreate() {
        super.onCreate()
        Log.i(TAG, "[LIFECYCLE] onCreate() - Service created")
        
        val defaultHandler = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, exception ->
            try {
                FirebaseCrashlytics.getInstance().setCustomKey("service_state", "CRASHED_IN_BACKGROUND")
                FirebaseCrashlytics.getInstance().recordException(exception)
            } catch (ignored: Exception) {}
            defaultHandler?.uncaughtException(thread, exception)
        }

        registerNetworkCallback()
    }

    private fun registerNetworkCallback() {
        if (networkCallback != null) return
        try {
            val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager ?: return
            val builder = NetworkRequest.Builder()
            networkCallback = object : ConnectivityManager.NetworkCallback() {
                override fun onAvailable(network: Network) {
                    Log.i(TAG, "🌐 [NET] Network available — reconnecting Kotlin socket if needed")
                    val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    val driverOnline = prefs.getBoolean("flutter.driver_is_online", false)
                    if (driverOnline && appState == "Killed") {
                        if (!isSocketConnected || socket == null) {
                            connectSocket()
                        } else {
                            emitOnline()
                        }
                    }
                }
            }
            cm.registerNetworkCallback(builder.build(), networkCallback!!)
        } catch (e: Exception) {
            Log.e(TAG, "Error registering network callback: ${e.message}")
        }
    }

    private fun unregisterNetworkCallback() {
        try {
            networkCallback?.let {
                val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
                cm?.unregisterNetworkCallback(it)
            }
            networkCallback = null
        } catch (e: Exception) {
            Log.e(TAG, "Error unregistering network callback: ${e.message}")
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val action = intent?.getStringExtra(EXTRA_ACTION)
        Log.i(TAG, "[LIFECYCLE] onStartCommand() - action: $action, flags: $flags, startId: $startId")

        when (action) {
            ACTION_STOP -> {
                Log.i(TAG, "[LIFECYCLE] onStartCommand - Stopping service via ACTION_STOP")
                stopSelf()
                return START_NOT_STICKY
            }
            ACTION_UPDATE -> {
                val title = intent.getStringExtra(EXTRA_TITLE) ?: "You are Online"
                val body = intent.getStringExtra(EXTRA_BODY) ?: "Waiting for orders..."
                ensureForegroundForOnlineDriver()
                updateStatusNotification(title, body)
                return START_STICKY
            }
            ACTION_SET_APP_STATE -> {
                val state = intent.getStringExtra(EXTRA_APP_STATE) ?: "Foreground"
                setAppState(state)
                val driverOnline = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .getBoolean("flutter.driver_is_online", false)
                if (driverOnline) {
                    ensureForegroundForOnlineDriver()
                }
                return if (driverOnline) START_STICKY else START_NOT_STICKY
            }
            ACTION_ACCEPT_RIDE -> {
                val orderId = intent.getStringExtra(EXTRA_ORDER_ID) ?: ""
                handleAcceptRide(orderId)
                return START_STICKY
            }
            ACTION_DECLINE_RIDE -> {
                val orderId = intent.getStringExtra(EXTRA_ORDER_ID) ?: ""
                handleDeclineRide(orderId)
                return START_STICKY
            }
        }

        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val driverIsOnline = prefs.getBoolean("flutter.driver_is_online", false)

        if (!driverIsOnline) {
            Log.i(TAG, "Service started but driver is offline — starting foreground briefly then stopping.")
            try {
                val notification = buildStatusNotification("ReachuDriver", "Starting...")
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    startForeground(
                        STATUS_NOTIFICATION_ID, 
                        notification, 
                        android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION
                    )
                } else {
                    startForeground(STATUS_NOTIFICATION_ID, notification)
                }
                isForegroundActive = true
            } catch (e: Exception) {
                Log.e(TAG, "startForeground failed while stopping: ${e.message}")
            }
            android.os.Handler(Looper.getMainLooper()).postDelayed({
                try {
                    ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
                } catch (e: Exception) {
                    Log.e(TAG, "stopForeground failed: ${e.message}")
                }
                stopSelf()
            }, 200)
            return START_NOT_STICKY
        }

        Log.i(TAG, "Starting foreground service")
        isOnDuty = true
        appState = "Foreground"

        try {
            val notification = buildStatusNotification(
                "You are Online",
                "Waiting for orders..." 
            )
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                startForeground(
                    STATUS_NOTIFICATION_ID, 
                    notification, 
                    android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION
                )
            } else {
                startForeground(STATUS_NOTIFICATION_ID, notification)
            }
            isForegroundActive = true
        } catch (e: Exception) {
            Log.e(TAG, "FATAL: startForeground failed: ${e.message}", e)
            stopSelf()
            return START_NOT_STICKY
        }

        cancelAllTimers()

        Thread {
            try {
                acquireLocks()
            } catch (e: Exception) {
                Log.e(TAG, "Error acquiring locks: ${e.message}", e)
            }

            locationEmitTimer = Timer("LocationEmit", true).also {
                it.scheduleAtFixedRate(object : TimerTask() {
                    override fun run() {
                        try { emitLocation() } catch (e: Exception) {
                            Log.e(TAG, "Error in emitLocation: ${e.message}")
                        }
                    }
                }, 3000, 5000)
            }
        }.start()

        try {
            startLocationUpdates()
        } catch (e: Exception) {
            Log.e(TAG, "Error starting location: ${e.message}", e)
        }

        return START_STICKY
    }

    override fun onDestroy() {
        Log.i(TAG, "[LIFECYCLE] onDestroy() - Service destroyed")
        isForegroundActive = false
        unregisterNetworkCallback()
        cancelAllTimers()
        stopLocationUpdates()
        disconnectSocket()
        releaseLocks()
        super.onDestroy()
    }

    override fun onTimeout(startId: Int, fgsType: Int) {
        super.onTimeout(startId, fgsType)
        Log.w(TAG, "[LIFECYCLE] onTimeout() - Foreground service timeout reached for fgsType: $fgsType, startId: $startId")
        try {
            FirebaseCrashlytics.getInstance().setCustomKey("service_timeout_reason", "fgsType_$fgsType")
            FirebaseCrashlytics.getInstance().recordException(
                Exception("SocketForegroundService timeout reached for fgsType: $fgsType")
            )
        } catch (ignored: Exception) {}
    }

    private fun cancelAllTimers() {
        onlineTimer?.cancel()
        onlineTimer = null
        locationEmitTimer?.cancel()
        locationEmitTimer = null
        wakeLockRefreshTimer?.cancel()
        wakeLockRefreshTimer = null
    }

    override fun onBind(intent: Intent?): IBinder? {
        Log.i(TAG, "[LIFECYCLE] onBind() - action: ${intent?.action}")
        return null 
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        super.onTaskRemoved(rootIntent)
        Log.w(TAG, "[LIFECYCLE] onTaskRemoved() - App killed — taking over socket connection")
        appState = "Killed"

        updateStatusNotification(
            "You are Online",
            "Running in Background • Waiting for orders..."
        )

        Thread {
            try {
                connectSocket()
                Log.i(TAG, "✅ Kotlin socket connected (takeover complete)")
            } catch (e: Exception) {
                Log.e(TAG, "Error connecting socket after kill: ${e.message}", e)
            }

            onlineTimer?.cancel()
            onlineTimer = Timer("OnlineEmit", true).also {
                it.scheduleAtFixedRate(object : TimerTask() {
                    override fun run() {
                        try { emitOnline() } catch (e: Exception) {
                            Log.e(TAG, "Error in emitOnline: ${e.message}")
                        }
                    }
                }, 5000, 30000)
            }
        }.start()
    }

    fun setAppState(state: String) {
        Log.i(TAG, "[STATE] App state changed: $appState -> $state")
        val oldState = appState
        appState = state

        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val driverOnline = prefs.getBoolean("flutter.driver_is_online", false)

        if (isOnDuty || driverOnline) {
            val body = buildNotificationBody()
            updateStatusNotification("You are Online", body)
        }

        if (state == "Background") {
            Log.i(TAG, "📱 App in Background — Native Kotlin taking over socket & location")
            if (isOnDuty || driverOnline) {
                Thread {
                    try {
                        if (socket == null || !isSocketConnected) {
                            connectSocket()
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Error connecting socket in background: ${e.message}", e)
                    }

                    onlineTimer?.cancel()
                    onlineTimer = Timer("OnlineEmit", true).also {
                        it.scheduleAtFixedRate(object : TimerTask() {
                            override fun run() {
                                try { emitOnline() } catch (e: Exception) {
                                    Log.e(TAG, "Error in emitOnline: ${e.message}")
                                }
                            }
                        }, 2000, 30000)
                    }
                }.start()
            }
        } else if (state == "Foreground") {
            Log.i(TAG, "🔄 Flutter is in Foreground — yielding socket to Flutter")
            Thread {
                try {
                    // Delay disconnect by 2.5 seconds to give Flutter socket time to connect & emit user:online seamlessly
                    Thread.sleep(2500)
                } catch (ignored: Exception) {}
                disconnectSocket()
                onlineTimer?.cancel()
                onlineTimer = null
            }.start()
        }
    }

    private fun connectSocket() {
        try {
            val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val token = prefs.getString(PREF_AUTH_TOKEN, null)
            val driverId = prefs.getString(PREF_DRIVER_ID, null)

            val defaultSocketUrl = if (BuildConfig.FLAVOR == "dev") {
                "https://dev.api.reachu.co.in"
            } else {
                "https://api.reachu.co.in"
            }
            val socketUrl = prefs.getString(PREF_SOCKET_URL, null) ?: defaultSocketUrl

            Log.i(TAG, "🔑 Auth token: ${if (token.isNullOrEmpty()) "MISSING!" else "found"}")
            Log.i(TAG, "🆔 Driver ID: ${if (driverId.isNullOrEmpty()) "MISSING!" else driverId}")

            if (token.isNullOrEmpty() || driverId.isNullOrEmpty()) {
                Log.e(TAG, "❌ Missing auth token or driverId — cannot connect socket")
                return
            }

            Log.i(TAG, "🔌 Connecting socket to $socketUrl (driverId=$driverId)")

            disconnectSocket()

            val options = IO.Options().apply {
                transports = arrayOf("websocket", "polling")
                reconnection = true
                reconnectionAttempts = MAX_SOCKET_RECONNECT_ATTEMPTS
                reconnectionDelay = 2000
                reconnectionDelayMax = 30000
                timeout = 15000
                auth = mapOf("token" to token)
                query = "userRole=Driver&platform=android_native&driverId=$driverId"
            }

            socket = IO.socket(URI.create(socketUrl), options)

            socket?.on(Socket.EVENT_CONNECT) {
                Log.i(TAG, "[SOCKET] ✅ Socket connected (id=${socket?.id()})")
                isSocketConnected = true
                emitOnline()
            }

            socket?.on(Socket.EVENT_DISCONNECT) { args ->
                val reason = if (args.isNotEmpty()) args[0].toString() else "unknown"
                Log.w(TAG, "❌ Socket disconnected: $reason")
                isSocketConnected = false
            }

            socket?.on(Socket.EVENT_CONNECT_ERROR) { args ->
                val err = if (args.isNotEmpty()) args[0].toString() else "unknown"
                Log.e(TAG, "❌ Socket connect error: $err")
            }

            socket?.on("ride:newRide") { args ->
                Log.i(TAG, "🚕 NEW RIDE REQUEST received")
                if (args.isNotEmpty()) {
                    try {
                        val data = args[0] as JSONObject
                        handleNewRideRequest(data)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error parsing ride request: ${e.message}")
                    }
                }
            }

            socket?.on("ride:confirmed") { args ->
                Log.i(TAG, "✅ Ride confirmed")
                if (args.isNotEmpty()) {
                    try {
                        val data = args[0] as JSONObject
                        val orderId = data.optString("orderId", data.optString("_id", ""))

                        val prefs2 = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        prefs2.edit()
                            .putString("flutter.active_ride_full_data", data.toString())
                            .putString("flutter.active_order_id", orderId)
                            .putBoolean("flutter.is_ride_in_progress", true)
                            .apply()

                        val nm = getSystemService(NotificationManager::class.java)
                        nm.cancel(RIDE_NOTIFICATION_ID)

                        updateStatusNotification(
                            "Order in Progress...",
                            buildNotificationBody()
                        )
                    } catch (e: Exception) {
                        Log.e(TAG, "Error handling ride:confirmed: ${e.message}")
                    }
                }
            }

            socket?.on("ride:orderCancelled") { args ->
                Log.i(TAG, "❌ Ride cancelled by user")
                val nm = getSystemService(NotificationManager::class.java)
                nm.cancel(RIDE_NOTIFICATION_ID)
                try {
                    getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE).edit()
                        .putBoolean(PREF_IS_RIDE_IN_PROGRESS, false)
                        .putString(PREF_ACTIVE_RIDE_ID, "")
                        .putBoolean("flutter.pending_ride_from_killed", false)
                        .remove("flutter.last_ride_request")
                        .remove("flutter.last_ride_request_ts")
                        .remove(PREF_LAST_RIDE_REQUEST)
                        .remove(PREF_PENDING_ACCEPT_ORDER_ID)
                        .remove(PREF_PENDING_DECLINE_ORDER_ID)
                        .remove("flutter.pending_open_requests")
                        .remove("pending_open_requests")
                        .apply()
                } catch (e: Exception) {
                    Log.e(TAG, "Error clearing ride state: ${e.message}")
                }
            }

            socket?.on("ride:status") { args ->
                if (args.isEmpty()) return@on
                try {
                    val data = args[0] as? JSONObject ?: return@on
                    val status = data.optString("status", "").lowercase()
                    if (status in listOf("completed", "finished", "ended", "cancelled")) {
                        Log.i(TAG, "✅ Ride ended (status=$status) — clearing ride state")
                        getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE).edit()
                            .putBoolean(PREF_IS_RIDE_IN_PROGRESS, false)
                            .putString(PREF_ACTIVE_RIDE_ID, "")
                            .apply()
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Error handling ride:status: ${e.message}")
                }
            }

            socket?.on("driver:online_success") { args ->
                try {
                    FirebaseCrashlytics.getInstance().setCustomKey("last_socket_heartbeat", isoDateFormat.format(Date()))
                } catch (ignored: Exception) {}
            }

            socket?.on("chat:receiveMessage") { args ->
                Log.i(TAG, "💬 Chat message received (chat:receiveMessage)")
                if (args.isNotEmpty()) {
                    try {
                        val data = args[0] as? JSONObject ?: return@on
                        showChatNotification(data)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error handling chat:receiveMessage: ${e.message}")
                    }
                }
            }

            socket?.on("chat:message") { args ->
                Log.i(TAG, "💬 Chat message received (chat:message)")
                if (args.isNotEmpty()) {
                    try {
                        val data = args[0] as? JSONObject ?: return@on
                        showChatNotification(data)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error handling chat:message: ${e.message}")
                    }
                }
            }

            socket?.connect()

        } catch (e: Exception) {
            Log.e(TAG, "Fatal socket error: ${e.message}", e)
        }
    }

    private fun disconnectSocket() {
        try {
            socket?.off()
            socket?.disconnect()
            socket?.close()
            socket = null
            isSocketConnected = false
        } catch (e: Exception) {
            Log.e(TAG, "Error disconnecting socket: ${e.message}")
        }
    }

    private fun emitOnline() {
        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val driverOnline = prefs.getBoolean("flutter.driver_is_online", false)
        if (!driverOnline && !isOnDuty) return
        isOnDuty = true

        if (socket == null || !isSocketConnected) return

        val vehicleType = prefs.getString(PREF_VEHICLE_TYPE, "") ?: ""
        val vehicleSubType = prefs.getString(PREF_VEHICLE_SUB_TYPE, null)
        val vehicleId = prefs.getString(PREF_VEHICLE_NUMBER, "") ?: ""
        val vehicleImage = prefs.getString(PREF_VEHICLE_IMAGE, null)
        val fleetId = prefs.getString(PREF_FLEET_ID, null)

        val doEmit = { lat: Double, lng: Double ->
            val payload = JSONObject().apply {
                put("latitude", lat)
                put("longitude", lng)
                put("vehicleType", vehicleType)
                if (vehicleSubType != null) put("vehicleSubType", vehicleSubType)
                put("vehicleId", vehicleId)
                if (vehicleImage != null) put("vehicleImage", vehicleImage)
                if (fleetId != null) put("fleetId", fleetId)
                put("timestamp", System.currentTimeMillis())
            }

            try {
                Log.i(TAG, "📡 Emitting user:online (lat=$lat, lng=$lng)")
                socket?.emit("user:online", payload)
            } catch (e: Exception) {
                Log.e(TAG, "Error emitting user:online: ${e.message}")
            }
        }

        if (currentLat != 0.0 && currentLng != 0.0) {
            doEmit(currentLat, currentLng)
        } else {
            fusedLocationClient?.lastLocation?.addOnSuccessListener { loc ->
                if (loc != null) {
                    currentLat = loc.latitude
                    currentLng = loc.longitude
                    doEmit(currentLat, currentLng)
                } else {
                    doEmit(23.2508131, 77.4647936)
                }
            }?.addOnFailureListener {
                doEmit(23.2508131, 77.4647936)
            }
        }
    }

    private fun nowIso(): String = isoDateFormat.format(Date())

    private fun emitLocation() {
        if (!isOnDuty || socket == null || !isSocketConnected) return
        if (currentLat == 0.0 && currentLng == 0.0) return

        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val isRide = prefs.getBoolean(PREF_IS_RIDE_IN_PROGRESS, false)
        val activeRideId = prefs.getString(PREF_ACTIVE_RIDE_ID, "") ?: ""
        val vehicleType = prefs.getString(PREF_VEHICLE_TYPE, "") ?: ""

        try {
            val timestamp = nowIso()
            if (isRide && activeRideId.isNotEmpty()) {
                val payload = JSONObject().apply {
                    put("rideId", activeRideId)
                    put("location", JSONObject().apply {
                        put("latitude", currentLat)
                        put("longitude", currentLng)
                        put("lat", currentLat)
                        put("lng", currentLng)
                        put("timestamp", timestamp)
                        put("accuracy", 0.0)
                        put("speed", 0.0)
                    })
                }
                socket?.emit("ride:location:update", payload)
            } else {
                val payload = JSONObject().apply {
                    put("latitude", currentLat)
                    put("longitude", currentLng)
                    put("role", "Driver")
                    put("vehicleType", vehicleType)
                    put("timestamp", timestamp)
                }
                socket?.emit("driver:location:update", payload)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error emitting location: ${e.message}")
        }
    }

    private fun handleNewRideRequest(data: JSONObject) {
        Log.i(TAG, "Processing ride request: ${data.toString().take(200)}")

        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit()
            .putString(PREF_LAST_RIDE_REQUEST, data.toString())
            .putLong("flutter.last_ride_request_ts", System.currentTimeMillis())
            .putBoolean("flutter.pending_ride_from_killed", true)
            .apply()

        val orderId = data.optString("orderId").ifEmpty {
            data.optString("_id").ifEmpty {
                data.optString("rideId").ifEmpty {
                    data.optString("id", "")
                }
            }
        }

        val pickupLocation = data.optString("pickupLocation",
            data.optJSONObject("pickup")?.optString("address", "Pickup") ?: "Pickup"
        )
        val dropLocation = data.optString("dropLocation",
            data.optJSONObject("dropoff")?.optString("address", "Drop") ?: "Drop"
        )
        val fare = data.optString("fare",
            data.optString("estimatedFare", "")
        )
        val distance = data.optString("distance", "")

        val body = buildString {
            append("$pickupLocation")
            append(" → $dropLocation")
            if (fare.isNotEmpty()) append(" • ₹$fare")
            if (distance.isNotEmpty()) append(" • $distance km")
        }

        showRideNotification(orderId, "New Order Request!", body)

        // Automatically trigger floating bubble overlay on native ride request
        SafeOverlayService.showOverlay(this)
    }

    private fun showChatNotification(data: JSONObject) {
        try {
            val messageObj = data.optJSONObject("message")
            val senderName = messageObj
                ?.optJSONObject("senderId")
                ?.optString("name", "New Message")
                ?: "New Message"
            val messageText = messageObj?.optString("message", "") ?: ""

            val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)?.apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            }
            val pendingIntent = PendingIntent.getActivity(
                this, 4000, openAppIntent,
                PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
            )

            val notification = NotificationCompat.Builder(this, CHAT_CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_bg_service_small)
                .setContentTitle("Chat: $senderName")
                .setContentText(messageText)
                .setStyle(NotificationCompat.BigTextStyle().bigText(messageText))
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setCategory(NotificationCompat.CATEGORY_MESSAGE)
                .setAutoCancel(true)
                .setContentIntent(pendingIntent)
                .setDefaults(NotificationCompat.DEFAULT_ALL)
                .build()

            val nm = getSystemService(NotificationManager::class.java)
            val notifId = CHAT_NOTIFICATION_ID + (System.currentTimeMillis() / 1000 % 1000).toInt()
            nm.notify(notifId, notification)

            Log.i(TAG, "✅ Chat notification shown: \"Chat: $senderName\"")
        } catch (e: Exception) {
            Log.e(TAG, "Error showing chat notification: ${e.message}")
        }
    }

    private fun showRideNotification(orderId: String, title: String, body: String) {
        val rideHash = orderId.hashCode() and 0xFFFF

        val acceptAppIntent = packageManager.getLaunchIntentForPackage(packageName)?.apply {
            addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK or
                Intent.FLAG_ACTIVITY_SINGLE_TOP or
                Intent.FLAG_ACTIVITY_CLEAR_TOP
            )
            putExtra("from_notification", true)
            putExtra("from_ride_notification", true)
            putExtra("accepted_ride", true)
            putExtra(EXTRA_ORDER_ID, orderId)
            action = "com.reachu.driver.ACCEPT_RIDE"
        }
        val acceptPendingIntent = PendingIntent.getActivity(
            this, 1000 + rideHash, acceptAppIntent,
            PendingIntent.FLAG_CANCEL_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val declineIntent = Intent(this, RideActionReceiver::class.java).apply {
            action = "com.reachu.driver.DECLINE_RIDE"
            putExtra(EXTRA_ORDER_ID, orderId)
        }
        val declinePendingIntent = PendingIntent.getBroadcast(
            this, 2000 + rideHash, declineIntent,
            PendingIntent.FLAG_CANCEL_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)?.apply {
            addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK or
                Intent.FLAG_ACTIVITY_SINGLE_TOP or
                Intent.FLAG_ACTIVITY_CLEAR_TOP
            )
            putExtra("from_notification", true)
            putExtra("from_ride_notification", true)
            putExtra(EXTRA_ORDER_ID, orderId)
        }
        val openPendingIntent = PendingIntent.getActivity(
            this, 3000 + rideHash, openAppIntent,
            PendingIntent.FLAG_CANCEL_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // Acquire temporary wake lock with ACQUIRE_CAUSES_WAKEUP to immediately turn ON device display when locked
        try {
            val pm = getSystemService(Context.POWER_SERVICE) as? PowerManager
            @Suppress("DEPRECATION")
            val screenWakeLock = pm?.newWakeLock(
                PowerManager.FULL_WAKE_LOCK or
                PowerManager.ACQUIRE_CAUSES_WAKEUP or
                PowerManager.ON_AFTER_RELEASE,
                "ReachuDriver:NewRideWakeLock"
            )
            screenWakeLock?.acquire(10000L)
            Log.i(TAG, "💡 Screen display wake lock acquired for new order notification")
        } catch (e: Exception) {
            Log.e(TAG, "Error acquiring screen wake lock: ${e.message}")
        }

        val notification = NotificationCompat.Builder(this, RIDE_CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_bg_service_small)
            .setContentTitle(title)
            .setContentText(body)
            .setStyle(NotificationCompat.BigTextStyle().bigText(body))
            .setPriority(NotificationCompat.PRIORITY_MAX)
            .setCategory(NotificationCompat.CATEGORY_CALL)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setLights(0xFFFF0000.toInt(), 500, 500)
            .setAutoCancel(true)
            .setOngoing(false)
            .setContentIntent(openPendingIntent)
            .addAction(0, "✅ Accept", acceptPendingIntent)
            .addAction(0, "❌ Decline", declinePendingIntent)
            .setDefaults(NotificationCompat.DEFAULT_ALL)
            .setFullScreenIntent(openPendingIntent, true)
            .build()
            
        notification.flags = notification.flags or Notification.FLAG_INSISTENT

        val nm = getSystemService(NotificationManager::class.java)
        nm.notify(RIDE_NOTIFICATION_ID, notification)
    }

    private fun handleAcceptRide(orderId: String) {
        Log.i(TAG, "✅ Accepting ride: $orderId")
        try {
            val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            prefs.edit()
                .putString(PREF_PENDING_ACCEPT_ORDER_ID, orderId)
                .putLong("flutter.pending_accept_timestamp", System.currentTimeMillis())
                .remove(PREF_PENDING_DECLINE_ORDER_ID)
                .apply()
        } catch (e: Exception) {
            Log.e(TAG, "Error persisting pending accept: ${e.message}")
        }

        val nm = getSystemService(NotificationManager::class.java)
        nm.cancel(RIDE_NOTIFICATION_ID)
        Log.i(TAG, "✅ handleAcceptRide complete")
    }

    private fun handleDeclineRide(orderId: String) {
        Log.i(TAG, "❌ Declining ride: $orderId")
        try {
            val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            prefs.edit()
                .putString(PREF_PENDING_DECLINE_ORDER_ID, orderId)
                .remove(PREF_PENDING_ACCEPT_ORDER_ID)
                .remove(PREF_LAST_RIDE_REQUEST)
                .remove("flutter.last_ride_request")
                .remove("flutter.last_ride_request_ts")
                .remove("flutter.pending_open_requests")
                .remove("pending_open_requests")
                .putBoolean("flutter.pending_ride_from_killed", false)
                .apply()
        } catch (e: Exception) {
            Log.e(TAG, "Error persisting pending decline: ${e.message}")
        }

        val nm = getSystemService(NotificationManager::class.java)
        nm.cancel(RIDE_NOTIFICATION_ID)
    }

    private fun startLocationUpdates() {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
            != PackageManager.PERMISSION_GRANTED
        ) {
            Log.w(TAG, "Location permission not granted")
            return
        }

        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)

        val locationRequest = LocationRequest.Builder(
            Priority.PRIORITY_HIGH_ACCURACY, LOCATION_INTERVAL_MS
        ).apply {
            setMinUpdateIntervalMillis(LOCATION_FASTEST_MS)
            setWaitForAccurateLocation(false)
        }.build()

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(result: LocationResult) {
                result.lastLocation?.let { location ->
                    currentLat = location.latitude
                    currentLng = location.longitude
                }
            }
        }

        fusedLocationClient?.requestLocationUpdates(
            locationRequest, locationCallback!!, Looper.getMainLooper()
        )

        fusedLocationClient?.lastLocation?.addOnSuccessListener { location: Location? ->
            location?.let {
                currentLat = it.latitude
                currentLng = it.longitude
                Log.i(TAG, "📍 Initial location: ($currentLat, $currentLng)")
            }
        }
    }

    private fun stopLocationUpdates() {
        locationCallback?.let {
            fusedLocationClient?.removeLocationUpdates(it)
        }
        locationCallback = null
        fusedLocationClient = null
    }

    private fun buildNotificationBody(): String {
        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val isRide = prefs.getBoolean(PREF_IS_RIDE_IN_PROGRESS, false)

        val sb = StringBuilder()
        when (appState) {
            "Killed", "Background" -> sb.append("Running in Background")
            else -> sb.append("")
        }

        if (isRide) {
            sb.append(" • 📦 Order in Progress")
        } else if (isOnDuty) {
            sb.append(" • Waiting for orders...")
        }
        return sb.toString()
    }

    private fun buildStatusNotification(title: String, body: String): Notification {
        val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)?.apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
        }
        val pendingIntent = PendingIntent.getActivity(
            this, 0, openAppIntent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        return NotificationCompat.Builder(this, STATUS_CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(body)
            .setSmallIcon(R.drawable.ic_bg_service_small)
            .setOngoing(true)
            .setContentIntent(pendingIntent)
            .setSilent(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
    }

    private fun updateStatusNotification(title: String, body: String) {
        val notification = buildStatusNotification(title, body)
        val nm = getSystemService(NotificationManager::class.java)
        nm.notify(STATUS_NOTIFICATION_ID, notification)
    }

    private fun ensureForegroundForOnlineDriver() {
        if (isForegroundActive) return
        val prefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val driverOnline = prefs.getBoolean("flutter.driver_is_online", false)
        if (!driverOnline) return
        try {
            val notification = buildStatusNotification("You are Online", buildNotificationBody())
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                startForeground(
                    STATUS_NOTIFICATION_ID,
                    notification,
                    android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION
                )
            } else {
                startForeground(STATUS_NOTIFICATION_ID, notification)
            }
            isForegroundActive = true
            Log.i(TAG, "✅ ensureForegroundForOnlineDriver: foreground started")
        } catch (e: Exception) {
            Log.e(TAG, "❌ ensureForegroundForOnlineDriver failed: ${e.message}", e)
        }
    }

    private fun acquireLocks() {
        try {
            if (wakeLock == null) {
                val pm = getSystemService(Context.POWER_SERVICE) as PowerManager
                wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "Reachu::SocketWakeLock")
            }
            wakeLock?.acquire(WAKELOCK_TIMEOUT_MS)
        } catch (e: Exception) {
            Log.e(TAG, "Error acquiring WakeLock: ${e.message}")
        }

        try {
            if (wifiLock == null) {
                val wm = applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
                wifiLock = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    wm.createWifiLock(WifiManager.WIFI_MODE_FULL_LOW_LATENCY, "Reachu::SocketWifiLock")
                } else {
                    @Suppress("DEPRECATION")
                    wm.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "Reachu::SocketWifiLock")
                }
            }
            if (wifiLock?.isHeld == false) {
                wifiLock?.acquire()
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error acquiring WifiLock: ${e.message}")
        }

        startWakeLockRefresh()
        Log.i(TAG, "🔒 Locks acquired")
    }

    private fun startWakeLockRefresh() {
        wakeLockRefreshTimer?.cancel()
        val refreshInterval = (WAKELOCK_TIMEOUT_MS * 0.8).toLong()
        wakeLockRefreshTimer = Timer("WakeLockRefresh", true).also {
            it.scheduleAtFixedRate(object : TimerTask() {
                override fun run() {
                    try {
                        wakeLock?.acquire(WAKELOCK_TIMEOUT_MS)
                        Log.d(TAG, "🔒 WakeLock refreshed")
                    } catch (e: Exception) {
                        Log.e(TAG, "Error refreshing WakeLock: ${e.message}")
                    }
                }
            }, refreshInterval, refreshInterval)
        }
    }

    private fun releaseLocks() {
        try {
            wakeLock?.let { if (it.isHeld) it.release() }
            wakeLock = null
            wifiLock?.let { if (it.isHeld) it.release() }
            wifiLock = null
            Log.i(TAG, "🔓 Locks released")
        } catch (e: Exception) {
            Log.e(TAG, "Error releasing locks: ${e.message}")
        }
    }
}
