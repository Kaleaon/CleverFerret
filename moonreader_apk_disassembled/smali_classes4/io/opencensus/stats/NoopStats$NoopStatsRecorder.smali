.class final Lio/opencensus/stats/NoopStats$NoopStatsRecorder;
.super Lio/opencensus/stats/StatsRecorder;
.source "NoopStats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/NoopStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopStatsRecorder"
.end annotation


# static fields
.field static final INSTANCE:Lio/opencensus/stats/StatsRecorder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 117
    new-instance v0, Lio/opencensus/stats/NoopStats$NoopStatsRecorder;

    invoke-direct {v0}, Lio/opencensus/stats/NoopStats$NoopStatsRecorder;-><init>()V

    sput-object v0, Lio/opencensus/stats/NoopStats$NoopStatsRecorder;->INSTANCE:Lio/opencensus/stats/StatsRecorder;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 116
    invoke-direct {p0}, Lio/opencensus/stats/StatsRecorder;-><init>()V

    return-void
.end method


# virtual methods
.method public newMeasureMap()Lio/opencensus/stats/MeasureMap;
    .locals 1

    .line 121
    invoke-static {}, Lio/opencensus/stats/NoopStats;->newNoopMeasureMap()Lio/opencensus/stats/MeasureMap;

    move-result-object v0

    return-object v0
.end method
