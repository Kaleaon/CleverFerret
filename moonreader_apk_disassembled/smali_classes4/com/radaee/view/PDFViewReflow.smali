.class public Lcom/radaee/view/PDFViewReflow;
.super Lcom/radaee/view/PDFView;
.source "PDFViewReflow.java"


# static fields
.field private static BUTTON_SIZE:I = 0x3c


# instance fields
.field m_dark:Z

.field private m_pageno:I

.field private m_paint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 18
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_paint:Landroid/graphics/Paint;

    .line 90
    iput-boolean p1, p0, Lcom/radaee/view/PDFViewReflow;->m_dark:Z

    const/16 p1, 0x60

    const/16 v1, 0x80

    .line 19
    invoke-virtual {v0, p1, v1, v1, v1}, Landroid/graphics/Paint;->setARGB(IIII)V

    return-void
.end method


# virtual methods
.method public vClose()V
    .locals 1

    .line 33
    invoke-super {p0}, Lcom/radaee/view/PDFView;->vClose()V

    const/4 v0, 0x0

    .line 34
    iput v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    return-void
.end method

.method public vDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 94
    iget-boolean v0, p0, Lcom/radaee/view/PDFViewReflow;->m_dark:Z

    if-eqz v0, :cond_0

    .line 95
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_back:I

    const v1, 0xffffff

    xor-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_0

    .line 97
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_back:I

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 98
    :goto_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 100
    iget-boolean v0, p0, Lcom/radaee/view/PDFViewReflow;->m_dark:Z

    sget-boolean v1, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eq v0, v1, :cond_1

    .line 102
    sget-boolean v0, Lcom/radaee/pdf/Global;->dark_mode:Z

    iput-boolean v0, p0, Lcom/radaee/view/PDFViewReflow;->m_dark:Z

    .line 103
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 104
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v0}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 105
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/radaee/view/PDFViewReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_page_gap:I

    div-int/lit8 v2, v2, 0x2

    iget-object v3, p0, Lcom/radaee/view/PDFViewReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 110
    :cond_2
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 111
    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    const/high16 v2, 0x40800000    # 4.0f

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 112
    sget v1, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v2, v2, 0x2

    sget v3, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 113
    sget v1, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v2, v2, 0x2

    sget v3, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 114
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 115
    iget-object v1, p0, Lcom/radaee/view/PDFViewReflow;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 116
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 117
    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 118
    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    sget v2, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v2, v2, 0x2

    sget v3, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 119
    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    sget v2, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v2, v2, 0x2

    sget v3, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 120
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 121
    iget-object v1, p0, Lcom/radaee/view/PDFViewReflow;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method protected vFindGoto()V
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    return-void

    .line 146
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFViewReflow;->vGotoPage(I)V

    return-void
.end method

.method protected vGetPage(II)I
    .locals 0

    .line 78
    iget p1, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    return p1
.end method

.method public vGetPos(II)Lcom/radaee/view/PDFView$PDFPos;
    .locals 1

    .line 83
    iget-object p1, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    if-gtz p1, :cond_0

    goto :goto_0

    .line 84
    :cond_0
    new-instance p1, Lcom/radaee/view/PDFView$PDFPos;

    invoke-direct {p1, p0}, Lcom/radaee/view/PDFView$PDFPos;-><init>(Lcom/radaee/view/PDFView;)V

    .line 85
    iget p2, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    iput p2, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    const/4 p2, 0x0

    .line 86
    iput p2, p1, Lcom/radaee/view/PDFView$PDFPos;->x:F

    .line 87
    iget-object p2, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    invoke-virtual {p2, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p2

    iput p2, p1, Lcom/radaee/view/PDFView$PDFPos;->y:F

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public vGotoPage(I)V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_2

    if-ltz p1, :cond_2

    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 133
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    if-ne v0, p1, :cond_1

    goto :goto_0

    .line 134
    :cond_1
    iput p1, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    .line 135
    invoke-virtual {p0}, Lcom/radaee/view/PDFViewReflow;->vLayout()V

    .line 136
    iget-object p1, p0, Lcom/radaee/view/PDFViewReflow;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_2

    .line 138
    iget-object p1, p0, Lcom/radaee/view/PDFViewReflow;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    .line 139
    iget-object p1, p0, Lcom/radaee/view/PDFViewReflow;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageChanged(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method protected vLayout()V
    .locals 6

    .line 39
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_page_gap:I

    if-le v0, v1, :cond_7

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_2

    .line 40
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scale:F

    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_scale_min:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scale_min:F

    iput v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scale:F

    .line 41
    :cond_1
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scale:F

    iget v1, p0, Lcom/radaee/view/PDFViewReflow;->m_scale_max:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scale_max:F

    iput v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scale:F

    .line 42
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 44
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 45
    new-array v2, v0, [Lcom/radaee/view/PDFVPage;

    iput-object v2, p0, Lcom/radaee/view/PDFViewReflow;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    .line 49
    iget-object v3, p0, Lcom/radaee/view/PDFViewReflow;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v4, Lcom/radaee/view/PDFVPage;

    iget-object v5, p0, Lcom/radaee/view/PDFViewReflow;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v4, v5, v2}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 52
    :cond_3
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 53
    :cond_4
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    aget-object v0, v0, v2

    iget v2, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    iget v3, p0, Lcom/radaee/view/PDFViewReflow;->m_page_gap:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/radaee/view/PDFViewReflow;->m_scale:F

    const/4 v4, 0x1

    invoke-virtual {v0, v2, v3, v4}, Lcom/radaee/view/PDFVPage;->Reflow(IFZ)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    .line 54
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_5

    .line 56
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFViewReflow;->m_docw:I

    .line 57
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFViewReflow;->m_doch:I

    .line 58
    iget-boolean v0, p0, Lcom/radaee/view/PDFViewReflow;->m_dark:Z

    if-eqz v0, :cond_6

    .line 60
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v2, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 61
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v0}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 62
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v2, p0, Lcom/radaee/view/PDFViewReflow;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 67
    :cond_5
    iput v1, p0, Lcom/radaee/view/PDFViewReflow;->m_docw:I

    .line 68
    iput v1, p0, Lcom/radaee/view/PDFViewReflow;->m_doch:I

    .line 70
    :cond_6
    :goto_1
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v4}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 71
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 72
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 73
    iget-object v0, p0, Lcom/radaee/view/PDFViewReflow;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_7
    :goto_2
    return-void
