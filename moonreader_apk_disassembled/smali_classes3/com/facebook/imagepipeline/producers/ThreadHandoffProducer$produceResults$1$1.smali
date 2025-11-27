.class public final Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;
.super Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;
.source "ThreadHandoffProducer.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1",
        "Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;",
        "onCancellationRequested",
        "",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $statefulRunnable:Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable<",
            "TT;>;",
            "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;->$statefulRunnable:Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;->this$0:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;

    .line 45
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellationRequested()V
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;->$statefulRunnable:Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->cancel()V

    .line 48
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;->this$0:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->getThreadHandoffProducerQueue()Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;->$statefulRunnable:Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;->remove(Ljava/lang/Runnable;)V

    return-void
.end method
