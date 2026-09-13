package com.example.gati_loader_driver

import android.content.Intent
import flutter.overlay.window.flutter_overlay_window.OverlayService

/**
 * Custom OverlayService wrapper that prevents NullPointerException crashes when Android OS
 * restarts the service after low memory/background kill with a null Intent payload.
 */
class SafeOverlayService : OverlayService() {
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent == null) {
            stopSelf(startId)
            return START_NOT_STICKY
        }
        return try {
            super.onStartCommand(intent, flags, startId)
        } catch (e: NullPointerException) {
            stopSelf(startId)
            START_NOT_STICKY
        }
    }

    companion object {
        fun showOverlay(context: android.content.Context) {
            try {
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M &&
                    !android.provider.Settings.canDrawOverlays(context)) {
                    android.util.Log.d("SafeOverlayService", "No overlay permission - skipping native show")
                    return
                }
                val intent = Intent(context, SafeOverlayService::class.java)
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                    context.startForegroundService(intent)
                } else {
                    context.startService(intent)
                }
                android.util.Log.d("SafeOverlayService", "Native overlay service started")
            } catch (e: Exception) {
                android.util.Log.e("SafeOverlayService", "Failed to start native overlay service: ${e.message}")
            }
        }

        fun stopOverlay(context: android.content.Context) {
            try {
                val intent = Intent(context, SafeOverlayService::class.java)
                context.stopService(intent)
                android.util.Log.d("SafeOverlayService", "Native overlay service stopped")
            } catch (e: Exception) {
                android.util.Log.e("SafeOverlayService", "Failed to stop native overlay service: ${e.message}")
            }
        }
    }
}
