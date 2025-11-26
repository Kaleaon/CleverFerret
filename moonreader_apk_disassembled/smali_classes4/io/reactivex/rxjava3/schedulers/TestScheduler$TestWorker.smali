.class final Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;
.super Lio/reactivex/rxjava3/core/Scheduler$Worker;
.source "TestScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/rxjava3/schedulers/TestScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "TestWorker"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker$QueueRemove;
    }
.end annotation


# instance fields
.field volatile disposed:Z

.field final synthetic this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;


# direct methods
.method constructor <init>(Lio/reactivex/rxjava3/schedulers/TestScheduler;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 186
    iput-object p1, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    invoke-direct {p0}, Lio/reactivex/rxjava3/core/Scheduler$Worker;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    const/4 v0, 0x1

    .line 192
    iput-boolean v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->disposed:Z

    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .line 197
    iget-boolean v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->disposed:Z

    return v0
.end method

.method public now(Ljava/util/concurrent/TimeUnit;)J
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "unit"
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/schedulers/TestScheduler;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public schedule(Ljava/lang/Runnable;)Lio/reactivex/rxjava3/disposables/Disposable;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "run"
        }
    .end annotation

    .line 218
    iget-boolean v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->disposed:Z

    if-eqz v0, :cond_0

    .line 219
    sget-object p1, Lio/reactivex/rxjava3/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/rxjava3/internal/disposables/EmptyDisposable;

    return-object p1

    .line 221
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-boolean v0, v0, Lio/reactivex/rxjava3/schedulers/TestScheduler;->useOnScheduleHook:Z

    if-eqz v0, :cond_1

    .line 222
    invoke-static {p1}, Lio/reactivex/rxjava3/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    :cond_1
    move-object v4, p1

    .line 224
    new-instance v0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TimedRunnable;

    iget-object p1, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-wide v5, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->counter:J

    const-wide/16 v1, 0x1

    add-long/2addr v1, v5

    iput-wide v1, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->counter:J

    const-wide/16 v2, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lio/reactivex/rxjava3/schedulers/TestScheduler$TimedRunnable;-><init>(Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;JLjava/lang/Runnable;J)V

    .line 225
    iget-object p1, v1, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-object p1, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->queue:Ljava/util/Queue;

    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 226
    new-instance p1, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker$QueueRemove;

    invoke-direct {p1, p0, v0}, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker$QueueRemove;-><init>(Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;Lio/reactivex/rxjava3/schedulers/TestScheduler$TimedRunnable;)V

    return-object p1
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/rxjava3/disposables/Disposable;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "run",
            "delayTime",
            "unit"
        }
    .end annotation

    .line 203
    iget-boolean v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->disposed:Z

    if-eqz v0, :cond_0

    .line 204
    sget-object p1, Lio/reactivex/rxjava3/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/rxjava3/internal/disposables/EmptyDisposable;

    return-object p1

    .line 206
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-boolean v0, v0, Lio/reactivex/rxjava3/schedulers/TestScheduler;->useOnScheduleHook:Z

    if-eqz v0, :cond_1

    .line 207
    invoke-static {p1}, Lio/reactivex/rxjava3/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    :cond_1
    move-object v4, p1

    .line 209
    new-instance v0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TimedRunnable;

    iget-object p1, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-wide v1, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->time:J

    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    add-long/2addr v1, p1

    iget-object p1, p0, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-wide v5, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->counter:J

    const-wide/16 p2, 0x1

    add-long/2addr p2, v5

    iput-wide p2, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->counter:J

    move-wide v2, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lio/reactivex/rxjava3/schedulers/TestScheduler$TimedRunnable;-><init>(Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;JLjava/lang/Runnable;J)V

    .line 210
    iget-object p1, v1, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;->this$0:Lio/reactivex/rxjava3/schedulers/TestScheduler;

    iget-object p1, p1, Lio/reactivex/rxjava3/schedulers/TestScheduler;->queue:Ljava/util/Queue;

    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 212
    new-instance p1, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker$QueueRemove;

    invoke-direct {p1, p0, v0}, Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker$QueueRemove;-><init>(Lio/reactivex/rxjava3/schedulers/TestScheduler$TestWorker;Lio/reactivex/rxjava3/schedulers/TestScheduler$TimedRunnable;)V

    return-object p1
.end method
