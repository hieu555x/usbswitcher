package com.example.usbswitcher

import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent

class MainActivity : FlutterActivity() {
    private val CHANNEL = "usb_debug_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getAdbStatus" -> {
                        try {
                            val value = Settings.Global.getInt(
                                contentResolver,
                                Settings.Global.ADB_ENABLED,
                                0
                            )
                            result.success(value == 1)
                        } catch (e: SecurityException) {
                            result.error(
                                "PERMISSION_DENIED",
                                "Thiếu quyền WRITE_SECURE_SETTINGS",
                                null
                            )
                        } catch (e: Exception) {
                            result.error("UNKNOWN_ERROR", e.message, null)
                        }
                    }

                    "setAdbEnabled" -> {
                        val enabled = call.argument<Boolean>("enabled") ?: false
                        try {
                            Settings.Global.putInt(
                                contentResolver,
                                Settings.Global.ADB_ENABLED,
                                if (enabled) 1 else 0
                            )
                            result.success(null)
                            UsbWidgetProvider.updateAllWidgets(this)
                        } catch (e: SecurityException) {
                            result.error(
                                "PERMISSION_DENIED",
                                "Thiếu quyền WRITE_SECURE_SETTINGS. Hãy chạy lệnh adb pm grant.",
                                null
                            )
                        } catch (e: Exception) {
                            result.error("UNKNOWN_ERROR", e.message, null)
                        }
                    }

                    "openDeviceInfoSettings" -> {
                        try {
                            val intent = Intent(Settings.ACTION_DEVICE_INFO_SETTINGS)
                            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                            startActivity(intent)
                            result.success(null)
                        } catch (e: Exception) {
                            try {
                                val fallbackIntent = Intent(Settings.ACTION_SETTINGS)
                                fallbackIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                                startActivity(fallbackIntent)
                                result.success(null)
                            } catch (e2: Exception) {
                                result.error("UNKNOWN_ERROR", e2.message, null)
                            }
                        }
                    }

                    else -> result.notImplemented()
                }
            }
    }
}