.class public Lcom/radaee/view/PDFLayoutHorz;
.super Lcom/radaee/view/PDFLayout;
.source "PDFLayoutHorz.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public vGetPage(II)I
    .locals 6

    .line 90
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    const/4 v0, -0x1

    if-eqz p2, :cond_9

    iget-object p2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    array-length p2, p2

    if-lez p2, :cond_9

    iget-object p2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    const/4 v1, 0x0

    aget-object p2, p2, v1

    if-nez p2, :cond_0

    goto :goto_3

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutHorz;->vGetX()I

    move-result p2

    add-int/2addr p1, p2

    .line 93
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    array-length p2, p2

    const/4 v2, 0x1

    sub-int/2addr p2, v2

    .line 95
    sget-boolean v3, Lcom/radaee/pdf/Global;->rtol:Z

    if-nez v3, :cond_2

    .line 96
    iget-object v3, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/radaee/view/VPage;->GetX()I

    move-result v3

    if-ge p1, v3, :cond_1

    return v1

    .line 98
    :cond_1
    iget-object v3, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, p2

    invoke-virtual {v3}, Lcom/radaee/view/VPage;->GetX()I

    move-result v3

    if-le p1, v3, :cond_2

    return p2

    :cond_2
    :goto_0
    if-gt v1, p2, :cond_9

    add-int v3, v1, p2

    shr-int/2addr v3, v2

    .line 104
    iget-object v4, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v3

    .line 105
    iget v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    shr-int/2addr v5, v2

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/VPage;->LocHorz(II)I

    move-result v5

    if-eq v5, v0, :cond_6

    if-eq v5, v2, :cond_5

    .line 119
    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result p1

    if-lez p1, :cond_4

    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetHeight()I

    move-result p1

    if-gtz p1, :cond_3

    goto :goto_1

    :cond_3
    return v3

    :cond_4
    :goto_1
    return v0

    .line 113
    :cond_5
    sget-boolean v4, Lcom/radaee/pdf/Global;->rtol:Z

    if-eqz v4, :cond_7

    goto :goto_2

    .line 107
    :cond_6
    sget-boolean v4, Lcom/radaee/pdf/Global;->rtol:Z

    if-eqz v4, :cond_8

    :cond_7
    add-int/lit8 v3, v3, 0x1

    move v1, v3

    goto :goto_0

    :cond_8
    :goto_2
    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_0

    :cond_9
    :goto_3
    return v0
.end method

