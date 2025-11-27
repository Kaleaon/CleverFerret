.class public Lcom/radaee/view/GLLayoutDual;
.super Lcom/radaee/view/GLLayout;
.source "GLLayoutDual.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/GLLayoutDual$PDFCell;
    }
.end annotation


# static fields
.field public static final ALIGN_BOTTOM:I = 0x2

.field public static final ALIGN_CENTER:I = 0x0

.field public static final ALIGN_TOP:I = 0x1

.field public static final SCALE_FIT:I = 0x3

.field public static final SCALE_NONE:I = 0x0

.field public static final SCALE_SAME_HEIGHT:I = 0x2

.field public static final SCALE_SAME_WIDTH:I = 0x1


# instance fields
.field private final m_align_type:I

.field private m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

.field private final m_horz_dual:[Z

.field private final m_rtol:Z

.field private final m_scale_mode:I

.field private final m_vert_dual:[Z

.field private m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;


# direct methods
.method public constructor <init>(Landroid/content/Context;IIZ[Z[Z)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayout;-><init>(Landroid/content/Context;)V

    .line 35
    iput-object p5, p0, Lcom/radaee/view/GLLayoutDual;->m_horz_dual:[Z

    .line 36
    iput-object p6, p0, Lcom/radaee/view/GLLayoutDual;->m_vert_dual:[Z

    .line 37
    iput p2, p0, Lcom/radaee/view/GLLayoutDual;->m_align_type:I

    .line 38
    iput p3, p0, Lcom/radaee/view/GLLayoutDual;->m_scale_mode:I

    .line 39
    iput-boolean p4, p0, Lcom/radaee/view/GLLayoutDual;->m_rtol:Z

    return-void
.end method

.method private do_scroll(IIII)V
    .locals 7

    mul-int/lit16 v0, p3, 0x200

    .line 445
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    mul-int/lit16 v1, p4, 0x200

    .line 446
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    div-int/2addr v1, v2

    int-to-float v1, v1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 447
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result v0

    float-to-int v0, v0

    invoke-static {v0}, Lcom/radaee/pdf/Global;->scrollDuration(I)I

    move-result v6

    .line 448
    iget-object v1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method private static dual_at([ZI)Z
    .locals 1

    if-eqz p0, :cond_1

    .line 167
    array-length v0, p0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 168
    :cond_0
    aget-boolean p0, p0, p1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private get_cell(I)I
    .locals 6

    .line 452
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    const/4 v1, -0x1

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    array-length v0, v0

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    if-nez v0, :cond_0

    goto :goto_1

    .line 454
    :cond_0
    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    const/4 v2, 0x0

    :goto_0
    if-gt v2, v0, :cond_3

    add-int v3, v2, v0

    shr-int/lit8 v3, v3, 0x1

    .line 457
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object v4, v4, v3

    .line 458
    iget v5, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    if-ge p1, v5, :cond_1

    add-int/lit8 v3, v3, -0x1

    move v0, v3

    goto :goto_0

    .line 460
    :cond_1
    iget v2, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    if-le p1, v2, :cond_2

    add-int/lit8 v3, v3, 0x1

    move v2, v3

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    if-gez v0, :cond_4

    return v1

    .line 467
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length p1, p1

    return p1

    :cond_5
    :goto_1
    return v1
.end method

.method private layout_ltor(FZ[Z)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    .line 172
    iget v2, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-lez v2, :cond_1f

    iget v2, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-gtz v2, :cond_0

    goto/16 :goto_c

    :cond_0
    const/high16 v2, 0x40000000    # 2.0f

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 179
    :goto_0
    iget v9, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    const/4 v10, 0x1

    if-ge v7, v9, :cond_8

    .line 180
    iget-object v9, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v7}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    .line 181
    iget-object v11, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11, v7}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v11

    .line 182
    invoke-static {v1, v8}, Lcom/radaee/view/GLLayoutDual;->dual_at([ZI)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 183
    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    sub-int/2addr v12, v10

    if-ge v7, v12, :cond_2

    .line 184
    iget-object v10, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v12, v7, 0x1

    invoke-virtual {v10, v12}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v10

    add-float/2addr v9, v10

    .line 185
    iget-object v10, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v10, v12}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v10

    cmpg-float v12, v11, v10

    if-gez v12, :cond_1

    move v11, v10

    :cond_1
    add-int/lit8 v7, v7, 0x2

    goto :goto_1

    :cond_2
    add-int/lit8 v7, v7, 0x1

    :goto_1
    cmpg-float v10, v5, v9

    if-gez v10, :cond_3

    move v5, v9

    :cond_3
    cmpg-float v10, v6, v11

    if-gez v10, :cond_4

    move v6, v11

    .line 192
    :cond_4
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v10, v12

    int-to-float v10, v10

    div-float/2addr v10, v9

    .line 193
    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v12, v13

    int-to-float v12, v12

    div-float/2addr v12, v11

    cmpl-float v13, v10, v12

    if-lez v13, :cond_5

    move v10, v12

    :cond_5
    mul-float v9, v9, v10

    mul-float v11, v11, v10

    float-to-int v9, v9

    if-le v2, v9, :cond_6

    move v2, v9

    :cond_6
    float-to-int v9, v11

    if-le v3, v9, :cond_7

    move v3, v9

    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 202
    :cond_8
    iget-object v7, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    if-eqz v7, :cond_a

    array-length v7, v7

    if-eq v7, v8, :cond_9

    goto :goto_2

    :cond_9
    const/4 v7, 0x0

    goto :goto_3

    :cond_a
    :goto_2
    const/4 v7, 0x1

    :goto_3
    if-eqz v7, :cond_b

    .line 203
    new-array v9, v8, [Lcom/radaee/view/GLLayoutDual$PDFCell;

    iput-object v9, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    .line 204
    :cond_b
    iget v9, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v9, v11

    int-to-float v9, v9

    div-float/2addr v9, v5

    iput v9, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    .line 206
    iget v5, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    iget v9, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v5, v9

    int-to-float v5, v5

    div-float/2addr v5, v6

    .line 207
    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    cmpl-float v6, v6, v5

    if-lez v6, :cond_c

    iput v5, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    .line 208
    :cond_c
    iget v5, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    sget v6, Lcom/radaee/view/GLLayoutDual;->m_max_zoom:F

    mul-float v5, v5, v6

    .line 209
    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    cmpg-float v6, p1, v6

    if-gez v6, :cond_d

    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    goto :goto_4

    :cond_d
    move/from16 v6, p1

    :goto_4
    cmpl-float v9, v6, v5

    if-lez v9, :cond_e

    goto :goto_5

    :cond_e
    move v5, v6

    .line 212
    :goto_5
    iput v5, v0, Lcom/radaee/view/GLLayoutDual;->m_scale:F

    .line 213
    iput v4, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    .line 214
    iput v4, v0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    const/4 v6, 0x0

    :goto_6
    if-ge v4, v8, :cond_1f

    .line 217
    iget-object v9, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v6}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    .line 218
    iget-object v11, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v11

    if-eqz v7, :cond_f

    .line 219
    iget-object v12, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    new-instance v13, Lcom/radaee/view/GLLayoutDual$PDFCell;

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Lcom/radaee/view/GLLayoutDual$PDFCell;-><init>(Lcom/radaee/view/GLLayoutDual$1;)V

    aput-object v13, v12, v4

    .line 220
    :cond_f
    iget-object v12, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object v12, v12, v4

    if-nez v12, :cond_10

    const/16 v16, 0x1

    goto/16 :goto_b

    .line 223
    :cond_10
    invoke-static {v1, v4}, Lcom/radaee/view/GLLayoutDual;->dual_at([ZI)Z

    move-result v13

    const/4 v14, -0x1

    if-eqz v13, :cond_13

    .line 224
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    sub-int/2addr v13, v10

    if-ge v6, v13, :cond_12

    .line 225
    iget-object v13, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v14, v6, 0x1

    invoke-virtual {v13, v14}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v13

    add-float/2addr v9, v13

    .line 226
    iget-object v13, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v13, v14}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    cmpg-float v15, v11, v13

    if-gez v15, :cond_11

    move v11, v13

    .line 229
    :cond_11
    iput v6, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    .line 230
    iput v14, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    add-int/lit8 v6, v6, 0x2

    goto :goto_8

    :cond_12
    add-int/lit8 v13, v6, 0x1

    .line 233
    iput v6, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    .line 234
    iput v14, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    goto :goto_7

    :cond_13
    add-int/lit8 v13, v6, 0x1

    .line 237
    iput v6, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    .line 238
    iput v14, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    :goto_7
    move v6, v13

    .line 240
    :goto_8
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_mode:I

    const/4 v14, 0x2

    if-eq v13, v10, :cond_17

    if-eq v13, v14, :cond_16

    const/4 v15, 0x3

    if-eq v13, v15, :cond_14

    const/high16 v13, 0x3f800000    # 1.0f

    .line 255
    iput v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    goto :goto_9

    .line 250
    :cond_14
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v13, v15

    int-to-float v13, v13

    div-float/2addr v13, v9

    .line 251
    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v15, v14

    int-to-float v14, v15

    div-float/2addr v14, v11

    cmpl-float v15, v13, v14

    if-lez v15, :cond_15

    move v13, v14

    .line 252
    :cond_15
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    div-float/2addr v13, v14

    iput v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    goto :goto_9

    :cond_16
    int-to-float v13, v3

    div-float/2addr v13, v11

    .line 247
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    div-float/2addr v13, v14

    iput v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    goto :goto_9

    :cond_17
    int-to-float v13, v2

    div-float/2addr v13, v9

    .line 243
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    div-float/2addr v13, v14

    iput v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    .line 258
    :goto_9
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    iput v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    mul-float v9, v9, v5

    .line 259
    iget v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v9, v9, v13

    float-to-int v9, v9

    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    add-int/2addr v9, v13

    mul-float v11, v11, v5

    .line 260
    iget v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v11, v11, v13

    float-to-int v11, v11

    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    add-int/2addr v11, v13

    .line 261
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/2addr v13, v10

    .line 262
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/2addr v14, v10

    .line 263
    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-ge v9, v15, :cond_18

    .line 264
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v13, v9

    shr-int/2addr v13, v10

    .line 265
    iget v9, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    .line 267
    :cond_18
    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_align_type:I

    if-eq v15, v10, :cond_1a

    const/4 v10, 0x2

    const/16 v16, 0x1

    if-eq v15, v10, :cond_19

    .line 280
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-ge v11, v10, :cond_1b

    .line 281
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr v10, v11

    shr-int/lit8 v14, v10, 0x1

    .line 282
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    goto :goto_a

    .line 274
    :cond_19
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-ge v11, v10, :cond_1b

    .line 275
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr v10, v11

    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/lit8 v11, v11, 0x1

    sub-int v14, v10, v11

    .line 276
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    goto :goto_a

    :cond_1a
    const/16 v16, 0x1

    .line 269
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-ge v11, v10, :cond_1b

    .line 270
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    .line 286
    :cond_1b
    :goto_a
    iget v10, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    add-int/2addr v10, v9

    iput v10, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    .line 287
    iget-object v9, v0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v10, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    aget-object v9, v9, v10

    .line 288
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    add-int/2addr v10, v13

    iget v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v13, v13, v5

    invoke-virtual {v9, v10, v14, v13}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_1c

    .line 289
    invoke-virtual {v9}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 290
    :cond_1c
    iget v10, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-ltz v10, :cond_1d

    .line 291
    iget-object v10, v0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    aget-object v10, v10, v13

    .line 292
    invoke-virtual {v9}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result v9

    iget v13, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v13, v13, v5

    invoke-virtual {v10, v9, v14, v13}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_1d

    .line 293
    invoke-virtual {v10}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 295
    :cond_1d
    iget v9, v12, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iput v9, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    .line 296
    iget v9, v0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    if-ge v9, v11, :cond_1e

    iput v11, v0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    :cond_1e
    :goto_b
    add-int/lit8 v4, v4, 0x1

    const/4 v10, 0x1

    goto/16 :goto_6

    :cond_1f
    :goto_c
    return-void
.end method

.method private layout_rtol(FZ[Z)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    .line 301
    iget v2, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-lez v2, :cond_20

    iget v2, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-gtz v2, :cond_0

    goto/16 :goto_c

    :cond_0
    const/high16 v2, 0x40000000    # 2.0f

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 309
    :goto_0
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    const/4 v11, 0x1

    if-ge v7, v10, :cond_9

    .line 310
    iget-object v10, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v10, v7}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v10

    .line 311
    iget-object v12, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v12, v7}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    .line 312
    invoke-static {v1, v8}, Lcom/radaee/view/GLLayoutDual;->dual_at([ZI)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 313
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    sub-int/2addr v13, v11

    if-ge v7, v13, :cond_2

    .line 314
    iget-object v13, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v14, v7, 0x1

    invoke-virtual {v13, v14}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v13

    add-float/2addr v10, v13

    .line 315
    iget-object v13, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v13, v14}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    cmpg-float v14, v12, v13

    if-gez v14, :cond_1

    move v12, v13

    :cond_1
    add-int/lit8 v7, v7, 0x2

    .line 318
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    if-ne v7, v13, :cond_3

    const/4 v9, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v7, v7, 0x1

    :cond_3
    :goto_1
    cmpg-float v11, v5, v10

    if-gez v11, :cond_4

    move v5, v10

    :cond_4
    cmpg-float v11, v6, v12

    if-gez v11, :cond_5

    move v6, v12

    .line 323
    :cond_5
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v11, v13

    int-to-float v11, v11

    div-float/2addr v11, v10

    .line 324
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v13, v14

    int-to-float v13, v13

    div-float/2addr v13, v12

    cmpl-float v14, v11, v13

    if-lez v14, :cond_6

    move v11, v13

    :cond_6
    mul-float v10, v10, v11

    mul-float v12, v12, v11

    float-to-int v10, v10

    if-le v2, v10, :cond_7

    move v2, v10

    :cond_7
    float-to-int v10, v12

    if-le v3, v10, :cond_8

    move v3, v10

    :cond_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 333
    :cond_9
    iget-object v7, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    if-eqz v7, :cond_b

    array-length v7, v7

    if-eq v7, v8, :cond_a

    goto :goto_2

    :cond_a
    const/4 v7, 0x0

    goto :goto_3

    :cond_b
    :goto_2
    const/4 v7, 0x1

    :goto_3
    if-eqz v7, :cond_c

    .line 334
    new-array v10, v8, [Lcom/radaee/view/GLLayoutDual$PDFCell;

    iput-object v10, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    .line 335
    :cond_c
    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v10, v12

    int-to-float v10, v10

    div-float/2addr v10, v5

    iput v10, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    .line 337
    iget v5, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    iget v10, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v5, v10

    int-to-float v5, v5

    div-float/2addr v5, v6

    .line 338
    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    cmpl-float v6, v6, v5

    if-lez v6, :cond_d

    iput v5, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    .line 339
    :cond_d
    iget v5, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    sget v6, Lcom/radaee/view/GLLayoutDual;->m_max_zoom:F

    mul-float v5, v5, v6

    .line 340
    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    cmpg-float v6, p1, v6

    if-gez v6, :cond_e

    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    goto :goto_4

    :cond_e
    move/from16 v6, p1

    :goto_4
    cmpl-float v10, v6, v5

    if-lez v10, :cond_f

    goto :goto_5

    :cond_f
    move v5, v6

    .line 343
    :goto_5
    iput v5, v0, Lcom/radaee/view/GLLayoutDual;->m_scale:F

    .line 344
    iput v4, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    .line 345
    iput v4, v0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    .line 346
    iget v6, v0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    sub-int/2addr v6, v11

    const/4 v10, 0x0

    :goto_6
    if-ge v10, v8, :cond_20

    .line 348
    iget-object v12, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v12, v6}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v12

    .line 349
    iget-object v13, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v13, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    if-eqz v7, :cond_10

    .line 350
    iget-object v14, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    new-instance v15, Lcom/radaee/view/GLLayoutDual$PDFCell;

    const/4 v4, 0x0

    invoke-direct {v15, v4}, Lcom/radaee/view/GLLayoutDual$PDFCell;-><init>(Lcom/radaee/view/GLLayoutDual$1;)V

    aput-object v15, v14, v10

    .line 351
    :cond_10
    iget-object v4, v0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object v4, v4, v10

    sub-int v14, v8, v10

    sub-int/2addr v14, v11

    .line 352
    invoke-static {v1, v14}, Lcom/radaee/view/GLLayoutDual;->dual_at([ZI)Z

    move-result v14

    const/4 v15, -0x1

    if-eqz v14, :cond_14

    if-gtz v6, :cond_12

    if-eqz v9, :cond_11

    goto :goto_7

    :cond_11
    add-int/lit8 v14, v6, -0x1

    .line 364
    iput v6, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    .line 365
    iput v15, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    goto :goto_8

    .line 356
    :cond_12
    :goto_7
    iget-object v9, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v14, v6, -0x1

    invoke-virtual {v9, v14}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    add-float/2addr v12, v9

    .line 357
    iget-object v9, v0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v14}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    cmpg-float v15, v13, v9

    if-gez v15, :cond_13

    move v13, v9

    .line 360
    :cond_13
    iput v14, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    .line 361
    iput v6, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    add-int/lit8 v6, v6, -0x2

    const/4 v9, 0x0

    goto :goto_9

    :cond_14
    add-int/lit8 v14, v6, -0x1

    .line 368
    iput v6, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    .line 369
    iput v15, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    :goto_8
    move v6, v14

    .line 371
    :goto_9
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_mode:I

    const/4 v15, 0x2

    if-eq v14, v11, :cond_18

    if-eq v14, v15, :cond_17

    const/4 v15, 0x3

    if-eq v14, v15, :cond_15

    const/high16 v14, 0x3f800000    # 1.0f

    .line 386
    iput v14, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    const/16 v16, 0x1

    goto :goto_a

    .line 381
    :cond_15
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v14, v15

    int-to-float v14, v14

    div-float/2addr v14, v12

    .line 382
    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    const/16 v16, 0x1

    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    sub-int/2addr v15, v11

    int-to-float v11, v15

    div-float/2addr v11, v13

    cmpl-float v15, v14, v11

    if-lez v15, :cond_16

    move v14, v11

    .line 383
    :cond_16
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    div-float/2addr v14, v11

    iput v14, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    goto :goto_a

    :cond_17
    const/16 v16, 0x1

    int-to-float v11, v3

    div-float/2addr v11, v13

    .line 378
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    div-float/2addr v11, v14

    iput v11, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    goto :goto_a

    :cond_18
    const/16 v16, 0x1

    int-to-float v11, v2

    div-float/2addr v11, v12

    .line 374
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_scale_min:F

    div-float/2addr v11, v14

    iput v11, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    .line 389
    :goto_a
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    iput v11, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    mul-float v12, v12, v5

    .line 390
    iget v11, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v12, v12, v11

    float-to-int v11, v12

    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    add-int/2addr v11, v12

    mul-float v13, v13, v5

    .line 391
    iget v12, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v13, v13, v12

    float-to-int v12, v13

    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    add-int/2addr v12, v13

    .line 392
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/lit8 v13, v13, 0x1

    .line 393
    iget v14, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/lit8 v14, v14, 0x1

    .line 394
    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-ge v11, v15, :cond_19

    .line 395
    iget v13, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v13, v11

    shr-int/lit8 v13, v13, 0x1

    .line 396
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    .line 398
    :cond_19
    iget v15, v0, Lcom/radaee/view/GLLayoutDual;->m_align_type:I

    const/4 v1, 0x1

    if-eq v15, v1, :cond_1b

    const/4 v1, 0x2

    const/16 v16, 0x1

    if-eq v15, v1, :cond_1a

    .line 411
    iget v1, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-ge v12, v1, :cond_1c

    .line 412
    iget v1, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr v1, v12

    shr-int/lit8 v14, v1, 0x1

    .line 413
    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    goto :goto_b

    .line 405
    :cond_1a
    iget v1, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-ge v12, v1, :cond_1c

    .line 406
    iget v1, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr v1, v12

    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/lit8 v12, v12, 0x1

    sub-int v14, v1, v12

    .line 407
    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    goto :goto_b

    :cond_1b
    const/16 v16, 0x1

    .line 400
    iget v1, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-ge v12, v1, :cond_1c

    .line 401
    iget v12, v0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    .line 417
    :cond_1c
    :goto_b
    iget v1, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    add-int/2addr v1, v11

    iput v1, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    .line 418
    iget-object v1, v0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v11, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    aget-object v1, v1, v11

    .line 419
    iget v11, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    add-int/2addr v11, v13

    iget v13, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v13, v13, v5

    invoke-virtual {v1, v11, v14, v13}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_1d

    .line 420
    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 421
    :cond_1d
    iget v11, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-ltz v11, :cond_1e

    .line 422
    iget-object v11, v0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v13, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    aget-object v11, v11, v13

    .line 423
    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result v1

    iget v13, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->scale:F

    mul-float v13, v13, v5

    invoke-virtual {v11, v1, v14, v13}, Lcom/radaee/view/GLPage;->gl_layout(IIF)V

    if-nez p2, :cond_1e

    .line 424
    invoke-virtual {v11}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 426
    :cond_1e
    iget v1, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iput v1, v0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    .line 427
    iget v1, v0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    if-ge v1, v12, :cond_1f

    iput v12, v0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    :cond_1f
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v1, p3

    const/4 v4, 0x0

    const/4 v11, 0x1

    goto/16 :goto_6

    :cond_20
    :goto_c
    return-void
.end method

.method private range_p0(II)I
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetX()I

    move-result p2

    add-int/2addr p1, p2

    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 46
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v0, p2

    if-lt p1, v0, :cond_1

    array-length p1, p2

    add-int/lit8 p1, p1, -0x1

    .line 47
    :cond_1
    aget-object p1, p2, p1

    .line 48
    iget p2, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-gez p2, :cond_2

    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    return p1

    .line 49
    :cond_2
    iget p2, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    iget v0, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-le p2, v0, :cond_3

    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    return p1

    .line 50
    :cond_3
    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    return p1
.end method

.method private range_p1(II)I
    .locals 1

    .line 54
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetX()I

    move-result p2

    add-int/2addr p1, p2

    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 56
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v0, p2

    if-lt p1, v0, :cond_1

    array-length p1, p2

    add-int/lit8 p1, p1, -0x1

    .line 57
    :cond_1
    aget-object p1, p2, p1

    .line 58
    iget p2, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-gez p2, :cond_2

    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    return p1

    .line 59
    :cond_2
    iget p2, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    iget v0, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-le p2, v0, :cond_3

    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    return p1

    .line 60
    :cond_3
    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    return p1
.end method

.method private scrollerStartScroll(IIII)V
    .locals 6

    .line 668
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-static {}, Lcom/radaee/pdf/Global;->scrollDuration()I

    move-result v5

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method


# virtual methods
.method public gl_draw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 9

    .line 131
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    goto :goto_1

    .line 132
    :cond_0
    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayoutDual;->gl_flush_range(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 133
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetX()I

    move-result v5

    .line 134
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetY()I

    move-result v6

    .line 135
    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    :goto_0
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    if-ge v0, v1, :cond_1

    .line 136
    iget-object v1, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v1, v1, v0

    iget-object v3, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    iget v4, p0, Lcom/radaee/view/GLLayoutDual;->m_def_text:I

    iget v7, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v8, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    move-object v2, p1

    invoke-virtual/range {v1 .. v8}, Lcom/radaee/view/GLPage;->gl_draw2(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;IIIII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public gl_fling(IIFFFF)Z
    .locals 6

    .line 472
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    const/4 p2, 0x0

    if-nez p1, :cond_0

    return p2

    .line 473
    :cond_0
    sget p1, Lcom/radaee/pdf/Global;->fling_speed:F

    mul-float p5, p5, p1

    .line 474
    sget p1, Lcom/radaee/pdf/Global;->fling_speed:F

    mul-float p6, p6, p1

    .line 476
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetX()I

    move-result p1

    .line 477
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetY()I

    move-result p3

    float-to-int p4, p5

    sub-int p4, p1, p4

    float-to-int v0, p6

    sub-int v0, p3, v0

    .line 480
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v1, v2

    if-le p4, v1, :cond_1

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p4, v1

    :cond_1
    if-gez p4, :cond_2

    const/4 p4, 0x0

    .line 482
    :cond_2
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr v1, v2

    if-le v0, v1, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr v0, v1

    :cond_3
    if-gez v0, :cond_4

    const/4 v0, 0x0

    .line 484
    :cond_4
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, p1

    invoke-direct {p0, v1}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result v1

    .line 485
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, p4

    invoke-direct {p0, v2}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result v2

    if-le v2, v1, :cond_5

    add-int/lit8 v2, v1, 0x1

    :cond_5
    if-ge v2, v1, :cond_6

    add-int/lit8 v2, v1, -0x1

    .line 488
    :cond_6
    iget-object v3, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 489
    iget-object v3, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/Scroller;->forceFinished(Z)V

    if-ge v1, v2, :cond_9

    .line 492
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length p4, p2

    if-ne v2, p4, :cond_7

    sub-int/2addr v2, v4

    .line 493
    aget-object p2, p2, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 495
    :cond_7
    aget-object p2, p2, v1

    .line 496
    iget p4, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p5, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p4, p5

    if-ge p1, p4, :cond_8

    .line 497
    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 499
    :cond_8
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    :cond_9
    if-le v1, v2, :cond_c

    if-gez v2, :cond_a

    neg-int p4, p1

    .line 503
    invoke-direct {p0, p1, p3, p4, p2}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 505
    :cond_a
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v1

    .line 506
    iget p4, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    if-le p1, p4, :cond_b

    .line 507
    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 509
    :cond_b
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 512
    :cond_c
    iget-object v1, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object v1, v1, v2

    .line 513
    iget v3, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    add-int/2addr v3, p4

    iget v5, v1, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    if-le v3, v5, :cond_f

    .line 514
    iget p2, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p4, p2

    iget p2, v1, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    if-le p4, p2, :cond_e

    add-int/lit8 p2, v2, 0x1

    .line 516
    iget-object p4, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length p5, p4

    if-ne p2, p5, :cond_d

    .line 517
    aget-object p2, p4, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 519
    :cond_d
    aget-object p2, p4, p2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_1

    .line 521
    :cond_e
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto :goto_1

    .line 523
    :cond_f
    iget v3, v1, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    if-ge p4, v3, :cond_12

    .line 524
    iget p2, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p4, p2

    iget p2, v1, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    if-ge p4, p2, :cond_11

    add-int/lit8 p2, v2, -0x1

    const/4 p4, -0x1

    if-ne p2, p4, :cond_10

    .line 527
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto :goto_1

    .line 529
    :cond_10
    iget-object p4, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p4, p2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto :goto_1

    .line 531
    :cond_11
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v2

    iget p2, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr v0, p3

    invoke-direct {p0, p1, p3, p2, v0}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    goto :goto_1

    :cond_12
    const p4, 0x3e99999a    # 0.3f

    mul-float p5, p5, p4

    float-to-int p5, p5

    sub-int p5, p1, p5

    mul-float p6, p6, p4

    float-to-int p4, p6

    sub-int p4, p3, p4

    .line 537
    iget p6, p0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p6, v0

    if-le p5, p6, :cond_13

    iget p5, p0, Lcom/radaee/view/GLLayoutDual;->m_layw:I

    iget p6, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p5, p6

    :cond_13
    if-gez p5, :cond_14

    const/4 p5, 0x0

    .line 539
    :cond_14
    iget p6, p0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr p6, v0

    if-le p4, p6, :cond_15

    iget p4, p0, Lcom/radaee/view/GLLayoutDual;->m_layh:I

    iget p6, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sub-int/2addr p4, p6

    :cond_15
    if-gez p4, :cond_16

    goto :goto_0

    :cond_16
    move p2, p4

    :goto_0
    sub-int/2addr p5, p1

    sub-int/2addr p2, p3

    .line 542
    invoke-direct {p0, p1, p3, p5, p2}, Lcom/radaee/view/GLLayoutDual;->do_scroll(IIII)V

    :goto_1
    return v4
.end method

.method protected gl_flush_range(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 7

    .line 65
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    if-le v0, v1, :cond_0

    return-void

    .line 68
    :cond_0
    iget-boolean v0, p0, Lcom/radaee/view/GLLayoutDual;->m_rtol:Z

    if-eqz v0, :cond_1

    .line 70
    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    neg-int v0, v0

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr v0, v1

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v1, v1

    invoke-direct {p0, v0, v1}, Lcom/radaee/view/GLLayoutDual;->range_p1(II)I

    move-result v0

    .line 71
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    mul-int/lit8 v1, v1, 0x2

    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sget v3, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v3

    invoke-direct {p0, v1, v2}, Lcom/radaee/view/GLLayoutDual;->range_p0(II)I

    move-result v1

    goto :goto_0

    .line 75
    :cond_1
    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    neg-int v0, v0

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr v0, v1

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    neg-int v1, v1

    invoke-direct {p0, v0, v1}, Lcom/radaee/view/GLLayoutDual;->range_p0(II)I

    move-result v0

    .line 76
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    mul-int/lit8 v1, v1, 0x2

    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    sget v3, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v3

    invoke-direct {p0, v1, v2}, Lcom/radaee/view/GLLayoutDual;->range_p1(II)I

    move-result v1

    :goto_0
    if-ltz v0, :cond_7

    if-ltz v1, :cond_7

    if-le v0, v1, :cond_2

    goto :goto_1

    :cond_2
    move v6, v1

    move v1, v0

    move v0, v6

    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 87
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    if-ge v2, v1, :cond_4

    .line 89
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    .line 91
    iget v3, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    if-le v1, v3, :cond_3

    iget v3, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    goto :goto_2

    :cond_3
    move v3, v1

    :goto_2
    if-ge v2, v3, :cond_4

    .line 94
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v2

    .line 95
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 96
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 100
    :cond_4
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    if-le v2, v0, :cond_6

    .line 103
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    .line 104
    iget v3, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    if-ge v0, v3, :cond_5

    iget v3, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    goto :goto_3

    :cond_5
    move v3, v0

    :goto_3
    if-ge v3, v2, :cond_6

    .line 107
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v3

    .line 108
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 109
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    move v6, v1

    move v1, v0

    move v0, v6

    goto :goto_5

    .line 116
    :cond_7
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    .line 117
    iget v3, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    :goto_4
    if-ge v2, v3, :cond_8

    .line 120
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object v4, v4, v2

    .line 121
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 122
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_thread:Lcom/radaee/view/GLThread;

    invoke-virtual {v4, p1, v5}, Lcom/radaee/view/GLPage;->gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 126
    :cond_8
    :goto_5
    iput v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno1:I

    .line 127
    iput v1, p0, Lcom/radaee/view/GLLayoutDual;->m_pageno2:I

    return-void
.end method

.method public gl_layout(FZ)V
    .locals 2

    .line 433
    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-le v0, v1, :cond_1

    .line 435
    iget-boolean v0, p0, Lcom/radaee/view/GLLayoutDual;->m_rtol:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_horz_dual:[Z

    invoke-direct {p0, p1, p2, v0}, Lcom/radaee/view/GLLayoutDual;->layout_ltor(FZ[Z)V

    return-void

    .line 436
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_horz_dual:[Z

    invoke-direct {p0, p1, p2, v0}, Lcom/radaee/view/GLLayoutDual;->layout_rtol(FZ[Z)V

    return-void

    .line 439
    :cond_1
    iget-boolean v0, p0, Lcom/radaee/view/GLLayoutDual;->m_rtol:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vert_dual:[Z

    invoke-direct {p0, p1, p2, v0}, Lcom/radaee/view/GLLayoutDual;->layout_ltor(FZ[Z)V

    return-void

    .line 440
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vert_dual:[Z

    invoke-direct {p0, p1, p2, v0}, Lcom/radaee/view/GLLayoutDual;->layout_rtol(FZ[Z)V

    return-void
.end method

.method public gl_move_end()V
    .locals 8

    .line 551
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetX()I

    move-result v0

    .line 552
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetY()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 553
    :goto_0
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v5, v4

    if-ge v3, v5, :cond_4

    .line 554
    aget-object v4, v4, v3

    .line 555
    iget v5, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    if-ge v0, v5, :cond_3

    .line 556
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->abortAnimation()V

    .line 557
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 558
    iget v5, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget v7, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v5, v7

    if-gt v0, v5, :cond_0

    goto :goto_1

    .line 559
    :cond_0
    iget v5, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr v5, v0

    iget v7, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    shr-int/2addr v7, v6

    if-le v5, v7, :cond_1

    .line 560
    iget v3, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr v3, v0

    iget v4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v3, v4

    invoke-direct {p0, v0, v1, v3, v2}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 561
    :cond_1
    iget-object v5, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v5, v5

    sub-int/2addr v5, v6

    if-ge v3, v5, :cond_2

    .line 562
    iget v3, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr v3, v0

    invoke-direct {p0, v0, v1, v3, v2}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 564
    :cond_2
    iget v3, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr v3, v0

    iget v4, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v3, v4

    invoke-direct {p0, v0, v1, v3, v2}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    return-void
.end method

.method public gl_zoom_confirm(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 6

    const/4 v0, 0x0

    .line 634
    iput-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    .line 635
    invoke-super {p0, p1}, Lcom/radaee/view/GLLayout;->gl_zoom_confirm(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 636
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 637
    iget p1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    div-int/lit8 p1, p1, 0x2

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/radaee/view/GLLayoutDual;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    .line 639
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-lez v0, :cond_6

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-lez v0, :cond_6

    iget v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    if-ltz v0, :cond_6

    iget v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    if-lt v0, v1, :cond_0

    goto :goto_2

    .line 641
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->gl_abort_scroll()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 643
    :goto_0
    iget-object v2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v3, v2

    if-ge v1, v3, :cond_6

    .line 644
    aget-object v2, v2, v1

    .line 645
    iget v3, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget v4, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    if-eq v3, v4, :cond_2

    iget v3, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget v4, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 646
    :cond_2
    :goto_1
    iget p1, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    .line 647
    iget v1, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr v1, p1

    .line 648
    iget-object v3, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v3

    .line 649
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v4

    .line 650
    iget v5, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-gt v1, v5, :cond_4

    .line 651
    iget v5, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr v1, v5

    shr-int/lit8 v1, v1, 0x1

    add-int/2addr v1, p1

    if-lt v3, p1, :cond_3

    .line 652
    iget p1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    add-int/2addr p1, v3

    iget v2, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    if-le p1, v2, :cond_6

    :cond_3
    sub-int/2addr v1, v3

    .line 653
    invoke-direct {p0, v3, v4, v1, v0}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 655
    :cond_4
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p1, v1

    .line 656
    iget v1, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    if-ge v3, p1, :cond_5

    sub-int/2addr p1, v3

    .line 658
    invoke-direct {p0, v3, v4, p1, v0}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 659
    :cond_5
    iget p1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    add-int/2addr p1, v3

    if-le p1, v1, :cond_6

    .line 660
    iget p1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    add-int/2addr p1, v3

    sub-int/2addr v1, p1

    invoke-direct {p0, v3, v4, v1, v0}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    :cond_6
    :goto_2
    return-void
.end method

.method public gl_zoom_set_pos(IILcom/radaee/view/GLLayout$PDFPos;)V
    .locals 4

    if-eqz p3, :cond_6

    .line 614
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    if-eqz v0, :cond_6

    iget v0, p3, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    if-ltz v0, :cond_6

    iget v0, p3, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 615
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v1, p3, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    aget-object v0, v0, v1

    .line 616
    iget-object v1, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    if-nez v1, :cond_3

    .line 617
    iget v1, p3, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result v1

    if-gez v1, :cond_1

    const/4 v1, 0x0

    .line 619
    :cond_1
    iget-object v2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v3, v2

    if-lt v1, v3, :cond_2

    array-length v1, v2

    add-int/lit8 v1, v1, -0x1

    .line 620
    :cond_2
    aget-object v1, v2, v1

    iput-object v1, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    .line 622
    :cond_3
    iget v1, p3, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v1

    sub-int/2addr v1, p1

    .line 623
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    if-ge v1, p1, :cond_4

    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    iget v1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    .line 624
    :cond_4
    iget p1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    add-int/2addr p1, v1

    iget-object v2, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    iget v2, v2, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    if-le p1, v2, :cond_5

    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_zoom_cell:Lcom/radaee/view/GLLayoutDual$PDFCell;

    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int v1, p1, v1

    .line 625
    :cond_5
    invoke-virtual {p0, v1}, Lcom/radaee/view/GLLayoutDual;->vSetX(I)V

    .line 626
    iget p1, p3, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    invoke-virtual {v0, p1}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLLayoutDual;->vSetY(I)V

    .line 627
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 628
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 629
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p2}, Landroid/widget/Scroller;->getCurrY()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalY(I)V

    :cond_6
    :goto_0
    return-void
.end method

.method public vGetPage(II)I
    .locals 6

    .line 140
    iget p2, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-lez p2, :cond_8

    iget p2, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-lez p2, :cond_8

    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    if-nez p2, :cond_0

    goto :goto_3

    .line 141
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->vGetX()I

    move-result p2

    add-int/2addr p1, p2

    .line 143
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length p2, p2

    add-int/lit8 p2, p2, -0x1

    .line 144
    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_page_gap:I

    shr-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-lt p2, v2, :cond_5

    add-int v3, v2, p2

    shr-int/lit8 v3, v3, 0x1

    .line 147
    iget-object v4, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object v4, v4, v3

    if-nez v4, :cond_1

    goto :goto_1

    .line 149
    :cond_1
    iget v5, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    sub-int/2addr v5, v0

    if-ge p1, v5, :cond_2

    add-int/lit8 v3, v3, -0x1

    move p2, v3

    goto :goto_0

    .line 151
    :cond_2
    iget v2, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    add-int/2addr v2, v0

    if-lt p1, v2, :cond_3

    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    .line 154
    :cond_3
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v0, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    aget-object p2, p2, v0

    .line 155
    invoke-virtual {p2}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result p2

    if-lt p1, p2, :cond_4

    iget p1, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-ltz p1, :cond_4

    iget p1, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    return p1

    .line 156
    :cond_4
    iget p1, v4, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    return p1

    :cond_5
    :goto_1
    if-gez p2, :cond_6

    goto :goto_2

    :cond_6
    move v1, p2

    .line 160
    :goto_2
    iget-object p2, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    aget-object p2, p2, v1

    .line 161
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    iget v1, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    aget-object v0, v0, v1

    .line 162
    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result v0

    if-lt p1, v0, :cond_7

    iget p1, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    if-ltz p1, :cond_7

    iget p1, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_right:I

    return p1

    .line 163
    :cond_7
    iget p1, p2, Lcom/radaee/view/GLLayoutDual$PDFCell;->page_left:I

    return p1

    :cond_8
    :goto_3
    const/4 p1, -0x1

    return p1
.end method

.method public vGotoPage(I)V
    .locals 2

    .line 574
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-lez v0, :cond_3

    if-ltz p1, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 576
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->gl_abort_scroll()V

    .line 577
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object p1, v0, p1

    .line 578
    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetLeft()I

    move-result v0

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result p1

    add-int/2addr v0, p1

    shr-int/lit8 p1, v0, 0x1

    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result p1

    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 580
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v1, v0

    if-lt p1, v1, :cond_2

    array-length p1, v0

    add-int/lit8 p1, p1, -0x1

    .line 581
    :cond_2
    aget-object p1, v0, p1

    .line 582
    iget v0, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    .line 583
    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr p1, v0

    .line 584
    iget v1, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p1, v1

    shr-int/lit8 p1, p1, 0x1

    add-int/2addr v0, p1

    .line 585
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 586
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 587
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    :cond_3
    :goto_0
    return-void
.end method

.method public vScrolltoPage(I)V
    .locals 3

    .line 592
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_vh:I

    if-lez v0, :cond_3

    if-ltz p1, :cond_3

    iget v0, p0, Lcom/radaee/view/GLLayoutDual;->m_page_cnt:I

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 594
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/GLLayoutDual;->gl_abort_scroll()V

    .line 595
    iget-object v0, p0, Lcom/radaee/view/GLLayoutDual;->m_pages:[Lcom/radaee/view/GLPage;

    aget-object p1, v0, p1

    .line 596
    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetLeft()I

    move-result v0

    invoke-virtual {p1}, Lcom/radaee/view/GLPage;->GetRight()I

    move-result p1

    add-int/2addr v0, p1

    shr-int/lit8 p1, v0, 0x1

    invoke-direct {p0, p1}, Lcom/radaee/view/GLLayoutDual;->get_cell(I)I

    move-result p1

    const/4 v0, 0x0

    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 598
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/GLLayoutDual;->m_cells:[Lcom/radaee/view/GLLayoutDual$PDFCell;

    array-length v2, v1

    if-lt p1, v2, :cond_2

    array-length p1, v1

    add-int/lit8 p1, p1, -0x1

    .line 599
    :cond_2
    aget-object p1, v1, p1

    .line 601
    iget v1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->left:I

    .line 602
    iget p1, p1, Lcom/radaee/view/GLLayoutDual$PDFCell;->right:I

    sub-int/2addr p1, v1

    .line 603
    iget v2, p0, Lcom/radaee/view/GLLayoutDual;->m_vw:I

    sub-int/2addr p1, v2

    shr-int/lit8 p1, p1, 0x1

    add-int/2addr v1, p1

    .line 604
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 605
    iget-object p1, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrX()I

    move-result p1

    .line 606
    iget-object v2, p0, Lcom/radaee/view/GLLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    sub-int/2addr v1, p1

    .line 607
    invoke-direct {p0, p1, v2, v1, v0}, Lcom/radaee/view/GLLayoutDual;->scrollerStartScroll(IIII)V

    :cond_3
    :goto_0
    return-void
.end method
