.class Lorg/apache/http/impl/client/IdleConnectionEvictor$1;
.super Ljava/lang/Object;
.source "IdleConnectionEvictor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/client/IdleConnectionEvictor;-><init>(Lorg/apache/http/conn/HttpClientConnectionManager;Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;JLjava/util/concurrent/TimeUnit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/client/IdleConnectionEvictor;

.field final synthetic val$connectionManager:Lorg/apache/http/conn/HttpClientConnectionManager;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/IdleConnectionEvictor;Lorg/apache/http/conn/HttpClientConnectionManager;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->this$0:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    iput-object p2, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->val$connectionManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 65
    :cond_0
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    .line 66
    iget-object v0, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->this$0:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    invoke-static {v0}, Lorg/apache/http/impl/client/IdleConnectionEvictor;->access$000(Lorg/apache/http/impl/client/IdleConnectionEvictor;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 67
    iget-object v0, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->val$connectionManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->closeExpiredConnections()V

    .line 68
    iget-object v0, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->this$0:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    invoke-static {v0}, Lorg/apache/http/impl/client/IdleConnectionEvictor;->access$100(Lorg/apache/http/impl/client/IdleConnectionEvictor;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 69
    iget-object v0, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->val$connectionManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v1, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->this$0:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    invoke-static {v1}, Lorg/apache/http/impl/client/IdleConnectionEvictor;->access$100(Lorg/apache/http/impl/client/IdleConnectionEvictor;)J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/http/conn/HttpClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 73
    iget-object v1, p0, Lorg/apache/http/impl/client/IdleConnectionEvictor$1;->this$0:Lorg/apache/http/impl/client/IdleConnectionEvictor;

    invoke-static {v1, v0}, Lorg/apache/http/impl/client/IdleConnectionEvictor;->access$202(Lorg/apache/http/impl/client/IdleConnectionEvictor;Ljava/lang/Exception;)Ljava/lang/Exception;

    :cond_1
    return-void
.end method
