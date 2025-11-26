.class public Lcom/radaee/view/GLLayoutHorz;
.super Lcom/radaee/view/GLLayout;
.source "GLLayoutHorz.java"


# instance fields
.field private final m_rtol:Z

.field private final m_same_height:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZ)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayout;-><init>(Landroid/content/Context;)V

    .line 12
    iput-boolean p2, p0, Lcom/radaee/view/GLLayoutHorz;->m_rtol:Z

    .line 13
    iput-boolean p3, p0, Lcom/radaee/view/GLLayoutHorz;->m_same_height:Z

    return-void
.end method

.method private layout_ltor(FZ)V
    .locals 7

    .line 50
    iget-object v0, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    move-result-object v0

    .line 51
    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_vh:I

    iget v2, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/4 v2, 0x1

    aget v3, v0, v2

    div-float/2addr v1, v3

    iput v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    .line 52
    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    sget v3, Lcom/radaee/view/GLLayoutHorz;->m_max_zoom:F

    mul-float v1, v1, v3

    .line 53
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    cmpg-float v3, p1, v3

    if-gez v3, :cond_0

    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    :cond_0
    cmpl-float v3, p1, v1

    if-lez v3, :cond_1

    goto :goto_0

    :cond_1
    move v1, p1

    .line 55
    :goto_0
    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    cmpl-float p1, p1, v1

    if-nez p1, :cond_2

    return-void

    .line 56
    :cond_2
    iput v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    .line 57
    aget p1, v0, v2

    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    mul-float p1, p1, v1

    float-to-int p1, p1

    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_layh:I

    .line 58
    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    shr-int/2addr p1, v2

    const/4 v1, 0x0

    .line 59
    :goto_1
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_cnt:I

    if-ge v1, v3, :cond_5

    .line 61
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    .line 62
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v4

    .line 63
    iget-boolean v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_same_height:Z

    if-eqz v5, :cond_3

    .line 64
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    aget v5, v0, v2

    mul-float v3, v3, v5

    div-float/2addr v3, v4

    .line 65
    :cond_3
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v1

    iget v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_layh:I

    iget-object v6, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v6, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v6

    mul-float v6, v6, v3

    float-to-int v6, v6

    sub-int/2addr v5, v6

    shr-int/2addr v5, v2

    invoke-virtual {v4, p1, v5, v3}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_4

    .line 66
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 67
    :cond_4
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v4

    mul-float v4, v4, v3

    float-to-int v3, v4

    iget v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    add-int/2addr v3, v4

    add-int/2addr p1, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 69
    :cond_5
    iget p2, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    shr-int/2addr p2, v2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_layw:I

    return-void
.end method

.method private layout_rtol(FZ)V
    .locals 9

    .line 73
    iget-object v0, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    move-result-object v0

    .line 74
    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_vh:I

    iget v2, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/4 v2, 0x1

    aget v3, v0, v2

    div-float/2addr v1, v3

    iput v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    .line 75
    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    sget v3, Lcom/radaee/view/GLLayoutHorz;->m_max_zoom:F

    mul-float v1, v1, v3

    .line 76
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    cmpg-float v3, p1, v3

    if-gez v3, :cond_0

    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale_min:F

    :cond_0
    cmpl-float v3, p1, v1

    if-lez v3, :cond_1

    goto :goto_0

    :cond_1
    move v1, p1

    .line 78
    :goto_0
    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    cmpl-float p1, p1, v1

    if-nez p1, :cond_2

    return-void

    .line 79
    :cond_2
    iput v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    .line 80
    aget p1, v0, v2

    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    mul-float p1, p1, v1

    float-to-int p1, p1

    iget v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_layh:I

    .line 81
    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    shr-int/2addr p1, v2

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 82
    :goto_1
    iget v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_cnt:I

    if-ge v3, v4, :cond_4

    .line 83
    iget v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    .line 84
    iget-object v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    .line 85
    iget-boolean v6, p0, Lcom/radaee/view/GLLayoutHorz;->m_same_height:Z

    if-eqz v6, :cond_3

    .line 86
    iget v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    aget v6, v0, v2

    mul-float v4, v4, v6

    div-float/2addr v4, v5

    .line 87
    :cond_3
    iget-object v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v3}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v5

    mul-float v5, v5, v4

    float-to-int v4, v5

    iget v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    add-int/2addr v4, v5

    add-int/2addr p1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 89
    :cond_4
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    shr-int/2addr v3, v2

    sub-int/2addr p1, v3

    iput p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_layw:I

    .line 91
    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_layw:I

    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    shr-int/2addr v3, v2

    sub-int/2addr p1, v3

    .line 92
    :goto_2
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_cnt:I

    if-ge v1, v3, :cond_7

    .line 94
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    .line 95
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v4

    .line 96
    iget-boolean v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_same_height:Z

    if-eqz v5, :cond_5

    .line 97
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_scale:F

    aget v5, v0, v2

    mul-float v3, v3, v5

    div-float/2addr v3, v4

    .line 98
    :cond_5
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v4

    mul-float v4, v4, v3

    float-to-int v4, v4

    .line 99
    iget-object v5, p0, Lcom/radaee/view/GLLayoutHorz;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v5, v5, v1

    sub-int v6, p1, v4

    iget v7, p0, Lcom/radaee/view/GLLayoutHorz;->m_layh:I

    iget-object v8, p0, Lcom/radaee/view/GLLayoutHorz;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    mul-float v8, v8, v3

    float-to-int v8, v8

    sub-int/2addr v7, v8

    shr-int/2addr v7, v2

    invoke-virtual {v5, v6, v7, v3}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_6

    .line 100
    iget-object v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 101
    :cond_6
    iget v3, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    add-int/2addr v4, v3

    sub-int/2addr p1, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 103
    :cond_7
    iget p1, p0, Lcom/radaee/view/GLLayoutHorz;->m_layw:I

    iget p2, p0, Lcom/radaee/view/GLLayoutHorz;->m_vw:I

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayoutHorz;->vSetX(I)V

    return-void
