.class public final Lio/reactivex/rxjava3/processors/MulticastProcessor;
.super Lio/reactivex/rxjava3/processors/FlowableProcessor;
.source "MulticastProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/rxjava3/processors/FlowableProcessor<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lio/reactivex/rxjava3/annotations/BackpressureSupport;
    value = .enum Lio/reactivex/rxjava3/annotations/BackpressureKind;->FULL:Lio/reactivex/rxjava3/annotations/BackpressureKind;
.end annotation

.annotation runtime Lio/reactivex/rxjava3/annotations/SchedulerSupport;
    value = "none"
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

.field static final TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;


# instance fields
.field final bufferSize:I

.field consumed:I

.field volatile done:Z

.field volatile error:Ljava/lang/Throwable;

.field fusionMode:I

.field final limit:I

.field volatile queue:Lio/reactivex/rxjava3/operators/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/rxjava3/operators/SimpleQueue<",
            "TT;>;"
        }
    .end annotation
.end field

.field final refcount:Z

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "[",
            "Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription<",
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

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    .line 156
    new-array v1, v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    sput-object v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->EMPTY:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 159
    new-array v0, v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    sput-object v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    return-void
.end method

.method constructor <init>(IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bufferSize",
            "refCount"
        }
    .end annotation

    .line 226
    invoke-direct {p0}, Lio/reactivex/rxjava3/processors/FlowableProcessor;-><init>()V

    .line 227
    iput p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize:I

    shr-int/lit8 v0, p1, 0x2

    sub-int/2addr p1, v0

    .line 228
    iput p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->limit:I

    .line 229
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 230
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->EMPTY:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 231
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    .line 232
    iput-boolean p2, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->refcount:Z

    return-void
.end method

.method public static create()Lio/reactivex/rxjava3/processors/MulticastProcessor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/rxjava3/processors/MulticastProcessor<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 170
    new-instance v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;

    invoke-static {}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/reactivex/rxjava3/processors/MulticastProcessor;-><init>(IZ)V

    return-object v0
.end method

.method public static create(I)Lio/reactivex/rxjava3/processors/MulticastProcessor;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bufferSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lio/reactivex/rxjava3/processors/MulticastProcessor<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 197
    const-string v0, "bufferSize"

    invoke-static {p0, v0}, Lio/reactivex/rxjava3/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 198
    new-instance v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/reactivex/rxjava3/processors/MulticastProcessor;-><init>(IZ)V

    return-object v0
.end method

.method public static create(IZ)Lio/reactivex/rxjava3/processors/MulticastProcessor;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bufferSize",
            "refCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(IZ)",
            "Lio/reactivex/rxjava3/processors/MulticastProcessor<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 214
    const-string v0, "bufferSize"

    invoke-static {p0, v0}, Lio/reactivex/rxjava3/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    .line 215
    new-instance v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;

    invoke-direct {v0, p0, p1}, Lio/reactivex/rxjava3/processors/MulticastProcessor;-><init>(IZ)V

    return-object v0
.end method

.method public static create(Z)Lio/reactivex/rxjava3/processors/MulticastProcessor;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "refCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z)",
            "Lio/reactivex/rxjava3/processors/MulticastProcessor<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 184
    new-instance v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;

    invoke-static {}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize()I

    move-result v1

    invoke-direct {v0, v1, p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;-><init>(IZ)V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;)Z
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
            "Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription<",
            "TT;>;)Z"
        }
    .end annotation

    .line 395
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 396
    sget-object v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    return v2

    .line 399
    :cond_1
    array-length v1, v0

    add-int/lit8 v3, v1, 0x1

    .line 401
    new-array v3, v3, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 402
    invoke-static {v0, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 403
    aput-object p1, v3, v1

    .line 404
    iget-object v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1, v0, v3}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1
.end method

