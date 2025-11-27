.class public final synthetic Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

.field public final synthetic f$1:Lcom/facebook/imagepipeline/producers/DecodeProducer;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Lcom/facebook/imagepipeline/producers/DecodeProducer;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;->f$1:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    iput p3, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;->f$2:I

    return-void
.end method


# virtual methods
.method public final run(Lcom/facebook/imagepipeline/image/EncodedImage;I)V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;->f$1:Lcom/facebook/imagepipeline/producers/DecodeProducer;

    iget v2, p0, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder$$ExternalSyntheticLambda0;->f$2:I

    invoke-static {v0, v1, v2, p1, p2}, Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;->$r8$lambda$Y9NahPUmLEkdMWWMLomB1mNwyIc(Lcom/facebook/imagepipeline/producers/DecodeProducer$ProgressiveDecoder;Lcom/facebook/imagepipeline/producers/DecodeProducer;ILcom/facebook/imagepipeline/image/EncodedImage;I)V

    return-void
.end method
