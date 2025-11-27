.class public Lcom/facebook/imagepipeline/producers/JobScheduler;
.super Ljava/lang/Object;
.source "JobScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;,
        Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;,
        Lcom/facebook/imagepipeline/producers/JobScheduler$JobStartExecutorSupplier;
    }
.end annotation


# static fields
.field static final QUEUE_TIME_KEY:Ljava/lang/String; = "queueTime"


# instance fields
.field private final mDoJobRunnable:Ljava/lang/Runnable;

.field mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mJobRunnable:Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;

.field mJobStartTime:J

.field mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

.field mJobSubmitTime:J

.field private final mMinimumJobIntervalMs:I

.field mStatus:I

.field private final mSubmitJobRunnable:Ljava/lang/Runnable;


# direct methods
.method static bridge synthetic -$$Nest$mdoJob(Lcom/facebook/imagepipeline/producers/JobScheduler;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->doJob()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msubmitJob(Lcom/facebook/imagepipeline/producers/JobScheduler;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->submitJob()V

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;I)V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mExecutor:Ljava/util/concurrent/Executor;

    .line 91
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobRunnable:Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;

    .line 92
    iput p3, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mMinimumJobIntervalMs:I

    .line 93
    new-instance p1, Lcom/facebook/imagepipeline/producers/JobScheduler$1;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/producers/JobScheduler$1;-><init>(Lcom/facebook/imagepipeline/producers/JobScheduler;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mDoJobRunnable:Ljava/lang/Runnable;

    .line 100
    new-instance p1, Lcom/facebook/imagepipeline/producers/JobScheduler$2;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/producers/JobScheduler$2;-><init>(Lcom/facebook/imagepipeline/producers/JobScheduler;)V

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mSubmitJobRunnable:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 107
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    const/4 p1, 0x0

    .line 108
    iput p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mStatus:I

    .line 109
    sget-object p1, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->IDLE:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    const-wide/16 p1, 0x0

    .line 110
    iput-wide p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobSubmitTime:J

    .line 111
    iput-wide p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobStartTime:J

    return-void
.end method

.method private doJob()V
    .locals 5

    .line 216
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 219
    monitor-enter p0

    .line 220
    :try_start_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    .line 221
    iget v3, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mStatus:I

    const/4 v4, 0x0

    .line 222
    iput-object v4, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    const/4 v4, 0x0

    .line 223
    iput v4, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mStatus:I

    .line 224
    sget-object v4, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->RUNNING:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    iput-object v4, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    .line 225
    iput-wide v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobStartTime:J

    .line 226
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 230
    :try_start_1
    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/producers/JobScheduler;->shouldProcess(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobRunnable:Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;

    invoke-interface {v0, v2, v3}, Lcom/facebook/imagepipeline/producers/JobScheduler$JobRunnable;->run(Lcom/facebook/imagepipeline/image/EncodedImage;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 234
    :cond_0
    invoke-static {v2}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 235
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->onJobFinished()V

    return-void

    :catchall_0
    move-exception v0

    .line 234
    invoke-static {v2}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    .line 235
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->onJobFinished()V

    .line 236
    throw v0

    :catchall_1
    move-exception v0

    .line 226
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method private enqueueJob(J)V
    .locals 4

    .line 201
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mSubmitJobRunnable:Ljava/lang/Runnable;

    const-string v1, "JobScheduler_enqueueJob"

    .line 202
    invoke-static {v0, v1}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->decorateRunnable(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-lez v3, :cond_0

    .line 204
    invoke-static {}, Lcom/facebook/imagepipeline/producers/JobScheduler$JobStartExecutorSupplier;->get()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    return-void

    .line 206
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private onJobFinished()V
    .locals 6

    .line 240
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 243
    monitor-enter p0

    .line 244
    :try_start_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    sget-object v3, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->RUNNING_AND_PENDING:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    if-ne v2, v3, :cond_0

    .line 245
    iget-wide v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobStartTime:J

    iget v4, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mMinimumJobIntervalMs:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 247
    iput-wide v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobSubmitTime:J

    .line 248
    sget-object v4, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->QUEUED:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    iput-object v4, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    const/4 v4, 0x1

    goto :goto_0

    .line 250
    :cond_0
    sget-object v2, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->IDLE:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    iput-object v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    .line 252
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_1

    sub-long/2addr v2, v0

    .line 254
    invoke-direct {p0, v2, v3}, Lcom/facebook/imagepipeline/producers/JobScheduler;->enqueueJob(J)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    .line 252
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private static shouldProcess(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z
    .locals 1
    .param p0    # Lcom/facebook/imagepipeline/image/EncodedImage;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 263
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->isLast(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x4

    .line 264
    invoke-static {p1, v0}, Lcom/facebook/imagepipeline/producers/BaseConsumer;->statusHasFlag(II)Z

    move-result p1

    if-nez p1, :cond_1

    .line 265
    invoke-static {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->isValid(Lcom/facebook/imagepipeline/image/EncodedImage;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private submitJob()V
    .locals 3

    .line 211
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mDoJobRunnable:Ljava/lang/Runnable;

    const-string v2, "JobScheduler_submitJob"

    .line 212
    invoke-static {v1, v2}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->decorateRunnable(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    .line 211
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public clearJob()V
    .locals 2

    .line 122
    monitor-enter p0

    .line 123
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    const/4 v1, 0x0

    .line 124
    iput-object v1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    const/4 v1, 0x0

    .line 125
    iput v1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mStatus:I

    .line 126
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    invoke-static {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    return-void

    :catchall_0
    move-exception v0

    .line 126
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized getQueuedTime()J
    .locals 4

    monitor-enter p0

    .line 274
    :try_start_0
    iget-wide v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobStartTime:J

    iget-wide v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobSubmitTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr v0, v2

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public scheduleJob()Z
    .locals 7

    .line 166
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 169
    monitor-enter p0

    .line 170
    :try_start_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    iget v3, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mStatus:I

    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/producers/JobScheduler;->shouldProcess(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 171
    monitor-exit p0

    return v3

    .line 173
    :cond_0
    sget-object v2, Lcom/facebook/imagepipeline/producers/JobScheduler$3;->$SwitchMap$com$facebook$imagepipeline$producers$JobScheduler$JobState:[I

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    invoke-virtual {v4}, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->ordinal()I

    move-result v4

    aget v2, v2, v4

    const/4 v4, 0x1

    if-eq v2, v4, :cond_2

    const/4 v5, 0x3

    if-eq v2, v5, :cond_1

    goto :goto_0

    .line 184
    :cond_1
    sget-object v2, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->RUNNING_AND_PENDING:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    iput-object v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    :goto_0
    const-wide/16 v5, 0x0

    goto :goto_1

    .line 175
    :cond_2
    iget-wide v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobStartTime:J

    iget v5, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mMinimumJobIntervalMs:I

    int-to-long v5, v5

    add-long/2addr v2, v5

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 177
    iput-wide v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobSubmitTime:J

    .line 178
    sget-object v2, Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;->QUEUED:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    iput-object v2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mJobState:Lcom/facebook/imagepipeline/producers/JobScheduler$JobState;

    const/4 v3, 0x1

    .line 190
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_3

    sub-long/2addr v5, v0

    .line 192
    invoke-direct {p0, v5, v6}, Lcom/facebook/imagepipeline/producers/JobScheduler;->enqueueJob(J)V

    :cond_3
    return v4

    :catchall_0
    move-exception v0

    .line 190
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public updateJob(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z
    .locals 1
    .param p1    # Lcom/facebook/imagepipeline/image/EncodedImage;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 140
    invoke-static {p1, p2}, Lcom/facebook/imagepipeline/producers/JobScheduler;->shouldProcess(Lcom/facebook/imagepipeline/image/EncodedImage;I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 144
    :cond_0
    monitor-enter p0

    .line 145
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    .line 146
    invoke-static {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->cloneOrNull(Lcom/facebook/imagepipeline/image/EncodedImage;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mEncodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    .line 147
    iput p2, p0, Lcom/facebook/imagepipeline/producers/JobScheduler;->mStatus:I

    .line 148
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    invoke-static {v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->closeSafely(Lcom/facebook/imagepipeline/image/EncodedImage;)V

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    .line 148
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
