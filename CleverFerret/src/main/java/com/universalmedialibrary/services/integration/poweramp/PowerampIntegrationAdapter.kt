package com.universalmedialibrary.services.integration.poweramp

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import com.universalmedialibrary.data.local.dao.ExternalMediaEntityDao
import com.universalmedialibrary.data.local.entity.ExternalMediaEntity
import com.universalmedialibrary.services.integration.IntegrationProvider
import com.universalmedialibrary.services.integration.ProviderStatus
import com.universalmedialibrary.services.integration.ProviderSyncResult
import com.universalmedialibrary.services.integration.ProviderType
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * External Poweramp Audio Connector Adapter
 *
 * Interfaces directly with external Poweramp application intents and IPC bindings for playback control
 * and track updates. Handles missing application package gracefully with fallback internal playback.
 */
@Singleton
class PowerampIntegrationAdapter @Inject constructor(
    @ApplicationContext private val context: Context,
    private val externalMediaEntityDao: ExternalMediaEntityDao
) : IntegrationProvider {

    companion object {
        const val POWERAMP_PACKAGE = "com.maxmpz.audioplayer"
        const val ACTION_API_COMMAND = "com.maxmpz.audioplayer.API_COMMAND"
        const val ACTION_TRACK_CHANGED = "com.maxmpz.audioplayer.TRACK_CHANGED"
        const val ACTION_STATUS_CHANGED = "com.maxmpz.audioplayer.STATUS_CHANGED"

        const val EXTRA_CMD = "cmd"
        const val CMD_TOGGLE_PLAY_PAUSE = 1
        const val CMD_PAUSE = 2
        const val CMD_RESUME = 3
        const val CMD_NEXT = 4
        const val CMD_PREVIOUS = 5
        const val CMD_SEEK = 8
    }

    override val providerId: String = "poweramp"
    override val providerName: String = "Poweramp Audio Engine"
    override val providerType: ProviderType = ProviderType.POWERAMP

    private val _providerStatus = MutableStateFlow(
        ProviderStatus(
            providerId = providerId,
            name = providerName,
            providerType = providerType,
            isConnected = false
        )
    )
    override val status: StateFlow<ProviderStatus> = _providerStatus.asStateFlow()

    private val _currentTrack = MutableStateFlow<PowerampTrackInfo?>(null)
    val currentTrack: StateFlow<PowerampTrackInfo?> = _currentTrack.asStateFlow()

    private var isReceiverRegistered = false

    private val powerampReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            intent ?: return
            when (intent.action) {
                ACTION_TRACK_CHANGED, ACTION_STATUS_CHANGED -> {
                    val track = intent.getBundleExtra("track")
                    val title = track?.getString("title") ?: intent.getStringExtra("title") ?: "Unknown Track"
                    val artist = track?.getString("artist") ?: intent.getStringExtra("artist") ?: "Unknown Artist"
                    val album = track?.getString("album") ?: intent.getStringExtra("album")
                    val duration = track?.getLong("duration") ?: intent.getLongExtra("duration", 0L)

                    val info = PowerampTrackInfo(
                        title = title,
                        artist = artist,
                        album = album,
                        durationMs = duration
                    )
                    _currentTrack.value = info
                }
            }
        }
    }

    /**
     * Check if Poweramp is installed on device
     */
    fun isPowerampInstalled(): Boolean {
        return try {
            context.packageManager.getPackageInfo(POWERAMP_PACKAGE, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    /**
     * Send playback command intent to external Poweramp installation
     */
    fun sendPowerampCommand(cmdCode: Int): Boolean {
        if (!isPowerampInstalled()) {
            // Fallback to internal playback
            return false
        }
        return try {
            val intent = Intent(ACTION_API_COMMAND).apply {
                setPackage(POWERAMP_PACKAGE)
                putExtra(EXTRA_CMD, cmdCode)
            }
            context.sendBroadcast(intent)
            true
        } catch (e: Exception) {
            false
        }
    }

    fun playPause(): Boolean = sendPowerampCommand(CMD_TOGGLE_PLAY_PAUSE)
    fun play(): Boolean = sendPowerampCommand(CMD_RESUME)
    fun pause(): Boolean = sendPowerampCommand(CMD_PAUSE)
    fun next(): Boolean = sendPowerampCommand(CMD_NEXT)
    fun previous(): Boolean = sendPowerampCommand(CMD_PREVIOUS)

    fun registerBroadcastReceiver() {
        if (!isReceiverRegistered && isPowerampInstalled()) {
            try {
                val filter = IntentFilter().apply {
                    addAction(ACTION_TRACK_CHANGED)
                    addAction(ACTION_STATUS_CHANGED)
                }
                context.registerReceiver(powerampReceiver, filter)
                isReceiverRegistered = true
            } catch (e: Exception) {
                // Ignore receiver registration failure
            }
        }
    }

    fun unregisterBroadcastReceiver() {
        if (isReceiverRegistered) {
            try {
                context.unregisterReceiver(powerampReceiver)
            } catch (e: Exception) {
                // Ignore
            }
            isReceiverRegistered = false
        }
    }

    // IntegrationProvider implementation

    override suspend fun connect(config: Map<String, String>): Boolean {
        val installed = isPowerampInstalled()
        if (installed) {
            registerBroadcastReceiver()
        }
        _providerStatus.value = _providerStatus.value.copy(isConnected = installed)
        return installed
    }

    override suspend fun disconnect() {
        unregisterBroadcastReceiver()
        _providerStatus.value = _providerStatus.value.copy(isConnected = false)
    }

    override suspend fun testConnection(): Boolean {
        return isPowerampInstalled()
    }

    override suspend fun sync(): ProviderSyncResult = withContext(Dispatchers.IO) {
        val installed = isPowerampInstalled()
        if (!installed) {
            return@withContext ProviderSyncResult(false, 0, "Poweramp application not installed; using internal playback")
        }

        val track = _currentTrack.value
        if (track != null) {
            val entity = ExternalMediaEntity(
                providerId = "poweramp",
                externalId = "${track.artist}_${track.title}".hashCode().toString(),
                title = track.title,
                creator = track.artist,
                series = track.album,
                mediaType = "MUSIC",
                uri = "poweramp://now_playing",
                lastSyncedAt = System.currentTimeMillis()
            )
            externalMediaEntityDao.insertEntity(entity)
        }

        _providerStatus.value = _providerStatus.value.copy(
            isConnected = true,
            itemCount = if (track != null) 1 else 0,
            lastSyncTime = System.currentTimeMillis()
        )
        ProviderSyncResult(true, if (track != null) 1 else 0, "Poweramp intent broadcast sync complete")
    }

    override suspend fun searchRemote(query: String, limit: Int): List<ExternalMediaEntity> {
        return externalMediaEntityDao.searchEntities(query, limit).filter { it.providerId == "poweramp" }
    }

    override suspend fun fetchEntities(): List<ExternalMediaEntity> {
        return externalMediaEntityDao.getEntitiesByProvider("poweramp")
    }
}

data class PowerampTrackInfo(
    val title: String,
    val artist: String,
    val album: String? = null,
    val durationMs: Long = 0L
)
