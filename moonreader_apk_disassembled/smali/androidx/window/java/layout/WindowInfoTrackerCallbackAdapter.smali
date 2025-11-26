.class public final Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;
.super Ljava/lang/Object;
.source "WindowInfoTrackerCallbackAdapter.kt"

# interfaces
.implements Landroidx/window/layout/WindowInfoTracker;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0002\u0010\u0003B\u0017\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J$\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013J$\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0010\u001a\u00020\u00112\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013J\u0014\u0010\u0017\u001a\u00020\r2\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013J\u0017\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u00192\u0006\u0010\u000e\u001a\u00020\u000fH\u0096\u0001J\u0017\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u00192\u0006\u0010\u0015\u001a\u00020\u0016H\u0096\u0001R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00088WX\u0097\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\n\u0010\u000bR\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;",
        "Landroidx/window/layout/WindowInfoTracker;",
        "tracker",
        "(Landroidx/window/layout/WindowInfoTracker;)V",
        "callbackToFlowAdapter",
        "Landroidx/window/java/core/CallbackToFlowAdapter;",
        "(Landroidx/window/layout/WindowInfoTracker;Landroidx/window/java/core/CallbackToFlowAdapter;)V",
        "supportedPostures",
        "",
        "Landroidx/window/layout/SupportedPosture;",
        "getSupportedPostures",
        "()Ljava/util/List;",
        "addWindowLayoutInfoListener",
        "",
        "activity",
        "Landroid/app/Activity;",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "consumer",
        "Landroidx/core/util/Consumer;",
        "Landroidx/window/layout/WindowLayoutInfo;",
        "context",
        "Landroid/content/Context;",
        "removeWindowLayoutInfoListener",
        "windowLayoutInfo",
        "Lkotlinx/coroutines/flow/Flow;",
        "window-java_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final callbackToFlowAdapter:Landroidx/window/java/core/CallbackToFlowAdapter;

.field private final tracker:Landroidx/window/layout/WindowInfoTracker;


# direct methods
.method public constructor <init>(Landroidx/window/layout/WindowInfoTracker;)V
    .locals 1

    const-string v0, "tracker"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    new-instance v0, Landroidx/window/java/core/CallbackToFlowAdapter;

    invoke-direct {v0}, Landroidx/window/java/core/CallbackToFlowAdapter;-><init>()V

    invoke-direct {p0, p1, v0}, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;-><init>(Landroidx/window/layout/WindowInfoTracker;Landroidx/window/java/core/CallbackToFlowAdapter;)V

    return-void
.end method

.method private constructor <init>(Landroidx/window/layout/WindowInfoTracker;Landroidx/window/java/core/CallbackToFlowAdapter;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->tracker:Landroidx/window/layout/WindowInfoTracker;

    .line 36
    iput-object p2, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->callbackToFlowAdapter:Landroidx/window/java/core/CallbackToFlowAdapter;

    return-void
.end method


# virtual methods
.method public final addWindowLayoutInfoListener(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/layout/WindowLayoutInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "consumer"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->callbackToFlowAdapter:Landroidx/window/java/core/CallbackToFlowAdapter;

    iget-object v1, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->tracker:Landroidx/window/layout/WindowInfoTracker;

    invoke-interface {v1, p1}, Landroidx/window/layout/WindowInfoTracker;->windowLayoutInfo(Landroid/app/Activity;)Lkotlinx/coroutines/flow/Flow;

    move-result-object p1

    invoke-virtual {v0, p2, p3, p1}, Landroidx/window/java/core/CallbackToFlowAdapter;->connect(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;Lkotlinx/coroutines/flow/Flow;)V

    return-void
.end method

.method public final addWindowLayoutInfoListener(Landroid/content/Context;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/layout/WindowLayoutInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "consumer"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->callbackToFlowAdapter:Landroidx/window/java/core/CallbackToFlowAdapter;

    iget-object v1, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->tracker:Landroidx/window/layout/WindowInfoTracker;

    invoke-interface {v1, p1}, Landroidx/window/layout/WindowInfoTracker;->windowLayoutInfo(Landroid/content/Context;)Lkotlinx/coroutines/flow/Flow;

    move-result-object p1

    invoke-virtual {v0, p2, p3, p1}, Landroidx/window/java/core/CallbackToFlowAdapter;->connect(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;Lkotlinx/coroutines/flow/Flow;)V

    return-void
.end method

.method public getSupportedPostures()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/window/layout/SupportedPosture;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->tracker:Landroidx/window/layout/WindowInfoTracker;

    invoke-interface {v0}, Landroidx/window/layout/WindowInfoTracker;->getSupportedPostures()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final removeWindowLayoutInfoListener(Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/layout/WindowLayoutInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "consumer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->callbackToFlowAdapter:Landroidx/window/java/core/CallbackToFlowAdapter;

    invoke-virtual {v0, p1}, Landroidx/window/java/core/CallbackToFlowAdapter;->disconnect(Landroidx/core/util/Consumer;)V

    return-void
.end method

.method public windowLayoutInfo(Landroid/app/Activity;)Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Landroidx/window/layout/WindowLayoutInfo;",
            ">;"
        }
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->tracker:Landroidx/window/layout/WindowInfoTracker;

    invoke-interface {v0, p1}, Landroidx/window/layout/WindowInfoTracker;->windowLayoutInfo(Landroid/app/Activity;)Lkotlinx/coroutines/flow/Flow;

    move-result-object p1

    return-object p1
.end method

.method public windowLayoutInfo(Landroid/content/Context;)Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Landroidx/window/layout/WindowLayoutInfo;",
            ">;"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;->tracker:Landroidx/window/layout/WindowInfoTracker;

    invoke-interface {v0, p1}, Landroidx/window/layout/WindowInfoTracker;->windowLayoutInfo(Landroid/content/Context;)Lkotlinx/coroutines/flow/Flow;

    move-result-object p1

    return-object p1
.end method
