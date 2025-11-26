.class Lorg/apache/http/impl/client/HttpClientBuilder$1;
.super Ljava/lang/Object;
.source "HttpClientBuilder.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/client/HttpClientBuilder;->build()Lorg/apache/http/impl/client/CloseableHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/client/HttpClientBuilder;

.field final synthetic val$connectionEvictor:Lorg/apache/http/impl/client/IdleConnectionEvictor;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/HttpClientBuilder;Lorg/apache/http/impl/client/IdleConnectionEvictor;)V
    .locals 0

    .line 1225
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder$1;->this$0:Lorg/apache/http/impl/client/HttpClientBuilder;

    iput-object p2, p0, Lorg/apache/http/impl/client/HttpClientBuilder$1;->val$connectionEvictor:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1229
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder$1;->val$connectionEvictor:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/IdleConnectionEvictor;->shutdown()V

    .line 1231
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder$1;->val$connectionEvictor:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3, v1}, Lorg/apache/http/impl/client/IdleConnectionEvictor;->awaitTermination(JLjava/util/concurrent/TimeUnit;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 1233
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void
.end method
