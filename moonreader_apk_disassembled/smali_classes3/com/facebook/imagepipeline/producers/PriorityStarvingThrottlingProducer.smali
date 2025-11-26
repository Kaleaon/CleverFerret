.class public Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;
.super Ljava/lang/Object;
.source "PriorityStarvingThrottlingProducer.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$ThrottlerConsumer;,
        Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$PriorityComparator;,
        Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/Producer<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final PRODUCER_NAME:Ljava/lang/String; = "PriorityStarvingThrottlingProducer"


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mMaxSimultaneousRequests:I

.field private mNumCurrentRequests:I

.field private final mPendingRequests:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetmExecutor(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;)Ljava/util/concurrent/Executor;
    .locals 0

    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mExecutor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNumCurrentRequests(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;)I
    .locals 0

    iget p0, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mNumCurrentRequests:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmPendingRequests(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;)Ljava/util/Queue;
    .locals 0

    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mPendingRequests:Ljava/util/Queue;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmNumCurrentRequests(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;I)V
    .locals 0

    iput p1, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mNumCurrentRequests:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mproduceResultsInternal(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->produceResultsInternal(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;)V

    return-void
.end method

.method public constructor <init>(ILjava/util/concurrent/Executor;Lcom/facebook/imagepipeline/producers/Producer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Executor;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "TT;>;)V"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mMaxSimultaneousRequests:I

    .line 46
    invoke-static {p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mExecutor:Ljava/util/concurrent/Executor;

    .line 47
    invoke-static {p3}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 48
    new-instance p1, Ljava/util/PriorityQueue;

    new-instance p2, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$PriorityComparator;

    invoke-direct {p2}, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$PriorityComparator;-><init>()V

    const/16 p3, 0xb

    invoke-direct {p1, p3, p2}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mPendingRequests:Ljava/util/Queue;

    const/4 p1, 0x0

    .line 49
    iput p1, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mNumCurrentRequests:I

    return-void
.end method

.method private produceResultsInternal(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item<",
            "TT;>;)V"
        }
    .end annotation

    .line 74
    iget-object v0, p1, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-result-object v0

    .line 75
    iget-object v1, p1, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string v2, "PriorityStarvingThrottlingProducer"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 76
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mInputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    new-instance v1, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$ThrottlerConsumer;

    iget-object v2, p1, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;->consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-direct {v1, p0, v2, v3}, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$ThrottlerConsumer;-><init>(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer-IA;)V

    iget-object p1, p1, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v0, v1, p1}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-void
.end method


# virtual methods
.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "TT;>;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    .line 54
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 55
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-result-object v2

    .line 56
    const-string v3, "PriorityStarvingThrottlingProducer"

    invoke-interface {v2, p2, v3}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V

    .line 58
    monitor-enter p0

    .line 59
    :try_start_0
    iget v2, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mNumCurrentRequests:I

    iget v3, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mMaxSimultaneousRequests:I

    const/4 v4, 0x1

    if-lt v2, v3, :cond_0

    .line 60
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mPendingRequests:Ljava/util/Queue;

    new-instance v3, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;

    invoke-direct {v3, p1, p2, v0, v1}, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;J)V

    invoke-interface {v2, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    add-int/2addr v2, v4

    .line 63
    iput v2, p0, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->mNumCurrentRequests:I

    const/4 v4, 0x0

    .line 66
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_1

    .line 69
    new-instance v2, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;

    invoke-direct {v2, p1, p2, v0, v1}, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;J)V

    invoke-direct {p0, v2}, Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer;->produceResultsInternal(Lcom/facebook/imagepipeline/producers/PriorityStarvingThrottlingProducer$Item;)V

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 66
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
