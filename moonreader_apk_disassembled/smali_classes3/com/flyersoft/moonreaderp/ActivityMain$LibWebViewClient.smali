.class Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LibWebViewClient"
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

    .line 5745
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 5755
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 5756
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowConnectIndicator(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 5759
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 5760
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowConnectIndicator(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 5774
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 p2, 0x3

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p2, v0

    const/4 p1, 0x1

    aput-object p3, p2, p1

    const/4 p1, 0x2

    aput-object p4, p2, p1

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz p3, :cond_0

    .line 5775
    const-string p1, "ERR_CLEARTEXT_NOT_PERMITTED"

    invoke-virtual {p3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 5776
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p2

    const-string p3, "Not https url (ERR_CLEARTEXT_NOT_PERMITTED)"

    invoke-static {p1, p2, p3}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 5765
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_username:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5766
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_username:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_password:Ljava/lang/String;

    invoke-virtual {p1, p3, p4, v0, v1}, Landroid/webkit/WebView;->setHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5767
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_username:Ljava/lang/String;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_password:Ljava/lang/String;

    invoke-virtual {p2, p1, p3}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 5769
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .line 5747
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "#url : "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 5748
    const-string p1, ".txt"

    invoke-virtual {p2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 5749
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoDownloadStartThread(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Z)V

    return v0

    :cond_0
    return v2
.end method
