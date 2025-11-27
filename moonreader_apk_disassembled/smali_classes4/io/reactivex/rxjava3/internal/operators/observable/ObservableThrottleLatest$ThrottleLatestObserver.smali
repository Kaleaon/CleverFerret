.class final Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableThrottleLatest.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/Observer;
.implements Lio/reactivex/rxjava3/disposables/Disposable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ThrottleLatestObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/rxjava3/core/Observer<",
        "TT;>;",
        "Lio/reactivex/rxjava3/disposables/Disposable;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x7323c2cdbcdaca16L


# instance fields
.field volatile cancelled:Z

.field volatile done:Z

.field final downstream:Lio/reactivex/rxjava3/core/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/rxjava3/core/Observer<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final emitLast:Z

.field error:Ljava/lang/Throwable;

.field final latest:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "TT;>;"
        }
    .end annotation
.end field

.field final onDropped:Lio/reactivex/rxjava3/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/rxjava3/functions/Consumer<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final timeout:J

.field volatile timerFired:Z

.field timerRunning:Z

.field final unit:Ljava/util/concurrent/TimeUnit;

.field upstream:Lio/reactivex/rxjava3/disposables/Disposable;

.field final worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/rxjava3/core/Observer;JLjava/util/concurrent/TimeUnit;Lio/reactivex/rxjava3/core/Scheduler$Worker;ZLio/reactivex/rxjava3/functions/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "downstream",
            "timeout",
            "unit",
            "worker",
            "emitLast",
            "onDropped"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/Observer<",
            "-TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/rxjava3/core/Scheduler$Worker;",
            "Z",
            "Lio/reactivex/rxjava3/functions/Consumer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 102
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 103
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->downstream:Lio/reactivex/rxjava3/core/Observer;

    .line 104
    iput-wide p2, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timeout:J

    .line 105
    iput-object p4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->unit:Ljava/util/concurrent/TimeUnit;

    .line 106
    iput-object p5, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;

    .line 107
    iput-boolean p6, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->emitLast:Z

    .line 108
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->latest:Ljava/util/concurrent/atomic/AtomicReference;

    .line 109
    iput-object p7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    return-void
.end method


# virtual methods
.method clear()V
    .locals 2

    .line 160
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->latest:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 164
    :try_start_0
    iget-object v1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    invoke-interface {v1, v0}, Lio/reactivex/rxjava3/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 166
    invoke-static {v0}, Lio/reactivex/rxjava3/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 167
    invoke-static {v0}, Lio/reactivex/rxjava3/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void

    .line 171
    :cond_1
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->latest:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    return-void
.end method

.method public dispose()V
    .locals 1

    const/4 v0, 0x1

    .line 151
    iput-boolean v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->cancelled:Z

    .line 152
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->upstream:Lio/reactivex/rxjava3/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/rxjava3/disposables/Disposable;->dispose()V

    .line 153
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/rxjava3/core/Scheduler$Worker;->dispose()V

    .line 154
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->clear()V

    :cond_0
    return-void
.end method

