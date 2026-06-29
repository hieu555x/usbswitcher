package com.example.usbswitcher

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.provider.Settings
import android.widget.RemoteViews

class UsbWidgetProvider : AppWidgetProvider() {

    companion object {
        const val ACTION_TOGGLE_ADB = "com.example.usbswitcher.ACTION_TOGGLE_ADB"

        fun updateAllWidgets(context: Context) {
            val manager = AppWidgetManager.getInstance(context)
            val ids = manager.getAppWidgetIds(
                android.content.ComponentName(context, UsbWidgetProvider::class.java)
            )
            ids.forEach { id -> updateWidget(context, manager, id) }
        }

        private fun updateWidget(context: Context, manager: AppWidgetManager, widgetId: Int) {
            val views = RemoteViews(context.packageName, R.layout.usb_widget)

            val isEnabled = try {
                Settings.Global.getInt(
                    context.contentResolver,
                    Settings.Global.ADB_ENABLED,
                    0
                ) == 1
            } catch (e: Exception) {
                false
            }

            views.setTextViewText(
                R.id.widget_status,
                if (isEnabled) "Connected" else "Disconnected"
            )
            views.setImageViewResource(
                R.id.status_dot,
                if (isEnabled) R.drawable.dot_green else R.drawable.dot_red
            )

            val intent = Intent(context, UsbWidgetProvider::class.java).apply {
                action = ACTION_TOGGLE_ADB
            }
            val pendingIntent = android.app.PendingIntent.getBroadcast(
                context,
                widgetId,
                intent,
                android.app.PendingIntent.FLAG_UPDATE_CURRENT or android.app.PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_toggle_btn, pendingIntent)

            manager.updateAppWidget(widgetId, views)
        }
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        appWidgetIds.forEach { id -> updateWidget(context, appWidgetManager, id) }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        if (intent.action == ACTION_TOGGLE_ADB) {
            try {
                val current = Settings.Global.getInt(
                    context.contentResolver,
                    Settings.Global.ADB_ENABLED,
                    0
                )
                Settings.Global.putInt(
                    context.contentResolver,
                    Settings.Global.ADB_ENABLED,
                    if (current == 1) 0 else 1
                )
            } catch (e: SecurityException) {
                android.util.Log.e("UsbWidget", "Thiếu quyền WRITE_SECURE_SETTINGS")
            }
            updateAllWidgets(context)
        }
    }
}