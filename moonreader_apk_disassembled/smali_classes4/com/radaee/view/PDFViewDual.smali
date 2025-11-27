.class public Lcom/radaee/view/PDFViewDual;
.super Lcom/radaee/view/PDFView;
.source "PDFViewDual.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/PDFViewDual$PDFCell;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

.field private m_horz_dual:[Z

.field private m_page_align_top:Z

.field private m_rtol:Z

.field private m_vert_dual:[Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/radaee/view/PDFViewDual;->m_page_align_top:Z

    return-void
.end method


# virtual methods
.method public vCenterPage(I)V
    .locals 4

    .line 369
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 371
    :goto_0
    iget-object v2, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v3, v2

    if-ge v1, v3, :cond_3

    .line 373
    aget-object v2, v2, v1

    .line 374
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    if-eq p1, v3, :cond_2

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    if-ne p1, v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 376
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object p1, p1, v1

    iget p1, p1, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    .line 377
    iget-object v2, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v1, v2, v1

    iget v1, v1, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v1, p1

    .line 378
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr p1, v1

    .line 379
    iget-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    .line 380
    iget-object v2, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    .line 381
    iget-object v3, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    sub-int/2addr p1, v1

    invoke-virtual {v3, v1, v2, p1, v0}, Landroid/widget/Scroller;->startScroll(IIII)V

    :cond_3
    :goto_2
    return-void
.end method

.method protected vGetPage(II)I
    .locals 5

    .line 305
    iget-object p2, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz p2, :cond_a

    iget-object p2, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p2, p2

    if-gtz p2, :cond_0

    goto/16 :goto_2

    .line 307
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length p2, p2

    add-int/lit8 p2, p2, -0x1

    .line 308
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    add-int/2addr v0, p1

    .line 309
    iget-boolean p1, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    const/4 v1, 0x0

    if-nez p1, :cond_4

    const/4 p1, 0x0

    :goto_0
    if-gt p1, p2, :cond_8

    add-int v2, p1, p2

    shr-int/lit8 v2, v2, 0x1

    .line 314
    iget-object v3, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v3, v3, v2

    .line 315
    iget v4, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    if-ge v0, v4, :cond_1

    add-int/lit8 v2, v2, -0x1

    move p2, v2

    goto :goto_0

    .line 319
    :cond_1
    iget p1, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    if-le v0, p1, :cond_2

    add-int/lit8 p1, v2, 0x1

    goto :goto_0

    .line 325
    :cond_2
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget p2, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    aget-object p1, p1, p2

    .line 326
    iget p2, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    if-ltz p2, :cond_3

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result p2

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result p1

    add-int/2addr p2, p1

    if-le v0, p2, :cond_3

    .line 327
    iget p1, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    return p1

    .line 329
    :cond_3
    iget p1, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    return p1

    :cond_4
    const/4 p1, 0x0

    :goto_1
    if-gt p1, p2, :cond_8

    add-int v2, p1, p2

    shr-int/lit8 v2, v2, 0x1

    .line 338
    iget-object v3, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v3, v3, v2

    .line 339
    iget v4, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    if-ge v0, v4, :cond_5

    add-int/lit8 p1, v2, 0x1

    goto :goto_1

    .line 343
    :cond_5
    iget p2, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    if-le v0, p2, :cond_6

    add-int/lit8 v2, v2, -0x1

    move p2, v2

    goto :goto_1

    .line 349
    :cond_6
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget p2, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    aget-object p1, p1, p2

    .line 350
    iget p2, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    if-ltz p2, :cond_7

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result p2

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result p1

    add-int/2addr p2, p1

    if-le v0, p2, :cond_7

    .line 351
    iget p1, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    return p1

    .line 353
    :cond_7
    iget p1, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    return p1

    :cond_8
    if-gez p2, :cond_9

    return v1

    .line 363
    :cond_9
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_a
    :goto_2
    const/4 p1, -0x1

    return p1
.end method

.method public vGotoPage(I)V
    .locals 0

    .line 75
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFViewDual;->vCenterPage(I)V

    return-void
.end method

.method protected vLayout()V
    .locals 15

    .line 80
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_2f

    iget v0, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    if-le v0, v1, :cond_2f

    iget v0, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_13

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 87
    iget-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    .line 88
    iget-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v1, :cond_1

    new-array v1, v0, [Lcom/radaee/view/PDFVPage;

    iput-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    .line 89
    :cond_1
    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-le v1, v2, :cond_16

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v2, v0, :cond_8

    .line 93
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_vert_dual:[Z

    if-eqz v7, :cond_5

    array-length v8, v7

    if-ge v6, v8, :cond_5

    aget-boolean v7, v7, v6

    if-eqz v7, :cond_5

    add-int/lit8 v7, v0, -0x1

    if-ge v2, v7, :cond_5

    .line 95
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    add-float/2addr v7, v8

    cmpg-float v8, v4, v7

    if-gez v8, :cond_2

    move v4, v7

    .line 97
    :cond_2
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v8, v1, v7

    if-gez v8, :cond_3

    move v1, v7

    .line 99
    :cond_3
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v9}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v8, v1, v7

    if-gez v8, :cond_4

    move v1, v7

    :cond_4
    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 105
    :cond_5
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    cmpg-float v8, v4, v7

    if-gez v8, :cond_6

    move v4, v7

    .line 107
    :cond_6
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v8, v1, v7

    if-gez v8, :cond_7

    move v1, v7

    :cond_7
    add-int/lit8 v2, v2, 0x1

    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 113
    :cond_8
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    iget v7, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    sub-int/2addr v2, v7

    int-to-float v2, v2

    div-float/2addr v2, v4

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    .line 114
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    sub-int/2addr v2, v4

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 115
    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    cmpl-float v4, v4, v2

    if-lez v4, :cond_9

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    .line 116
    :cond_9
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    sget v4, Lcom/radaee/pdf/Global;->zoomLevel:F

    mul-float v2, v2, v4

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_max:F

    .line 117
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    cmpg-float v2, v2, v4

    if-gez v2, :cond_a

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 118
    :cond_a
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_scale_max:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_b

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_max:F

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 119
    :cond_b
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    .line 120
    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    if-ge v1, v2, :cond_c

    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    iput v1, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    .line 121
    :cond_c
    new-array v1, v6, [Lcom/radaee/view/PDFViewDual$PDFCell;

    iput-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_2
    if-ge v1, v6, :cond_15

    .line 127
    new-instance v7, Lcom/radaee/view/PDFViewDual$PDFCell;

    invoke-direct {v7, p0}, Lcom/radaee/view/PDFViewDual$PDFCell;-><init>(Lcom/radaee/view/PDFViewDual;)V

    .line 130
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_vert_dual:[Z

    if-eqz v8, :cond_11

    array-length v9, v8

    if-ge v1, v9, :cond_11

    aget-boolean v8, v8, v1

    if-eqz v8, :cond_11

    add-int/lit8 v8, v0, -0x1

    if-ge v4, v8, :cond_11

    .line 132
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v4}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    iget-object v9, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v10, v4, 0x1

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    add-float/2addr v8, v9

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v8, v8, v9

    float-to-int v8, v8

    .line 133
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    if-ge v9, v11, :cond_d

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    goto :goto_3

    .line 134
    :cond_d
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    .line 135
    :goto_3
    iput v4, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    .line 136
    iput v10, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    .line 137
    iput v2, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    add-int v11, v2, v9

    .line 138
    iput v11, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 139
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    if-nez v11, :cond_e

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v12, Lcom/radaee/view/PDFVPage;

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v12, v13, v4}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v12, v11, v4

    .line 140
    :cond_e
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v10

    if-nez v11, :cond_f

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v12, Lcom/radaee/view/PDFVPage;

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v12, v13, v10}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v12, v11, v10

    .line 141
    :cond_f
    iget-boolean v11, p0, Lcom/radaee/view/PDFViewDual;->m_page_align_top:Z

    if-eqz v11, :cond_10

    .line 143
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    div-int/lit8 v12, v12, 0x2

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    invoke-virtual {v11, v8, v12, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 144
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v10

    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    invoke-virtual {v10}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v10

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    invoke-virtual {v11}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v11

    add-int/2addr v10, v11

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    div-int/lit8 v11, v11, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    invoke-virtual {v8, v10, v11, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    goto :goto_4

    .line 148
    :cond_10
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    int-to-float v12, v12

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    .line 149
    invoke-virtual {v13, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    iget v14, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v13, v13, v14

    sub-float/2addr v12, v13

    float-to-int v12, v12

    div-int/lit8 v12, v12, 0x2

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 148
    invoke-virtual {v11, v8, v12, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 150
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v10

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    invoke-virtual {v11}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v11

    iget-object v12, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v12, v12, v4

    invoke-virtual {v12}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v12

    add-int/2addr v11, v12

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    int-to-float v12, v12

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    .line 151
    invoke-virtual {v13, v10}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v10

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v10, v10, v13

    sub-float/2addr v12, v10

    float-to-int v10, v12

    div-int/lit8 v10, v10, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 150
    invoke-virtual {v8, v11, v10, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    :goto_4
    add-int/lit8 v4, v4, 0x2

    goto :goto_7

    .line 157
    :cond_11
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v4}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v8, v8, v9

    float-to-int v8, v8

    .line 158
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    iget v10, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    if-ge v9, v10, :cond_12

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    goto :goto_5

    .line 159
    :cond_12
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    .line 160
    :goto_5
    iput v4, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    .line 161
    iput v3, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    .line 162
    iput v2, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    add-int v10, v2, v9

    .line 163
    iput v10, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 164
    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    if-nez v10, :cond_13

    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v11, Lcom/radaee/view/PDFVPage;

    iget-object v12, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v11, v12, v4}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v11, v10, v4

    .line 165
    :cond_13
    iget-boolean v10, p0, Lcom/radaee/view/PDFViewDual;->m_page_align_top:Z

    if-eqz v10, :cond_14

    .line 167
    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    div-int/lit8 v11, v11, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    invoke-virtual {v10, v8, v11, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    goto :goto_6

    .line 172
    :cond_14
    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    int-to-float v11, v11

    iget-object v12, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    .line 173
    invoke-virtual {v12, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v12, v12, v13

    sub-float/2addr v11, v12

    float-to-int v11, v11

    div-int/lit8 v11, v11, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 172
    invoke-virtual {v10, v8, v11, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    :goto_6
    add-int/lit8 v4, v4, 0x1

    :goto_7
    add-int/2addr v2, v9

    .line 178
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aput-object v7, v8, v1

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2

    .line 181
    :cond_15
    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    goto/16 :goto_10

    :cond_16
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_8
    if-ge v2, v0, :cond_1e

    .line 187
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_horz_dual:[Z

    if-eqz v7, :cond_17

    array-length v8, v7

    if-ge v6, v8, :cond_17

    aget-boolean v7, v7, v6

    if-eqz v7, :cond_1b

    :cond_17
    add-int/lit8 v7, v0, -0x1

    if-ge v2, v7, :cond_1b

    .line 189
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    add-float/2addr v7, v8

    cmpg-float v8, v4, v7

    if-gez v8, :cond_18

    move v4, v7

    .line 191
    :cond_18
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v8, v1, v7

    if-gez v8, :cond_19

    move v1, v7

    .line 193
    :cond_19
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v9}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v8, v1, v7

    if-gez v8, :cond_1a

    move v1, v7

    :cond_1a
    add-int/lit8 v2, v2, 0x2

    goto :goto_9

    .line 199
    :cond_1b
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    cmpg-float v8, v4, v7

    if-gez v8, :cond_1c

    move v4, v7

    .line 201
    :cond_1c
    iget-object v7, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v8, v1, v7

    if-gez v8, :cond_1d

    move v1, v7

    :cond_1d
    add-int/lit8 v2, v2, 0x1

    :goto_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 207
    :cond_1e
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    iget v7, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    sub-int/2addr v2, v7

    int-to-float v2, v2

    div-float/2addr v2, v4

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    .line 208
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    sub-int/2addr v2, v4

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 209
    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    cmpl-float v4, v4, v2

    if-lez v4, :cond_1f

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    .line 210
    :cond_1f
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    sget v4, Lcom/radaee/pdf/Global;->zoomLevel:F

    mul-float v2, v2, v4

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_max:F

    .line 211
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    cmpg-float v2, v2, v4

    if-gez v2, :cond_20

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_min:F

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 212
    :cond_20
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_scale_max:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_21

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale_max:F

    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 213
    :cond_21
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    .line 214
    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    if-ge v1, v2, :cond_22

    iget v1, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    iput v1, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    .line 215
    :cond_22
    new-array v1, v6, [Lcom/radaee/view/PDFViewDual$PDFCell;

    iput-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_a
    if-ge v1, v6, :cond_2c

    .line 221
    new-instance v7, Lcom/radaee/view/PDFViewDual$PDFCell;

    invoke-direct {v7, p0}, Lcom/radaee/view/PDFViewDual$PDFCell;-><init>(Lcom/radaee/view/PDFViewDual;)V

    .line 224
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_horz_dual:[Z

    if-eqz v8, :cond_23

    array-length v9, v8

    if-ge v1, v9, :cond_23

    aget-boolean v8, v8, v1

    if-eqz v8, :cond_28

    :cond_23
    add-int/lit8 v8, v0, -0x1

    if-ge v4, v8, :cond_28

    .line 226
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v4}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    iget-object v9, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v10, v4, 0x1

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    add-float/2addr v8, v9

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v8, v8, v9

    float-to-int v8, v8

    .line 227
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    if-ge v9, v11, :cond_24

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    goto :goto_b

    .line 228
    :cond_24
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    .line 229
    :goto_b
    iput v4, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    .line 230
    iput v10, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    .line 231
    iput v2, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    add-int v11, v2, v9

    .line 232
    iput v11, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 233
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    if-nez v11, :cond_25

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v12, Lcom/radaee/view/PDFVPage;

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v12, v13, v4}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v12, v11, v4

    .line 234
    :cond_25
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v10

    if-nez v11, :cond_26

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v12, Lcom/radaee/view/PDFVPage;

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v12, v13, v10}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v12, v11, v10

    .line 235
    :cond_26
    iget-boolean v11, p0, Lcom/radaee/view/PDFViewDual;->m_page_align_top:Z

    if-eqz v11, :cond_27

    .line 237
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    div-int/lit8 v12, v12, 0x2

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    invoke-virtual {v11, v8, v12, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 238
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v10

    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    invoke-virtual {v10}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v10

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    invoke-virtual {v11}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v11

    add-int/2addr v10, v11

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    div-int/lit8 v11, v11, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    invoke-virtual {v8, v10, v11, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    goto :goto_c

    .line 242
    :cond_27
    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    int-to-float v12, v12

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    .line 243
    invoke-virtual {v13, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    iget v14, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v13, v13, v14

    sub-float/2addr v12, v13

    float-to-int v12, v12

    div-int/lit8 v12, v12, 0x2

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 242
    invoke-virtual {v11, v8, v12, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 244
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v10

    iget-object v11, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v11, v11, v4

    invoke-virtual {v11}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v11

    iget-object v12, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v12, v12, v4

    invoke-virtual {v12}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v12

    add-int/2addr v11, v12

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    int-to-float v12, v12

    iget-object v13, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    .line 245
    invoke-virtual {v13, v10}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v10

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v10, v10, v13

    sub-float/2addr v12, v10

    float-to-int v10, v12

    div-int/lit8 v10, v10, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 244
    invoke-virtual {v8, v11, v10, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    :goto_c
    add-int/lit8 v4, v4, 0x2

    goto :goto_f

    .line 251
    :cond_28
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v4}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v8, v8, v9

    float-to-int v8, v8

    .line 252
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    iget v10, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    if-ge v9, v10, :cond_29

    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    goto :goto_d

    .line 253
    :cond_29
    iget v9, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    add-int/2addr v9, v8

    .line 254
    :goto_d
    iput v4, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    .line 255
    iput v3, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    .line 256
    iput v2, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    add-int v10, v2, v9

    .line 257
    iput v10, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 258
    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    if-nez v10, :cond_2a

    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v11, Lcom/radaee/view/PDFVPage;

    iget-object v12, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v11, v12, v4}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v11, v10, v4

    .line 259
    :cond_2a
    iget-boolean v10, p0, Lcom/radaee/view/PDFViewDual;->m_page_align_top:Z

    if-eqz v10, :cond_2b

    .line 261
    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_page_gap:I

    div-int/lit8 v11, v11, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    invoke-virtual {v10, v8, v11, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    goto :goto_e

    .line 265
    :cond_2b
    iget-object v10, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v4

    sub-int v8, v9, v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v2

    iget v11, p0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    int-to-float v11, v11

    iget-object v12, p0, Lcom/radaee/view/PDFViewDual;->m_doc:Lcom/radaee/pdf/Document;

    .line 266
    invoke-virtual {v12, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    iget v13, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    mul-float v12, v12, v13

    sub-float/2addr v11, v12

    float-to-int v11, v11

    div-int/lit8 v11, v11, 0x2

    iget v12, p0, Lcom/radaee/view/PDFViewDual;->m_scale:F

    .line 265
    invoke-virtual {v10, v8, v11, v12}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    :goto_e
    add-int/lit8 v4, v4, 0x1

    :goto_f
    add-int/2addr v2, v9

    .line 271
    iget-object v8, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aput-object v7, v8, v1

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_a

    .line 274
    :cond_2c
    iput v2, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    .line 276
    :goto_10
    iget-boolean v1, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    if-eqz v1, :cond_2f

    const/4 v1, 0x0

    :goto_11
    if-ge v1, v6, :cond_2e

    .line 282
    iget-object v2, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v2, v2, v1

    .line 283
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    .line 284
    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    iget v7, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v4, v7

    iput v4, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    .line 285
    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    sub-int/2addr v4, v3

    iput v4, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 286
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    if-ltz v3, :cond_2d

    .line 288
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    .line 289
    iget v4, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    iput v4, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_left:I

    .line 290
    iput v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->page_right:I

    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_2e
    :goto_12
    if-ge v5, v0, :cond_2f

    .line 296
    iget-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v5

    .line 297
    iget v2, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    iget v3, v1, Lcom/radaee/view/PDFVPage;->m_x:I

    iget v4, v1, Lcom/radaee/view/PDFVPage;->m_w:I

    add-int/2addr v3, v4

    sub-int/2addr v2, v3

    iput v2, v1, Lcom/radaee/view/PDFVPage;->m_x:I

    add-int/lit8 v5, v5, 0x1

    goto :goto_12

    :cond_2f
    :goto_13
    return-void
.end method

.method protected vOnFling(FFFF)Z
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    .line 454
    invoke-virtual {v0}, Lcom/radaee/view/PDFViewDual;->vGetScale()F

    move-result v3

    invoke-virtual {v0}, Lcom/radaee/view/PDFViewDual;->vGetMinScale()F

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5

    .line 455
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v3, :cond_4

    iget v3, v0, Lcom/radaee/view/PDFViewDual;->m_lock:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    goto :goto_1

    :cond_0
    neg-float v1, v1

    .line 456
    sget v3, Lcom/radaee/pdf/Global;->fling_dis:F

    mul-float v1, v1, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    float-to-int v10, v1

    neg-float v1, v2

    .line 457
    sget v2, Lcom/radaee/pdf/Global;->fling_dis:F

    mul-float v1, v1, v2

    div-float/2addr v1, v3

    float-to-int v11, v1

    .line 458
    iget v1, v0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v1, v2

    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    iget v3, v0, Lcom/radaee/view/PDFViewDual;->m_h:I

    sub-int v15, v2, v3

    .line 460
    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_pageno:I

    .line 461
    sget v3, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v4, 0x6

    if-ne v3, v4, :cond_2

    iget v3, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_h:I

    if-le v3, v4, :cond_2

    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_horz_dual:[Z

    if-nez v3, :cond_1

    if-eqz v3, :cond_2

    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_pageno:I

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_2

    .line 462
    :cond_1
    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_pageno:I

    add-int/2addr v2, v5

    div-int/lit8 v2, v2, 0x2

    .line 463
    :cond_2
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v4, v3

    if-ge v2, v4, :cond_3

    .line 464
    aget-object v1, v3, v2

    iget v6, v1, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    .line 465
    iget-object v1, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v1, v1, v2

    iget v1, v1, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v1, v2

    move v12, v6

    goto :goto_0

    :cond_3
    const/4 v12, 0x0

    :goto_0
    move v13, v1

    .line 467
    iget-object v7, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget-object v1, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v8

    iget-object v1, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v9

    const/4 v14, 0x0

    invoke-virtual/range {v7 .. v15}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    return v5

    :cond_4
    :goto_1
    return v6

    :cond_5
    const/4 v3, 0x0

    cmpg-float v4, v1, v3

    if-gez v4, :cond_6

    neg-float v1, v1

    :cond_6
    cmpg-float v4, v2, v3

    if-gez v4, :cond_7

    neg-float v2, v2

    :cond_7
    cmpg-float v2, v1, v2

    if-gez v2, :cond_8

    return v6

    .line 473
    :cond_8
    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    shr-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    cmpg-float v2, p1, v2

    if-gez v2, :cond_9

    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    shr-int/lit8 v2, v2, 0x2

    neg-int v2, v2

    int-to-float v2, v2

    cmpl-float v2, p1, v2

    if-lez v2, :cond_9

    return v6

    .line 474
    :cond_9
    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    shr-int/2addr v2, v5

    int-to-float v2, v2

    cmpg-float v2, v1, v2

    if-gez v2, :cond_a

    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    shr-int/2addr v2, v5

    neg-int v2, v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_a

    return v6

    .line 475
    :cond_a
    iget-object v1, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    .line 476
    iget-object v2, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    .line 477
    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    add-int/2addr v4, v1

    iget v7, v0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    if-le v4, v7, :cond_b

    iget v1, v0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v1, v4

    :cond_b
    if-gez v1, :cond_c

    const/4 v1, 0x0

    .line 479
    :cond_c
    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_h:I

    add-int/2addr v4, v2

    iget v7, v0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    if-le v4, v7, :cond_d

    iget v2, v0, Lcom/radaee/view/PDFViewDual;->m_doch:I

    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_h:I

    sub-int/2addr v2, v4

    :cond_d
    if-gez v2, :cond_e

    const/4 v2, 0x0

    :cond_e
    const/4 v4, 0x0

    .line 482
    :goto_2
    iget-object v7, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v8, v7

    if-ge v4, v8, :cond_17

    .line 484
    aget-object v7, v7, v4

    .line 485
    iget v8, v0, Lcom/radaee/view/PDFViewDual;->m_holdsx:F

    iget v9, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_16

    iget v8, v0, Lcom/radaee/view/PDFViewDual;->m_holdsx:F

    iget v9, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gez v8, :cond_16

    .line 487
    iget-boolean v8, v0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    if-eqz v8, :cond_12

    cmpl-float v3, p1, v3

    if-lez v3, :cond_10

    .line 491
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v7, v3

    sub-int/2addr v7, v5

    if-ge v4, v7, :cond_f

    add-int/2addr v4, v5

    .line 493
    aget-object v3, v3, v4

    iget v3, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v3, v4

    .line 494
    iget-object v4, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    sub-int/2addr v3, v1

    invoke-virtual {v4, v1, v2, v3, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    .line 497
    :cond_f
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    neg-int v4, v1

    invoke-virtual {v3, v1, v2, v4, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    :cond_10
    if-lez v4, :cond_11

    .line 503
    iget v3, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 504
    iget-object v4, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    sub-int/2addr v3, v1

    invoke-virtual {v4, v1, v2, v3, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    .line 507
    :cond_11
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget-object v7, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v4, v7, v4

    iget v4, v4, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v7, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v4, v7

    invoke-virtual {v3, v1, v2, v4, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    :cond_12
    cmpl-float v3, p1, v3

    if-lez v3, :cond_14

    if-lez v4, :cond_13

    .line 516
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    sub-int/2addr v4, v5

    aget-object v3, v3, v4

    iget v3, v3, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v4, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v3, v4

    .line 517
    iget-object v4, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    sub-int/2addr v3, v1

    invoke-virtual {v4, v1, v2, v3, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    .line 520
    :cond_13
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    neg-int v4, v1

    invoke-virtual {v3, v1, v2, v4, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    .line 524
    :cond_14
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v3, v3

    sub-int/2addr v3, v5

    if-ge v4, v3, :cond_15

    .line 526
    iget v3, v7, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    .line 527
    iget-object v4, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    sub-int/2addr v3, v1

    invoke-virtual {v4, v1, v2, v3, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_3

    .line 530
    :cond_15
    iget-object v3, v0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget-object v7, v0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    aget-object v4, v7, v4

    iget v4, v4, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v7, v0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v4, v7

    invoke-virtual {v3, v1, v2, v4, v6}, Landroid/widget/Scroller;->startScroll(IIII)V

    :goto_3
    return v5

    :cond_16
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2

    :cond_17
    return v6
.end method

.method protected vOnMoveEnd(II)V
    .locals 5

    .line 391
    iget-boolean v0, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    .line 393
    :goto_0
    iget-object v2, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v3, v2

    if-ge v0, v3, :cond_9

    .line 395
    aget-object v2, v2, v0

    .line 396
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->left:I

    if-lt p1, v3, :cond_3

    .line 398
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v3, v4

    if-gt p1, v3, :cond_0

    goto/16 :goto_2

    .line 401
    :cond_0
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v3, p1

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    div-int/lit8 v4, v4, 0x2

    if-le v3, v4, :cond_1

    .line 403
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v2, p1

    iget v3, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    return-void

    .line 405
    :cond_1
    iget-object v3, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_2

    .line 407
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v2, p1

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    return-void

    .line 411
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v2, p1

    iget v3, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    return-void

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    .line 420
    :goto_1
    iget-object v2, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v3, v2

    if-ge v0, v3, :cond_9

    .line 422
    aget-object v2, v2, v0

    .line 423
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    if-ge p1, v3, :cond_8

    .line 425
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v3, v4

    if-gt p1, v3, :cond_5

    goto :goto_2

    .line 428
    :cond_5
    iget v3, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v3, p1

    iget v4, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    div-int/lit8 v4, v4, 0x2

    if-le v3, v4, :cond_6

    .line 430
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v2, p1

    iget v3, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    return-void

    .line 432
    :cond_6
    iget-object v3, p0, Lcom/radaee/view/PDFViewDual;->m_cells:[Lcom/radaee/view/PDFViewDual$PDFCell;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_7

    .line 434
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v2, p1

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    return-void

    .line 438
    :cond_7
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v2, Lcom/radaee/view/PDFViewDual$PDFCell;->right:I

    sub-int/2addr v2, p1

    iget v3, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    return-void

    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_9
    :goto_2
    return-void
.end method

.method protected vOnZoomEnd()V
    .locals 2

    .line 449
    iget-object v0, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/PDFViewDual;->vOnMoveEnd(II)V

    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V
    .locals 0

    .line 54
    invoke-super {p0, p1, p2, p3, p4}, Lcom/radaee/view/PDFView;->vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V

    .line 55
    iget-boolean p1, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    if-eqz p1, :cond_0

    .line 57
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 58
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public vResize(II)V
    .locals 1

    .line 64
    iget-boolean v0, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFViewDual;->m_w:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFViewDual;->m_h:I

    if-gtz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 65
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/radaee/view/PDFView;->vResize(II)V

    if-eqz v0, :cond_2

    .line 68
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    iget p2, p0, Lcom/radaee/view/PDFViewDual;->m_docw:I

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 69
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_2
    return-void
.end method

.method public vSetLayoutPara([Z[ZZZ)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_vert_dual:[Z

    .line 45
    iput-object p2, p0, Lcom/radaee/view/PDFViewDual;->m_horz_dual:[Z

    .line 46
    iput-boolean p3, p0, Lcom/radaee/view/PDFViewDual;->m_rtol:Z

    .line 47
    iput-boolean p4, p0, Lcom/radaee/view/PDFViewDual;->m_page_align_top:Z

    .line 48
    invoke-virtual {p0}, Lcom/radaee/view/PDFViewDual;->vLayout()V

    .line 49
    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/radaee/view/PDFViewDual;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_0
    return-void
.end method
