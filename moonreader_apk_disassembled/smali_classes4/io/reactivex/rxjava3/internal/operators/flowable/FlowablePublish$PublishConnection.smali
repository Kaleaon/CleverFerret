.class final Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowablePublish.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/FlowableSubscriber;
.implements Lio/reactivex/rxjava3/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PublishConnection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/rxjava3/core/FlowableSubscriber<",
        "TT;>;",
        "Lio/reactivex/rxjava3/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

.field static final TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

.field private static final serialVersionUID:J = -0x17344e2bc8b53579L


# instance fields
.field final bufferSize:I

.field final connect:Ljava/util/concurrent/atomic/AtomicBoolean;

.field consumed:I

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field volatile queue:Lio/reactivex/rxjava3/operators/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/rxjava3/operators/SimpleQueue<",
            "TT;>;"
        }
    .end annotation
.end field

.field sourceMode:I

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "[",
            "Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field final upstream:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    .line 170
    new-array v1, v0, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    sput-object v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->EMPTY:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    .line 172
    new-array v0, v0, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    sput-object v0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "current",
            "bufferSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection<",
            "TT;>;>;I)V"
        }
    .end annotation

    .line 175
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 176
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 177
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    .line 178
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->connect:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 179
    iput p2, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->bufferSize:I

    .line 180
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object p2, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->EMPTY:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method add(Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inner"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription<",
            "TT;>;)Z"
        }
    .end annotation

    .line 376
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    .line 379
    sget-object v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    return v2

    .line 383
    :cond_1
    array-length v1, v0

    add-int/lit8 v3, v1, 0x1

    .line 385
    new-array v3, v3, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    .line 386
    invoke-static {v0, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 387
    aput-object p1, v3, v1

    .line 389
    iget-object v1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1, v0, v3}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1
.end method

.method checkTerminated(ZZ)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "isDone",
            "isEmpty"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    .line 347
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->error:Ljava/lang/Throwable;

    if-eqz p1, :cond_0

    .line 350
    invoke-virtual {p0, p1}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->signalError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 352
    :cond_0
    iget-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object p2, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    array-length p2, p1

    :goto_0
    if-ge v0, p2, :cond_2

    aget-object v1, p1, v0

    .line 353
    invoke-virtual {v1}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 354
    iget-object v1, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->downstream:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 p1, 0x1

    return p1

    :cond_3
    return v0
.end method

.method public dispose()V
    .locals 2

    .line 186
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    return-void
.end method

