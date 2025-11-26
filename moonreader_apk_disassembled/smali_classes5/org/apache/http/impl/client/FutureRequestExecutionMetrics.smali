.class public final Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;
.super Ljava/lang/Object;
.source "FutureRequestExecutionMetrics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;
    }
.end annotation


# instance fields
.field private final activeConnections:Ljava/util/concurrent/atomic/AtomicLong;

.field private final failedConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

.field private final requests:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

.field private final scheduledConnections:Ljava/util/concurrent/atomic/AtomicLong;

.field private final successfulConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

.field private final tasks:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->activeConnections:Ljava/util/concurrent/atomic/AtomicLong;

    .line 37
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->scheduledConnections:Ljava/util/concurrent/atomic/AtomicLong;

    .line 38
    new-instance v0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-direct {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->successfulConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    .line 39
    new-instance v0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-direct {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->failedConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    .line 40
    new-instance v0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-direct {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->requests:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    .line 41
    new-instance v0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-direct {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->tasks:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    return-void
.end method


# virtual methods
.method public getActiveConnectionCount()J
    .locals 2

    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->activeConnections:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getActiveConnections()Ljava/util/concurrent/atomic/AtomicLong;
    .locals 1

    .line 47
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->activeConnections:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method public getFailedConnectionAverageDuration()J
    .locals 2

    .line 91
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->failedConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->averageDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getFailedConnectionCount()J
    .locals 2

    .line 87
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->failedConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method getFailedConnections()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;
    .locals 1

    .line 59
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->failedConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    return-object v0
.end method

.method public getRequestAverageDuration()J
    .locals 2

    .line 99
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->requests:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->averageDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getRequestCount()J
    .locals 2

    .line 95
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->requests:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method getRequests()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;
    .locals 1

    .line 63
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->requests:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    return-object v0
.end method

.method public getScheduledConnectionCount()J
    .locals 2

    .line 75
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->scheduledConnections:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getScheduledConnections()Ljava/util/concurrent/atomic/AtomicLong;
    .locals 1

    .line 51
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->scheduledConnections:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method public getSuccessfulConnectionAverageDuration()J
    .locals 2

    .line 83
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->successfulConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->averageDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSuccessfulConnectionCount()J
    .locals 2

    .line 79
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->successfulConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method getSuccessfulConnections()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->successfulConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    return-object v0
.end method

.method public getTaskAverageDuration()J
    .locals 2

    .line 107
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->tasks:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->averageDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTaskCount()J
    .locals 2

    .line 103
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->tasks:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method getTasks()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;
    .locals 1

    .line 67
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->tasks:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[activeConnections="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->activeConnections:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", scheduledConnections="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->scheduledConnections:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", successfulConnections="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->successfulConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", failedConnections="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->failedConnections:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", requests="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->requests:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", tasks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->tasks:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
