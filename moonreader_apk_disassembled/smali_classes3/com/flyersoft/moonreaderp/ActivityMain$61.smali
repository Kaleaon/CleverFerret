.class Lcom/flyersoft/moonreaderp/ActivityMain$61;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->addNewCatalogThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 5895
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 5898
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xc

    if-le v0, v1, :cond_0

    .line 5899
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    const/16 v1, 0x2710

    .line 5900
    invoke-static {v0, v1}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 5901
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/opds/N;->getUserAgent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 5902
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 5904
    :try_start_0
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 5905
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    .line 5906
    invoke-static {v0}, Lcom/flyersoft/opds/MyHttpResponse;->createMyHttpResponse(Lorg/apache/http/HttpResponse;)Lcom/flyersoft/opds/MyHttpResponse;

    move-result-object v0

    const/4 v3, 0x1

    .line 5905
    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5910
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 5908
    :try_start_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 5910
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    goto :goto_1

    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$61;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 5911
    throw v0

    :cond_0
    :goto_1
    return-void
.end method
