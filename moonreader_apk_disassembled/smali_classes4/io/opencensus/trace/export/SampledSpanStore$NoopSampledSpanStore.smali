.class final Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;
.super Lio/opencensus/trace/export/SampledSpanStore;
.source "SampledSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/SampledSpanStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopSampledSpanStore"
.end annotation


# static fields
.field private static final EMPTY_PER_SPAN_NAME_SUMMARY:Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;


# instance fields
.field private final registeredSpanNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 479
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 480
    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 478
    invoke-static {v0, v1}, Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;->create(Ljava/util/Map;Ljava/util/Map;)Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->EMPTY_PER_SPAN_NAME_SUMMARY:Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 476
    invoke-direct {p0}, Lio/opencensus/trace/export/SampledSpanStore;-><init>()V

    .line 482
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/export/SampledSpanStore$1;)V
    .locals 0

    .line 476
    invoke-direct {p0}, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;-><init>()V

    return-void
.end method


# virtual methods
.method public getErrorSampledSpans(Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;",
            ")",
            "Ljava/util/Collection<",
            "Lio/opencensus/trace/export/SpanData;",
            ">;"
        }
    .end annotation

    .line 504
    const-string v0, "errorFilter"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p1
.end method

.method public getLatencySampledSpans(Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;",
            ")",
            "Ljava/util/Collection<",
            "Lio/opencensus/trace/export/SpanData;",
            ">;"
        }
    .end annotation

    .line 498
    const-string v0, "latencyFilter"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p1
.end method

.method public getRegisteredSpanNamesForCollection()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 526
    iget-object v0, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    monitor-enter v0

    .line 527
    :try_start_0
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 528
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSummary()Lio/opencensus/trace/export/SampledSpanStore$Summary;
    .locals 5

    .line 487
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 488
    iget-object v1, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    monitor-enter v1

    .line 489
    :try_start_0
    iget-object v2, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 490
    sget-object v4, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->EMPTY_PER_SPAN_NAME_SUMMARY:Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 492
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 493
    invoke-static {v0}, Lio/opencensus/trace/export/SampledSpanStore$Summary;->create(Ljava/util/Map;)Lio/opencensus/trace/export/SampledSpanStore$Summary;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    .line 492
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public registerSpanNamesForCollection(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 510
    const-string v0, "spanNames"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    iget-object v0, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    monitor-enter v0

    .line 512
    :try_start_0
    iget-object v1, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 513
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public unregisterSpanNamesForCollection(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 518
    const-string v0, "spanNames"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    iget-object v0, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    monitor-enter v0

    .line 520
    :try_start_0
    iget-object v1, p0, Lio/opencensus/trace/export/SampledSpanStore$NoopSampledSpanStore;->registeredSpanNames:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 521
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
