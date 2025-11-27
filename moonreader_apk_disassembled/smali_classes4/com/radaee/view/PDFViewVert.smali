.class public Lcom/radaee/view/PDFViewVert;
.super Lcom/radaee/view/PDFView;
.source "PDFViewVert.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private m_align:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/radaee/view/PDFViewVert;->m_align:I

    return-void
.end method


# virtual methods
.method protected vGetPage(II)I
    .locals 6

    .line 84
    iget-object p1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    if-gtz p1, :cond_0

    goto :goto_1

    .line 86
    :cond_0
    iget-object p1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    .line 87
    iget-object v0, p0, Lcom/radaee/view/PDFViewVert;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    add-int/2addr v0, p2

    .line 88
    iget p2, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    shr-int/lit8 p2, p2, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-gt v2, p1, :cond_3

    add-int v3, v2, p1

    shr-int/lit8 v3, v3, 0x1

    .line 92
    iget-object v4, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v3

    .line 93
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v5

    sub-int/2addr v5, p2

    if-ge v0, v5, :cond_1

    add-int/lit8 v3, v3, -0x1

    move p1, v3

    goto :goto_0

    .line 97
    :cond_1
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v2

    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v4

    add-int/2addr v2, v4

    add-int/2addr v2, p2

    if-le v0, v2, :cond_2

    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    if-gez p1, :cond_4

    return v1

    .line 107
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_5
    :goto_1
    const/4 p1, -0x1

    return p1
.end method

.method protected vLayout()V
    .locals 7

    .line 27
    iget-object v0, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/radaee/view/PDFViewVert;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    if-le v0, v1, :cond_c

    iget v0, p0, Lcom/radaee/view/PDFViewVert;->m_h:I

    iget v1, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_3

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 30
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    move-result-object v1

    const/4 v2, 0x0

    .line 31
    aget v1, v1, v2

    .line 32
    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_w:I

    iget v4, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v3, v1

    iput v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale_min:F

    .line 33
    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale_min:F

    sget v4, Lcom/radaee/pdf/Global;->zoomLevel:F

    mul-float v3, v3, v4

    iput v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale_max:F

    .line 34
    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFViewVert;->m_scale_min:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale_min:F

    iput v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    .line 35
    :cond_1
    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFViewVert;->m_scale_max:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale_max:F

    iput v3, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    .line 37
    :cond_2
    iget-object v3, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v3, :cond_3

    new-array v3, v0, [Lcom/radaee/view/PDFVPage;

    iput-object v3, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    .line 38
    :cond_3
    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    const/4 v4, 0x2

    div-int/2addr v3, v4

    .line 39
    iget v5, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    div-int/2addr v5, v4

    .line 40
    iget v6, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    mul-float v6, v6, v1

    float-to-int v1, v6

    iget v6, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    add-int/2addr v1, v6

    iput v1, p0, Lcom/radaee/view/PDFViewVert;->m_docw:I

    .line 42
    iget v1, p0, Lcom/radaee/view/PDFViewVert;->m_align:I

    const/4 v6, 0x1

    if-ne v1, v6, :cond_6

    .line 44
    iput v2, p0, Lcom/radaee/view/PDFViewVert;->m_doch:I

    :goto_0
    if-ge v2, v0, :cond_5

    .line 47
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v3, Lcom/radaee/view/PDFVPage;

    iget-object v6, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v3, v6, v2}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v3, v1, v2

    .line 48
    :cond_4
    iget v1, p0, Lcom/radaee/view/PDFViewVert;->m_docw:I

    iget-object v3, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v3

    iget v6, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    mul-float v3, v3, v6

    float-to-int v3, v3

    sub-int/2addr v1, v3

    div-int/2addr v1, v4

    .line 49
    iget-object v3, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    iget v6, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    invoke-virtual {v3, v1, v5, v6}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 50
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v1

    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    add-int/2addr v1, v3

    add-int/2addr v5, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 53
    :cond_5
    iput v5, p0, Lcom/radaee/view/PDFViewVert;->m_doch:I

    return-void

    :cond_6
    if-ne v1, v4, :cond_9

    .line 57
    iput v2, p0, Lcom/radaee/view/PDFViewVert;->m_doch:I

    :goto_1
    if-ge v2, v0, :cond_8

    .line 60
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v3, Lcom/radaee/view/PDFVPage;

    iget-object v6, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v3, v6, v2}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v3, v1, v2

    .line 61
    :cond_7
    iget v1, p0, Lcom/radaee/view/PDFViewVert;->m_docw:I

    iget-object v3, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v3

    iget v6, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    mul-float v3, v3, v6

    float-to-int v3, v3

    sub-int/2addr v1, v3

    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    div-int/2addr v3, v4

    sub-int/2addr v1, v3

    .line 62
    iget-object v3, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    iget v6, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    invoke-virtual {v3, v1, v5, v6}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 63
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v1

    iget v3, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    add-int/2addr v1, v3

    add-int/2addr v5, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 66
    :cond_8
    iput v5, p0, Lcom/radaee/view/PDFViewVert;->m_doch:I

    return-void

    .line 70
    :cond_9
    iput v2, p0, Lcom/radaee/view/PDFViewVert;->m_doch:I

    :goto_2
    if-ge v2, v0, :cond_b

    .line 73
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    if-nez v1, :cond_a

    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v4, Lcom/radaee/view/PDFVPage;

    iget-object v6, p0, Lcom/radaee/view/PDFViewVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v4, v6, v2}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v4, v1, v2

    .line 74
    :cond_a
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    iget v4, p0, Lcom/radaee/view/PDFViewVert;->m_scale:F

    invoke-virtual {v1, v3, v5, v4}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 75
    iget-object v1, p0, Lcom/radaee/view/PDFViewVert;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v1

    iget v4, p0, Lcom/radaee/view/PDFViewVert;->m_page_gap:I

    add-int/2addr v1, v4

    add-int/2addr v5, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 78
    :cond_b
    iput v5, p0, Lcom/radaee/view/PDFViewVert;->m_doch:I

    :cond_c
    :goto_3
    return-void
.end method

.method public vSetPageAlign(I)V
    .locals 0

    .line 22
    iput p1, p0, Lcom/radaee/view/PDFViewVert;->m_align:I

    return-void
.end method
