.class public Lorg/apache/http/impl/execchain/BackoffStrategyExec;
.super Ljava/lang/Object;
.source "BackoffStrategyExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# instance fields
.field private final backoffManager:Lorg/apache/http/client/BackoffManager;

.field private final connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/ConnectionBackoffStrategy;Lorg/apache/http/client/BackoffManager;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const-string v0, "HTTP client request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    const-string v0, "Connection backoff strategy"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    const-string v0, "Backoff manager"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 63
    iput-object p1, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 64
    iput-object p2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    .line 65
    iput-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .line 74
    const-string v0, "HTTP route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 75
    const-string v0, "HTTP request"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    const-string v0, "HTTP context"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    iget-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    invoke-interface {p3, p2}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Lorg/apache/http/HttpResponse;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 99
    iget-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    invoke-interface {p3, p1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V

    return-object p2

    .line 101
    :cond_0
    iget-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    invoke-interface {p3, p1}, Lorg/apache/http/client/BackoffManager;->probe(Lorg/apache/http/conn/routing/HttpRoute;)V

    return-object p2

    :catch_0
    move-exception p2

    .line 84
    iget-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    invoke-interface {p3, p2}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Ljava/lang/Throwable;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 85
    iget-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    invoke-interface {p3, p1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 87
    :cond_1
    instance-of p1, p2, Ljava/lang/RuntimeException;

    if-nez p1, :cond_4

    .line 90
    instance-of p1, p2, Lorg/apache/http/HttpException;

    if-nez p1, :cond_3

    .line 93
    instance-of p1, p2, Ljava/io/IOException;

    if-eqz p1, :cond_2

    .line 94
    check-cast p2, Ljava/io/IOException;

    throw p2

    .line 96
    :cond_2
    new-instance p1, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {p1, p2}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 91
    :cond_3
    check-cast p2, Lorg/apache/http/HttpException;

    throw p2

    .line 88
    :cond_4
    check-cast p2, Ljava/lang/RuntimeException;

    throw p2
.end method
