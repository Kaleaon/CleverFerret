package com.cleverferret.v2.core.network.resilience

import java.time.Clock

class RequestThrottle(private val minIntervalMillis: Long, private val clock: Clock) {
    private var lastRequestAt: Long = Long.MIN_VALUE

    @Synchronized
    fun tryAcquire(): Boolean {
        val now = clock.millis()
        if ((now - lastRequestAt) < minIntervalMillis) return false
        lastRequestAt = now
        return true
    }
}
