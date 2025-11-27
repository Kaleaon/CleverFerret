.class public abstract Lio/opencensus/metrics/export/Point;
.super Ljava/lang/Object;
.source "Point.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lio/opencensus/metrics/export/Value;Lio/opencensus/common/Timestamp;)Lio/opencensus/metrics/export/Point;
    .locals 1

    .line 45
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Point;

    invoke-direct {v0, p0, p1}, Lio/opencensus/metrics/export/AutoValue_Point;-><init>(Lio/opencensus/metrics/export/Value;Lio/opencensus/common/Timestamp;)V

    return-object v0
.end method


# virtual methods
.method public abstract getTimestamp()Lio/opencensus/common/Timestamp;
.end method

.method public abstract getValue()Lio/opencensus/metrics/export/Value;
.end method
