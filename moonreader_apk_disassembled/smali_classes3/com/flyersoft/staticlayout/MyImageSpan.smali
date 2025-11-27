.class public Lcom/flyersoft/staticlayout/MyImageSpan;
.super Lcom/flyersoft/staticlayout/DynamicDrawableSpan;
.source "MyImageSpan.java"


# instance fields
.field public mDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;ZZ)V
    .locals 1

    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, p3, v0}, Lcom/flyersoft/staticlayout/MyImageSpan;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;I)V

    .line 33
    iput-object p4, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 34
    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    .line 35
    iput-boolean p5, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->inline:Z

    .line 36
    iput-boolean p6, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->isCenter:Z

    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;I)V
    .locals 0

    .line 44
    invoke-direct {p0, p3}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;-><init>(I)V

    .line 45
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 46
    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mSource:Ljava/lang/String;

    return-void
.end method

.method private setWhiteTransparent(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 71
    sget-boolean v0, Lcom/flyersoft/tools/A;->imageWhiteTransparent:Z

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 72
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_2

    .line 73
    sget-boolean v0, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBackgroundDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getDrawableAboutColor(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isDarkColor(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-nez v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->backgroundColor:I

    .line 74
    invoke-static {v0}, Lcom/flyersoft/tools/A;->isDarkColor(I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 75
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/flyersoft/tools/T;->setWhiteTransparent(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_2

    if-eq v0, v1, :cond_2

    .line 78
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/flyersoft/tools/T;->bitmapToDrawble(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :cond_2
    return-object p1
.end method


# virtual methods
.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 5

    .line 53
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mSource:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 56
    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->clearTextViewImageSpan(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mSource:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->originalSize:Z

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;->getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 59
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/MyImageSpan;->setWhiteTransparent(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 64
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    if-nez v1, :cond_3

    if-eqz v0, :cond_3

    .line 65
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    :cond_3
    return-object v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyImageSpan;->mSource:Ljava/lang/String;

    return-object v0
.end method
