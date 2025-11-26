.class Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;
.super Ljava/lang/Object;
.source "BookDownloadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->startFileDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 376
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 378
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->cookies:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->username:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadWithUrlConnection()V

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 385
    :try_start_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    iput-object v4, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->httpParams:Lorg/apache/http/params/BasicHttpParams;

    .line 386
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->httpParams:Lorg/apache/http/params/BasicHttpParams;

    const/16 v4, 0x2710

    invoke-static {v3, v4}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 387
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->httpParams:Lorg/apache/http/params/BasicHttpParams;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->user_agent:Ljava/lang/String;

    invoke-static {v3, v4}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 389
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->httpParams:Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    iput-object v4, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    .line 390
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->cookies:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 391
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->cookies:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mgetCookieStore(Lcom/flyersoft/moonreaderp/BookDownloadService;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/impl/client/BasicCookieStore;

    move-result-object v3

    .line 392
    new-instance v4, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v4}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 393
    const-string v5, "http.cookie-store"

    invoke-interface {v4, v5, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 394
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v4, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->setCookieStore(Lorg/apache/http/client/CookieStore;)V

    .line 397
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->username:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->password:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 398
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-static {v3, v1}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->-$$Nest$fputloginStart(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;Z)V

    .line 399
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v3

    new-instance v4, Lorg/apache/http/auth/AuthScope;

    const/4 v5, -0x1

    invoke-direct {v4, v2, v5, v2}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lorg/apache/http/auth/UsernamePasswordCredentials;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->username:Ljava/lang/String;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->password:Ljava/lang/String;

    invoke-direct {v5, v6, v7}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4, v5}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 404
    :cond_2
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 405
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-virtual {v4, v3}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadWithHttpGet(Lorg/apache/http/HttpResponse;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    .line 408
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->username:Ljava/lang/String;

    if-nez v4, :cond_3

    instance-of v4, v3, Ljava/lang/IllegalArgumentException;

    if-eqz v4, :cond_3

    .line 409
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 410
    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "*************use downloadWithUrlConnection() instead************"

    aput-object v3, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 411
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadWithUrlConnection()V

    goto :goto_0

    .line 413
    :cond_3
    invoke-static {v3}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    if-eqz v2, :cond_4

    .line 417
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    .line 418
    invoke-virtual {v3, v0, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 417
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_4
    return-void
.end method
