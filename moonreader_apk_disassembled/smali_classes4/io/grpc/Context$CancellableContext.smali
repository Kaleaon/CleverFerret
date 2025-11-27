.class public final Lio/grpc/Context$CancellableContext;
.super Lio/grpc/Context;
.source "Context.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/Context;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CancellableContext"
.end annotation


# instance fields
.field private cancellationCause:Ljava/lang/Throwable;

.field private cancelled:Z

.field private final deadline:Lio/grpc/Deadline;

.field private pendingDeadline:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private final uncancellableSurrogate:Lio/grpc/Context;


# direct methods
.method private constructor <init>(Lio/grpc/Context;)V
    .locals 2

    .line 706
    iget-object v0, p1, Lio/grpc/Context;->keyValueEntries:Lio/grpc/PersistentHashArrayMappedTrie;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lio/grpc/Context;-><init>(Lio/grpc/Context;Lio/grpc/PersistentHashArrayMappedTrie;Lio/grpc/Context$1;)V

    .line 707
    invoke-virtual {p1}, Lio/grpc/Context;->getDeadline()Lio/grpc/Deadline;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/Context$CancellableContext;->deadline:Lio/grpc/Deadline;

    .line 710
    new-instance p1, Lio/grpc/Context;

    iget-object v0, p0, Lio/grpc/Context$CancellableContext;->keyValueEntries:Lio/grpc/PersistentHashArrayMappedTrie;

    invoke-direct {p1, p0, v0, v1}, Lio/grpc/Context;-><init>(Lio/grpc/Context;Lio/grpc/PersistentHashArrayMappedTrie;Lio/grpc/Context$1;)V

    iput-object p1, p0, Lio/grpc/Context$CancellableContext;->uncancellableSurrogate:Lio/grpc/Context;

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/Context;Lio/grpc/Context$1;)V
    .locals 0

    .line 693
    invoke-direct {p0, p1}, Lio/grpc/Context$CancellableContext;-><init>(Lio/grpc/Context;)V

    return-void
.end method

