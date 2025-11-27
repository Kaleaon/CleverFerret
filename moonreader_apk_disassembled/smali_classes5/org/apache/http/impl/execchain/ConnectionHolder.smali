.class Lorg/apache/http/impl/execchain/ConnectionHolder;
.super Ljava/lang/Object;
.source "ConnectionHolder.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionReleaseTrigger;
.implements Lorg/apache/http/concurrent/Cancellable;
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final managedConn:Lorg/apache/http/HttpClientConnection;

.field private final manager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private final released:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private volatile reusable:Z

.field private volatile state:Ljava/lang/Object;

.field private volatile timeUnit:Ljava/util/concurrent/TimeUnit;

.field private volatile validDuration:J


# direct methods
.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    .line 67
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 68
    iput-object p3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    .line 69
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private releaseConnection(Z)V
    .locals 8

    .line 96
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 97
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v1

    if-eqz p1, :cond_0

    .line 99
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    iget-object v4, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->state:Ljava/lang/Object;

    iget-wide v5, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->validDuration:J

    iget-object v7, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->timeUnit:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v2 .. v7}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_3

    .line 103
    :cond_0
    :try_start_1
    iget-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    invoke-interface {p1}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 104
    iget-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string v0, "Connection discarded"

    invoke-interface {p1, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 110
    :try_start_2
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    :goto_0
    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    invoke-interface/range {v2 .. v7}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_2

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 106
    :try_start_3
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, p1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 110
    :cond_1
    :try_start_4
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    goto :goto_0

    .line 114
    :goto_1
    monitor-exit v1

    goto :goto_4

    .line 110
    :goto_2
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    invoke-interface/range {v2 .. v7}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    throw p1

    .line 114
    :goto_3
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p1

    :cond_2
    :goto_4
    return-void
.end method


# virtual methods
.method public abortConnection()V
    .locals 9

    .line 125
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v1

    .line 128
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    invoke-interface {v0}, Lorg/apache/http/HttpClientConnection;->shutdown()V

    .line 129
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection discarded"

    invoke-interface {v0, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    :try_start_1
    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v4, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    invoke-interface/range {v3 .. v8}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 131
    :try_start_2
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 132
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 135
    :cond_0
    :try_start_3
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    invoke-interface/range {v2 .. v7}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 138
    :goto_0
    monitor-exit v1

    goto :goto_2

    .line 135
    :goto_1
    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    invoke-interface/range {v2 .. v7}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    throw v0

    :catchall_1
    move-exception v0

    .line 138
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    :cond_1
    :goto_2
    return-void
.end method

.method public cancel()Z
    .locals 3

    .line 144
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    .line 145
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Cancelling request execution"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 146
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 156
    invoke-direct {p0, v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->releaseConnection(Z)V

    return-void
.end method

.method public isReleased()Z
    .locals 1

    .line 151
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isReusable()Z
    .locals 1

    .line 73
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    return v0
.end method

.method public markNonReusable()V
    .locals 1

    const/4 v0, 0x0

    .line 81
    iput-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    return-void
.end method

.method public markReusable()V
    .locals 1

    const/4 v0, 0x1

    .line 77
    iput-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    return-void
.end method

.method public releaseConnection()V
    .locals 1

    .line 120
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    invoke-direct {p0, v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->releaseConnection(Z)V

    return-void
.end method

.method public setState(Ljava/lang/Object;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->state:Ljava/lang/Object;

    return-void
.end method

.method public setValidFor(JLjava/util/concurrent/TimeUnit;)V
    .locals 1

    .line 89
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v0

    .line 90
    :try_start_0
    iput-wide p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->validDuration:J

    .line 91
    iput-object p3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->timeUnit:Ljava/util/concurrent/TimeUnit;

    .line 92
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
