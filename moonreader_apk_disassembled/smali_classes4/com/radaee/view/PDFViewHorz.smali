.class public Lcom/radaee/view/PDFViewHorz;
.super Lcom/radaee/view/PDFView;
.source "PDFViewHorz.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private m_rtol:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/radaee/view/PDFViewHorz;->m_rtol:Z

    return-void
.end method


# virtual methods
.method protected vGetPage(II)I
    .locals 6

    .line 88
    iget-object p2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz p2, :cond_8

    iget-object p2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p2, p2

    if-gtz p2, :cond_0

    goto/16 :goto_2

    .line 90
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p2, p2

    add-int/lit8 p2, p2, -0x1

    .line 91
    iget v0, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    shr-int/lit8 v0, v0, 0x1

    .line 92
    iget-object v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    add-int/2addr v1, p1

    .line 93
    iget-boolean p1, p0, Lcom/radaee/view/PDFViewHorz;->m_rtol:Z

    const/4 v2, 0x0

    if-nez p1, :cond_3

    const/4 p1, 0x0

    :goto_0
    if-gt p1, p2, :cond_6

    add-int v3, p1, p2

    shr-int/lit8 v3, v3, 0x1

    .line 98
    iget-object v4, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v3

    .line 99
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    sub-int/2addr v5, v0

    if-ge v1, v5, :cond_1

    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_0

    .line 103
    :cond_1
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result p1

    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v4

    add-int/2addr p1, v4

    add-int/2addr p1, v0

    if-le v1, p1, :cond_2

    add-int/lit8 p1, v3, 0x1

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    const/4 p1, 0x0

    :goto_1
    if-gt p1, p2, :cond_6

    add-int v3, p1, p2

    shr-int/lit8 v3, v3, 0x1

    .line 118
    iget-object v4, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v3

    .line 119
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    sub-int/2addr v5, v0

    if-ge v1, v5, :cond_4

    add-int/lit8 p1, v3, 0x1

    goto :goto_1

    .line 123
    :cond_4
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result p2

    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v4

    add-int/2addr p2, v4

    add-int/2addr p2, v0

    if-le v1, p2, :cond_5

    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_1

    :cond_5
    return v3

    :cond_6
    if-gez p2, :cond_7

    return v2

    .line 134
    :cond_7
    iget-object p1, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_8
    :goto_2
    const/4 p1, -0x1

    return p1
.end method

