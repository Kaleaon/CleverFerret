.class public Lcom/flyersoft/views/ScrollImage;
.super Landroid/widget/ImageView;
.source "ScrollImage.java"


# instance fields
.field isDark:Z

.field public page1Bm:Landroid/graphics/Bitmap;

.field public page2Bm:Landroid/graphics/Bitmap;

.field public shadowBm:Landroid/graphics/Bitmap;

.field public topLine:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 44
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-nez v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/flyersoft/views/ScrollImage;->page2Bm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 49
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    .line 50
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    .line 53
    iget-object v2, p0, Lcom/flyersoft/views/ScrollImage;->page1Bm:Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez v2, :cond_1

    .line 54
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v4, v4, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 55
    iget-object v5, p0, Lcom/flyersoft/views/ScrollImage;->page1Bm:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v5, v2, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 58
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/views/ScrollImage;->page2Bm:Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 59
    new-instance v2, Landroid/graphics/Rect;

    iget v5, p0, Lcom/flyersoft/views/ScrollImage;->topLine:I

    invoke-direct {v2, v4, v5, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 60
    iget-object v1, p0, Lcom/flyersoft/views/ScrollImage;->page2Bm:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v1, v2, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 63
    :cond_2
    iget-boolean v1, p0, Lcom/flyersoft/views/ScrollImage;->isDark:Z

    if-eqz v1, :cond_3

    .line 64
    new-instance v10, Landroid/graphics/Paint;

    invoke-direct {v10}, Landroid/graphics/Paint;-><init>()V

    .line 65
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    const/16 v2, -0x32

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v1

    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    invoke-static {}, Lcom/flyersoft/tools/A;->getDensity()F

    move-result v1

    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 67
    iget v1, p0, Lcom/flyersoft/views/ScrollImage;->topLine:I

    int-to-float v7, v1

    int-to-float v8, v0

    int-to-float v9, v1

    const/4 v6, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    :cond_3
    move-object v5, p1

    .line 70
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/views/ScrollImage;->shadowBm:Landroid/graphics/Bitmap;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollImage;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 72
    iget-boolean v1, p0, Lcom/flyersoft/views/ScrollImage;->isDark:Z

    if-eqz v1, :cond_4

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->shadow_b2:I

    goto :goto_1

    :cond_4
    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->shadow_b:I

    .line 71
    :goto_1
    invoke-static {p1, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/ScrollImage;->shadowBm:Landroid/graphics/Bitmap;

    .line 73
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/views/ScrollImage;->shadowBm:Landroid/graphics/Bitmap;

    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/flyersoft/views/ScrollImage;->shadowBm:Landroid/graphics/Bitmap;

    .line 74
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v6, p0, Lcom/flyersoft/views/ScrollImage;->shadowBm:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-direct {v1, v4, v4, v2, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v2, Landroid/graphics/Rect;

    iget v6, p0, Lcom/flyersoft/views/ScrollImage;->topLine:I

    const/high16 v7, 0x41000000    # 8.0f

    .line 75
    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    add-int/2addr v7, v6

    invoke-direct {v2, v4, v6, v0, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 73
    invoke-virtual {v5, p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void
.end method

.method public setPage1Bm(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 34
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    return-void

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/ScrollImage;->page1Bm:Landroid/graphics/Bitmap;

    if-eq v0, p1, :cond_1

    .line 37
    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 38
    :cond_1
    iput-object p1, p0, Lcom/flyersoft/views/ScrollImage;->page1Bm:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setPage2Bm(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/flyersoft/views/ScrollImage;->page2Bm:Landroid/graphics/Bitmap;

    if-eq v0, p1, :cond_0

    .line 27
    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 28
    :cond_0
    iput-object p1, p0, Lcom/flyersoft/views/ScrollImage;->page2Bm:Landroid/graphics/Bitmap;

    .line 29
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getBitmapAboutColor(Landroid/graphics/Bitmap;)I

    move-result p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getColorValue(I)I

    move-result p1

    const/16 v0, 0x78

    if-ge p1, v0, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 30
    :goto_0
    iput-boolean p1, p0, Lcom/flyersoft/views/ScrollImage;->isDark:Z

    return-void
.end method
