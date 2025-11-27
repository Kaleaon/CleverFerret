.class public abstract Lio/opencensus/metrics/LongGauge;
.super Ljava/lang/Object;
.source "LongGauge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/LongGauge$NoopLongGauge;,
        Lio/opencensus/metrics/LongGauge$LongPoint;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newNoopLongGauge(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/LongGauge;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)",
            "Lio/opencensus/metrics/LongGauge;"
        }
    .end annotation

    .line 130
    invoke-static {p0, p1, p2, p3}, Lio/opencensus/metrics/LongGauge$NoopLongGauge;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/LongGauge$NoopLongGauge;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract getDefaultTimeSeries()Lio/opencensus/metrics/LongGauge$LongPoint;
.end method

.method public abstract getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongGauge$LongPoint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)",
            "Lio/opencensus/metrics/LongGauge$LongPoint;"
        }
    .end annotation
.end method

.method public abstract removeTimeSeries(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)V"
        }
    .end annotation
.end method