.method private constructor <init>(Lio/grpc/Context;Lio/grpc/Deadline;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 2

    .line 718
    iget-object v0, p1, Lio/grpc/Context;->keyValueEntries:Lio/grpc/PersistentHashArrayMappedTrie;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lio/grpc/Context;-><init>(Lio/grpc/Context;Lio/grpc/PersistentHashArrayMappedTrie;Lio/grpc/Context$1;)V

    .line 719
    invoke-virtual {p1}, Lio/grpc/Context;->getDeadline()Lio/grpc/Deadline;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 720
    invoke-virtual {p1, p2}, Lio/grpc/Deadline;->compareTo(Lio/grpc/Deadline;)I

    move-result v0

    if-gtz v0, :cond_0

    move-object p2, p1

    goto :goto_0

    .line 725
    :cond_0
    invoke-virtual {p2}, Lio/grpc/Deadline;->isExpired()Z

    move-result p1

    if-nez p1, :cond_1

    .line 728
    new-instance p1, Lio/grpc/Context$CancellableContext$1;

    invoke-direct {p1, p0}, Lio/grpc/Context$CancellableContext$1;-><init>(Lio/grpc/Context$CancellableContext;)V

    invoke-virtual {p2, p1, p3}, Lio/grpc/Deadline;->runOnExpiration(Ljava/lang/Runnable;Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/Context$CancellableContext;->pendingDeadline:Ljava/util/concurrent/ScheduledFuture;

    goto :goto_0

    .line 740
    :cond_1
    new-instance p1, Ljava/util/concurrent/TimeoutException;

    const-string p3, "context timed out"

    invoke-direct {p1, p3}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    .line 743
    :goto_0
    iput-object p2, p0, Lio/grpc/Context$CancellableContext;->deadline:Lio/grpc/Deadline;

    .line 744
    new-instance p1, Lio/grpc/Context;

    iget-object p2, p0, Lio/grpc/Context$CancellableContext;->keyValueEntries:Lio/grpc/PersistentHashArrayMappedTrie;

    invoke-direct {p1, p0, p2, v1}, Lio/grpc/Context;-><init>(Lio/grpc/Context;Lio/grpc/PersistentHashArrayMappedTrie;Lio/grpc/Context$1;)V

    iput-object p1, p0, Lio/grpc/Context$CancellableContext;->uncancellableSurrogate:Lio/grpc/Context;

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/Context;Lio/grpc/Deadline;Ljava/util/concurrent/ScheduledExecutorService;Lio/grpc/Context$1;)V
    .locals 0

    .line 693
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/Context$CancellableContext;-><init>(Lio/grpc/Context;Lio/grpc/Deadline;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-void
.end method


# virtual methods
.method public attach()Lio/grpc/Context;
    .locals 1

    .line 750
    iget-object v0, p0, Lio/grpc/Context$CancellableContext;->uncancellableSurrogate:Lio/grpc/Context;

    invoke-virtual {v0}, Lio/grpc/Context;->attach()Lio/grpc/Context;

    move-result-object v0

    return-object v0
.end method

.method canBeCancelled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public cancel(Ljava/lang/Throwable;)Z
    .locals 3

    .line 785
    monitor-enter p0

    .line 786
    :try_start_0
    iget-boolean v0, p0, Lio/grpc/Context$CancellableContext;->cancelled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 787
    iput-boolean v0, p0, Lio/grpc/Context$CancellableContext;->cancelled:Z

    .line 788
    iget-object v2, p0, Lio/grpc/Context$CancellableContext;->pendingDeadline:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v2, :cond_0

    .line 790
    invoke-interface {v2, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    const/4 v1, 0x0

    .line 791
    iput-object v1, p0, Lio/grpc/Context$CancellableContext;->pendingDeadline:Ljava/util/concurrent/ScheduledFuture;

    .line 793
    :cond_0
    iput-object p1, p0, Lio/grpc/Context$CancellableContext;->cancellationCause:Ljava/lang/Throwable;

    const/4 v1, 0x1

    .line 796
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 798
    invoke-virtual {p0}, Lio/grpc/Context$CancellableContext;->notifyAndClearListeners()V

    :cond_2
    return v1

    :catchall_0
    move-exception p1

    .line 796
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public cancellationCause()Ljava/lang/Throwable;
    .locals 1

    .line 835
    invoke-virtual {p0}, Lio/grpc/Context$CancellableContext;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 836
    iget-object v0, p0, Lio/grpc/Context$CancellableContext;->cancellationCause:Ljava/lang/Throwable;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public close()V
    .locals 1

    const/4 v0, 0x0

    .line 856
    invoke-virtual {p0, v0}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    return-void
.end method

.method public detach(Lio/grpc/Context;)V
    .locals 1

    .line 755
    iget-object v0, p0, Lio/grpc/Context$CancellableContext;->uncancellableSurrogate:Lio/grpc/Context;

    invoke-virtual {v0, p1}, Lio/grpc/Context;->detach(Lio/grpc/Context;)V

    return-void
.end method

.method public detachAndCancel(Lio/grpc/Context;Ljava/lang/Throwable;)V
    .locals 0

    .line 811
    :try_start_0
    invoke-virtual {p0, p1}, Lio/grpc/Context$CancellableContext;->detach(Lio/grpc/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 813
    invoke-virtual {p0, p2}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {p0, p2}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    throw p1
.end method

.method public getDeadline()Lio/grpc/Deadline;
    .locals 1

    .line 843
    iget-object v0, p0, Lio/grpc/Context$CancellableContext;->deadline:Lio/grpc/Deadline;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 2

    .line 819
    monitor-enter p0

    .line 820
    :try_start_0
    iget-boolean v0, p0, Lio/grpc/Context$CancellableContext;->cancelled:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 821
    monitor-exit p0

    return v1

    .line 823
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 826
    invoke-super {p0}, Lio/grpc/Context;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 827
    invoke-super {p0}, Lio/grpc/Context;->cancellationCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    .line 823
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public isCurrent()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 769
    iget-object v0, p0, Lio/grpc/Context$CancellableContext;->uncancellableSurrogate:Lio/grpc/Context;

    invoke-virtual {v0}, Lio/grpc/Context;->isCurrent()Z

    move-result v0

    return v0
.end method
