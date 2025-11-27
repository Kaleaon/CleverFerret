.class Lcom/flyersoft/moonreaderp/ActivityMain$65;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doDownloadThreadWithLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$thisNetTag:J


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6507
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-wide p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->val$thisNetTag:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const-string v0, "Basic "

    .line 6509
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 6511
    :try_start_0
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    const/16 v2, 0x2710

    .line 6512
    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 6513
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_UserAgent:Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 6515
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->createTrustHttpClient(Lorg/apache/http/params/BasicHttpParams;)Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v1

    iput-object v1, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    .line 6516
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v1

    new-instance v2, Lorg/apache/http/auth/AuthScope;

    const/4 v3, -0x1

    const/4 v4, 0x0

    invoke-direct {v2, v4, v3, v4}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lorg/apache/http/auth/UsernamePasswordCredentials;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_username:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_password:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2, v3}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 6518
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Url:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 6519
    invoke-static {v1}, Lcom/flyersoft/opds/MyHttpResponse;->createMyHttpResponse(Lorg/apache/http/HttpResponse;)Lcom/flyersoft/opds/MyHttpResponse;

    move-result-object v1

    .line 6520
    iget-wide v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->val$thisNetTag:J

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_0

    .line 6521
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Msg_Id:I

    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 6540
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 6541
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 6542
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_ERROR()I

    move-result v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :catch_1
    move-exception v1

    .line 6523
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 6525
    :try_start_1
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Url:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 6526
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 6527
    invoke-static {v1}, Lcom/flyersoft/tools/T;->trustHttpsUrlConnection(Ljava/net/URLConnection;)V

    .line 6528
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_username:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_password:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 6529
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m()Ljava/util/Base64$Encoder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/Base64$Encoder;[B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 6530
    const-string v2, "Authorization"

    invoke-virtual {v1, v2, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 6531
    invoke-static {v1}, Lcom/flyersoft/opds/MyHttpResponse;->createUrlsConnectionResponse(Ljava/net/HttpURLConnection;)Lcom/flyersoft/opds/MyHttpResponse;

    move-result-object v0

    .line 6532
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 6533
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Msg_Id:I

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    :catch_2
    move-exception v0

    .line 6535
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 6536
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 6537
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_ERROR()I

    move-result v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    :goto_0
    return-void
.end method
