.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "PrefDownloadCover.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefDownloadCover;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 178
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "#onPageFinished : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 189
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 190
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->progressBar2:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "#onPageStarted : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 194
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 195
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->progressBar2:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .line 180
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

    .line 181
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$misTtfUrl(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 182
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$mdownloadFontFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)V

    return v0

    :cond_0
    return v2
.end method
