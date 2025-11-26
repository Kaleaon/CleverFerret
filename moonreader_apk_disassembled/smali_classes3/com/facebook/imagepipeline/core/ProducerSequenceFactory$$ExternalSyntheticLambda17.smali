.class public final synthetic Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda17;->f$0:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda17;->f$0:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;

    invoke-static {v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->$r8$lambda$jp4XLEcuZPfCcplgWfZKBTMZYTY(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    move-result-object v0

    return-object v0
.end method
