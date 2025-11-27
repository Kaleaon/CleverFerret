.class public Lcom/flyersoft/views/MRBookView;
.super Landroid/webkit/WebView;
.source "MRBookView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/MRBookView$BookViewClient;,
        Lcom/flyersoft/views/MRBookView$BookViewChromeClient;
    }
.end annotation


# static fields
.field public static CSS:Ljava/lang/String; = "<style type=\"text/css\">\nbody{%BACKGROUNDcolor:%COLOR;margin-left:%LEFT;margin-right:%RIGHT;margin-top:%TOP;margin-bottom:%BOTTOM;}\n</style>"

.field public static css:Ljava/lang/String;

.field public static ebook_css:Ljava/lang/String;


# instance fields
.field public clickTime:J

.field public lastUrl:Ljava/lang/String;

.field public lastX:I

.field public lastY:I

.field touchDisabled:Z


# direct methods
.method static bridge synthetic -$$Nest$mhideProgressIndicator(Lcom/flyersoft/views/MRBookView;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->hideProgressIndicator()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowProgressIndicator(Lcom/flyersoft/views/MRBookView;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->showProgressIndicator()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 31
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    const-wide/16 v0, -0x1

    .line 27
    iput-wide v0, p0, Lcom/flyersoft/views/MRBookView;->clickTime:J

    .line 32
    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->initBookView()V

    return-void
.end method

.method private getAct()Lcom/flyersoft/moonreaderp/ActivityTxt;
    .locals 1

    .line 203
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private hideProgressIndicator()V
    .locals 1

    .line 179
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 180
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    :cond_0
    return-void
.end method

.method private initBookView()V
    .locals 1

    .line 36
    new-instance v0, Lcom/flyersoft/views/MRBookView$BookViewClient;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/MRBookView$BookViewClient;-><init>(Lcom/flyersoft/views/MRBookView;)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/MRBookView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 37
    new-instance v0, Lcom/flyersoft/views/MRBookView$BookViewChromeClient;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/MRBookView$BookViewChromeClient;-><init>(Lcom/flyersoft/views/MRBookView;)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/MRBookView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    return-void
.end method

.method private showProgressIndicator()V
    .locals 1

    .line 174
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 175
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showProgressIndicator()V

    :cond_0
    return-void
.end method


# virtual methods
.method public getContentHeight2()I
    .locals 1

    .line 170
    invoke-virtual {p0}, Lcom/flyersoft/views/MRBookView;->computeVerticalScrollRange()I

    move-result v0

    return v0
.end method

.method public getContentWidth2()I
    .locals 1

    .line 166
    invoke-virtual {p0}, Lcom/flyersoft/views/MRBookView;->computeHorizontalScrollRange()I

    move-result v0

    return v0
.end method

.method public loadPage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "content://com.flyersoft.moonreaderp.provider"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/MRBookView;->lastUrl:Ljava/lang/String;

    .line 49
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/MRBookView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 187
    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->getAct()Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 188
    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->getAct()Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pressDownX:F

    .line 189
    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->getAct()Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTouchInEdge(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    iput-boolean v1, p0, Lcom/flyersoft/views/MRBookView;->touchDisabled:Z

    .line 193
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->getAct()Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 194
    invoke-direct {p0}, Lcom/flyersoft/views/MRBookView;->getAct()Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 196
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    .line 197
    iput-boolean v0, p0, Lcom/flyersoft/views/MRBookView;->touchDisabled:Z

    .line 199
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/views/MRBookView;->touchDisabled:Z

    if-nez v0, :cond_3

    invoke-super {p0, p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_3
    return v1
.end method

.method public resetZoom()V
    .locals 0

    return-void
.end method

.method public selectAndCopyText()V
    .locals 9

    .line 208
    :try_start_0
    new-instance v0, Landroid/view/KeyEvent;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x42

    invoke-direct/range {v0 .. v8}, Landroid/view/KeyEvent;-><init>(JJIIII)V

    .line 209
    invoke-virtual {v0, p0}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 211
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
