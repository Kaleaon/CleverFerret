.class public final Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "InnerQueuedObserver.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/Observer;
.implements Lio/reactivex/rxjava3/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Lio/reactivex/rxjava3/disposables/Disposable;",
        ">;",
        "Lio/reactivex/rxjava3/core/Observer<",
        "TT;>;",
        "Lio/reactivex/rxjava3/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4b2db39073b2fa8dL


# instance fields
.field volatile done:Z

.field fusionMode:I

.field final parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport<",
            "TT;>;"
        }
    .end annotation
.end field

.field final prefetch:I

.field queue:Lio/reactivex/rxjava3/operators/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/rxjava3/operators/SimpleQueue<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parent",
            "prefetch"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport<",
            "TT;>;I)V"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 49
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;

    .line 50
    iput p2, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->prefetch:I

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .line 100
    invoke-static {p0}, Lio/reactivex/rxjava3/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .line 105
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/rxjava3/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/rxjava3/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/rxjava3/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .line 109
    iget-boolean v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->done:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    .line 95
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0, p0}, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;->innerComplete(Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0, p0, p1}, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;->innerError(Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;Ljava/lang/Throwable;)V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 81
    iget v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->fusionMode:I

    if-nez v0, :cond_0

    .line 82
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {v0, p0, p1}, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;->innerNext(Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;Ljava/lang/Object;)V

    return-void

    .line 84
    :cond_0
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {p1}, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;->drain()V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/rxjava3/disposables/Disposable;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation

    .line 55
    invoke-static {p0, p1}, Lio/reactivex/rxjava3/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/rxjava3/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 56
    instance-of v0, p1, Lio/reactivex/rxjava3/operators/QueueDisposable;

    if-eqz v0, :cond_1

    .line 58
    check-cast p1, Lio/reactivex/rxjava3/operators/QueueDisposable;

    const/4 v0, 0x3

    .line 60
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/operators/QueueDisposable;->requestFusion(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 62
    iput v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->fusionMode:I

    .line 63
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 64
    iput-boolean v1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->done:Z

    .line 65
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->parent:Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;

    invoke-interface {p1, p0}, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserverSupport;->innerComplete(Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;)V

    return-void

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 69
    iput v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->fusionMode:I

    .line 70
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    return-void

    .line 75
    :cond_1
    iget p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->prefetch:I

    neg-int p1, p1

    invoke-static {p1}, Lio/reactivex/rxjava3/internal/util/QueueDrainHelper;->createQueue(I)Lio/reactivex/rxjava3/operators/SimpleQueue;

    move-result-object p1

    iput-object p1, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    :cond_2
    return-void
.end method

.method public queue()Lio/reactivex/rxjava3/operators/SimpleQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/rxjava3/operators/SimpleQueue<",
            "TT;>;"
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    return-object v0
.end method

.method public setDone()V
    .locals 1

    const/4 v0, 0x1

    .line 113
    iput-boolean v0, p0, Lio/reactivex/rxjava3/internal/observers/InnerQueuedObserver;->done:Z

    return-void
.end method