.method public vLayout()V
    .locals 12

    .line 39
    iget v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_w:I

    if-lez v0, :cond_14

    iget v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    if-lez v0, :cond_14

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    goto/16 :goto_9

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 44
    sget-boolean v1, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    if-nez v1, :cond_1

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    .line 45
    :cond_1
    sget-boolean v1, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales_min:[F

    if-nez v1, :cond_2

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales_min:[F

    .line 47
    :cond_2
    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_maxh:F

    div-float/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_min:F

    .line 48
    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_min:F

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_zoom_level:F

    mul-float v1, v1, v2

    iput v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_max:F

    .line 49
    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_min:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_min:F

    iput v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    .line 50
    :cond_3
    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_max:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_4

    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_max:F

    iput v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    .line 52
    :cond_4
    iget v1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale_min:F

    div-float/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_zoom_level_clip:F

    const/4 v3, 0x0

    const/4 v4, 0x1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_5

    const/4 v1, 0x1

    goto :goto_0

    :cond_5
    const/4 v1, 0x0

    .line 53
    :goto_0
    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_maxh:F

    iget v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    mul-float v2, v2, v5

    float-to-int v2, v2

    iput v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_th:I

    .line 54
    iput v3, p0, Lcom/radaee/view/PDFLayoutHorz;->m_tw:I

    .line 55
    iget v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    shr-int/2addr v2, v4

    .line 56
    sget-boolean v5, Lcom/radaee/pdf/Global;->rtol:Z

    const/4 v6, 0x0

    if-eqz v5, :cond_c

    sub-int/2addr v0, v4

    :goto_1
    if-ltz v0, :cond_13

    .line 58
    sget-boolean v5, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v5, :cond_7

    iget-object v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    aget v5, v5, v0

    cmpl-float v5, v5, v6

    if-eqz v5, :cond_6

    iget-object v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    aget v5, v5, v0

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 59
    :cond_6
    iget-object v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    iget v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    iget v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    sub-int/2addr v7, v8

    int-to-float v7, v7

    iget-object v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    div-float/2addr v7, v8

    aput v7, v5, v0

    .line 60
    iget-object v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales_min:[F

    iget v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    iget v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    sub-int/2addr v7, v8

    int-to-float v7, v7

    iget-object v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    div-float/2addr v7, v8

    aput v7, v5, v0

    .line 62
    :cond_7
    sget-boolean v5, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    aget v5, v5, v0

    goto :goto_2

    :cond_8
    iget v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    .line 63
    :goto_2
    iget-object v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v0}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    mul-float v7, v7, v5

    float-to-int v7, v7

    .line 64
    iget-object v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    mul-float v8, v8, v5

    float-to-int v8, v8

    .line 65
    sget-boolean v9, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v9, :cond_9

    iget v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    shr-int/2addr v8, v4

    goto :goto_3

    :cond_9
    iget v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_maxh:F

    mul-float v9, v9, v5

    float-to-int v9, v9

    iget v10, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    add-int/2addr v9, v10

    sub-int/2addr v9, v8

    shr-int/lit8 v8, v9, 0x1

    .line 66
    :goto_3
    sget-boolean v9, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v9, :cond_b

    iget-object v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales_min:[F

    aget v9, v9, v0

    div-float v9, v5, v9

    iget v10, p0, Lcom/radaee/view/PDFLayoutHorz;->m_zoom_level_clip:F

    cmpl-float v9, v9, v10

    if-lez v9, :cond_a

    const/4 v9, 0x1

    goto :goto_4

    :cond_a
    const/4 v9, 0x0

    goto :goto_4

    :cond_b
    move v9, v1

    .line 67
    :goto_4
    iget-object v10, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v10, v10, v0

    invoke-virtual {v10, v2, v8, v5, v9}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 68
    iget v5, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    add-int/2addr v7, v5

    add-int/2addr v2, v7

    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_1

    :cond_c
    const/4 v5, 0x0

    :goto_5
    if-ge v5, v0, :cond_13

    .line 72
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_e

    iget-object v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    aget v7, v7, v5

    cmpl-float v7, v7, v6

    if-eqz v7, :cond_d

    iget-object v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    aget v7, v7, v5

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 73
    :cond_d
    iget-object v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    iget v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    iget v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iget-object v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    div-float/2addr v8, v9

    aput v8, v7, v5

    .line 74
    iget-object v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales_min:[F

    iget v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    iget v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iget-object v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    div-float/2addr v8, v9

    aput v8, v7, v5

    .line 76
    :cond_e
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_f

    iget-object v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales:[F

    aget v7, v7, v5

    goto :goto_6

    :cond_f
    iget v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scale:F

    .line 77
    :goto_6
    iget-object v8, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    mul-float v8, v8, v7

    float-to-int v8, v8

    .line 78
    iget-object v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    mul-float v9, v9, v7

    float-to-int v9, v9

    .line 79
    sget-boolean v10, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v10, :cond_10

    iget v9, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    shr-int/2addr v9, v4

    goto :goto_7

    :cond_10
    iget v10, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_maxh:F

    mul-float v10, v10, v7

    float-to-int v10, v10

    iget v11, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    add-int/2addr v10, v11

    sub-int/2addr v10, v9

    shr-int/lit8 v9, v10, 0x1

    .line 80
    :goto_7
    sget-boolean v10, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v10, :cond_12

    iget-object v10, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scales_min:[F

    aget v10, v10, v5

    div-float v10, v7, v10

    iget v11, p0, Lcom/radaee/view/PDFLayoutHorz;->m_zoom_level_clip:F

    cmpl-float v10, v10, v11

    if-lez v10, :cond_11

    const/4 v10, 0x1

    goto :goto_8

    :cond_11
    const/4 v10, 0x0

    goto :goto_8

    :cond_12
    move v10, v1

    .line 81
    :goto_8
    iget-object v11, p0, Lcom/radaee/view/PDFLayoutHorz;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v11, v11, v5

    invoke-virtual {v11, v2, v9, v7, v10}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 82
    iget v7, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    add-int/2addr v8, v7

    add-int/2addr v2, v8

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_5

    .line 85
    :cond_13
    iget v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_page_gap:I

    shr-int/2addr v0, v4

    sub-int/2addr v2, v0

    iput v2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_tw:I

    :cond_14
    :goto_9
    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V
    .locals 0

    .line 20
    invoke-super {p0, p1, p2}, Lcom/radaee/view/PDFLayout;->vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V

    .line 21
    sget-boolean p1, Lcom/radaee/pdf/Global;->rtol:Z

    if-eqz p1, :cond_0

    .line 22
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_tw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 23
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public vResize(II)V
    .locals 1

    .line 29
    sget-boolean v0, Lcom/radaee/pdf/Global;->rtol:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_w:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFLayoutHorz;->m_h:I

    if-gtz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 30
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/radaee/view/PDFLayout;->vResize(II)V

    if-eqz v0, :cond_2

    .line 32
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lcom/radaee/view/PDFLayoutHorz;->m_tw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 33
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_2
    return-void
.end method
