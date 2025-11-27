.class public final synthetic Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

.field public final synthetic f$2:Lcom/facebook/cache/common/CacheKey;

.field public final synthetic f$3:Lcom/facebook/imagepipeline/image/EncodedImage;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$1:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    iput-object p3, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$2:Lcom/facebook/cache/common/CacheKey;

    iput-object p4, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$3:Lcom/facebook/imagepipeline/image/EncodedImage;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$1:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$2:Lcom/facebook/cache/common/CacheKey;

    iget-object v3, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda1;->f$3:Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->$r8$lambda$Xi8OsSSDnMevR6CCYihna7wDklU(Ljava/lang/Object;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    return-void
.end method
