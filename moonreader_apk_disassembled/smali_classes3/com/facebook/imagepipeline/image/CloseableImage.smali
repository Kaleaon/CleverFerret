.class public interface abstract Lcom/facebook/imagepipeline/image/CloseableImage;
.super Ljava/lang/Object;
.source "CloseableImage.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lcom/facebook/imagepipeline/image/ImageInfo;
.implements Lcom/facebook/common/references/HasBitmap;
.implements Lcom/facebook/fresco/middleware/HasExtraData;


# virtual methods
.method public abstract close()V
.end method

.method public abstract getHeight()I
.end method

.method public abstract getImageInfo()Lcom/facebook/imagepipeline/image/ImageInfo;
.end method

.method public abstract getQualityInfo()Lcom/facebook/imagepipeline/image/QualityInfo;
.end method

.method public abstract getSizeInBytes()I
.end method

.method public abstract getWidth()I
.end method

.method public abstract isClosed()Z
.end method

.method public abstract isStateful()Z
.end method
