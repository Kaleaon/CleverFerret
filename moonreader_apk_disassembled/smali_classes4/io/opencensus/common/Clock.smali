.class public abstract Lio/opencensus/common/Clock;
.super Ljava/lang/Object;
.source "Clock.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract now()Lio/opencensus/common/Timestamp;
.end method

.method public abstract nowNanos()J
.end method
