package com.reachu.driver

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

class RideActionReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val orderId = intent.getStringExtra(SocketForegroundService.EXTRA_ORDER_ID) ?: ""
        Log.i("RideActionReceiver", "Action: ${intent.action}, orderId: $orderId")

        try {
            val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            val editor = prefs.edit()
            when (intent.action) {
                "com.reachu.driver.ACCEPT_RIDE" -> {
                    editor
                        .putString("flutter.pending_accept_order_id", orderId)
                        .putLong("flutter.pending_accept_timestamp", System.currentTimeMillis())
                        .remove("flutter.pending_decline_order_id")
                        .putBoolean("flutter.pending_ride_from_killed", false)
                }
                "com.reachu.driver.DECLINE_RIDE" -> {
                    editor
                        .putString("flutter.pending_decline_order_id", orderId)
                        .remove("flutter.pending_accept_order_id")
                }
            }
            editor.apply()
        } catch (e: Exception) {
            Log.e("RideActionReceiver", "Error writing pending action: ${e.message}")
        }

        try {
            val nm = context.getSystemService(NotificationManager::class.java)
            nm.cancel(SocketForegroundService.RIDE_NOTIFICATION_ID)
        } catch (e: Exception) {
            Log.e("RideActionReceiver", "Error cancelling ride notification: ${e.message}")
        }

        if (intent.action == "com.reachu.driver.ACCEPT_RIDE") {
            try {
                @Suppress("DEPRECATION")
                context.sendBroadcast(Intent(Intent.ACTION_CLOSE_SYSTEM_DIALOGS))

                val pm = context.packageManager
                val launchIntent = pm.getLaunchIntentForPackage(context.packageName)?.apply {
                    addFlags(
                        Intent.FLAG_ACTIVITY_NEW_TASK or
                        Intent.FLAG_ACTIVITY_CLEAR_TOP or
                        Intent.FLAG_ACTIVITY_SINGLE_TOP or
                        Intent.FLAG_ACTIVITY_REORDER_TO_FRONT
                    )
                    putExtra("from_notification", true)
                    putExtra("from_ride_notification", true)
                    putExtra("accepted_ride", true)
                    putExtra(SocketForegroundService.EXTRA_ORDER_ID, orderId)
                }
                
                if (launchIntent != null) {
                    context.startActivity(launchIntent)
                    Log.i("RideActionReceiver", "✅ App launched from BroadcastReceiver")
                } else {
                    Log.e("RideActionReceiver", "❌ getLaunchIntentForPackage returned null")
                }
            } catch (e: Exception) {
                Log.e("RideActionReceiver", "Could not open app from receiver: ${e.message}")
            }
        }
    }
}
