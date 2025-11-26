.class public final synthetic Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic f$2:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

.field public final synthetic f$3:Lcom/facebook/cache/common/CacheKey;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$2:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    iput-object p4, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$3:Lcom/facebook/cache/common/CacheKey;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v2, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$2:Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    iget-object v3, p0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache$$ExternalSyntheticLambda2;->f$3:Lcom/facebook/cache/common/CacheKey;

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;->$r8$lambda$vaIZbByACJ_oaNMhyp8n6lFtsWg(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/facebook/imagepipeline/cache/BufferedDiskCache;Lcom/facebook/cache/common/CacheKey;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v0

    return-object v0
.end method
