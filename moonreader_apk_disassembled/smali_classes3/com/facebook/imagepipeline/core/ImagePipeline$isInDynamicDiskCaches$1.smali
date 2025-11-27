.class final Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;
.super Ljava/lang/Object;
.source "ImagePipeline.kt"

# interfaces
.implements Lbolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/core/ImagePipeline;->isInDynamicDiskCaches(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/cache/common/CacheKey;Lbolts/Continuation;Lbolts/CancellationTokenSource;)Lbolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TTaskResult:",
        "Ljava/lang/Object;",
        "TContinuationResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lbolts/Continuation;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $cts:Lbolts/CancellationTokenSource;

.field final synthetic $curTask:Lkotlin/jvm/internal/Ref$ObjectRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Lbolts/Task<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic $intermediateContinuation:Lbolts/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lbolts/Continuation<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lbolts/CancellationTokenSource;Lbolts/Continuation;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/CancellationTokenSource;",
            "Lbolts/Continuation<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Void;",
            ">;",
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Lbolts/Task<",
            "Ljava/lang/Boolean;",
            ">;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->$cts:Lbolts/CancellationTokenSource;

    iput-object p2, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->$intermediateContinuation:Lbolts/Continuation;

    iput-object p3, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->$curTask:Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Lbolts/Task;)Lbolts/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/Task<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lbolts/Task<",
            "+",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 838
    invoke-virtual {p1}, Lbolts/Task;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lbolts/Task;->isFaulted()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 839
    iget-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->$cts:Lbolts/CancellationTokenSource;

    invoke-virtual {p1}, Lbolts/CancellationTokenSource;->cancel()V

    const/4 p1, 0x1

    .line 840
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lbolts/Task;->forResult(Ljava/lang/Object;)Lbolts/Task;

    move-result-object p1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->$intermediateContinuation:Lbolts/Continuation;

    invoke-virtual {p1, v0}, Lbolts/Task;->continueWith(Lbolts/Continuation;)Lbolts/Task;

    move-result-object p1

    return-object p1

    .line 841
    :cond_0
    invoke-virtual {p1}, Lbolts/Task;->isCancelled()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 842
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lbolts/Task;->forResult(Ljava/lang/Object;)Lbolts/Task;

    move-result-object p1

    return-object p1

    .line 844
    :cond_1
    iget-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->$curTask:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object p1, p1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p1, Lbolts/Task;

    return-object p1
.end method

.method public bridge synthetic then(Lbolts/Task;)Ljava/lang/Object;
    .locals 0

    .line 836
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipeline$isInDynamicDiskCaches$1;->then(Lbolts/Task;)Lbolts/Task;

    move-result-object p1

    return-object p1
.end method
