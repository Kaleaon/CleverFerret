.class public Lcom/facebook/common/executors/DefaultSerialExecutorService;
.super Lcom/facebook/common/executors/ConstrainedExecutorService;
.source "DefaultSerialExecutorService.java"

# interfaces
.implements Lcom/facebook/common/executors/SerialExecutorService;
.implements Ljava/lang/AutoCloseable;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 3

    .line 24
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-string v1, "SerialExecutor"

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p1, v0}, Lcom/facebook/common/executors/ConstrainedExecutorService;-><init>(Ljava/lang/String;ILjava/util/concurrent/Executor;Ljava/util/concurrent/BlockingQueue;)V

    return-void
.end method


# virtual methods
.method public synthetic close()V
    .locals 0

    invoke-static {p0}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method public declared-synchronized execute(Ljava/lang/Runnable;)V
    .locals 0

    monitor-enter p0

    .line 35
    :try_start_0
    invoke-super {p0, p1}, Lcom/facebook/common/executors/ConstrainedExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
