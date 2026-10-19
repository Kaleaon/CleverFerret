package com.universalmedialibrary.data.crdt

import android.content.Context
import android.content.SharedPreferences
import java.util.UUID
import java.util.concurrent.atomic.AtomicLong
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manages thread-safe logical Lamport clock generation and persistence.
 *
 * Each device maintains a monotonic counter that increments on local mutations
 * and advances when receiving operations with higher logical timestamps from remote peers.
 */
@Singleton
class LamportClockManager(
    private val prefs: SharedPreferences?,
    overrideDeviceId: String? = null,
    initialClock: Long = 0L
) {

    @Inject
    constructor(context: Context) : this(
        prefs = context.getSharedPreferences("crdt_lamport_clock_prefs", Context.MODE_PRIVATE)
    )

    private val deviceId: String
    private val currentClock: AtomicLong

    init {
        if (overrideDeviceId != null) {
            deviceId = overrideDeviceId
        } else if (prefs != null) {
            val existingDeviceId = prefs.getString(KEY_DEVICE_ID, null)
            if (existingDeviceId.isNullOrEmpty()) {
                val newDeviceId = UUID.randomUUID().toString()
                prefs.edit().putString(KEY_DEVICE_ID, newDeviceId).apply()
                deviceId = newDeviceId
            } else {
                deviceId = existingDeviceId
            }
        } else {
            deviceId = UUID.randomUUID().toString()
        }

        val storedClock = prefs?.getLong(KEY_LAMPORT_CLOCK, initialClock) ?: initialClock
        currentClock = AtomicLong(storedClock)
    }

    /**
     * Testing constructor allowing custom deviceId and initial clock without Android Context.
     */
    constructor(deviceId: String, initialClock: Long = 0L) : this(
        prefs = null,
        overrideDeviceId = deviceId,
        initialClock = initialClock
    )

    fun getDeviceId(): String = deviceId

    fun getClock(): Long = currentClock.get()

    /**
     * Increments local clock for a new local operation.
     */
    @Synchronized
    fun tick(): Long {
        val newClock = currentClock.incrementAndGet()
        persistClock(newClock)
        return newClock
    }

    /**
     * Updates logical clock upon receiving a remote operation timestamp.
     * Guaranteed to return a clock value strictly greater than both local and remote timestamps.
     */
    @Synchronized
    fun updateClock(remoteLamportTimestamp: Long): Long {
        val local = currentClock.get()
        val next = maxOf(local, remoteLamportTimestamp) + 1
        currentClock.set(next)
        persistClock(next)
        return next
    }

    private fun persistClock(clockValue: Long) {
        prefs?.edit()?.putLong(KEY_LAMPORT_CLOCK, clockValue)?.apply()
    }

    companion object {
        private const val KEY_DEVICE_ID = "crdt_device_id"
        private const val KEY_LAMPORT_CLOCK = "crdt_lamport_clock"
    }
}
