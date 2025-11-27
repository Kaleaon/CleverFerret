.class Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;
.super Lcom/facebook/imagepipeline/producers/DelegatingConsumer;
.source "ThrottlingProducer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/ThrottlingProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThrottlerConsumer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/DelegatingConsumer<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/ThrottlingProducer;


# direct methods
.method private constructor <init>(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;Lcom/facebook/imagepipeline/producers/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "TT;>;)V"
        }
    .end annotation

    .line 76
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->this$0:Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    .line 77
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/producers/DelegatingConsumer;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ThrottlingProducer-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;-><init>(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;Lcom/facebook/imagepipeline/producers/Consumer;)V

    return-void
.end method

.method private onRequestFinished()V
    .locals 4

    .line 102
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->this$0:Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    monitor-enter v0

    .line 103
    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->this$0:Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    invoke-static {v1}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer;->-$$Nest$fgetmPendingRequests(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    if-nez v1, :cond_0

    .line 105
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->this$0:Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    invoke-static {v2}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer;->-$$Nest$fgetmNumCurrentRequests(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer;->-$$Nest$fputmNumCurrentRequests(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;I)V

    .line 107
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 110
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->this$0:Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer;->-$$Nest$fgetmExecutor(Lcom/facebook/imagepipeline/producers/ThrottlingProducer;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v2, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer$1;

    invoke-direct {v2, p0, v1}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer$1;-><init>(Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;Landroid/util/Pair;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 107
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method protected onCancellationImpl()V
    .locals 1

    .line 96
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    .line 97
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->onRequestFinished()V

    return-void
.end method

.method protected onFailureImpl(Ljava/lang/Throwable;)V
    .locals 1

    .line 90
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/producers/Consumer;->onFailure(Ljava/lang/Throwable;)V

    .line 91
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->onRequestFinished()V

    return-void
.end method

.method protected onNewResultImpl(Ljava/lang/Object;I)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->getConsumer()Lcom/facebook/imagepipeline/producers/Consumer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;I)V

    .line 83
    invoke-static {p2}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->isLast(I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 84
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/ThrottlingProducer$ThrottlerConsumer;->onRequestFinished()V

    :cond_0
    return-void
.end method
