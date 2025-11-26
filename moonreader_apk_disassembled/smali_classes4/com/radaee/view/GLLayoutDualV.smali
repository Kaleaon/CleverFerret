.class public Lcom/radaee/view/GLLayoutDualV;
.super Lcom/radaee/view/GLLayout;
.source "GLLayoutDualV.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/GLLayoutDualV$PDFCell;
    }
.end annotation


# static fields
.field public static final ALIGN_CENTER:I = 0x0

.field public static final ALIGN_LEFT:I = 0x1

.field public static final ALIGN_RIGHT:I = 0x2


# instance fields
.field private final m_align_type:I

.field private m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

.field private final m_has_cover:Z

.field private final m_rtol:Z

.field private final m_same_width:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;IZZZ)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayout;-><init>(Landroid/content/Context;)V

    .line 31
    iput p2, p0, Lcom/radaee/view/GLLayoutDualV;->m_align_type:I

    .line 32
    iput-boolean p3, p0, Lcom/radaee/view/GLLayoutDualV;->m_rtol:Z

    .line 33
    iput-boolean p4, p0, Lcom/radaee/view/GLLayoutDualV;->m_has_cover:Z

    .line 34
    iput-boolean p5, p0, Lcom/radaee/view/GLLayoutDualV;->m_same_width:Z

    return-void
.end method

.method private get_cell(I)I
    .locals 6

    .line 231
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    const/4 v1, -0x1

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    array-length v0, v0

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    if-nez v0, :cond_0

    goto :goto_1

    .line 233
    :cond_0
    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    const/4 v2, 0x0

    :goto_0
    if-gt v2, v0, :cond_3

    add-int v3, v2, v0

    shr-int/lit8 v3, v3, 0x1

    .line 236
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    aget-object v4, v4, v3

    .line 237
    iget v5, v4, Lcom/radaee/view/GLLayoutDualV$PDFCell;->top:I

    if-ge p1, v5, :cond_1

    add-int/lit8 v3, v3, -0x1

    move v0, v3

    goto :goto_0

    .line 239
    :cond_1
    iget v2, v4, Lcom/radaee/view/GLLayoutDualV$PDFCell;->bottom:I

    if-le p1, v2, :cond_2

    add-int/lit8 v3, v3, 0x1

    move v2, v3

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    if-gez v0, :cond_4

    return v1

    .line 246
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    array-length p1, p1

    return p1

    :cond_5
    :goto_1
    return v1
.end method


