.class Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;
.super Ljava/lang/Object;
.source "PoolingHttpClientConnectionManager.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;

.field final synthetic val$future:Ljava/util/concurrent/Future;

.field final synthetic val$route:Lorg/apache/http/conn/routing/HttpRoute;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;Ljava/util/concurrent/Future;Lorg/apache/http/conn/routing/HttpRoute;)V
    .locals 0

    .line 269
    iput-object p1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;

    iput-object p2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$future:Ljava/util/concurrent/Future;

    iput-object p3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()Z
    .locals 2

    .line 273
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$future:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Lorg/apache/http/conn/ConnectionPoolTimeoutException;
        }
    .end annotation

    .line 280
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;

    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$future:Ljava/util/concurrent/Future;

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->leaseConnection(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;

    move-result-object p1

    .line 281
    invoke-interface {p1}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 283
    iget-object p2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 284
    iget-object p2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object p2

    goto :goto_0

    .line 286
    :cond_0
    iget-object p2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object p2

    .line 288
    :goto_0
    iget-object p3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;

    invoke-static {p3, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->access$000(Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;Lorg/apache/http/HttpHost;)Lorg/apache/http/config/SocketConfig;

    move-result-object p2

    .line 289
    invoke-virtual {p2}, Lorg/apache/http/config/SocketConfig;->getSoTimeout()I

    move-result p2

    invoke-interface {p1, p2}, Lorg/apache/http/HttpClientConnection;->setSocketTimeout(I)V

    :cond_1
    return-object p1
.end method