.method drain()V
    .locals 22

    move-object/from16 v1, p0

    .line 456
    iget-object v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_d

    .line 461
    :cond_0
    iget-object v2, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 462
    iget v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->consumed:I

    .line 463
    iget v3, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->limit:I

    .line 464
    iget v4, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->fusionMode:I

    const/4 v5, 0x1

    const/4 v6, 0x1

    .line 469
    :cond_1
    :goto_0
    iget-object v7, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    if-eqz v7, :cond_12

    .line 472
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 473
    array-length v9, v8

    if-eqz v9, :cond_12

    .line 478
    array-length v9, v8

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, -0x1

    :goto_1
    const-wide/16 v16, 0x0

    if-ge v13, v9, :cond_4

    const-wide/16 v18, -0x1

    aget-object v10, v8, v13

    .line 479
    invoke-virtual {v10}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->get()J

    move-result-wide v20

    cmp-long v11, v20, v16

    if-ltz v11, :cond_3

    cmp-long v11, v14, v18

    if-nez v11, :cond_2

    .line 482
    iget-wide v10, v10, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->emitted:J

    sub-long v14, v20, v10

    goto :goto_2

    .line 484
    :cond_2
    iget-wide v10, v10, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->emitted:J

    sub-long v10, v20, v10

    invoke-static {v14, v15, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v14

    :cond_3
    :goto_2
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_4
    move v9, v0

    :cond_5
    :goto_3
    cmp-long v10, v14, v16

    if-lez v10, :cond_d

    .line 490
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 492
    sget-object v11, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    if-ne v0, v11, :cond_6

    .line 493
    invoke-interface {v7}, Lio/reactivex/rxjava3/operators/SimpleQueue;->clear()V

    return-void

    :cond_6
    if-eq v8, v0, :cond_7

    goto/16 :goto_a

    .line 501
    :cond_7
    iget-boolean v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    .line 506
    :try_start_0
    invoke-interface {v7}, Lio/reactivex/rxjava3/operators/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception v0

    .line 508
    invoke-static {v0}, Lio/reactivex/rxjava3/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 509
    iget-object v11, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v11}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 512
    iput-object v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    .line 513
    iput-boolean v5, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    const/4 v11, 0x0

    const/4 v0, 0x1

    :goto_4
    if-nez v11, :cond_8

    const/4 v13, 0x1

    goto :goto_5

    :cond_8
    const/4 v13, 0x0

    :goto_5
    if-eqz v0, :cond_a

    if-eqz v13, :cond_a

    .line 518
    iget-object v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_9

    .line 520
    sget-object v3, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    array-length v3, v2

    :goto_6
    if-ge v12, v3, :cond_13

    aget-object v4, v2, v12

    .line 521
    invoke-virtual {v4, v0}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->onError(Ljava/lang/Throwable;)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_6

    .line 524
    :cond_9
    sget-object v0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    array-length v2, v0

    :goto_7
    if-ge v12, v2, :cond_13

    aget-object v3, v0, v12

    .line 525
    invoke-virtual {v3}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->onComplete()V

    add-int/lit8 v12, v12, 0x1

    goto :goto_7

    :cond_a
    if-eqz v13, :cond_b

    goto :goto_9

    .line 535
    :cond_b
    array-length v0, v8

    const/4 v10, 0x0

    :goto_8
    if-ge v10, v0, :cond_c

    aget-object v13, v8, v10

    .line 536
    invoke-virtual {v13, v11}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->onNext(Ljava/lang/Object;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_8

    :cond_c
    const-wide/16 v10, 0x1

    sub-long/2addr v14, v10

    if-eq v4, v5, :cond_5

    add-int/lit8 v9, v9, 0x1

    if-ne v9, v3, :cond_5

    .line 544
    iget-object v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    int-to-long v9, v3

    invoke-interface {v0, v9, v10}, Lorg/reactivestreams/Subscription;->request(J)V

    const/4 v9, 0x0

    goto/16 :goto_3

    :cond_d
    :goto_9
    if-nez v10, :cond_11

    .line 550
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 552
    sget-object v10, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    if-ne v0, v10, :cond_e

    .line 553
    invoke-interface {v7}, Lio/reactivex/rxjava3/operators/SimpleQueue;->clear()V

    return-void

    :cond_e
    if-eq v8, v0, :cond_f

    :goto_a
    move v0, v9

    goto/16 :goto_0

    .line 561
    :cond_f
    iget-boolean v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-eqz v0, :cond_11

    invoke-interface {v7}, Lio/reactivex/rxjava3/operators/SimpleQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 562
    iget-object v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_10

    .line 564
    invoke-virtual {v2, v10}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    array-length v3, v2

    :goto_b
    if-ge v12, v3, :cond_13

    aget-object v4, v2, v12

    .line 565
    invoke-virtual {v4, v0}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->onError(Ljava/lang/Throwable;)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_b

    .line 568
    :cond_10
    invoke-virtual {v2, v10}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    array-length v2, v0

    :goto_c
    if-ge v12, v2, :cond_13

    aget-object v3, v0, v12

    .line 569
    invoke-virtual {v3}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->onComplete()V

    add-int/lit8 v12, v12, 0x1

    goto :goto_c

    :cond_11
    move v0, v9

    .line 578
    :cond_12
    iput v0, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->consumed:I

    .line 579
    iget-object v7, v1, Lio/reactivex/rxjava3/processors/MulticastProcessor;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v6, v6

    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v6

    if-nez v6, :cond_1

    :cond_13
    :goto_d
    return-void
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 1
    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 368
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasComplete()Z
    .locals 1
    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 362
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasSubscribers()Z
    .locals 1
    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 350
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    array-length v0, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasThrowable()Z
    .locals 1
    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 356
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 2
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
            "(TT;)Z"
        }
    .end annotation

    .annotation runtime Lio/reactivex/rxjava3/annotations/CheckReturnValue;
    .end annotation

    .line 315
    const-string v0, "offer called with a null value."

    invoke-static {p1, v0}, Lio/reactivex/rxjava3/internal/util/ExceptionHelper;->nullCheck(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 316
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 319
    :cond_0
    iget v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->fusionMode:I

    if-nez v0, :cond_2

    .line 320
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/rxjava3/operators/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 321
    invoke-virtual {p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->drain()V

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1

    .line 326
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "offer() should not be called in fusion mode!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onComplete()V
    .locals 1

    const/4 v0, 0x1

    .line 343
    iput-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    .line 344
    invoke-virtual {p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->drain()V

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

    .line 331
    const-string v0, "onError called with a null Throwable."

    invoke-static {p1, v0}, Lio/reactivex/rxjava3/internal/util/ExceptionHelper;->nullCheck(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 332
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-nez v0, :cond_0

    .line 333
    iput-object p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    .line 334
    iput-boolean p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    .line 335
    invoke-virtual {p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->drain()V

    return-void

    .line 338
    :cond_0
    invoke-static {p1}, Lio/reactivex/rxjava3/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

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

    .line 291
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-eqz v0, :cond_0

    return-void

    .line 294
    :cond_0
    iget v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->fusionMode:I

    if-nez v0, :cond_1

    .line 295
    const-string v0, "onNext called with a null value."

    invoke-static {p1, v0}, Lio/reactivex/rxjava3/internal/util/ExceptionHelper;->nullCheck(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 296
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/rxjava3/operators/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 297
    iget-object p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 298
    invoke-static {}, Lio/reactivex/rxjava3/exceptions/MissingBackpressureException;->createDefault()Lio/reactivex/rxjava3/exceptions/MissingBackpressureException;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 302
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->drain()V

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

    .line 261
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 262
    instance-of v0, p1, Lio/reactivex/rxjava3/operators/QueueSubscription;

    if-eqz v0, :cond_1

    .line 264
    move-object v0, p1

    check-cast v0, Lio/reactivex/rxjava3/operators/QueueSubscription;

    const/4 v1, 0x3

    .line 266
    invoke-interface {v0, v1}, Lio/reactivex/rxjava3/operators/QueueSubscription;->requestFusion(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 268
    iput v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->fusionMode:I

    .line 269
    iput-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 270
    iput-boolean v2, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    .line 271
    invoke-virtual {p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->drain()V

    return-void

    :cond_0
    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 275
    iput v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->fusionMode:I

    .line 276
    iput-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 278
    iget v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    return-void

    .line 283
    :cond_1
    new-instance v0, Lio/reactivex/rxjava3/operators/SpscArrayQueue;

    iget v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/rxjava3/operators/SpscArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    .line 285
    iget v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    :cond_2
    return-void
.end method

.method remove(Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;)V
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
            "Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription<",
            "TT;>;)V"
        }
    .end annotation

    .line 413
    :cond_0
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 414
    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_2

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    .line 421
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

    goto :goto_2

    :cond_4
    const/4 v4, 0x1

    if-ne v1, v4, :cond_6

    .line 432
    iget-boolean v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->refcount:Z

    if-eqz v1, :cond_5

    .line 433
    iget-object v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/rxjava3/processors/MulticastProcessor;->TERMINATED:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    invoke-static {v1, v0, v2}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 434
    iget-object p1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 435
    iput-boolean v4, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    return-void

    .line 439
    :cond_5
    iget-object v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/rxjava3/processors/MulticastProcessor;->EMPTY:[Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    invoke-static {v1, v0, v2}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_6
    add-int/lit8 v5, v1, -0x1

    .line 444
    new-array v5, v5, [Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    .line 445
    invoke-static {v0, v2, v5, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v2, v3, 0x1

    sub-int/2addr v1, v3

    sub-int/2addr v1, v4

    .line 446
    invoke-static {v0, v2, v5, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 447
    iget-object v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1, v0, v5}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_2
    return-void
.end method

.method public start()V
    .locals 2

    .line 242
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/rxjava3/internal/subscriptions/EmptySubscription;->INSTANCE:Lio/reactivex/rxjava3/internal/subscriptions/EmptySubscription;

    invoke-static {v0, v1}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    new-instance v0, Lio/reactivex/rxjava3/operators/SpscArrayQueue;

    iget v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/rxjava3/operators/SpscArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    :cond_0
    return-void
.end method

.method public startUnbounded()V
    .locals 2

    .line 254
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->upstream:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/rxjava3/internal/subscriptions/EmptySubscription;->INSTANCE:Lio/reactivex/rxjava3/internal/subscriptions/EmptySubscription;

    invoke-static {v0, v1}, Lio/reactivex/rxjava3/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    new-instance v0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;

    iget v1, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->queue:Lio/reactivex/rxjava3/operators/SimpleQueue;

    :cond_0
    return-void
.end method

.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;)V"
        }
    .end annotation

    .line 373
    new-instance v0, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;

    invoke-direct {v0, p1, p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/rxjava3/processors/MulticastProcessor;)V

    .line 374
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 375
    invoke-virtual {p0, v0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->add(Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 376
    invoke-virtual {v0}, Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;->get()J

    move-result-wide v1

    const-wide/high16 v3, -0x8000000000000000L

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    .line 377
    invoke-virtual {p0, v0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->remove(Lio/reactivex/rxjava3/processors/MulticastProcessor$MulticastSubscription;)V

    return-void

    .line 379
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/rxjava3/processors/MulticastProcessor;->drain()V

    return-void

    .line 382
    :cond_1
    iget-boolean v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->done:Z

    if-eqz v0, :cond_2

    .line 383
    iget-object v0, p0, Lio/reactivex/rxjava3/processors/MulticastProcessor;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_2

    .line 385
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 389
    :cond_2
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    return-void
.end method
