.class public final synthetic Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lbolts/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/core/DiskCachesStore;

.field public final synthetic f$1:Lcom/facebook/cache/common/CacheKey;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/core/DiskCachesStore;Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda2;->f$0:Lcom/facebook/imagepipeline/core/DiskCachesStore;

    iput-object p2, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda2;->f$1:Lcom/facebook/cache/common/CacheKey;

    return-void
.end method


# virtual methods
.method public final then(Lbolts/Task;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda2;->f$0:Lcom/facebook/imagepipeline/core/DiskCachesStore;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda2;->f$1:Lcom/facebook/cache/common/CacheKey;

    invoke-static {v0, v1, p1}, Lcom/facebook/imagepipeline/core/ImagePipeline;->$r8$lambda$h_URuzpFksYOniHi5DkyH5FAQGQ(Lcom/facebook/imagepipeline/core/DiskCachesStore;Lcom/facebook/cache/common/CacheKey;Lbolts/Task;)Lbolts/Task;

    move-result-object p1

    return-object p1
.end method
