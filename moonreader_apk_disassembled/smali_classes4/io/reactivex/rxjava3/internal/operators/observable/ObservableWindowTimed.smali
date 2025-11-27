.class public final Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;
.super Lio/reactivex/rxjava3/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableWindowTimed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;,
        Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;,
        Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;,
        Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$AbstractWindowObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/rxjava3/internal/operators/observable/AbstractObservableWithUpstream<",
        "TT;",
        "Lio/reactivex/rxjava3/core/Observable<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final maxSize:J

.field final restartTimerOnMaxSize:Z

.field final scheduler:Lio/reactivex/rxjava3/core/Scheduler;

.field final timeskip:J

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(Lio/reactivex/rxjava3/core/Observable;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/rxjava3/core/Scheduler;JIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "source",
            "timespan",
            "timeskip",
            "unit",
            "scheduler",
            "maxSize",
            "bufferSize",
            "restartTimerOnMaxSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/Observable<",
            "TT;>;JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/rxjava3/core/Scheduler;",
            "JIZ)V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1}, Lio/reactivex/rxjava3/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/rxjava3/core/ObservableSource;)V

    .line 43
    iput-wide p2, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timespan:J

    .line 44
    iput-wide p4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timeskip:J

    .line 45
    iput-object p6, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->unit:Ljava/util/concurrent/TimeUnit;

    .line 46
    iput-object p7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->scheduler:Lio/reactivex/rxjava3/core/Scheduler;

    .line 47
    iput-wide p8, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->maxSize:J

    .line 48
    iput p10, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->bufferSize:I

    .line 49
    iput-boolean p11, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->restartTimerOnMaxSize:Z

    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/rxjava3/core/Observer;)V
    .locals 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "downstream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/Observer<",
            "-",
            "Lio/reactivex/rxjava3/core/Observable<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 54
    iget-wide v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timespan:J

    iget-wide v2, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timeskip:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    .line 55
    iget-wide v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->maxSize:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 56
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->source:Lio/reactivex/rxjava3/core/ObservableSource;

    new-instance v1, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;

    iget-wide v3, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timespan:J

    iget-object v5, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->unit:Ljava/util/concurrent/TimeUnit;

    iget-object v6, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->scheduler:Lio/reactivex/rxjava3/core/Scheduler;

    iget v7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->bufferSize:I

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowExactUnboundedObserver;-><init>(Lio/reactivex/rxjava3/core/Observer;JLjava/util/concurrent/TimeUnit;Lio/reactivex/rxjava3/core/Scheduler;I)V

    invoke-interface {v0, v1}, Lio/reactivex/rxjava3/core/ObservableSource;->subscribe(Lio/reactivex/rxjava3/core/Observer;)V

    return-void

    :cond_0
    move-object v3, p1

    .line 61
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->source:Lio/reactivex/rxjava3/core/ObservableSource;

    new-instance v2, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;

    iget-wide v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timespan:J

    iget-object v6, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->unit:Ljava/util/concurrent/TimeUnit;

    iget-object v7, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->scheduler:Lio/reactivex/rxjava3/core/Scheduler;

    iget v8, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->bufferSize:I

    iget-wide v9, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->maxSize:J

    iget-boolean v11, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->restartTimerOnMaxSize:Z

    invoke-direct/range {v2 .. v11}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowExactBoundedObserver;-><init>(Lio/reactivex/rxjava3/core/Observer;JLjava/util/concurrent/TimeUnit;Lio/reactivex/rxjava3/core/Scheduler;IJZ)V

    invoke-interface {p1, v2}, Lio/reactivex/rxjava3/core/ObservableSource;->subscribe(Lio/reactivex/rxjava3/core/Observer;)V

    return-void

    :cond_1
    move-object v3, p1

    .line 67
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->source:Lio/reactivex/rxjava3/core/ObservableSource;

    new-instance v2, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;

    iget-wide v4, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timespan:J

    iget-wide v6, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->timeskip:J

    iget-object v8, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->unit:Ljava/util/concurrent/TimeUnit;

    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->scheduler:Lio/reactivex/rxjava3/core/Scheduler;

    .line 68
    invoke-virtual {v0}, Lio/reactivex/rxjava3/core/Scheduler;->createWorker()Lio/reactivex/rxjava3/core/Scheduler$Worker;

    move-result-object v9

    iget v10, p0, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed;->bufferSize:I

    invoke-direct/range {v2 .. v10}, Lio/reactivex/rxjava3/internal/operators/observable/ObservableWindowTimed$WindowSkipObserver;-><init>(Lio/reactivex/rxjava3/core/Observer;JJLjava/util/concurrent/TimeUnit;Lio/reactivex/rxjava3/core/Scheduler$Worker;I)V

    .line 67
    invoke-interface {p1, v2}, Lio/reactivex/rxjava3/core/ObservableSource;->subscribe(Lio/reactivex/rxjava3/core/Observer;)V

    return-void
.end method