.method drain()V
    .locals 20

    move-object/from16 v1, p0

    .line 255
    invoke-virtual {v1}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_7

    .line 260
    :cond_0
    iget-object v0, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 261
    iget v2, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->consumed:I

    .line 262
    iget v3, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->bufferSize:I

    shr-int/lit8 v4, v3, 0x2

    sub-int/2addr v3, v4

    .line 263
    iget v4, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->sourceMode:I

    const/4 v6, 0x1

    if-eq v4, v6, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    move v7, v2

    move-object v2, v0

    move v0, v7

    const/4 v7, 0x1

    :cond_2
    :goto_1
    if-eqz v2, :cond_e

    .line 271
    iget-object v8, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    .line 273
    array-length v9, v8

    const-wide v10, 0x7fffffffffffffffL

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_2
    if-ge v12, v9, :cond_4

    aget-object v14, v8, v12

    .line 274
    invoke-virtual {v14}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->get()J

    move-result-wide v15

    const-wide/high16 v17, -0x8000000000000000L

    cmp-long v19, v15, v17

    if-eqz v19, :cond_3

    .line 277
    iget-wide v13, v14, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->emitted:J

    sub-long v13, v15, v13

    invoke-static {v13, v14, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    const/4 v13, 0x1

    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    :cond_4
    const-wide/16 v14, 0x0

    if-nez v13, :cond_5

    move-wide v10, v14

    :cond_5
    :goto_3
    cmp-long v9, v10, v14

    if-eqz v9, :cond_d

    .line 286
    iget-boolean v9, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    .line 290
    :try_start_0
    invoke-interface {v2}, Lio/reactivex/rxjava3/operators/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v12, :cond_6

    const/4 v13, 0x1

    goto :goto_4

    :cond_6
    const/4 v13, 0x0

    .line 302
    :goto_4
    invoke-virtual {v1, v9, v13}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->checkTerminated(ZZ)Z

    move-result v9

    if-eqz v9, :cond_7

    goto/16 :goto_7

    :cond_7
    if-eqz v13, :cond_8

    goto :goto_6

    .line 310
    :cond_8
    array-length v9, v8

    const/4 v13, 0x0

    :goto_5
    const-wide/16 v16, 0x1

    if-ge v13, v9, :cond_a

    aget-object v5, v8, v13

    .line 311
    invoke-virtual {v5}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->isCancelled()Z

    move-result v19

    if-nez v19, :cond_9

    .line 312
    iget-object v14, v5, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->downstream:Lorg/reactivestreams/Subscriber;

    invoke-interface {v14, v12}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 313
    iget-wide v14, v5, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->emitted:J

    add-long v14, v14, v16

    iput-wide v14, v5, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->emitted:J

    :cond_9
    add-int/lit8 v13, v13, 0x1

    const-wide/16 v14, 0x0

    goto :goto_5

    :cond_a
    if-eqz v4, :cond_b

    add-int/lit8 v0, v0, 0x1

    if-ne v0, v3, :cond_b

    .line 319
    iget-object v0, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    int-to-long v12, v3

    invoke-interface {v0, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    const/4 v0, 0x0

    :cond_b
    sub-long v10, v10, v16

    .line 323
    iget-object v5, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-eq v8, v5, :cond_c

    goto/16 :goto_1

    :cond_c
    const-wide/16 v14, 0x0

    goto :goto_3

    :catchall_0
    move-exception v0

    .line 292
    invoke-static {v0}, Lio/reactivex/rxjava3/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 293
    iget-object v3, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/reactivestreams/Subscription;

    invoke-interface {v3}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 294
    invoke-interface {v2}, Lio/reactivex/rxjava3/operators/SimpleQueue;->clear()V

    .line 295
    iput-boolean v6, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    .line 296
    invoke-virtual {v1, v0}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->signalError(Ljava/lang/Throwable;)V

    return-void

    .line 328
    :cond_d
    :goto_6
    iget-boolean v5, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    invoke-interface {v2}, Lio/reactivex/rxjava3/operators/SimpleQueue;->isEmpty()Z

    move-result v8

    invoke-virtual {v1, v5, v8}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->checkTerminated(ZZ)Z

    move-result v5

    if-eqz v5, :cond_e

    goto :goto_7

    .line 333
    :cond_e
    iput v0, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->consumed:I

    neg-int v5, v7

    .line 334
    invoke-virtual {v1, v5}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->addAndGet(I)I

    move-result v7

    if-nez v7, :cond_f

    :goto_7
    return-void

    :cond_f
    if-nez v2, :cond_2

    .line 339
    iget-object v2, v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    goto/16 :goto_1
.end method

.method public isDisposed()Z
    .locals 2

    .line 193
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onComplete()V
    .locals 1

    const/4 v0, 0x1

    .line 250
    iput-boolean v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    .line 251
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->drain()V

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

    .line 239
    iget-boolean v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    if-eqz v0, :cond_0

    .line 240
    invoke-static {p1}, Lio/reactivex/rxjava3/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 242
    :cond_0
    iput-object p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    .line 243
    iput-boolean p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    .line 244
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->drain()V

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

    .line 228
    iget v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->sourceMode:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/rxjava3/operators/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 229
    new-instance p1, Lio/reactivex/rxjava3/exceptions/QueueOverflowException;

    invoke-direct {p1}, Lio/reactivex/rxjava3/exceptions/QueueOverflowException;-><init>()V

    invoke-virtual {p0, p1}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 234
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->drain()V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .line 198
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 199
    instance-of v0, p1, Lio/reactivex/rxjava3/operators/QueueSubscription;

    if-eqz v0, :cond_1

    .line 201
    move-object v0, p1

    check-cast v0, Lio/reactivex/rxjava3/operators/QueueSubscription;

    const/4 v1, 0x7

    .line 203
    invoke-interface {v0, v1}, Lio/reactivex/rxjava3/operators/QueueSubscription;->requestFusion(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 205
    iput v1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->sourceMode:I

    .line 206
    iput-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 207
    iput-boolean v2, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->done:Z

    .line 208
    invoke-virtual {p0}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->drain()V

    return-void

    :cond_0
    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 212
    iput v1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->sourceMode:I

    .line 213
    iput-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 214
    iget v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    return-void

    .line 219
    :cond_1
    new-instance v0, Lio/reactivex/rxjava3/operators/SpscArrayQueue;

    iget v1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/rxjava3/operators/SpscArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 221
    iget v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    :cond_2
    return-void
.end method

.method remove(Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inner"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription<",
            "TT;>;)V"
        }
    .end annotation

    .line 402
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    .line 403
    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_3

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    .line 412
    aget-object v4, v0, v3

    if-ne v4, p1, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v3, -0x1

    :goto_1
    if-gez v3, :cond_4

    goto :goto_3

    :cond_4
    const/4 v4, 0x1

    if-ne v1, v4, :cond_5

    .line 426
    sget-object v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->EMPTY:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    goto :goto_2

    :cond_5
    add-int/lit8 v5, v1, -0x1

    .line 429
    new-array v5, v5, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    .line 431
    invoke-static {v0, v2, v5, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v2, v3, 0x1

    sub-int/2addr v1, v3

    sub-int/2addr v1, v4

    .line 433
    invoke-static {v0, v2, v5, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v5

    .line 436
    :goto_2
    iget-object v2, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2, v0, v1}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_3
    return-void
.end method

.method signalError(Ljava/lang/Throwable;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ex"
        }
    .end annotation

    .line 365
    iget-object v0, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$PublishConnection;->TERMINATED:[Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 366
    invoke-virtual {v3}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_0

    .line 367
    iget-object v3, v3, Lio/reactivex/rxjava3/internal/operators/flowable/FlowablePublish$InnerSubscription;->downstream:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
