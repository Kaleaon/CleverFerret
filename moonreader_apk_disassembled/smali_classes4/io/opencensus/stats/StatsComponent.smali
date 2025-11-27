.class public abstract Lio/opencensus/stats/StatsComponent;
.super Ljava/lang/Object;
.source "StatsComponent.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getState()Lio/opencensus/stats/StatsCollectionState;
.end method

.method public abstract getStatsRecorder()Lio/opencensus/stats/StatsRecorder;
.end method

.method public abstract getViewManager()Lio/opencensus/stats/ViewManager;
.end method

.method public abstract setState(Lio/opencensus/stats/StatsCollectionState;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
