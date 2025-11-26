.class public Lcom/radaee/view/GLLayoutVert;
.super Lcom/radaee/view/GLLayout;
.source "GLLayoutVert.java"


# static fields
.field public static final ALIGN_CENTER:I = 0x0

.field public static final ALIGN_LEFT:I = 0x1

.field public static final ALIGN_RIGHT:I = 0x2


# instance fields
.field private final m_align:I

.field private final m_same_width:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayout;-><init>(Landroid/content/Context;)V

    .line 14
    iput-boolean p3, p0, Lcom/radaee/view/GLLayoutVert;->m_same_width:Z

    .line 15
    iput p2, p0, Lcom/radaee/view/GLLayoutVert;->m_align:I

    return-void
.end method


# virtual methods
.method public gl_layout(FZ)V
    .locals 7

    .line 40
    iget v0, p0, Lcom/radaee/view/GLLayoutVert;->m_vw:I

    if-lez v0, :cond_9

    iget v0, p0, Lcom/radaee/view/GLLayoutVert;->m_vh:I

    if-gtz v0, :cond_0

    goto/16 :goto_4

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayoutVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    move-result-object v0

    .line 42
    iget v1, p0, Lcom/radaee/view/GLLayoutVert;->m_vw:I

    iget v2, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/4 v2, 0x0

    aget v3, v0, v2

    div-float/2addr v1, v3

    iput v1, p0, Lcom/radaee/view/GLLayoutVert;->m_scale_min:F

    .line 43
    iget v1, p0, Lcom/radaee/view/GLLayoutVert;->m_scale_min:F

    sget v3, Lcom/radaee/view/GLLayoutVert;->m_max_zoom:F

    mul-float v1, v1, v3

    .line 44
    iget v3, p0, Lcom/radaee/view/GLLayoutVert;->m_scale_min:F

    cmpg-float v3, p1, v3

    if-gez v3, :cond_1

    iget p1, p0, Lcom/radaee/view/GLLayoutVert;->m_scale_min:F

    :cond_1
    cmpl-float v3, p1, v1

    if-lez v3, :cond_2

    goto :goto_0

    :cond_2
    move v1, p1

    .line 46
    :goto_0
    iget p1, p0, Lcom/radaee/view/GLLayoutVert;->m_scale:F

    cmpl-float p1, p1, v1

    if-nez p1, :cond_3

    goto :goto_4

    .line 47
    :cond_3
    iput v1, p0, Lcom/radaee/view/GLLayoutVert;->m_scale:F

    .line 48
    aget p1, v0, v2

    iget v1, p0, Lcom/radaee/view/GLLayoutVert;->m_scale:F

    mul-float p1, p1, v1

    float-to-int p1, p1

    iget v1, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/GLLayoutVert;->m_layw:I

    .line 49
    iget p1, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    const/4 v1, 0x1

    shr-int/2addr p1, v1

    const/4 v3, 0x0

    .line 50
    :goto_1
    iget v4, p0, Lcom/radaee/view/GLLayoutVert;->m_page_cnt:I

    if-ge v3, v4, :cond_8

    .line 53
    iget v4, p0, Lcom/radaee/view/GLLayoutVert;->m_scale:F

    .line 54
    iget-object v5, p0, Lcom/radaee/view/GLLayoutVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v3}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v5

    .line 55
    iget-boolean v6, p0, Lcom/radaee/view/GLLayoutVert;->m_same_width:Z

    if-eqz v6, :cond_4

    .line 56
    iget v4, p0, Lcom/radaee/view/GLLayoutVert;->m_scale:F

    aget v6, v0, v2

    mul-float v4, v4, v6

    div-float/2addr v4, v5

    .line 57
    :cond_4
    iget v5, p0, Lcom/radaee/view/GLLayoutVert;->m_align:I

    if-eq v5, v1, :cond_6

    const/4 v6, 0x2

    if-eq v5, v6, :cond_5

    .line 66
    iget v5, p0, Lcom/radaee/view/GLLayoutVert;->m_layw:I

    iget-object v6, p0, Lcom/radaee/view/GLLayoutVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v6, v3}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v6

    mul-float v6, v6, v4

    float-to-int v6, v6

    sub-int/2addr v5, v6

    goto :goto_2

    .line 63
    :cond_5
    iget v5, p0, Lcom/radaee/view/GLLayoutVert;->m_layw:I

    iget v6, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    shr-int/2addr v6, v1

    sub-int/2addr v5, v6

    goto :goto_3

    .line 60
    :cond_6
    iget v5, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    :goto_2
    shr-int/2addr v5, v1

    .line 69
    :goto_3
    iget-object v6, p0, Lcom/radaee/view/GLLayoutVert;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v6, v6, v3

    invoke-virtual {v6, v5, p1, v4}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_7

    .line 70
    iget-object v5, p0, Lcom/radaee/view/GLLayoutVert;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 71
    :cond_7
    iget-object v5, p0, Lcom/radaee/view/GLLayoutVert;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    mul-float v5, v5, v4

    float-to-int v4, v5

    iget v5, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    add-int/2addr v4, v5

    add-int/2addr p1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 73
    :cond_8
    iget p2, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    shr-int/2addr p2, v1

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/radaee/view/GLLayoutVert;->m_layh:I

    :cond_9
    :goto_4
    return-void
.end method

.method public vGetPage(II)I
    .locals 6

    .line 19
    iget p1, p0, Lcom/radaee/view/GLLayoutVert;->m_vw:I

    if-lez p1, :cond_5

    iget p1, p0, Lcom/radaee/view/GLLayoutVert;->m_vh:I

    if-gtz p1, :cond_0

    goto :goto_1

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutVert;->vGetY()I

    move-result p1

    add-int/2addr p2, p1

    .line 22
    iget p1, p0, Lcom/radaee/view/GLLayoutVert;->m_page_cnt:I

    add-int/lit8 p1, p1, -0x1

    .line 23
    iget v0, p0, Lcom/radaee/view/GLLayoutVert;->m_page_gap:I

    shr-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-lt p1, v2, :cond_3

    add-int v3, v2, p1

    shr-int/lit8 v3, v3, 0x1

    .line 27
    iget-object v4, p0, Lcom/radaee/view/GLLayoutVert;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v3

    .line 28
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetTop()I

    move-result v5

    sub-int/2addr v5, v0

    if-ge p2, v5, :cond_1

    add-int/lit8 v3, v3, -0x1

    move p1, v3

    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {v4}, Lcom/radaee/view/GLPage;->GetBottom()I

    move-result v2

    add-int/2addr v2, v0

    if-lt p2, v2, :cond_2

    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    if-gez p1, :cond_4

    return v1

    :cond_4
    return p1

    :cond_5
    :goto_1
    const/4 p1, -0x1

    return p1
.end method
