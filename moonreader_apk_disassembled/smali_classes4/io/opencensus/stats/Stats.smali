.class public final Lio/opencensus/stats/Stats;
.super Ljava/lang/Object;
.source "Stats.java"


# static fields
.field private static final logger:Ljava/util/logging/Logger;

.field private static final statsComponent:Lio/opencensus/stats/StatsComponent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-class v0, Lio/opencensus/stats/Stats;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/opencensus/stats/Stats;->logger:Ljava/util/logging/Logger;

    .line 33
    const-class v0, Lio/opencensus/stats/StatsComponent;

    .line 34
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/stats/Stats;->loadStatsComponent(Ljava/lang/ClassLoader;)Lio/opencensus/stats/StatsComponent;

    move-result-object v0

    sput-object v0, Lio/opencensus/stats/Stats;->statsComponent:Lio/opencensus/stats/StatsComponent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getState()Lio/opencensus/stats/StatsCollectionState;
    .locals 1

    .line 67
    sget-object v0, Lio/opencensus/stats/Stats;->statsComponent:Lio/opencensus/stats/StatsComponent;

    invoke-virtual {v0}, Lio/opencensus/stats/StatsComponent;->getState()Lio/opencensus/stats/StatsCollectionState;

    move-result-object v0

    return-object v0
.end method

.method public static getStatsRecorder()Lio/opencensus/stats/StatsRecorder;
    .locals 1

    .line 42
    sget-object v0, Lio/opencensus/stats/Stats;->statsComponent:Lio/opencensus/stats/StatsComponent;

    invoke-virtual {v0}, Lio/opencensus/stats/StatsComponent;->getStatsRecorder()Lio/opencensus/stats/StatsRecorder;

    move-result-object v0

    return-object v0
.end method

.method public static getViewManager()Lio/opencensus/stats/ViewManager;
    .locals 1

    .line 51
    sget-object v0, Lio/opencensus/stats/Stats;->statsComponent:Lio/opencensus/stats/StatsComponent;

    invoke-virtual {v0}, Lio/opencensus/stats/StatsComponent;->getViewManager()Lio/opencensus/stats/ViewManager;

    move-result-object v0

    return-object v0
.end method

.method static loadStatsComponent(Ljava/lang/ClassLoader;)Lio/opencensus/stats/StatsComponent;
    .locals 5
    .param p0    # Ljava/lang/ClassLoader;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    .line 96
    :try_start_0
    const-string v1, "io.opencensus.impl.stats.StatsComponentImpl"

    .line 97
    invoke-static {v1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lio/opencensus/stats/StatsComponent;

    .line 96
    invoke-static {v1, v2}, Lio/opencensus/internal/Provider;->createInstance(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/stats/StatsComponent;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    .line 101
    sget-object v2, Lio/opencensus/stats/Stats;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "Couldn\'t load full implementation for StatsComponent, now trying to load lite implementation."

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    :try_start_1
    const-string v1, "io.opencensus.impllite.stats.StatsComponentImplLite"

    .line 110
    invoke-static {v1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0

    const-class v0, Lio/opencensus/stats/StatsComponent;

    .line 109
    invoke-static {p0, v0}, Lio/opencensus/internal/Provider;->createInstance(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/opencensus/stats/StatsComponent;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    .line 116
    sget-object v0, Lio/opencensus/stats/Stats;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "Couldn\'t load lite implementation for StatsComponent, now using default implementation for StatsComponent."

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 122
    invoke-static {}, Lio/opencensus/stats/NoopStats;->newNoopStatsComponent()Lio/opencensus/stats/StatsComponent;

    move-result-object p0

    return-object p0
.end method

.method public static setState(Lio/opencensus/stats/StatsCollectionState;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 88
    sget-object v0, Lio/opencensus/stats/Stats;->statsComponent:Lio/opencensus/stats/StatsComponent;

    invoke-virtual {v0, p0}, Lio/opencensus/stats/StatsComponent;->setState(Lio/opencensus/stats/StatsCollectionState;)V

    return-void
.end method