.method drain()V
    .locals 8

    .line 187
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    .line 193
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->latest:Ljava/util/concurrent/atomic/AtomicReference;

    .line 194
    iget-object v1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->downstream:Lio/reactivex/rxjava3/core/Observer;

    const/4 v2, 0x1

    const/4 v3, 0x1

    .line 199
    :cond_1
    :goto_0
    iget-boolean v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->cancelled:Z

    if-eqz v4, :cond_2

    .line 200
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->clear()V

    return-void

    .line 204
    :cond_2
    iget-boolean v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->done:Z

    .line 205
    iget-object v5, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->error:Ljava/lang/Throwable;

    const/4 v6, 0x0

    const/4 v7, 0x0

    if-eqz v4, :cond_5

    if-eqz v5, :cond_5

    .line 208
    iget-object v3, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    if-eqz v3, :cond_3

    .line 209
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 212
    :try_start_0
    iget-object v3, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    invoke-interface {v3, v0}, Lio/reactivex/rxjava3/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 214
    invoke-static {v0}, Lio/reactivex/rxjava3/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 215
    new-instance v3, Lio/reactivex/rxjava3/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object v5, v4, v7

    aput-object v0, v4, v2

    invoke-direct {v3, v4}, Lio/reactivex/rxjava3/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    move-object v5, v3

    goto :goto_1

    .line 219
    :cond_3
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 221
    :cond_4
    :goto_1
    invoke-interface {v1, v5}, Lio/reactivex/rxjava3/core/Observer;->onError(Ljava/lang/Throwable;)V

    .line 222
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/rxjava3/core/Scheduler$Worker;->dispose()V

    return-void

    .line 226
    :cond_5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_6

    const/4 v5, 0x1

    goto :goto_2

    :cond_6
    const/4 v5, 0x0

    :goto_2
    if-eqz v4, :cond_9

    if-nez v5, :cond_8

    .line 231
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 232
    iget-boolean v2, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->emitLast:Z

    if-eqz v2, :cond_7

    .line 233
    invoke-interface {v1, v0}, Lio/reactivex/rxjava3/core/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_3

    .line 235
    :cond_7
    iget-object v2, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    if-eqz v2, :cond_8

    .line 237
    :try_start_1
    invoke-interface {v2, v0}, Lio/reactivex/rxjava3/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    .line 239
    invoke-static {v0}, Lio/reactivex/rxjava3/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 240
    invoke-interface {v1, v0}, Lio/reactivex/rxjava3/core/Observer;->onError(Ljava/lang/Throwable;)V

    .line 241
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/rxjava3/core/Scheduler$Worker;->dispose()V

    return-void

    .line 247
    :cond_8
    :goto_3
    invoke-interface {v1}, Lio/reactivex/rxjava3/core/Observer;->onComplete()V

    .line 248
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/rxjava3/core/Scheduler$Worker;->dispose()V

    return-void

    :cond_9
    if-eqz v5, :cond_a

    .line 253
    iget-boolean v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerFired:Z

    if-eqz v4, :cond_b

    .line 254
    iput-boolean v7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerRunning:Z

    .line 255
    iput-boolean v7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerFired:Z

    goto :goto_4

    .line 260
    :cond_a
    iget-boolean v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerRunning:Z

    if-eqz v4, :cond_c

    iget-boolean v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerFired:Z

    if-eqz v4, :cond_b

    goto :goto_6

    :cond_b
    :goto_4
    neg-int v3, v3

    .line 272
    invoke-virtual {p0, v3}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->addAndGet(I)I

    move-result v3

    if-nez v3, :cond_1

    :goto_5
    return-void

    .line 261
    :cond_c
    :goto_6
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 262
    invoke-interface {v1, v4}, Lio/reactivex/rxjava3/core/Observer;->onNext(Ljava/lang/Object;)V

    .line 264
    iput-boolean v7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerFired:Z

    .line 265
    iput-boolean v2, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerRunning:Z

    .line 266
    iget-object v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->worker:Lio/reactivex/rxjava3/core/Scheduler$Worker;

    iget-wide v5, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timeout:J

    iget-object v7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, p0, v5, v6, v7}, Lio/reactivex/rxjava3/core/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/rxjava3/disposables/Disposable;

    goto/16 :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .line 177
    iget-boolean v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->cancelled:Z

    return v0
.end method

.method public onComplete()V
    .locals 1

    const/4 v0, 0x1

    .line 145
    iput-boolean v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->done:Z

    .line 146
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->drain()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    .line 139
    iput-boolean p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->done:Z

    .line 140
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->drain()V

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

    .line 122
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->latest:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 123
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->onDropped:Lio/reactivex/rxjava3/functions/Consumer;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 125
    :try_start_0
    invoke-interface {v0, p1}, Lio/reactivex/rxjava3/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 127
    invoke-static {p1}, Lio/reactivex/rxjava3/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 128
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->upstream:Lio/reactivex/rxjava3/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/rxjava3/disposables/Disposable;->dispose()V

    .line 129
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    .line 130
    iput-boolean p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->done:Z

    .line 133
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->drain()V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/rxjava3/disposables/Disposable;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->upstream:Lio/reactivex/rxjava3/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/rxjava3/internal/disposables/DisposableHelper;->validate(Lio/reactivex/rxjava3/disposables/Disposable;Lio/reactivex/rxjava3/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->upstream:Lio/reactivex/rxjava3/disposables/Disposable;

    .line 116
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->downstream:Lio/reactivex/rxjava3/core/Observer;

    invoke-interface {p1, p0}, Lio/reactivex/rxjava3/core/Observer;->onSubscribe(Lio/reactivex/rxjava3/disposables/Disposable;)V

    :cond_0
    return-void
.end method

.method public run()V
    .locals 1

    const/4 v0, 0x1

    .line 182
    iput-boolean v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->timerFired:Z

    .line 183
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableThrottleLatest$ThrottleLatestObserver;->drain()V

    return-void
.end method
