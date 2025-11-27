.class final Lio/opencensus/stats/NoopStats$NoopStatsComponent;
.super Lio/opencensus/stats/StatsComponent;
.source "NoopStats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/NoopStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopStatsComponent"
.end annotation


# instance fields
.field private volatile isRead:Z

.field private final viewManager:Lio/opencensus/stats/ViewManager;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 87
    invoke-direct {p0}, Lio/opencensus/stats/StatsComponent;-><init>()V

    .line 88
    invoke-static {}, Lio/opencensus/stats/NoopStats;->newNoopViewManager()Lio/opencensus/stats/ViewManager;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/stats/NoopStats$NoopStatsComponent;->viewManager:Lio/opencensus/stats/ViewManager;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/stats/NoopStats$1;)V
    .locals 0

    .line 87
    invoke-direct {p0}, Lio/opencensus/stats/NoopStats$NoopStatsComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getState()Lio/opencensus/stats/StatsCollectionState;
    .locals 1

    const/4 v0, 0x1

    .line 103
    iput-boolean v0, p0, Lio/opencensus/stats/NoopStats$NoopStatsComponent;->isRead:Z

    .line 104
    sget-object v0, Lio/opencensus/stats/StatsCollectionState;->DISABLED:Lio/opencensus/stats/StatsCollectionState;

    return-object v0
.end method

.method public getStatsRecorder()Lio/opencensus/stats/StatsRecorder;
    .locals 1

    .line 98
    invoke-static {}, Lio/opencensus/stats/NoopStats;->getNoopStatsRecorder()Lio/opencensus/stats/StatsRecorder;

    move-result-object v0

    return-object v0
.end method

.method public getViewManager()Lio/opencensus/stats/ViewManager;
    .locals 1

    .line 93
    iget-object v0, p0, Lio/opencensus/stats/NoopStats$NoopStatsComponent;->viewManager:Lio/opencensus/stats/ViewManager;

    return-object v0
.end method

.method public setState(Lio/opencensus/stats/StatsCollectionState;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 110
    const-string v0, "state"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    iget-boolean p1, p0, Lio/opencensus/stats/NoopStats$NoopStatsComponent;->isRead:Z

    xor-int/lit8 p1, p1, 0x1

    const-string v0, "State was already read, cannot set state."

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkState(ZLjava/lang/Object;)V

    return-void
.end method
