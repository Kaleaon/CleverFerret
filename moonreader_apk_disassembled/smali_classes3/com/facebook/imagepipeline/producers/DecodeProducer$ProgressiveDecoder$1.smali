.class public final Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;
.super Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;
.source "DecodeProducer.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;-><init>(Lcom/facebook/imagepipeline/producers/DecodeProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0003H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "com/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1",
        "Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;",
        "onIsIntermediateResultExpectedChanged",
        "",
        "onCancellationRequested",
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
.field final synthetic $decodeCancellationEnabled:Z

.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Z)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    iput-boolean p2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;->$decodeCancellationEnabled:Z

    .line 428
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellationRequested()V
    .locals 1

    .line 436
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;->$decodeCancellationEnabled:Z

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->access$handleCancellation(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;)V

    :cond_0
    return-void
.end method

.method public onIsIntermediateResultExpectedChanged()V
    .locals 1

    .line 430
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->access$getProducerContext$p(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;)Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->isIntermediateResultExpected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$1;->this$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->access$getJobScheduler$p(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;)Lcom/facebook/imagepipeline/producers/JobScheduler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->scheduleJob()Z

    :cond_0
    return-void
.end method
