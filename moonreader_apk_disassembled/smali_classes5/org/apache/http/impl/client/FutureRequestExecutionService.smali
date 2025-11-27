.class public Lorg/apache/http/impl/client/FutureRequestExecutionService;
.super Ljava/lang/Object;
.source "FutureRequestExecutionService.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# instance fields
.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final httpclient:Lorg/apache/http/client/HttpClient;

.field private final metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/HttpClient;Ljava/util/concurrent/ExecutorService;)V
    .locals 2

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-direct {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    .line 52
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    iput-object p1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    .line 71
    iput-object p2, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->executorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 137
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 138
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    instance-of v1, v0, Ljava/io/Closeable;

    if-eqz v1, :cond_0

    .line 139
    check-cast v0, Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    :cond_0
    return-void
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;)Lorg/apache/http/impl/client/HttpRequestFutureTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Lorg/apache/http/client/ResponseHandler<",
            "TT;>;)",
            "Lorg/apache/http/impl/client/HttpRequestFutureTask<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 89
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/FutureRequestExecutionService;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;)Lorg/apache/http/impl/client/HttpRequestFutureTask;

    move-result-object p1

    return-object p1
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;)Lorg/apache/http/impl/client/HttpRequestFutureTask;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Lorg/apache/http/client/ResponseHandler<",
            "TT;>;",
            "Lorg/apache/http/concurrent/FutureCallback<",
            "TT;>;)",
            "Lorg/apache/http/impl/client/HttpRequestFutureTask<",
            "TT;>;"
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getScheduledConnections()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 117
    new-instance v1, Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    iget-object v2, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    iget-object v7, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v7}, Lorg/apache/http/impl/client/HttpRequestTaskCallable;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;)V

    .line 119
    new-instance p1, Lorg/apache/http/impl/client/HttpRequestFutureTask;

    invoke-direct {p1, v3, v1}, Lorg/apache/http/impl/client/HttpRequestFutureTask;-><init>(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/impl/client/HttpRequestTaskCallable;)V

    .line 121
    iget-object p2, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p2, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-object p1

    .line 114
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Close has been called on this httpclient instance."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public metrics()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    return-object v0
.end method