.end method


# virtual methods
.method public gl_layout(FZ)V
    .locals 1

    .line 108
    iget v0, p0, Lcom/radaee/view/GLLayoutHorz;->m_vw:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/radaee/view/GLLayoutHorz;->m_vh:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 109
    :cond_0
    iget-boolean v0, p0, Lcom/radaee/view/GLLayoutHorz;->m_rtol:Z

    if-nez v0, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/radaee/view/GLLayoutHorz;->layout_ltor(FZ)V

    return-void

    .line 110
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/radaee/view/GLLayoutHorz;->layout_rtol(FZ)V

    :cond_2
    :goto_0
    return-void
.end method

.method public vGetPage(II)I
    .locals 6

    .line 18
    iget p2, p0, Lcom/radaee/view/GLLayoutHorz;->m_vw:I

    if-lez p2, :cond_8

    iget p2, p0, Lcom/radaee/view/GLLayoutHorz;->m_vh:I

    if-gtz p2, :cond_0

    goto :goto_2

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutHorz;->vGetX()I

    move-result p2

    add-int/2addr p1, p2

    .line 21
    iget p2, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_cnt:I

    add-int/lit8 p2, p2, -0x1

    .line 22
    iget v0, p0, Lcom/radaee/view/GLLayoutHorz;->m_page_gap:I

    shr-int/lit8 v0, v0, 0x1

    .line 23
    iget-boolean v1, p0, Lcom/radaee/view/GLLayoutHorz;->m_rtol:Z

    const/4 v2, 0x0

    if-nez v1, :cond_3

    const/4 v1, 0x0

    :goto_0
    if-lt p2, v1, :cond_6

    add-int v3, v1, p2

    shr-int/lit8 v3, v3, 0x1

    .line 26
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v3

    .line 27
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetLeft()I

    move-result v5

    sub-int/2addr v5, v0

    if-ge p1, v5, :cond_1

    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result v1

    add-int/2addr v1, v0

    if-lt p1, v1, :cond_2

    add-int/lit8 v1, v3, 0x1

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    const/4 v1, 0x0

    :goto_1
    if-lt p2, v1, :cond_6

    add-int v3, v1, p2

    shr-int/lit8 v3, v3, 0x1

    .line 37
    iget-object v4, p0, Lcom/radaee/view/GLLayoutHorz;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v3

    .line 38
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetLeft()I

    move-result v5

    sub-int/2addr v5, v0

    if-ge p1, v5, :cond_4

    add-int/lit8 v1, v3, 0x1

    goto :goto_1

    .line 40
    :cond_4
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result p2

    add-int/2addr p2, v0

    if-lt p1, p2, :cond_5

    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_1

    :cond_5
    return v3

    :cond_6
    if-gez p2, :cond_7

    return v2

    :cond_7
    return p2

    :cond_8
    :goto_2
    const/4 p1, -0x1

    return p1
.end method
