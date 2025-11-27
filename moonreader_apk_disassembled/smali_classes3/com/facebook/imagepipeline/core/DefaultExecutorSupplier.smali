.class public final Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;
.super Ljava/lang/Object;
.source "DefaultExecutorSupplier.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/core/ExecutorSupplier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\r\u001a\u00020\u0007H\u0016J\u0008\u0010\u000e\u001a\u00020\u0007H\u0016J\u0008\u0010\u000f\u001a\u00020\u0007H\u0016J\u0008\u0010\u0010\u001a\u00020\u0007H\u0016J\n\u0010\u0011\u001a\u0004\u0018\u00010\u000cH\u0016J\u0008\u0010\u0012\u001a\u00020\u0007H\u0016J\u0008\u0010\u0013\u001a\u00020\u0007H\u0016R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;",
        "Lcom/facebook/imagepipeline/core/ExecutorSupplier;",
        "numCpuBoundThreads",
        "",
        "<init>",
        "(I)V",
        "ioBoundExecutor",
        "Ljava/util/concurrent/Executor;",
        "decodeExecutor",
        "backgroundExecutor",
        "lightWeightBackgroundExecutor",
        "backgroundScheduledExecutorService",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "forLocalStorageRead",
        "forLocalStorageWrite",
        "forDecode",
        "forBackgroundTasks",
        "scheduledExecutorServiceForBackgroundTasks",
        "forLightweightBackgroundTasks",
        "forThumbnailProducer",
        "Companion",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier$Companion;

.field private static final NUM_IO_BOUND_THREADS:I = 0x2

.field private static final NUM_LIGHTWEIGHT_BACKGROUND_THREADS:I = 0x1


# instance fields
.field private final backgroundExecutor:Ljava/util/concurrent/Executor;

.field private final backgroundScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private final decodeExecutor:Ljava/util/concurrent/Executor;

.field private final ioBoundExecutor:Ljava/util/concurrent/Executor;

.field private final lightWeightBackgroundExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->Companion:Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier$Companion;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 6

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    const/16 v1, 0xa

    const-string v2, "FrescoIoBoundExecutor"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;-><init>(ILjava/lang/String;Z)V

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    const/4 v2, 0x2

    .line 24
    invoke-static {v2, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    const-string v2, "newFixedThreadPool(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->ioBoundExecutor:Ljava/util/concurrent/Executor;

    .line 30
    new-instance v0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    const-string v4, "FrescoDecodeExecutor"

    invoke-direct {v0, v1, v4, v3}, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;-><init>(ILjava/lang/String;Z)V

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    .line 28
    invoke-static {p1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->decodeExecutor:Ljava/util/concurrent/Executor;

    .line 34
    new-instance v0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    const-string v4, "FrescoBackgroundExecutor"

    invoke-direct {v0, v1, v4, v3}, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;-><init>(ILjava/lang/String;Z)V

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    .line 32
    invoke-static {p1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->backgroundExecutor:Ljava/util/concurrent/Executor;

    .line 39
    new-instance v0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    .line 40
    const-string v5, "FrescoLightWeightBackgroundExecutor"

    .line 39
    invoke-direct {v0, v1, v5, v3}, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;-><init>(ILjava/lang/String;Z)V

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    .line 37
    invoke-static {v3, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->lightWeightBackgroundExecutor:Ljava/util/concurrent/Executor;

    .line 44
    new-instance v0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    invoke-direct {v0, v1, v4, v3}, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;-><init>(ILjava/lang/String;Z)V

    check-cast v0, Ljava/util/concurrent/ThreadFactory;

    .line 42
    invoke-static {p1, v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    const-string v0, "newScheduledThreadPool(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->backgroundScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method


# virtual methods
.method public forBackgroundTasks()Ljava/util/concurrent/Executor;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->backgroundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public forDecode()Ljava/util/concurrent/Executor;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->decodeExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public forLightweightBackgroundTasks()Ljava/util/concurrent/Executor;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->lightWeightBackgroundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public forLocalStorageRead()Ljava/util/concurrent/Executor;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->ioBoundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public forLocalStorageWrite()Ljava/util/concurrent/Executor;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->ioBoundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public forThumbnailProducer()Ljava/util/concurrent/Executor;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->ioBoundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public scheduledExecutorServiceForBackgroundTasks()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DefaultExecutorSupplier;->backgroundScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method