# virtual methods
.method protected gl_flush_range(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 7

    .line 171
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    if-le v0, v1, :cond_0

    return-void

    .line 172
    :cond_0
    sget v0, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v0, v0

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v1, v1

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/GLLayoutDualV;->vGetPage(II)I

    move-result v0

    .line 173
    iget v1, p0, Lcom/radaee/view/GLLayoutDualV;->m_vw:I

    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_vh:I

    sget v3, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/radaee/view/GLLayoutDualV;->vGetPage(II)I

    move-result v1

    if-ltz v0, :cond_7

    if-ltz v1, :cond_7

    if-le v0, v1, :cond_1

    goto :goto_0

    :cond_1
    move v6, v1

    move v1, v0

    move v0, v6

    :goto_0
    add-int/lit8 v2, v0, 0x1

    .line 183
    iget-boolean v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_rtol:Z

    if-eqz v3, :cond_3

    if-lez v1, :cond_2

    add-int/lit8 v1, v1, -0x1

    .line 185
    :cond_2
    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_cnt:I

    if-ge v2, v3, :cond_3

    add-int/lit8 v0, v0, 0x2

    move v6, v1

    move v1, v0

    move v0, v6

    goto :goto_1

    :cond_3
    move v0, v1

    move v1, v2

    .line 187
    :goto_1
    iget v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    if-ge v2, v0, :cond_5

    .line 189
    iget v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    .line 191
    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    if-le v0, v3, :cond_4

    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    goto :goto_2

    :cond_4
    move v3, v0

    :goto_2
    if-ge v2, v3, :cond_5

    .line 194
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v2

    .line 195
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 196
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 200
    :cond_5
    iget v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    if-le v2, v1, :cond_8

    .line 203
    iget v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    .line 204
    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    if-ge v1, v3, :cond_6

    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    goto :goto_3

    :cond_6
    move v3, v1

    :goto_3
    if-ge v3, v2, :cond_8

    .line 207
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v3

    .line 208
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 209
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 216
    :cond_7
    iget v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    .line 217
    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    :goto_4
    if-ge v2, v3, :cond_8

    .line 220
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v2

    .line 221
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 222
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 226
    :cond_8
    iput v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno1:I

    .line 227
    iput v1, p0, Lcom/radaee/view/GLLayoutDualV;->m_pageno2:I

    return-void
.end method

.method public gl_layout(FZ)V
    .locals 12

    .line 69
    iget v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_vw:I

    if-lez v0, :cond_18

    iget v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_vh:I

    if-gtz v0, :cond_0

    goto/16 :goto_a

    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 76
    :goto_0
    iget v7, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_cnt:I

    const/4 v8, 0x1

    if-ge v5, v7, :cond_8

    .line 77
    iget-object v7, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    .line 78
    iget-object v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    .line 79
    iget-boolean v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_has_cover:Z

    if-eqz v10, :cond_1

    if-lez v5, :cond_3

    :cond_1
    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_cnt:I

    sub-int/2addr v10, v8

    if-ge v5, v10, :cond_3

    .line 81
    iget-object v8, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v10, v5, 0x1

    invoke-virtual {v8, v10}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    add-float/2addr v7, v8

    .line 82
    iget-object v8, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v10}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    cmpg-float v10, v9, v8

    if-gez v10, :cond_2

    move v9, v8

    :cond_2
    add-int/lit8 v5, v5, 0x2

    goto :goto_1

    :cond_3
    add-int/lit8 v5, v5, 0x1

    :goto_1
    cmpg-float v8, v3, v7

    if-gez v8, :cond_4

    move v3, v7

    :cond_4
    cmpg-float v8, v4, v9

    if-gez v8, :cond_5

    move v4, v9

    .line 90
    :cond_5
    iget v8, p0, Lcom/radaee/view/GLLayoutDualV;->m_vw:I

    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    sub-int/2addr v8, v10

    int-to-float v8, v8

    div-float/2addr v8, v7

    mul-float v7, v7, v8

    mul-float v9, v9, v8

    float-to-int v7, v7

    if-le v0, v7, :cond_6

    move v0, v7

    :cond_6
    float-to-int v7, v9

    if-le v1, v7, :cond_7

    move v1, v7

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 98
    :cond_8
    iget-object v1, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    if-eqz v1, :cond_a

    array-length v1, v1

    if-eq v1, v6, :cond_9

    goto :goto_2

    :cond_9
    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    :goto_2
    const/4 v1, 0x1

    :goto_3
    if-eqz v1, :cond_b

    .line 99
    new-array v4, v6, [Lcom/radaee/view/GLLayoutDualV$PDFCell;

    iput-object v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    .line 100
    :cond_b
    iget v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_vw:I

    iget v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    div-float/2addr v4, v3

    iput v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_scale_min:F

    .line 101
    iget v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_scale_min:F

    sget v5, Lcom/radaee/view/GLLayoutDualV;->m_max_zoom:F

    mul-float v4, v4, v5

    .line 102
    iget v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_scale_min:F

    cmpg-float v5, p1, v5

    if-gez v5, :cond_c

    iget p1, p0, Lcom/radaee/view/GLLayoutDualV;->m_scale_min:F

    :cond_c
    cmpl-float v5, p1, v4

    if-lez v5, :cond_d

    goto :goto_4

    :cond_d
    move v4, p1

    .line 106
    :goto_4
    iput v4, p0, Lcom/radaee/view/GLLayoutDualV;->m_scale:F

    mul-float v3, v3, v4

    float-to-int p1, v3

    .line 107
    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/radaee/view/GLLayoutDualV;->m_layw:I

    .line 108
    iput v2, p0, Lcom/radaee/view/GLLayoutDualV;->m_layh:I

    const/4 p1, 0x0

    :goto_5
    if-ge v2, v6, :cond_18

    .line 111
    iget-object v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3, p1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v3

    .line 112
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    if-eqz v1, :cond_e

    .line 113
    iget-object v7, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    new-instance v9, Lcom/radaee/view/GLLayoutDualV$PDFCell;

    const/4 v10, 0x0

    invoke-direct {v9, v10}, Lcom/radaee/view/GLLayoutDualV$PDFCell;-><init>(Lcom/radaee/view/GLLayoutDualV$1;)V

    aput-object v9, v7, v2

    .line 114
    :cond_e
    iget-object v7, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    aget-object v7, v7, v2

    .line 115
    iget-boolean v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_has_cover:Z

    if-eqz v9, :cond_f

    if-lez p1, :cond_12

    :cond_f
    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_cnt:I

    sub-int/2addr v9, v8

    if-ge p1, v9, :cond_12

    .line 117
    iget-object v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v10, p1, 0x1

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    add-float/2addr v3, v9

    .line 118
    iget-object v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    cmpg-float v11, v5, v9

    if-gez v11, :cond_10

    move v5, v9

    .line 121
    :cond_10
    iget-boolean v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_rtol:Z

    if-eqz v9, :cond_11

    .line 122
    iput v10, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    .line 123
    iput p1, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    goto :goto_6

    .line 126
    :cond_11
    iput p1, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    .line 127
    iput v10, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    :goto_6
    add-int/lit8 p1, p1, 0x2

    goto :goto_7

    :cond_12
    add-int/lit8 v9, p1, 0x1

    .line 131
    iput p1, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    const/4 p1, -0x1

    .line 132
    iput p1, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    move p1, v9

    .line 134
    :goto_7
    iget-boolean v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_same_width:Z

    if-eqz v9, :cond_13

    int-to-float v9, v0

    div-float/2addr v9, v3

    .line 136
    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_scale_min:F

    div-float/2addr v9, v10

    iput v9, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->scale:F

    goto :goto_8

    :cond_13
    const/high16 v9, 0x3f800000    # 1.0f

    .line 139
    iput v9, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->scale:F

    .line 141
    :goto_8
    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_layh:I

    iput v9, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->top:I

    mul-float v3, v3, v4

    .line 142
    iget v9, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->scale:F

    mul-float v3, v3, v9

    float-to-int v3, v3

    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    add-int/2addr v3, v9

    mul-float v5, v5, v4

    .line 143
    iget v9, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->scale:F

    mul-float v5, v5, v9

    float-to-int v5, v5

    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    add-int/2addr v5, v9

    .line 144
    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    shr-int/2addr v9, v8

    .line 145
    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_align_type:I

    if-eq v10, v8, :cond_15

    const/4 v11, 0x2

    if-eq v10, v11, :cond_14

    .line 152
    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_layw:I

    sub-int/2addr v9, v3

    iget v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    add-int/2addr v9, v3

    shr-int/2addr v9, v8

    goto :goto_9

    .line 149
    :cond_14
    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_layw:I

    sub-int/2addr v10, v3

    add-int/2addr v9, v10

    .line 155
    :cond_15
    :goto_9
    iget v3, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->top:I

    add-int/2addr v3, v5

    iput v3, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->bottom:I

    .line 156
    iget-object v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    iget v5, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    aget-object v3, v3, v5

    .line 157
    iget v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_layh:I

    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    shr-int/2addr v10, v8

    add-int/2addr v5, v10

    iget v10, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->scale:F

    mul-float v10, v10, v4

    invoke-virtual {v3, v9, v5, v10}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_16

    .line 158
    invoke-virtual {v3}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 159
    :cond_16
    iget v5, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    if-ltz v5, :cond_17

    .line 160
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    iget v9, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    aget-object v5, v5, v9

    .line 161
    invoke-virtual {v3}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result v3

    iget v9, p0, Lcom/radaee/view/GLLayoutDualV;->m_layh:I

    iget v10, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    shr-int/2addr v10, v8

    add-int/2addr v9, v10

    iget v10, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->scale:F

    mul-float v10, v10, v4

    invoke-virtual {v5, v3, v9, v10}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_17

    .line 162
    invoke-virtual {v5}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 164
    :cond_17
    iget v3, v7, Lcom/radaee/view/GLLayoutDualV$PDFCell;->bottom:I

    iput v3, p0, Lcom/radaee/view/GLLayoutDualV;->m_layh:I

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_5

    :cond_18
    :goto_a
    return-void
.end method

.method public vGetPage(II)I
    .locals 7

    .line 39
    iget v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_vw:I

    if-lez v0, :cond_7

    iget v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_vh:I

    if-gtz v0, :cond_0

    goto :goto_2

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDualV;->vGetY()I

    move-result v0

    add-int/2addr p2, v0

    .line 41
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDualV;->vGetX()I

    move-result v0

    add-int/2addr p1, v0

    .line 43
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    .line 44
    iget v1, p0, Lcom/radaee/view/GLLayoutDualV;->m_page_gap:I

    shr-int/lit8 v1, v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-lt v0, v3, :cond_4

    add-int v4, v3, v0

    shr-int/lit8 v4, v4, 0x1

    .line 47
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    aget-object v5, v5, v4

    .line 48
    iget v6, v5, Lcom/radaee/view/GLLayoutDualV$PDFCell;->top:I

    sub-int/2addr v6, v1

    if-ge p2, v6, :cond_1

    add-int/lit8 v4, v4, -0x1

    move v0, v4

    goto :goto_0

    .line 50
    :cond_1
    iget v3, v5, Lcom/radaee/view/GLLayoutDualV$PDFCell;->bottom:I

    add-int/2addr v3, v1

    if-lt p2, v3, :cond_2

    add-int/lit8 v3, v4, 0x1

    goto :goto_0

    .line 54
    :cond_2
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    iget v0, v5, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    aget-object p2, p2, v0

    .line 55
    invoke-virtual {p2}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result p2

    if-lt p1, p2, :cond_3

    iget p1, v5, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    if-ltz p1, :cond_3

    iget p1, v5, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    return p1

    .line 56
    :cond_3
    iget p1, v5, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    return p1

    :cond_4
    if-gez v0, :cond_5

    goto :goto_1

    :cond_5
    move v2, v0

    .line 60
    :goto_1
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDualV;->m_cells:[Lcom/radaee/view/GLLayoutDualV$PDFCell;

    aget-object p2, p2, v2

    .line 61
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDualV;->m_pages:[Lcom/radaee/view/GLPage;

    iget v1, p2, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    aget-object v0, v0, v1

    .line 63
    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result v0

    if-lt p1, v0, :cond_6

    iget p1, p2, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    if-ltz p1, :cond_6

    iget p1, p2, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_right:I

    return p1

    .line 64
    :cond_6
    iget p1, p2, Lcom/radaee/view/GLLayoutDualV$PDFCell;->page_left:I

    return p1

    :cond_7
    :goto_2
    const/4 p1, -0x1

    return p1
.end method
