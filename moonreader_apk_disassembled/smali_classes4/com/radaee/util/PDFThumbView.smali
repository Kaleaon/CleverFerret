.class public Lcom/radaee/util/PDFThumbView;
.super Landroid/view/View;
.source "PDFThumbView.java"

# interfaces
.implements Lcom/radaee/view/PDFView$PDFViewListener;


# instance fields
.field private m_paint:Landroid/graphics/Paint;

.field protected m_thumb:Lcom/radaee/view/PDFViewThumb;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 151
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/radaee/util/PDFThumbView;->m_paint:Landroid/graphics/Paint;

    .line 29
    new-instance p2, Lcom/radaee/view/PDFViewThumb;

    invoke-direct {p2, p1}, Lcom/radaee/view/PDFViewThumb;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    return-void
.end method


# virtual methods
.method public OnPDFDoubleTapped(FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public OnPDFFound(Z)V
    .locals 0

    return-void
.end method

.method public OnPDFInvalidate(Z)V
    .locals 0

    .line 60
    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->postInvalidate()V

    return-void
.end method

.method public OnPDFLongPressed(FF)V
    .locals 0

    return-void
.end method

.method public OnPDFPageChanged(I)V
    .locals 0

    return-void
.end method

.method public OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;)V
    .locals 6

    .line 169
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_paint:Landroid/graphics/Paint;

    const v1, -0x11888889

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 170
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v0}, Lcom/radaee/view/PDFViewThumb;->vGetY()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Lcom/radaee/view/PDFVPage;->GetVY(F)I

    move-result v0

    .line 171
    invoke-virtual {p2}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v1

    add-int/2addr v1, v0

    .line 172
    iget-object v2, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v2}, Lcom/radaee/view/PDFViewThumb;->vGetX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p2, v2}, Lcom/radaee/view/PDFVPage;->GetVX(F)I

    move-result v2

    .line 173
    invoke-virtual {p2}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v3

    add-int/2addr v3, v2

    .line 174
    iget-object v4, p0, Lcom/radaee/util/PDFThumbView;->m_paint:Landroid/graphics/Paint;

    iget-object v5, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v5}, Lcom/radaee/view/PDFViewThumb;->vGetWinH()I

    move-result v5

    div-int/lit8 v5, v5, 0x8

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 175
    iget-object v4, p0, Lcom/radaee/util/PDFThumbView;->m_paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 176
    invoke-virtual {p2}, Lcom/radaee/view/PDFVPage;->GetPageNo()I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    add-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    add-int/2addr v0, v1

    int-to-float v0, v0

    .line 177
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x40c00000    # 6.0f

    mul-float v1, v1, v3

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/radaee/util/PDFThumbView;->m_paint:Landroid/graphics/Paint;

    .line 176
    invoke-virtual {p1, p2, v2, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public OnPDFPageRendered(I)V
    .locals 0

    return-void
.end method

.method public OnPDFSelectEnd()V
    .locals 0

    return-void
.end method

.method public OnPDFSelecting(Landroid/graphics/Canvas;[I[I)V
    .locals 0

    return-void
.end method

.method public OnPDFShowPressed(FF)V
    .locals 0

    return-void
.end method

.method public OnPDFSingleTapped(FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public OnPDFZoomEnd()V
    .locals 0

    return-void
.end method

.method public OnPDFZoomStart()V
    .locals 0

    return-void
.end method

.method public computeScroll()V
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {v0}, Lcom/radaee/view/PDFViewThumb;->vComputeScroll()V

    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {v0}, Lcom/radaee/view/PDFViewThumb;->vClose()V

    const/4 v0, 0x0

    .line 192
    iput-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    .line 194
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    const v0, -0x555556

    .line 74
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 75
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    .line 76
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    if-eqz v0, :cond_1

    .line 79
    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFViewThumb;->vDraw(Landroid/graphics/Canvas;)V

    .line 81
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v1, :cond_2

    .line 83
    :try_start_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 85
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 91
    iget-object p3, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    if-eqz p3, :cond_0

    .line 92
    invoke-virtual {p3, p1, p2}, Lcom/radaee/view/PDFViewThumb;->vResize(II)V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFViewThumb;->vTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public thumbClose()V
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {v0}, Lcom/radaee/view/PDFViewThumb;->vClose()V

    :cond_0
    return-void
.end method

.method public thumbGotoPage(I)V
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFViewThumb;->vSetSel(I)V

    return-void
.end method

.method public thumbOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFViewThumb$PDFThumbListener;IIII)V
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v0, p4}, Lcom/radaee/view/PDFViewThumb;->vSetOrientation(I)V

    .line 115
    iget-object p4, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {p4, p3}, Lcom/radaee/view/PDFViewThumb;->setThumbHeight(I)V

    .line 116
    iget-object p3, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {p3, p1, p6, p5, p0}, Lcom/radaee/view/PDFViewThumb;->vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V

    .line 117
    iget-object p1, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {p1, p2}, Lcom/radaee/view/PDFViewThumb;->vSetThumbListener(Lcom/radaee/view/PDFViewThumb$PDFThumbListener;)V

    .line 118
    iget-object p1, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->getHeight()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/radaee/view/PDFViewThumb;->vResize(II)V

    return-void
.end method

.method public thumbOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFViewThumb$PDFThumbListener;Z)V
    .locals 3

    .line 101
    sget v0, Lcom/radaee/pdf/Global;->thumbViewHeight:I

    if-lez v0, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 103
    sget v1, Lcom/radaee/pdf/Global;->thumbViewHeight:I

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 104
    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFThumbView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    if-eqz p3, :cond_1

    .line 107
    iget-object p3, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    const/4 v0, 0x2

    invoke-virtual {p3, v0}, Lcom/radaee/view/PDFViewThumb;->vSetOrientation(I)V

    .line 108
    :cond_1
    iget-object p3, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    const/16 v0, 0x8

    sget v1, Lcom/radaee/pdf/Global;->thumbViewBgColor:I

    invoke-virtual {p3, p1, v0, v1, p0}, Lcom/radaee/view/PDFViewThumb;->vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V

    .line 109
    iget-object p1, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {p1, p2}, Lcom/radaee/view/PDFViewThumb;->vSetThumbListener(Lcom/radaee/view/PDFViewThumb$PDFThumbListener;)V

    .line 110
    iget-object p1, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Lcom/radaee/util/PDFThumbView;->getHeight()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/radaee/view/PDFViewThumb;->vResize(II)V

    return-void
.end method

.method public thumbSetBmpFormat(Landroid/graphics/Bitmap$Config;)V
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFViewThumb;->vSetBmpFormat(Landroid/graphics/Bitmap$Config;)V

    return-void
.end method

.method public thumbUpdatePage(I)V
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/radaee/util/PDFThumbView;->m_thumb:Lcom/radaee/view/PDFViewThumb;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFViewThumb;->vGetPage(I)Lcom/radaee/view/PDFVPage;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFViewThumb;->vRenderAsync(Lcom/radaee/view/PDFVPage;)V

    return-void
.end method
