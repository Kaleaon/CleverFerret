.class final Lio/opencensus/stats/NoopStats$NoopViewManager;
.super Lio/opencensus/stats/ViewManager;
.source "NoopStats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/NoopStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopViewManager"
.end annotation


# static fields
.field private static final ZERO_TIMESTAMP:Lio/opencensus/common/Timestamp;


# instance fields
.field private volatile exportedViews:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final registeredViews:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/opencensus/stats/View$Name;",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    .line 161
    invoke-static {v0, v1, v2}, Lio/opencensus/common/Timestamp;->create(JI)Lio/opencensus/common/Timestamp;

    move-result-object v0

    sput-object v0, Lio/opencensus/stats/NoopStats$NoopViewManager;->ZERO_TIMESTAMP:Lio/opencensus/common/Timestamp;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 160
    invoke-direct {p0}, Lio/opencensus/stats/ViewManager;-><init>()V

    .line 163
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/stats/NoopStats$1;)V
    .locals 0

    .line 160
    invoke-direct {p0}, Lio/opencensus/stats/NoopStats$NoopViewManager;-><init>()V

    return-void
.end method

.method private static filterExportedViews(Ljava/util/Collection;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lio/opencensus/stats/View;",
            ">;)",
            "Ljava/util/Set<",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation

    .line 224
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 225
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/stats/View;

    .line 226
    invoke-virtual {v1}, Lio/opencensus/stats/View;->getWindow()Lio/opencensus/stats/View$AggregationWindow;

    move-result-object v2

    instance-of v2, v2, Lio/opencensus/stats/View$AggregationWindow$Interval;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 229
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 231
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getAllExportedViews()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation

    .line 212
    iget-object v0, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->exportedViews:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 214
    iget-object v1, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    monitor-enter v1

    .line 215
    :try_start_0
    iget-object v0, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/stats/NoopStats$NoopViewManager;->filterExportedViews(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->exportedViews:Ljava/util/Set;

    .line 216
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    return-object v0
.end method

.method public getView(Lio/opencensus/stats/View$Name;)Lio/opencensus/stats/ViewData;
    .locals 6
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 189
    const-string v0, "name"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object v0, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    monitor-enter v0

    .line 191
    :try_start_0
    iget-object v1, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/opencensus/stats/View;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 193
    monitor-exit v0

    return-object p1

    .line 197
    :cond_0
    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 198
    invoke-virtual {p1}, Lio/opencensus/stats/View;->getWindow()Lio/opencensus/stats/View$AggregationWindow;

    move-result-object v2

    sget-object v3, Lio/opencensus/stats/NoopStats$NoopViewManager;->ZERO_TIMESTAMP:Lio/opencensus/common/Timestamp;

    .line 201
    invoke-static {v3, v3}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;->create(Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;

    move-result-object v4

    .line 200
    invoke-static {v4}, Lio/opencensus/common/Functions;->returnConstant(Ljava/lang/Object;)Lio/opencensus/common/Function;

    move-result-object v4

    .line 204
    invoke-static {v3}, Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;->create(Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;

    move-result-object v3

    .line 203
    invoke-static {v3}, Lio/opencensus/common/Functions;->returnConstant(Ljava/lang/Object;)Lio/opencensus/common/Function;

    move-result-object v3

    .line 205
    invoke-static {}, Lio/opencensus/common/Functions;->throwAssertionError()Lio/opencensus/common/Function;

    move-result-object v5

    .line 199
    invoke-virtual {v2, v4, v3, v5}, Lio/opencensus/stats/View$AggregationWindow;->match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/opencensus/stats/ViewData$AggregationWindowData;

    .line 195
    invoke-static {p1, v1, v2}, Lio/opencensus/stats/ViewData;->create(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;)Lio/opencensus/stats/ViewData;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    .line 207
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public registerView(Lio/opencensus/stats/View;)V
    .locals 4

    .line 172
    const-string v0, "newView"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    iget-object v0, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    monitor-enter v0

    const/4 v1, 0x0

    .line 174
    :try_start_0
    iput-object v1, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->exportedViews:Ljava/util/Set;

    .line 175
    iget-object v1, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    invoke-virtual {p1}, Lio/opencensus/stats/View;->getName()Lio/opencensus/stats/View$Name;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/stats/View;

    if-eqz v1, :cond_1

    .line 177
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    :goto_1
    const-string v3, "A different view with the same name already exists."

    .line 176
    invoke-static {v2, v3}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    if-nez v1, :cond_2

    .line 180
    iget-object v1, p0, Lio/opencensus/stats/NoopStats$NoopViewManager;->registeredViews:Ljava/util/Map;

    invoke-virtual {p1}, Lio/opencensus/stats/View;->getName()Lio/opencensus/stats/View$Name;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