.method protected vLayout()V
    .locals 7

    .line 44
    iget-object v0, p0, Lcom/radaee/view/PDFViewHorz;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/radaee/view/PDFViewHorz;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    if-le v0, v1, :cond_a

    iget v0, p0, Lcom/radaee/view/PDFViewHorz;->m_h:I

    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_2

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 47
    iget-object v1, p0, Lcom/radaee/view/PDFViewHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    move-result-object v1

    const/4 v2, 0x1

    .line 48
    aget v1, v1, v2

    .line 49
    iget v3, p0, Lcom/radaee/view/PDFViewHorz;->m_h:I

    iget v4, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v3, v1

    iput v3, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_min:F

    .line 50
    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_min:F

    sget v3, Lcom/radaee/pdf/Global;->zoomLevel:F

    mul-float v1, v1, v3

    iput v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_max:F

    .line 51
    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale:F

    iget v3, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_min:F

    cmpg-float v1, v1, v3

    if-gez v1, :cond_1

    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_min:F

    iput v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale:F

    .line 52
    :cond_1
    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale:F

    iget v3, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_max:F

    cmpl-float v1, v1, v3

    if-lez v1, :cond_2

    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale_max:F

    iput v1, p0, Lcom/radaee/view/PDFViewHorz;->m_scale:F

    .line 54
    :cond_2
    iget-object v1, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v1, :cond_3

    new-array v1, v0, [Lcom/radaee/view/PDFVPage;

    iput-object v1, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    .line 55
    :cond_3
    iget v1, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    .line 56
    iget v3, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    div-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    .line 57
    iput v4, p0, Lcom/radaee/view/PDFViewHorz;->m_docw:I

    .line 58
    iput v4, p0, Lcom/radaee/view/PDFViewHorz;->m_doch:I

    .line 59
    iget-boolean v5, p0, Lcom/radaee/view/PDFViewHorz;->m_rtol:Z

    if-eqz v5, :cond_6

    sub-int/2addr v0, v2

    :goto_0
    if-ltz v0, :cond_9

    .line 64
    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v4, Lcom/radaee/view/PDFVPage;

    iget-object v5, p0, Lcom/radaee/view/PDFViewHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v4, v5, v0}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v4, v2, v0

    .line 65
    :cond_4
    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    iget v4, p0, Lcom/radaee/view/PDFViewHorz;->m_scale:F

    invoke-virtual {v2, v1, v3, v4}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 66
    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v2

    iget v4, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    add-int/2addr v2, v4

    add-int/2addr v1, v2

    .line 67
    iget v2, p0, Lcom/radaee/view/PDFViewHorz;->m_doch:I

    iget-object v4, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v0

    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v4

    if-ge v2, v4, :cond_5

    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v2

    iput v2, p0, Lcom/radaee/view/PDFViewHorz;->m_doch:I

    :cond_5
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_6
    :goto_1
    if-ge v4, v0, :cond_9

    .line 76
    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v4

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v5, Lcom/radaee/view/PDFVPage;

    iget-object v6, p0, Lcom/radaee/view/PDFViewHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v5, v6, v4}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v5, v2, v4

    .line 77
    :cond_7
    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v4

    iget v5, p0, Lcom/radaee/view/PDFViewHorz;->m_scale:F

    invoke-virtual {v2, v1, v3, v5}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 78
    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v4

    invoke-virtual {v2}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v2

    iget v5, p0, Lcom/radaee/view/PDFViewHorz;->m_page_gap:I

    add-int/2addr v2, v5

    add-int/2addr v1, v2

    .line 79
    iget v2, p0, Lcom/radaee/view/PDFViewHorz;->m_doch:I

    iget-object v5, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v4

    invoke-virtual {v5}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v5

    if-ge v2, v5, :cond_8

    iget-object v2, p0, Lcom/radaee/view/PDFViewHorz;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v4

    invoke-virtual {v2}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v2

    iput v2, p0, Lcom/radaee/view/PDFViewHorz;->m_doch:I

    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 83
    :cond_9
    iput v1, p0, Lcom/radaee/view/PDFViewHorz;->m_docw:I

    :cond_a
    :goto_2
    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V
    .locals 0

    .line 23
    invoke-super {p0, p1, p2, p3, p4}, Lcom/radaee/view/PDFView;->vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V

    .line 24
    iget-boolean p1, p0, Lcom/radaee/view/PDFViewHorz;->m_rtol:Z

    if-eqz p1, :cond_0

    .line 26
    iget-object p1, p0, Lcom/radaee/view/PDFViewHorz;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lcom/radaee/view/PDFViewHorz;->m_docw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 27
    iget-object p1, p0, Lcom/radaee/view/PDFViewHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public vResize(II)V
    .locals 1

    .line 33
    iget-boolean v0, p0, Lcom/radaee/view/PDFViewHorz;->m_rtol:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFViewHorz;->m_w:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFViewHorz;->m_h:I

    if-gtz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 34
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/radaee/view/PDFView;->vResize(II)V

    if-eqz v0, :cond_2

    .line 37
    iget-object p1, p0, Lcom/radaee/view/PDFViewHorz;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lcom/radaee/view/PDFViewHorz;->m_docw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 38
    iget-object p1, p0, Lcom/radaee/view/PDFViewHorz;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_2
    return-void
.end method

.method public vSetDirection(Z)V
    .locals 0

    .line 18
    iput-boolean p1, p0, Lcom/radaee/view/PDFViewHorz;->m_rtol:Z

    return-void
.end method
