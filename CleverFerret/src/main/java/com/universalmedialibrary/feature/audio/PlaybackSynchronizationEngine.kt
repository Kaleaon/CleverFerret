package com.universalmedialibrary.feature.audio

import kotlin.math.absoluteValue
import kotlin.math.sign
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

import javax.inject.Inject

class PlaybackSynchronizationEngine @Inject constructor(
    private val maxCorrectionPerTickMs: Double = 20.0,
    private val jitterToleranceMs: Double = 6.0,
    private val disconnectTimeoutMs: Long = 4_000L
) {
    private val _state = MutableStateFlow(SyncEngineState())
    val state: StateFlow<SyncEngineState> = _state.asStateFlow()

    fun createGroup(groupId: String, members: List<String>) {
        _state.value = _state.value.copy(
            groups = _state.value.groups + (groupId to SyncGroup(groupId, members.toSet()))
        )
    }

    fun joinGroup(deviceId: String, groupId: String) {
        val groups = _state.value.groups.toMutableMap()
        val group = groups[groupId] ?: SyncGroup(groupId)
        groups[groupId] = group.copy(members = group.members + deviceId)
        _state.value = _state.value.copy(groups = groups, fallbackToLocalPlayback = false)
    }

    fun leaveGroup(deviceId: String, groupId: String) {
        val groups = _state.value.groups.toMutableMap()
        val group = groups[groupId] ?: return
        groups[groupId] = group.copy(members = group.members - deviceId)
        _state.value = _state.value.copy(groups = groups)
        if (groups.values.none { deviceId in it.members }) {
            _state.value = _state.value.copy(fallbackToLocalPlayback = true)
        }
    }

    fun reportOffset(deviceId: String, offsetMs: Double, observedJitterMs: Double, nowMs: Long) {
        val correction = when {
            offsetMs.absoluteValue <= jitterToleranceMs -> 0.0
            else -> offsetMs.sign * minOf(offsetMs.absoluteValue, maxCorrectionPerTickMs)
        }

        val updated = _state.value.devices.toMutableMap()
        val previous = updated[deviceId]
        updated[deviceId] = DeviceSyncState(
            deviceId = deviceId,
            offsetMs = offsetMs,
            correctionMs = correction,
            jitterMs = observedJitterMs,
            lastSeenEpochMs = nowMs,
            isConnected = true,
            reconnectAttempts = previous?.reconnectAttempts ?: 0
        )

        _state.value = _state.value.copy(devices = updated)
    }

    fun onDisconnect(deviceId: String, nowMs: Long) {
        val device = _state.value.devices[deviceId] ?: return
        val expired = nowMs - device.lastSeenEpochMs > disconnectTimeoutMs
        val reconnectAttempts = if (expired) device.reconnectAttempts + 1 else device.reconnectAttempts
        val next = device.copy(isConnected = !expired, reconnectAttempts = reconnectAttempts)
        _state.value = _state.value.copy(
            devices = _state.value.devices + (deviceId to next),
            fallbackToLocalPlayback = expired
        )
    }

    fun autoRejoin(deviceId: String) {
        val device = _state.value.devices[deviceId] ?: return
        _state.value = _state.value.copy(
            devices = _state.value.devices + (deviceId to device.copy(isConnected = true)),
            fallbackToLocalPlayback = false
        )
    }
}

data class SyncEngineState(
    val groups: Map<String, SyncGroup> = emptyMap(),
    val devices: Map<String, DeviceSyncState> = emptyMap(),
    val fallbackToLocalPlayback: Boolean = false
)

data class SyncGroup(
    val id: String,
    val members: Set<String> = emptySet()
)

data class DeviceSyncState(
    val deviceId: String,
    val offsetMs: Double = 0.0,
    val correctionMs: Double = 0.0,
    val jitterMs: Double = 0.0,
    val lastSeenEpochMs: Long = 0L,
    val isConnected: Boolean = true,
    val reconnectAttempts: Int = 0
)
