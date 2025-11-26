.class final Lio/opencensus/stats/NoopStats;
.super Ljava/lang/Object;
.source "NoopStats.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/stats/NoopStats$NoopViewManager;,
        Lio/opencensus/stats/NoopStats$NoopMeasureMap;,
        Lio/opencensus/stats/NoopStats$NoopStatsRecorder;,
        Lio/opencensus/stats/NoopStats$NoopStatsComponent;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getNoopStatsRecorder()Lio/opencensus/stats/StatsRecorder;
    .locals 1

    .line 63
    sget-object v0, Lio/opencensus/stats/NoopStats$NoopStatsRecorder;->INSTANCE:Lio/opencensus/stats/StatsRecorder;

    return-object v0
.end method

.method static newNoopMeasureMap()Lio/opencensus/stats/MeasureMap;
    .locals 2

    .line 72
    new-instance v0, Lio/opencensus/stats/NoopStats$NoopMeasureMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/stats/NoopStats$NoopMeasureMap;-><init>(Lio/opencensus/stats/NoopStats$1;)V

    return-object v0
.end method

.method static newNoopStatsComponent()Lio/opencensus/stats/StatsComponent;
    .locals 2

    .line 54
    new-instance v0, Lio/opencensus/stats/NoopStats$NoopStatsComponent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/stats/NoopStats$NoopStatsComponent;-><init>(Lio/opencensus/stats/NoopStats$1;)V

    return-object v0
.end method

.method static newNoopViewManager()Lio/opencensus/stats/ViewManager;
    .locals 2

    .line 83
    new-instance v0, Lio/opencensus/stats/NoopStats$NoopViewManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/stats/NoopStats$NoopViewManager;-><init>(Lio/opencensus/stats/NoopStats$1;)V

    return-object v0
.end method
