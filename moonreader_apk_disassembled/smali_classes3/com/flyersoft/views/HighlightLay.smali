.class public Lcom/flyersoft/views/HighlightLay;
.super Lcom/flyersoft/views/DotLinearLayout;
.source "HighlightLay.java"


# instance fields
.field public bm:Landroid/graphics/Bitmap;

.field public magnifierShowing:Z

.field mgCavas:Landroid/graphics/Canvas;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/flyersoft/views/DotLinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/DotLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 113
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 116
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getWidth()I

    move-result v0

    .line 117
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getHeight()I

    move-result v1

    .line 118
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingLeft()I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    sub-int/2addr v2, v4

    .line 119
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingRight()I

    move-result v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    sub-int/2addr v4, v5

    .line 120
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingTop()I

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    sub-int/2addr v5, v6

    .line 121
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingBottom()I

    move-result v6

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    sub-int/2addr v6, v7

    .line 122
    sget-boolean v7, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v7, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v7

    if-nez v7, :cond_1

    .line 123
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 124
    invoke-static {}, Lcom/flyersoft/tools/C;->getTxtBottomBarColor()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    new-instance v8, Landroid/graphics/Rect;

    sub-int v9, v0, v4

    sub-int v10, v1, v6

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    add-int/2addr v10, v11

    add-int/lit8 v10, v10, 0x1

    invoke-direct {v8, v2, v5, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v8, v7}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 127
    :cond_1
    invoke-super {p0, p1}, Lcom/flyersoft/views/DotLinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 128
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 129
    new-instance v13, Landroid/graphics/Paint;

    invoke-direct {v13}, Landroid/graphics/Paint;-><init>()V

    .line 130
    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v13, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    invoke-virtual {v13, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v3, -0x66111112

    .line 132
    invoke-virtual {v13, v3}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v9, v2

    int-to-float v10, v5

    sub-int/2addr v0, v4

    int-to-float v11, v0

    move v12, v10

    move-object v8, p1

    .line 133
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move p1, v11

    sub-int/2addr v1, v6

    int-to-float v12, v1

    move v11, v9

    .line 134
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v0, v9

    move v11, p1

    move v9, p1

    .line 135
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v11, v9

    move p1, v12

    move v9, v0

    move v10, v12

    .line 136
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_2
    :goto_0
    return-void

    :cond_3
    move-object v8, p1

    .line 139
    invoke-super {p0, v8}, Lcom/flyersoft/views/DotLinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 140
    iget-object p1, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingTop()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v8, p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 146
    invoke-super {p0, p1}, Lcom/flyersoft/views/DotLinearLayout;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public drawMagnifier(Landroid/view/MotionEvent;Landroid/graphics/Bitmap;)V
    .locals 10

    .line 34
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-nez v0, :cond_0

    goto :goto_3

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getWidth()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_3

    :cond_1
    const/4 v1, 0x1

    .line 40
    iput-boolean v1, p0, Lcom/flyersoft/views/HighlightLay;->magnifierShowing:Z

    .line 41
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getTouchX(Landroid/view/MotionEvent;)F

    move-result v1

    float-to-int v1, v1

    .line 42
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 43
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_5

    .line 44
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfGl()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 45
    iget-object p2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object p2, p2, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    new-instance v0, Lcom/flyersoft/views/HighlightLay$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/views/HighlightLay$1;-><init>(Lcom/flyersoft/views/HighlightLay;Landroid/view/MotionEvent;)V

    invoke-virtual {p2, v0}, Lcom/radaee/reader/GLView;->getBitmap(Lcom/radaee/reader/GLView$OnPixelCopy;)V

    return-void

    .line 58
    :cond_2
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_3

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1c

    if-lt p1, p2, :cond_3

    goto :goto_1

    .line 59
    :cond_3
    sget-object p1, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    iget-object p1, p1, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 60
    sget-object p1, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    iget-object p1, p1, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    :goto_0
    move-object p2, p1

    goto :goto_2

    :cond_4
    :goto_1
    invoke-virtual {v0, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(Z)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    .line 61
    :goto_2
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result p1

    if-eqz p1, :cond_5

    :goto_3
    return-void

    .line 66
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingLeft()I

    move-result v3

    sub-int/2addr p1, v3

    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingRight()I

    move-result v3

    sub-int/2addr p1, v3

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingTop()I

    move-result v5

    sub-int/2addr v3, v5

    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v3, v5

    .line 68
    sget-boolean v5, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    if-eqz v5, :cond_6

    div-int/lit8 v5, p1, 0x2

    goto :goto_4

    :cond_6
    mul-int/lit8 v5, p1, 0x2

    div-int/lit8 v5, v5, 0x3

    .line 69
    :goto_4
    sget-boolean v6, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    if-eqz v6, :cond_7

    div-int/lit8 v6, v3, 0x2

    goto :goto_5

    :cond_7
    mul-int/lit8 v6, v3, 0x2

    div-int/lit8 v6, v6, 0x3

    .line 70
    :goto_5
    new-instance v7, Landroid/graphics/Rect;

    div-int/lit8 v5, v5, 0x2

    sub-int v8, v1, v5

    div-int/lit8 v6, v6, 0x2

    sub-int v9, v2, v6

    add-int/2addr v1, v5

    add-int/2addr v2, v6

    invoke-direct {v7, v8, v9, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 71
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v4, v4, p1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 73
    iget-object v2, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 74
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    .line 75
    new-instance p1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    invoke-direct {p1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    .line 76
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfGl()Z

    move-result p1

    if-eqz p1, :cond_8

    sget-boolean p1, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz p1, :cond_8

    .line 77
    iget-object p1, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    const/high16 v2, -0x1000000

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 80
    :cond_8
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-nez p1, :cond_9

    .line 81
    iget-object p1, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/graphics/Canvas;)V

    .line 82
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v7, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 84
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfGl()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 85
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 86
    iget-object p2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object p2, p2, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p2, v0}, Lcom/radaee/reader/GLView;->drawLayer(Landroid/graphics/Canvas;)V

    .line 87
    iget-object p2, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    invoke-virtual {p2, p1, v7, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_a
    const/high16 p1, 0x3f800000    # 1.0f

    .line 90
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    .line 91
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 92
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    int-to-float v0, p1

    .line 93
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 94
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v0

    if-eqz v0, :cond_b

    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    goto :goto_6

    :cond_b
    const v0, 0x33333333

    :goto_6
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    const v0, 0x11333333

    .line 96
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 97
    new-instance v0, Landroid/graphics/Rect;

    iget v2, v1, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, p1

    iget v3, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v3, p1

    iget v4, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, p1

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, p1

    invoke-direct {v0, v2, v3, v4, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 98
    iget-object p1, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 100
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->postInvalidate()V

    return-void
.end method

.method public stopMagnifier()V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    const/4 v0, 0x0

    .line 105
    iput-object v0, p0, Lcom/flyersoft/views/HighlightLay;->bm:Landroid/graphics/Bitmap;

    .line 106
    iput-object v0, p0, Lcom/flyersoft/views/HighlightLay;->mgCavas:Landroid/graphics/Canvas;

    const/4 v0, 0x0

    .line 107
    iput-boolean v0, p0, Lcom/flyersoft/views/HighlightLay;->magnifierShowing:Z

    .line 108
    invoke-virtual {p0}, Lcom/flyersoft/views/HighlightLay;->postInvalidate()V

    return-void
.end method
