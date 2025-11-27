.class Lcom/flyersoft/views/MRBookView$BookViewClient;
.super Landroid/webkit/WebViewClient;
.source "MRBookView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/MRBookView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BookViewClient"
.end annotation


# instance fields
.field pHanlder:Landroid/os/Handler;

.field public pageFinishedTime:J

.field final synthetic this$0:Lcom/flyersoft/views/MRBookView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/MRBookView;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    const-wide/16 v0, -0x1

    .line 112
    iput-wide v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pageFinishedTime:J

    .line 113
    new-instance p1, Lcom/flyersoft/views/MRBookView$BookViewClient$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/views/MRBookView$BookViewClient$1;-><init>(Lcom/flyersoft/views/MRBookView$BookViewClient;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4

    .line 96
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pageFinishedTime:J

    .line 97
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-static {v0}, Lcom/flyersoft/views/MRBookView;->-$$Nest$mhideProgressIndicator(Lcom/flyersoft/views/MRBookView;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 99
    sget-boolean v0, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iget v0, v0, Lcom/flyersoft/views/MRBookView;->lastY:I

    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 103
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iput v1, v0, Lcom/flyersoft/views/MRBookView;->lastY:I

    .line 108
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-static {v0}, Lcom/flyersoft/views/MRBookView;->-$$Nest$mshowProgressIndicator(Lcom/flyersoft/views/MRBookView;)V

    .line 90
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onScaleChanged(Landroid/webkit/WebView;FF)V
    .locals 5

    .line 74
    iget-wide v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->pageFinishedTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_2

    .line 75
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    .line 76
    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getDefaultFontSize()I

    move-result v0

    const/4 v1, 0x1

    cmpg-float v2, p3, p2

    if-gez v2, :cond_0

    if-le v0, v1, :cond_0

    sub-int/2addr v0, v1

    .line 78
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setDefaultFontSize(I)V

    goto :goto_0

    :cond_0
    cmpl-float p2, p3, p2

    if-lez p2, :cond_1

    const/16 p2, 0x47

    if-ge v0, p2, :cond_1

    add-int/2addr v0, v1

    .line 80
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setDefaultFontSize(I)V

    .line 82
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getDefaultFontSize()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->lastWebFontSize:I

    .line 83
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "======new WebFontSize:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget p2, Lcom/flyersoft/tools/A;->lastWebFontSize:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    const/4 p3, 0x0

    aput-object p1, p2, p3

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6

    .line 147
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iget-wide v2, v2, Lcom/flyersoft/views/MRBookView;->clickTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x5dc

    const/4 v4, 0x1

    cmp-long v5, v0, v2

    if-gez v5, :cond_0

    return v4

    .line 150
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iput-object p2, v0, Lcom/flyersoft/views/MRBookView;->lastUrl:Ljava/lang/String;

    .line 151
    const-string v0, "MS-ITS:"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 152
    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 153
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".chm/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 154
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v2, v2, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 155
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 156
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iput-object p2, p1, Lcom/flyersoft/views/MRBookView;->lastUrl:Ljava/lang/String;

    return v4

    .line 159
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-static {p1}, Lcom/flyersoft/views/MRBookView;->-$$Nest$mshowProgressIndicator(Lcom/flyersoft/views/MRBookView;)V

    return v1
.end method
