.class public Lcom/radaee/reader/PDFGrayView;
.super Landroid/view/View;
.source "PDFGrayView.java"


# instance fields
.field private m_bmp:Landroid/graphics/Bitmap;

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_page:Lcom/radaee/pdf/Page;

.field private m_pageno:I

.field private m_paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 27
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGrayView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGrayView;->init(Landroid/content/Context;)V

    return-void
.end method

.method private close_page()V
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    :cond_0
    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_page:Lcom/radaee/pdf/Page;

    .line 49
    iget-object v1, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 50
    :cond_1
    iput-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    .line 35
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/radaee/reader/PDFGrayView;->m_paint:Landroid/graphics/Paint;

    .line 36
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 37
    iget-object p1, p0, Lcom/radaee/reader/PDFGrayView;->m_paint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/graphics/Paint;->setARGB(IIII)V

    return-void
.end method

.method private render_page(I)V
    .locals 4

    .line 54
    iget-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->getWidth()I

    move-result v0

    .line 56
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->getHeight()I

    move-result v1

    if-lez v0, :cond_3

    if-gtz v1, :cond_1

    goto :goto_0

    .line 58
    :cond_1
    invoke-direct {p0}, Lcom/radaee/reader/PDFGrayView;->close_page()V

    .line 60
    iput p1, p0, Lcom/radaee/reader/PDFGrayView;->m_pageno:I

    .line 61
    iget-object v2, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v2

    iput-object v2, p0, Lcom/radaee/reader/PDFGrayView;->m_page:Lcom/radaee/pdf/Page;

    .line 62
    iget-object v2, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, p1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v2

    .line 63
    iget-object v3, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    int-to-float v0, v0

    div-float/2addr v0, v2

    int-to-float v1, v1

    div-float/2addr v1, p1

    cmpl-float v3, v0, v1

    if-lez v3, :cond_2

    move v0, v1

    :cond_2
    mul-float v2, v2, v0

    float-to-int v1, v2

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 70
    sget-object v2, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, p1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    .line 71
    new-instance v1, Lcom/radaee/pdf/Matrix;

    neg-float v2, v0

    const/4 v3, 0x0

    int-to-float p1, p1

    invoke-direct {v1, v0, v2, v3, p1}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 72
    iget-object p1, p0, Lcom/radaee/reader/PDFGrayView;->m_page:Lcom/radaee/pdf/Page;

    iget-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, v1}, Lcom/radaee/pdf/Page;->RenderToGrayBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z

    .line 73
    iget-object p1, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-static {p1}, Lcom/radaee/pdf/Global;->dither16Grays(Landroid/graphics/Bitmap;)Z

    .line 74
    iget-object p1, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-static {p1}, Lcom/radaee/pdf/Global;->invertBmp(Landroid/graphics/Bitmap;)Z

    .line 75
    invoke-virtual {v1}, Lcom/radaee/pdf/Matrix;->Destroy()V

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public PDFClose()V
    .locals 1

    .line 96
    invoke-direct {p0}, Lcom/radaee/reader/PDFGrayView;->close_page()V

    const/4 v0, 0x0

    .line 97
    iput v0, p0, Lcom/radaee/reader/PDFGrayView;->m_pageno:I

    return-void
.end method

.method public PDFGotoPage(I)V
    .locals 1

    if-ltz p1, :cond_1

    .line 101
    iget-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGrayView;->render_page(I)V

    .line 103
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->invalidate()V

    :cond_1
    :goto_0
    return-void
.end method

.method public PDFNextPage()V
    .locals 2

    .line 107
    iget v0, p0, Lcom/radaee/reader/PDFGrayView;->m_pageno:I

    iget-object v1, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    if-le v0, v1, :cond_0

    return-void

    .line 108
    :cond_0
    iget v0, p0, Lcom/radaee/reader/PDFGrayView;->m_pageno:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFGrayView;->render_page(I)V

    .line 109
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->invalidate()V

    return-void
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;)V
    .locals 0

    .line 90
    iput-object p1, p0, Lcom/radaee/reader/PDFGrayView;->m_doc:Lcom/radaee/pdf/Document;

    const/4 p1, 0x0

    .line 91
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGrayView;->render_page(I)V

    .line 92
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->invalidate()V

    return-void
.end method

.method public PDFPrevPage()V
    .locals 2

    .line 113
    iget v0, p0, Lcom/radaee/reader/PDFGrayView;->m_pageno:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    sub-int/2addr v0, v1

    .line 114
    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFGrayView;->render_page(I)V

    .line 115
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->invalidate()V

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 119
    invoke-direct {p0}, Lcom/radaee/reader/PDFGrayView;->close_page()V

    .line 120
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 81
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, -0x1

    .line 82
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 83
    iget-object v0, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    .line 85
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    shr-int/lit8 v1, v1, 0x1

    .line 86
    iget-object v2, p0, Lcom/radaee/reader/PDFGrayView;->m_bmp:Landroid/graphics/Bitmap;

    int-to-float v0, v0

    int-to-float v1, v1

    iget-object v3, p0, Lcom/radaee/reader/PDFGrayView;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 41
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 42
    iget p1, p0, Lcom/radaee/reader/PDFGrayView;->m_pageno:I

    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGrayView;->render_page(I)V

    .line 43
    invoke-virtual {p0}, Lcom/radaee/reader/PDFGrayView;->invalidate()V

    return-void
.end method
