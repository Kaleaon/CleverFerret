.class public final Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;
.super Ljava/lang/Object;
.source "OkHttpRequestor.java"

# interfaces
.implements Lcom/squareup/okhttp/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/OkHttpRequestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AsyncCallback"
.end annotation


# instance fields
.field private error:Ljava/io/IOException;

.field private response:Lcom/squareup/okhttp/Response;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 279
    iput-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->error:Ljava/io/IOException;

    .line 280
    iput-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->response:Lcom/squareup/okhttp/Response;

    return-void
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/http/OkHttpRequestor$1;)V
    .locals 0

    .line 274
    invoke-direct {p0}, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized getResponse()Lcom/squareup/okhttp/Response;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 284
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->error:Ljava/io/IOException;

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->response:Lcom/squareup/okhttp/Response;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 286
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 288
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 289
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0

    :cond_0
    if-nez v0, :cond_1

    .line 295
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->response:Lcom/squareup/okhttp/Response;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    .line 293
    :cond_1
    :try_start_3
    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public declared-synchronized onFailure(Lcom/squareup/okhttp/Request;Ljava/io/IOException;)V
    .locals 0

    monitor-enter p0

    .line 300
    :try_start_0
    iput-object p2, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->error:Ljava/io/IOException;

    .line 301
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
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

.method public declared-synchronized onResponse(Lcom/squareup/okhttp/Response;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 306
    :try_start_0
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->response:Lcom/squareup/okhttp/Response;

    .line 307
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
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
