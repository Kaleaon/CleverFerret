.class public Lorg/comic/CLayoutVert;
.super Lorg/comic/CLayout;
.source "CLayoutVert.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Lorg/comic/CLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lorg/comic/CLayoutVert;->vert:Z

    return-void
.end method


# virtual methods
.method public vGetPage(II)I
    .locals 5

    .line 36
    iget-object p1, p0, Lorg/comic/CLayoutVert;->m_pages:[Lorg/comic/VCPage;

    const/4 v0, -0x1

    if-nez p1, :cond_0

    return v0

    .line 37
    :cond_0
    invoke-virtual {p0}, Lorg/comic/CLayoutVert;->vGetY()I

    move-result p1

    add-int/2addr p2, p1

    .line 39
    iget-object p1, p0, Lorg/comic/CLayoutVert;->m_pages:[Lorg/comic/VCPage;

    array-length p1, p1

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    const/4 v2, 0x0

    :goto_0
    if-gt v2, p1, :cond_3

    add-int v3, v2, p1

    shr-int/2addr v3, v1

    .line 44
    iget-object v4, p0, Lorg/comic/CLayoutVert;->m_pages:[Lorg/comic/VCPage;

    aget-object v4, v4, v3

    .line 45
    invoke-virtual {v4, p2}, Lorg/comic/VCPage;->LocVert(I)I

    move-result v4

    if-eq v4, v0, :cond_2

    if-eq v4, v1, :cond_1

    return v3

    :cond_1
    add-int/lit8 v3, v3, 0x1

    move v2, v3

    goto :goto_0

    :cond_2
    add-int/lit8 v3, v3, -0x1

    move p1, v3

    goto :goto_0

    .line 56
    :cond_3
    iget-object p1, p0, Lorg/comic/CLayoutVert;->m_pages:[Lorg/comic/VCPage;

    array-length p1, p1

    sub-int/2addr p1, v1

    return p1
.end method

.method public vLayout()V
    .locals 6

    .line 14
    iget v0, p0, Lorg/comic/CLayoutVert;->m_w:I

    if-lez v0, :cond_4

    iget v0, p0, Lorg/comic/CLayoutVert;->m_h:I

    if-lez v0, :cond_4

    iget-object v0, p0, Lorg/comic/CLayoutVert;->m_doc:Lorg/comic/CDocument;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/comic/CLayoutVert;->m_pages:[Lorg/comic/VCPage;

    if-nez v0, :cond_0

    goto :goto_2

    .line 15
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutVert;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v0}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v0

    .line 17
    iget v1, p0, Lorg/comic/CLayoutVert;->m_w:I

    iget v2, p0, Lorg/comic/CLayoutVert;->m_page_gap:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lorg/comic/CLayoutVert;->m_page_maxw:F

    div-float/2addr v1, v2

    iput v1, p0, Lorg/comic/CLayoutVert;->m_scale_min:F

    .line 18
    iget v1, p0, Lorg/comic/CLayoutVert;->m_scale_min:F

    iget v2, p0, Lorg/comic/CLayoutVert;->m_zoom_level:F

    mul-float v1, v1, v2

    iput v1, p0, Lorg/comic/CLayoutVert;->m_scale_max:F

    .line 19
    iget v1, p0, Lorg/comic/CLayoutVert;->m_scale:F

    iget v2, p0, Lorg/comic/CLayoutVert;->m_scale_min:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    iget v1, p0, Lorg/comic/CLayoutVert;->m_scale_min:F

    iput v1, p0, Lorg/comic/CLayoutVert;->m_scale:F

    .line 20
    :cond_1
    iget v1, p0, Lorg/comic/CLayoutVert;->m_scale:F

    iget v2, p0, Lorg/comic/CLayoutVert;->m_scale_max:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    iget v1, p0, Lorg/comic/CLayoutVert;->m_scale_max:F

    iput v1, p0, Lorg/comic/CLayoutVert;->m_scale:F

    .line 21
    :cond_2
    iget v1, p0, Lorg/comic/CLayoutVert;->m_page_maxw:F

    iget v2, p0, Lorg/comic/CLayoutVert;->m_scale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lorg/comic/CLayoutVert;->m_tw:I

    const/4 v1, 0x0

    .line 22
    iput v1, p0, Lorg/comic/CLayoutVert;->m_th:I

    .line 23
    iget v2, p0, Lorg/comic/CLayoutVert;->m_page_gap:I

    shr-int/lit8 v2, v2, 0x1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_3

    .line 25
    iget-object v4, p0, Lorg/comic/CLayoutVert;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v4, v3}, Lorg/comic/CDocument;->GetPageHeight(I)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lorg/comic/CLayoutVert;->m_scale:F

    mul-float v4, v4, v5

    float-to-int v4, v4

    .line 26
    iget v5, p0, Lorg/comic/CLayoutVert;->m_page_gap:I

    add-int/2addr v4, v5

    add-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 28
    :cond_3
    iget v0, p0, Lorg/comic/CLayoutVert;->m_page_gap:I

    shr-int/lit8 v0, v0, 0x1

    sub-int/2addr v2, v0

    iput v2, p0, Lorg/comic/CLayoutVert;->m_th:I

    .line 30
    iget-object v0, p0, Lorg/comic/CLayoutVert;->m_pages:[Lorg/comic/VCPage;

    array-length v2, v0

    :goto_1
    if-ge v1, v2, :cond_4

    aget-object v3, v0, v1

    const/4 v4, -0x1

    .line 31
    iput v4, v3, Lorg/comic/VCPage;->booky:I

    iput v4, v3, Lorg/comic/VCPage;->bookx:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    return-void
.end method

.method public vMoveEnd()V
    .locals 0

    return-void
.end method
