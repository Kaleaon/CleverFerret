package com.cleverferret.v2.core.network.resilience;

import java.time.Clock;

public final class CircuitBreaker {
    private final int failureThreshold;
    private final long openDurationMillis;
    private final Clock clock;

    private int consecutiveFailures;
    private long openedAtMillis = -1L;

    public CircuitBreaker(int failureThreshold, long openDurationMillis, Clock clock) {
        this.failureThreshold = failureThreshold;
        this.openDurationMillis = openDurationMillis;
        this.clock = clock;
    }

    public synchronized boolean allowRequest() {
        if (openedAtMillis < 0) {
            return true;
        }
        return (clock.millis() - openedAtMillis) >= openDurationMillis;
    }

    public synchronized void onSuccess() {
        consecutiveFailures = 0;
        openedAtMillis = -1L;
    }

    public synchronized void onFailure() {
        consecutiveFailures++;
        if (consecutiveFailures >= failureThreshold) {
            openedAtMillis = clock.millis();
        }
    }
}