.end method

.method protected vOnFling(FFFF)Z
    .locals 0

    const/4 p3, 0x0

    cmpg-float p4, p1, p3

    if-gez p4, :cond_0

    neg-float p1, p1

    :cond_0
    cmpg-float p3, p2, p3

    if-gez p3, :cond_1

    neg-float p2, p2

    :cond_1
    cmpg-float p1, p1, p2

    if-gez p1, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    const/4 p1, 0x1

    if-gez p4, :cond_3

    .line 172
    iget p2, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    add-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lcom/radaee/view/PDFViewReflow;->vGotoPage(I)V

    goto :goto_0

    .line 174
    :cond_3
    iget p2, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    sub-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lcom/radaee/view/PDFViewReflow;->vGotoPage(I)V

    :goto_0
    return p1
.end method

.method public vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V
    .locals 0

    .line 24
    invoke-super {p0, p1, p2, p3, p4}, Lcom/radaee/view/PDFView;->vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V

    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 26
    iput p1, p0, Lcom/radaee/view/PDFViewReflow;->m_scale:F

    .line 27
    iput p1, p0, Lcom/radaee/view/PDFViewReflow;->m_scale_min:F

    const/high16 p1, 0x40800000    # 4.0f

    .line 28
    iput p1, p0, Lcom/radaee/view/PDFViewReflow;->m_scale_max:F

    return-void
.end method

.method public vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    .line 127
    :cond_0
    iget p1, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFViewReflow;->vGotoPage(I)V

    return-void
.end method

.method protected vSingleTap(FF)V
    .locals 3

    const/high16 v0, 0x40800000    # 4.0f

    const/4 v1, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 151
    sget v0, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v0, v0, 0x2

    sget v2, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 v0, v0, 0x2

    sget v2, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/2addr v0, v2

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    .line 153
    iput v1, p0, Lcom/radaee/view/PDFViewReflow;->m_status:I

    .line 154
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFViewReflow;->vGotoPage(I)V

    .line 156
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    add-int/lit8 v0, v0, -0x4

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFViewReflow;->m_w:I

    sget v2, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr v0, v2

    add-int/lit8 v0, v0, -0x4

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    iget p1, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 p1, p1, 0x2

    sget v0, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_1

    iget p1, p0, Lcom/radaee/view/PDFViewReflow;->m_h:I

    div-int/lit8 p1, p1, 0x2

    sget v0, Lcom/radaee/view/PDFViewReflow;->BUTTON_SIZE:I

    add-int/2addr p1, v0

    int-to-float p1, p1

    cmpg-float p1, p2, p1

    if-gez p1, :cond_1

    .line 158
    iput v1, p0, Lcom/radaee/view/PDFViewReflow;->m_status:I

    .line 159
    iget p1, p0, Lcom/radaee/view/PDFViewReflow;->m_pageno:I

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFViewReflow;->vGotoPage(I)V

    :cond_1
    return-void
.end method
