.class public Lcom/flyersoft/moonreaderp/PrefHtmlViewer;
.super Landroid/app/Dialog;
.source "PrefHtmlViewer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public content:Ljava/lang/String;

.field public root:Landroid/view/View;

.field type:I

.field public web:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    .line 27
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 28
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    .line 29
    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->type:I

    .line 30
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->html_viewer:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->root:Landroid/view/View;

    .line 31
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private initView()V
    .locals 3

    .line 48
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->web:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->web:Landroid/webkit/WebView;

    .line 51
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 52
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->web:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 54
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->type:I

    if-nez v0, :cond_0

    .line 55
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->loadHtml()V

    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->web:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v2, 0x0

    .line 58
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 60
    :goto_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->type:I

    if-ne v0, v1, :cond_1

    .line 61
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->fixWebViewFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    .line 62
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->web:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "file://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 64
    :cond_1
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 65
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->web:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method private loadHtml()V
    .locals 8

    .line 69
    sget v0, Lcom/flyersoft/tools/A;->backgroundColor:I

    .line 70
    sget-boolean v1, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/flyersoft/tools/A;->savedBackgroundDrwable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    .line 71
    sget-object v0, Lcom/flyersoft/tools/A;->savedBackgroundDrwable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getDrawableAboutColor(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    .line 73
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "background-color:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/flyersoft/tools/T;->color2Html(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ";"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 74
    sget-object v1, Lcom/flyersoft/views/MRBookView;->CSS:Ljava/lang/String;

    const-string v2, "%BACKGROUND"

    .line 76
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v1}, Lcom/flyersoft/tools/T;->color2Html(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "%COLOR"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%LEFT"

    const-string v2, "20"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%RIGHT"

    .line 77
    const-string v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%TOP"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%BOTTOM"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 79
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v1, :cond_1

    .line 80
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    .line 81
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 82
    const-string v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<html>"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<body>"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<body></html>"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->content:Ljava/lang/String;

    .line 88
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->web:Landroid/webkit/WebView;

    const-string v6, "UTF-8"

    const/4 v7, 0x0

    const-string v3, ""

    const-string v5, "text/html"

    invoke-virtual/range {v2 .. v7}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 98
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 99
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 100
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 101
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->moveStart2:Z

    sput-boolean v0, Lcom/flyersoft/tools/A;->moveStart:Z

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 92
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    if-ne p1, v0, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->dismiss()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 36
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 38
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 39
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, -0x2

    .line 40
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 41
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->type:I

    if-nez v0, :cond_0

    const v0, 0x3f4ccccd    # 0.8f

    goto :goto_0

    :cond_0
    const v0, 0x3f59999a    # 0.85f

    :goto_0
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    const/16 v0, 0x11

    .line 42
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 44
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->initView()V

    return-void
.end method
