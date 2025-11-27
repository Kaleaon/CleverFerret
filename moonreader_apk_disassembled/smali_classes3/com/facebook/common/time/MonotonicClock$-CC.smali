.class public final synthetic Lcom/facebook/common/time/MonotonicClock$-CC;
.super Ljava/lang/Object;
.source "MonotonicClock.java"


# direct methods
.method public static $default$now(Lcom/facebook/common/time/MonotonicClock;)J
    .locals 3
    .param p0, "_this"    # Lcom/facebook/common/time/MonotonicClock;

    .line 43
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0}, Lcom/facebook/common/time/MonotonicClock;->nowNanos()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static of(Lcom/facebook/common/time/Clock;)Lcom/facebook/common/time/MonotonicClock;
    .locals 2

    .line 52
    new-instance v0, Lcom/facebook/common/time/MonotonicClock$MonotonicClockWrapper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/common/time/MonotonicClock$MonotonicClockWrapper;-><init>(Lcom/facebook/common/time/Clock;Lcom/facebook/common/time/MonotonicClock-IA;)V

    return-object v0
.end method
