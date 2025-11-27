.class public interface abstract Lcom/facebook/imagepipeline/producers/ProducerContext;
.super Ljava/lang/Object;
.source "ProducerContext.kt"

# interfaces
.implements Lcom/facebook/fresco/middleware/HasExtraData;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020#H&J\u001c\u0010(\u001a\u00020!2\u0008\u0010)\u001a\u0004\u0018\u00010\u00072\u0008\u0010*\u001a\u0004\u0018\u00010\u0007H&J\u0012\u0010(\u001a\u00020!2\u0008\u0010)\u001a\u0004\u0018\u00010\u0007H&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\tR\u0014\u0010\n\u001a\u0004\u0018\u00010\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\tR\u0012\u0010\u000c\u001a\u00020\rX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000e\u0010\u000fR\u0012\u0010\u0010\u001a\u00020\u0011X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013R\u0012\u0010\u0014\u001a\u00020\u0015X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0017R\u0012\u0010\u0018\u001a\u00020\u0019X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u001aR\u0012\u0010\u001b\u001a\u00020\u001cX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001d\u0010\u001eR\u0012\u0010\u001f\u001a\u00020\u0019X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001f\u0010\u001aR\u0012\u0010$\u001a\u00020%X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008&\u0010\'\u00a8\u0006+"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/ProducerContext;",
        "Lcom/facebook/fresco/middleware/HasExtraData;",
        "imageRequest",
        "Lcom/facebook/imagepipeline/request/ImageRequest;",
        "getImageRequest",
        "()Lcom/facebook/imagepipeline/request/ImageRequest;",
        "id",
        "",
        "getId",
        "()Ljava/lang/String;",
        "uiComponentId",
        "getUiComponentId",
        "producerListener",
        "Lcom/facebook/imagepipeline/producers/ProducerListener2;",
        "getProducerListener",
        "()Lcom/facebook/imagepipeline/producers/ProducerListener2;",
        "callerContext",
        "",
        "getCallerContext",
        "()Ljava/lang/Object;",
        "lowestPermittedRequestLevel",
        "Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;",
        "getLowestPermittedRequestLevel",
        "()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;",
        "isPrefetch",
        "",
        "()Z",
        "priority",
        "Lcom/facebook/imagepipeline/common/Priority;",
        "getPriority",
        "()Lcom/facebook/imagepipeline/common/Priority;",
        "isIntermediateResultExpected",
        "addCallbacks",
        "",
        "callbacks",
        "Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;",
        "imagePipelineConfig",
        "Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;",
        "getImagePipelineConfig",
        "()Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;",
        "putOriginExtra",
        "origin",
        "subcategory",
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


# virtual methods
.method public abstract addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V
.end method

.method public abstract getCallerContext()Ljava/lang/Object;
.end method

.method public abstract getId()Ljava/lang/String;
.end method

.method public abstract getImagePipelineConfig()Lcom/facebook/imagepipeline/core/ImagePipelineConfigInterface;
.end method

.method public abstract getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;
.end method

.method public abstract getLowestPermittedRequestLevel()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;
.end method

.method public abstract getPriority()Lcom/facebook/imagepipeline/common/Priority;
.end method

.method public abstract getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;
.end method

.method public abstract getUiComponentId()Ljava/lang/String;
.end method

.method public abstract isIntermediateResultExpected()Z
.end method

.method public abstract isPrefetch()Z
.end method

.method public abstract putOriginExtra(Ljava/lang/String;)V
.end method

.method public abstract putOriginExtra(Ljava/lang/String;Ljava/lang/String;)V
.end method
