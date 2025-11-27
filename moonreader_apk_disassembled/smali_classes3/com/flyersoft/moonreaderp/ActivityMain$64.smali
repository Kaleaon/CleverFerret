.class Lcom/flyersoft/moonreaderp/ActivityMain$64;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doDownloadThread(Ljava/lang/String;Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$createNew:Z

.field final synthetic val$thisNetTag:J


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6472
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-wide p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$thisNetTag:J

    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$createNew:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 6474
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$thisNetTag:J

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    .line 6476
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$createNew:Z

    if-nez v0, :cond_0

    .line 6477
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Url:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 6478
    invoke-static {v0}, Lcom/flyersoft/opds/MyHttpResponse;->createMyHttpResponse(Lorg/apache/http/HttpResponse;)Lcom/flyersoft/opds/MyHttpResponse;

    move-result-object v0

    .line 6479
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    .line 6480
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Msg_Id:I

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 6482
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Url:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_UserAgent:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->openUrlConnection(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 6483
    invoke-static {v0}, Lcom/flyersoft/tools/T;->trustHttpsUrlConnection(Ljava/net/URLConnection;)V

    .line 6484
    invoke-static {v0}, Lcom/flyersoft/opds/MyHttpResponse;->createUrlsConnectionResponse(Ljava/net/HttpURLConnection;)Lcom/flyersoft/opds/MyHttpResponse;

    move-result-object v0

    .line 6485
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    .line 6486
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_Msg_Id:I

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 6492
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 6493
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->val$thisNetTag:J

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netTag:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    .line 6494
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_ERROR()I

    move-result v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method
