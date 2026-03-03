package com.cleverferret.v2.core.network.resilience;

import java.time.Clock;

public final class RequestThrottle {
    private final long minIntervalMillis;
    private final Clock clock;
    private long lastRequestAt = Long.MIN_VALUE;

    public RequestThrottle(long minIntervalMillis, Clock clock) {
        this.minIntervalMillis = minIntervalMillis;
        this.clock = clock;
    }

    public synchronized boolean tryAcquire() {
        long now = clock.millis();
        if ((now - lastRequestAt) < minIntervalMillis) {
            return false;
        }
        lastRequestAt = now;
        return true;
    }
}
