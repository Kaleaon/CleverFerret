package com.cleverferret.v2.core.network.resilience

import java.time.Clock

class CircuitBreaker(
    private val failureThreshold: Int,
    private val openDurationMillis: Long,
    private val clock: Clock,
) {
    private var consecutiveFailures = 0
    private var openedAtMillis: Long = -1L

    @Synchronized
    fun allowRequest(): Boolean = openedAtMillis < 0 || (clock.millis() - openedAtMillis) >= openDurationMillis

    @Synchronized
    fun onSuccess() {
        consecutiveFailures = 0
        openedAtMillis = -1L
    }

    @Synchronized
    fun onFailure() {
        consecutiveFailures++
        if (consecutiveFailures >= failureThreshold) openedAtMillis = clock.millis()
    }
}
