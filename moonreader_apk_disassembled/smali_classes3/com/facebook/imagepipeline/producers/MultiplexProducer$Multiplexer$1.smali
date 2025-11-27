.class Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;
.super Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;
.source "MultiplexProducer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->addCallbacks(Landroid/util/Pair;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

.field final synthetic val$consumerContextPair:Landroid/util/Pair;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;Landroid/util/Pair;)V
    .locals 0

    .line 292
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->val$consumerContextPair:Landroid/util/Pair;

    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellationRequested()V
    .locals 7

    .line 301
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    monitor-enter v0

    .line 302
    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v1}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$fgetmConsumerContextPairs(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/concurrent/CopyOnWriteArraySet;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->val$consumerContextPair:Landroid/util/Pair;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 304
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v3}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$fgetmConsumerContextPairs(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/concurrent/CopyOnWriteArraySet;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 305
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v3}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$fgetmMultiplexProducerContext(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Lcom/facebook/imagepipeline/producers/BaseProducerContext;

    move-result-object v3

    move-object v4, v2

    goto :goto_0

    .line 307
    :cond_0
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v3}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$mupdateIsPrefetch(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/List;

    move-result-object v3

    .line 308
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v4}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$mupdatePriority(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/List;

    move-result-object v4

    .line 309
    iget-object v5, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v5}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$mupdateIsIntermediateResultExpected(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/List;

    move-result-object v5

    move-object v6, v3

    move-object v3, v2

    move-object v2, v6

    goto :goto_1

    :cond_1
    move-object v3, v2

    move-object v4, v3

    :goto_0
    move-object v5, v4

    .line 312
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 314
    invoke-static {v2}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnIsPrefetchChanged(Ljava/util/List;)V

    .line 315
    invoke-static {v4}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnPriorityChanged(Ljava/util/List;)V

    .line 316
    invoke-static {v5}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnIsIntermediateResultExpectedChanged(Ljava/util/List;)V

    if-eqz v3, :cond_3

    .line 320
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    iget-object v0, v0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->this$0:Lcom/facebook/imagepipeline/producers/MultiplexProducer;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/MultiplexProducer;->-$$Nest$fgetmKeepCancelledFetchAsLowPriority(Lcom/facebook/imagepipeline/producers/MultiplexProducer;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v3}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->isPrefetch()Z

    move-result v0

    if-nez v0, :cond_2

    .line 321
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->LOW:Lcom/facebook/imagepipeline/common/Priority;

    .line 322
    invoke-virtual {v3, v0}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->setPriorityNoCallbacks(Lcom/facebook/imagepipeline/common/Priority;)Ljava/util/List;

    move-result-object v0

    .line 323
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnPriorityChanged(Ljava/util/List;)V

    goto :goto_2

    .line 325
    :cond_2
    invoke-virtual {v3}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->cancel()V

    :cond_3
    :goto_2
    if-eqz v1, :cond_4

    .line 329
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->val$consumerContextPair:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    :cond_4
    return-void

    :catchall_0
    move-exception v1

    .line 312
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onIsIntermediateResultExpectedChanged()V
    .locals 1

    .line 340
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    .line 341
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$mupdateIsIntermediateResultExpected(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/List;

    move-result-object v0

    .line 340
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnIsIntermediateResultExpectedChanged(Ljava/util/List;)V

    return-void
.end method

.method public onIsPrefetchChanged()V
    .locals 1

    .line 335
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$mupdateIsPrefetch(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnIsPrefetchChanged(Ljava/util/List;)V

    return-void
.end method

.method public onPriorityChanged()V
    .locals 1

    .line 346
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$1;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->-$$Nest$mupdatePriority(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/BaseProducerContext;->callOnPriorityChanged(Ljava/util/List;)V

    return-void
.end method
