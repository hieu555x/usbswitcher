package com.example.usbswitcher

import android.provider.Settings
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService

class UsbDebugTileService : TileService() {

    override fun onStartListening() {
        super.onStartListening()
        updateTile()
    }

    override fun onClick() {
        super.onClick()
        try {
            val current = Settings.Global.getInt(
                contentResolver,
                Settings.Global.ADB_ENABLED,
                0
            )
            val newValue = if (current == 1) 0 else 1
            Settings.Global.putInt(
                contentResolver,
                Settings.Global.ADB_ENABLED,
                newValue
            )
            updateTile()
        } catch (e: SecurityException) {
            // Chưa được grant quyền WRITE_SECURE_SETTINGS
            qsTile?.state = Tile.STATE_UNAVAILABLE
            qsTile?.subtitle = "Chưa có quyền"
            qsTile?.updateTile()
        }
    }

    private fun updateTile() {
        val tile = qsTile ?: return
        try {
            val enabled = Settings.Global.getInt(
                contentResolver,
                Settings.Global.ADB_ENABLED,
                0
            ) == 1
            tile.state = if (enabled) Tile.STATE_ACTIVE else Tile.STATE_INACTIVE
            tile.subtitle = if (enabled) "Đang bật" else "Đang tắt"
            tile.label = "USB Debug"
        } catch (e: SecurityException) {
            tile.state = Tile.STATE_UNAVAILABLE
            tile.subtitle = "Chưa có quyền"
        }
        tile.updateTile()
    }
}