.class public final synthetic Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lbolts/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/core/ImagePipeline;

.field public final synthetic f$1:Lcom/facebook/imagepipeline/request/ImageRequest;

.field public final synthetic f$2:Lcom/facebook/cache/common/CacheKey;

.field public final synthetic f$3:Lbolts/Continuation;

.field public final synthetic f$4:Lbolts/CancellationTokenSource;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/core/ImagePipeline;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/cache/common/CacheKey;Lbolts/Continuation;Lbolts/CancellationTokenSource;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$0:Lcom/facebook/imagepipeline/core/ImagePipeline;

    iput-object p2, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$1:Lcom/facebook/imagepipeline/request/ImageRequest;

    iput-object p3, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$2:Lcom/facebook/cache/common/CacheKey;

    iput-object p4, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$3:Lbolts/Continuation;

    iput-object p5, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$4:Lbolts/CancellationTokenSource;

    return-void
.end method


# virtual methods
.method public final then(Lbolts/Task;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$0:Lcom/facebook/imagepipeline/core/ImagePipeline;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$1:Lcom/facebook/imagepipeline/request/ImageRequest;

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$2:Lcom/facebook/cache/common/CacheKey;

    iget-object v3, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$3:Lbolts/Continuation;

    iget-object v4, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda3;->f$4:Lbolts/CancellationTokenSource;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/facebook/imagepipeline/core/ImagePipeline;->$r8$lambda$7JWcDGUyxezW9d95xY22VrjNbsE(Lcom/facebook/imagepipeline/core/ImagePipeline;Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/cache/common/CacheKey;Lbolts/Continuation;Lbolts/CancellationTokenSource;Lbolts/Task;)Lbolts/Task;

    move-result-object p1

    return-object p1
.end method
