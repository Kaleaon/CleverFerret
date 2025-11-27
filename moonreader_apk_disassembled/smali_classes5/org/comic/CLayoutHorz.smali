.class public Lorg/comic/CLayoutHorz;
.super Lorg/comic/CLayout;
.source "CLayoutHorz.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lorg/comic/CLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lorg/comic/CLayoutHorz;->vert:Z

    return-void
.end method


# virtual methods
.method public vGetPage(II)I
    .locals 6

    .line 66
    iget-object p2, p0, Lorg/comic/CLayoutHorz;->m_pages:[Lorg/comic/VCPage;

    const/4 v0, -0x1

    if-nez p2, :cond_0

    return v0

    .line 67
    :cond_0
    invoke-virtual {p0}, Lorg/comic/CLayoutHorz;->vGetX()I

    move-result p2

    add-int/2addr p1, p2

    .line 69
    iget-object p2, p0, Lorg/comic/CLayoutHorz;->m_pages:[Lorg/comic/VCPage;

    array-length p2, p2

    const/4 v1, 0x1

    sub-int/2addr p2, v1

    const/4 v2, 0x0

    :goto_0
    if-gt v2, p2, :cond_7

    add-int v3, v2, p2

    shr-int/2addr v3, v1

    .line 74
    iget-object v4, p0, Lorg/comic/CLayoutHorz;->m_pages:[Lorg/comic/VCPage;

    aget-object v4, v4, v3

    .line 75
    invoke-virtual {v4, p1}, Lorg/comic/VCPage;->LocHorz(I)I

    move-result v5

    if-eq v5, v0, :cond_4

    if-eq v5, v1, :cond_3

    .line 89
    invoke-virtual {v4}, Lorg/comic/VCPage;->GetWidth()I

    move-result p1

    if-lez p1, :cond_2

    invoke-virtual {v4}, Lorg/comic/VCPage;->GetHeight()I

    move-result p1

    if-gtz p1, :cond_1

    goto :goto_1

    :cond_1
    return v3

    :cond_2
    :goto_1
    return v0

    .line 83
    :cond_3
    sget-boolean v4, Lcom/radaee/pdf/Global;->cbzRtol:Z

    if-eqz v4, :cond_5

    goto :goto_2

    .line 77
    :cond_4
    sget-boolean v4, Lcom/radaee/pdf/Global;->cbzRtol:Z

    if-eqz v4, :cond_6

    :cond_5
    add-int/lit8 v3, v3, 0x1

    move v2, v3

    goto :goto_0

    :cond_6
    :goto_2
    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_0

    :cond_7
    return v0
.end method

.method public vLayout()V
    .locals 6

    .line 35
    iget v0, p0, Lorg/comic/CLayoutHorz;->m_w:I

    if-lez v0, :cond_5

    iget v0, p0, Lorg/comic/CLayoutHorz;->m_h:I

    if-lez v0, :cond_5

    iget-object v0, p0, Lorg/comic/CLayoutHorz;->m_doc:Lorg/comic/CDocument;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/comic/CLayoutHorz;->m_pages:[Lorg/comic/VCPage;

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 36
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutHorz;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v0}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v0

    .line 38
    iget v1, p0, Lorg/comic/CLayoutHorz;->m_h:I

    iget v2, p0, Lorg/comic/CLayoutHorz;->m_page_gap:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lorg/comic/CLayoutHorz;->m_page_maxh:F

    div-float/2addr v1, v2

    iput v1, p0, Lorg/comic/CLayoutHorz;->m_scale_min:F

    .line 39
    iget v1, p0, Lorg/comic/CLayoutHorz;->m_scale_min:F

    iget v2, p0, Lorg/comic/CLayoutHorz;->m_zoom_level:F

    mul-float v1, v1, v2

    iput v1, p0, Lorg/comic/CLayoutHorz;->m_scale_max:F

    .line 40
    iget v1, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    iget v2, p0, Lorg/comic/CLayoutHorz;->m_scale_min:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    iget v1, p0, Lorg/comic/CLayoutHorz;->m_scale_min:F

    iput v1, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    .line 41
    :cond_1
    iget v1, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    iget v2, p0, Lorg/comic/CLayoutHorz;->m_scale_max:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    iget v1, p0, Lorg/comic/CLayoutHorz;->m_scale_max:F

    iput v1, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    .line 42
    :cond_2
    iget v1, p0, Lorg/comic/CLayoutHorz;->m_page_maxh:F

    iget v2, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lorg/comic/CLayoutHorz;->m_th:I

    const/4 v1, 0x0

    .line 43
    iput v1, p0, Lorg/comic/CLayoutHorz;->m_tw:I

    .line 44
    iget v2, p0, Lorg/comic/CLayoutHorz;->m_page_gap:I

    shr-int/lit8 v2, v2, 0x1

    .line 47
    sget-boolean v3, Lcom/radaee/pdf/Global;->cbzRtol:Z

    if-eqz v3, :cond_3

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_4

    .line 49
    iget-object v3, p0, Lorg/comic/CLayoutHorz;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v3, v0}, Lorg/comic/CDocument;->GetPageWidth(I)I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    mul-float v3, v3, v4

    float-to-int v3, v3

    .line 50
    iget v4, p0, Lorg/comic/CLayoutHorz;->m_page_gap:I

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v0, :cond_4

    .line 54
    iget-object v4, p0, Lorg/comic/CLayoutHorz;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v4, v3}, Lorg/comic/CDocument;->GetPageWidth(I)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lorg/comic/CLayoutHorz;->m_scale:F

    mul-float v4, v4, v5

    float-to-int v4, v4

    .line 55
    iget v5, p0, Lorg/comic/CLayoutHorz;->m_page_gap:I

    add-int/2addr v4, v5

    add-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 59
    :cond_4
    iget v0, p0, Lorg/comic/CLayoutHorz;->m_page_gap:I

    shr-int/lit8 v0, v0, 0x1

    sub-int/2addr v2, v0

    iput v2, p0, Lorg/comic/CLayoutHorz;->m_tw:I

    .line 60
    iget-object v0, p0, Lorg/comic/CLayoutHorz;->m_pages:[Lorg/comic/VCPage;

    array-length v2, v0

    :goto_2
    if-ge v1, v2, :cond_5

    aget-object v3, v0, v1

    const/4 v4, -0x1

    .line 61
    iput v4, v3, Lorg/comic/VCPage;->booky:I

    iput v4, v3, Lorg/comic/VCPage;->bookx:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    return-void
.end method

.method public vMoveEnd()V
    .locals 0

    return-void
.end method

.method public vOpen(Lorg/comic/CDocument;Lorg/comic/CLayout$LayoutListener;)V
    .locals 0

    .line 16
    invoke-super {p0, p1, p2}, Lorg/comic/CLayout;->vOpen(Lorg/comic/CDocument;Lorg/comic/CLayout$LayoutListener;)V

    .line 17
    sget-boolean p1, Lcom/radaee/pdf/Global;->cbzRtol:Z

    if-eqz p1, :cond_0

    .line 18
    iget-object p1, p0, Lorg/comic/CLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lorg/comic/CLayoutHorz;->m_tw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 19
    iget-object p1, p0, Lorg/comic/CLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public vResize(II)V
    .locals 1

    .line 25
    sget-boolean v0, Lcom/radaee/pdf/Global;->cbzRtol:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/comic/CLayoutHorz;->m_w:I

    if-lez v0, :cond_0

    iget v0, p0, Lorg/comic/CLayoutHorz;->m_h:I

    if-gtz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-super {p0, p1, p2}, Lorg/comic/CLayout;->vResize(II)V

    if-eqz v0, :cond_2

    .line 28
    iget-object p1, p0, Lorg/comic/CLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lorg/comic/CLayoutHorz;->m_tw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 29
    iget-object p1, p0, Lorg/comic/CLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_2
    return-void
.end method
