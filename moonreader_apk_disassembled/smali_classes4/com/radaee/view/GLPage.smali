.class public Lcom/radaee/view/GLPage;
.super Ljava/lang/Object;
.source "GLPage.java"

# interfaces
.implements Lcom/radaee/view/ILayoutView$IVPage;


# static fields
.field private static size_limit:I


# instance fields
.field private m_blks:[Lcom/radaee/view/GLBlock;

.field private m_blks_zoom:[Lcom/radaee/view/GLBlock;

.field private m_bottom:I

.field private m_curl:Z

.field private m_dirty:Z

.field private final m_doc:Lcom/radaee/pdf/Document;

.field private m_left:I

.field private final m_pageno:I

.field private m_ph:I

.field private m_pw:I

.field private m_right:I

.field private m_scale:F

.field private m_top:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/radaee/pdf/Document;I)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    .line 28
    iput p2, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    .line 30
    iput-object p1, p0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/radaee/view/GLPage;->m_dirty:Z

    return-void
.end method


# virtual methods
.method public final CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;
    .locals 4

    .line 391
    iget-boolean v0, p0, Lcom/radaee/view/GLPage;->m_curl:Z

    if-eqz v0, :cond_0

    .line 393
    new-instance p1, Lcom/radaee/pdf/Matrix;

    iget p2, p0, Lcom/radaee/view/GLPage;->m_scale:F

    neg-float v0, p2

    iget v1, p0, Lcom/radaee/view/GLPage;->m_right:I

    iget v2, p0, Lcom/radaee/view/GLPage;->m_left:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/radaee/view/GLPage;->m_pw:I

    sub-int/2addr v1, v2

    shr-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    iget v2, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v3, p0, Lcom/radaee/view/GLPage;->m_top:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/radaee/view/GLPage;->m_ph:I

    add-int/2addr v2, v3

    shr-int/lit8 v2, v2, 0x1

    int-to-float v2, v2

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 394
    invoke-virtual {p1}, Lcom/radaee/pdf/Matrix;->Invert()V

    return-object p1

    .line 397
    :cond_0
    new-instance v0, Lcom/radaee/pdf/Matrix;

    iget v1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    neg-float v2, v1

    iget v3, p0, Lcom/radaee/view/GLPage;->m_left:I

    int-to-float v3, v3

    sub-float/2addr v3, p1

    iget p1, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    int-to-float p1, p1

    sub-float/2addr p1, p2

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 398
    invoke-virtual {v0}, Lcom/radaee/pdf/Matrix;->Invert()V

    return-object v0
.end method

.method protected final GetBottom()I
    .locals 1

    .line 334
    iget v0, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    return v0
.end method

.method protected final GetHeight()I
    .locals 2

    .line 336
    iget v0, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v1, p0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int/2addr v0, v1

    return v0
.end method

.method protected final GetLeft()I
    .locals 1

    .line 331
    iget v0, p0, Lcom/radaee/view/GLPage;->m_left:I

    return v0
.end method

.method protected final GetPDFX(I)F
    .locals 2

    .line 339
    iget v0, p0, Lcom/radaee/view/GLPage;->m_right:I

    iget v1, p0, Lcom/radaee/view/GLPage;->m_left:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/radaee/view/GLPage;->m_pw:I

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iget v0, p0, Lcom/radaee/view/GLPage;->m_scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method protected final GetPDFY(I)F
    .locals 2

    .line 343
    iget v0, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v1, p0, Lcom/radaee/view/GLPage;->m_top:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/radaee/view/GLPage;->m_ph:I

    add-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    sub-int/2addr v0, p1

    int-to-float p1, v0

    iget v0, p0, Lcom/radaee/view/GLPage;->m_scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method public final GetPageNo()I
    .locals 1

    .line 330
    iget v0, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    return v0
.end method

.method protected final GetRight()I
    .locals 1

    .line 333
    iget v0, p0, Lcom/radaee/view/GLPage;->m_right:I

    return v0
.end method

.method public final GetScale()F
    .locals 1

    .line 387
    iget v0, p0, Lcom/radaee/view/GLPage;->m_scale:F

    return v0
.end method

.method protected final GetTop()I
    .locals 1

    .line 332
    iget v0, p0, Lcom/radaee/view/GLPage;->m_top:I

    return v0
.end method

.method public final GetVX(F)I
    .locals 2

    .line 381
    iget v0, p0, Lcom/radaee/view/GLPage;->m_right:I

    iget v1, p0, Lcom/radaee/view/GLPage;->m_left:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/radaee/view/GLPage;->m_pw:I

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    mul-float p1, p1, v1

    float-to-int p1, p1

    add-int/2addr v0, p1

    return v0
.end method

.method public final GetVY(F)I
    .locals 2

    .line 385
    iget v0, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v1, p0, Lcom/radaee/view/GLPage;->m_top:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/radaee/view/GLPage;->m_ph:I

    add-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    mul-float p1, p1, v1

    float-to-int p1, p1

    sub-int/2addr v0, p1

    return v0
.end method

.method protected final GetWidth()I
    .locals 2

    .line 335
    iget v0, p0, Lcom/radaee/view/GLPage;->m_right:I

    iget v1, p0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public Reflow(IFZ)Landroid/graphics/Bitmap;
    .locals 2

    .line 408
    sget v0, Lcom/radaee/view/GLPage;->size_limit:I

    if-gtz v0, :cond_0

    sget v0, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    mul-int v0, v0, v1

    mul-int/lit8 v0, v0, 0x4

    sput v0, Lcom/radaee/view/GLPage;->size_limit:I

    .line 409
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    int-to-float v1, p1

    .line 410
    invoke-virtual {v0, v1, p2, p3}, Lcom/radaee/pdf/Page;->ReflowStart(FFZ)F

    move-result p2

    float-to-int p2, p2

    mul-int p3, p1, p2

    .line 411
    sget v1, Lcom/radaee/view/GLPage;->size_limit:I

    if-le p3, v1, :cond_1

    .line 412
    div-int p2, v1, p1

    :cond_1
    mul-int p3, p1, p2

    if-gtz p3, :cond_2

    const/4 p1, 0x0

    return-object p1

    .line 414
    :cond_2
    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 p2, -0x1

    .line 415
    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    const/4 p2, 0x0

    .line 416
    invoke-virtual {v0, p1, p2, p2}, Lcom/radaee/pdf/Page;->ReflowToBmp(Landroid/graphics/Bitmap;FF)Z

    .line 417
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    return-object p1
.end method

.method public Reflow(IFI)Lcom/radaee/view/GLReflowCanvas;
    .locals 7

    .line 403
    new-instance v0, Lcom/radaee/view/GLReflowCanvas;

    iget-object v1, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    sget v5, Lcom/radaee/view/GLBlock;->m_cell_size:I

    move v4, p1

    move v3, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/radaee/view/GLReflowCanvas;-><init>(Lcom/radaee/pdf/Document;IFIII)V

    return-object v0
.end method

.method public final ToDIBX(F)F
    .locals 1

    .line 372
    iget v0, p0, Lcom/radaee/view/GLPage;->m_scale:F

    mul-float p1, p1, v0

    return p1
.end method

.method public final ToDIBY(F)F
    .locals 2

    .line 378
    iget v0, p0, Lcom/radaee/view/GLPage;->m_ph:I

    int-to-float v0, v0

    iget v1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    mul-float p1, p1, v1

    sub-float/2addr v0, p1

    return v0
.end method

.method public final ToPDFSize(F)F
    .locals 1

    .line 388
    iget v0, p0, Lcom/radaee/view/GLPage;->m_scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method public final ToPDFX(FF)F
    .locals 1

    .line 353
    iget-boolean v0, p0, Lcom/radaee/view/GLPage;->m_curl:Z

    if-eqz v0, :cond_0

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLPage;->GetPDFY(I)F

    move-result p1

    return p1

    :cond_0
    add-float/2addr p1, p2

    .line 354
    iget p2, p0, Lcom/radaee/view/GLPage;->m_left:I

    int-to-float p2, p2

    sub-float/2addr p1, p2

    iget p2, p0, Lcom/radaee/view/GLPage;->m_scale:F

    div-float/2addr p1, p2

    return p1
.end method

.method public final ToPDFY(FF)F
    .locals 1

    .line 364
    iget-boolean v0, p0, Lcom/radaee/view/GLPage;->m_curl:Z

    if-eqz v0, :cond_0

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Lcom/radaee/view/GLPage;->GetPDFY(I)F

    move-result p1

    return p1

    .line 365
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    int-to-float v0, v0

    sub-float/2addr v0, p1

    sub-float/2addr v0, p2

    iget p1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    div-float/2addr v0, p1

    return v0
.end method

.method protected final gl_alloc()V
    .locals 18

    move-object/from16 v0, p0

    .line 62
    :try_start_0
    iget v1, v0, Lcom/radaee/view/GLPage;->m_right:I

    iget v2, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int/2addr v1, v2

    .line 63
    iget v2, v0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v3, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int v12, v2, v3

    .line 64
    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    const/4 v3, 0x1

    shl-int/2addr v2, v3

    .line 65
    iget-boolean v4, v0, Lcom/radaee/view/GLPage;->m_curl:Z

    const/4 v13, 0x0

    if-nez v4, :cond_4

    sget v4, Lcom/radaee/view/GLBlock;->m_cell_size:I

    if-lez v4, :cond_4

    if-ge v1, v2, :cond_0

    if-lt v12, v2, :cond_4

    .line 67
    :cond_0
    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v1

    sub-int/2addr v2, v3

    sget v4, Lcom/radaee/view/GLBlock;->m_cell_size:I

    div-int/2addr v2, v4

    .line 68
    sget v4, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v4, v12

    sub-int/2addr v4, v3

    sget v3, Lcom/radaee/view/GLBlock;->m_cell_size:I

    div-int v3, v4, v3

    mul-int v4, v2, v3

    .line 69
    new-array v4, v4, [Lcom/radaee/view/GLBlock;

    iput-object v4, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    const/4 v9, 0x0

    const/4 v14, 0x0

    :goto_0
    if-ge v14, v3, :cond_5

    add-int/lit8 v4, v3, -0x1

    if-ge v14, v4, :cond_1

    .line 74
    sget v4, Lcom/radaee/view/GLBlock;->m_cell_size:I

    goto :goto_1

    :cond_1
    sub-int v4, v12, v9

    :goto_1
    move v11, v4

    const/4 v8, 0x0

    const/4 v15, 0x0

    :goto_2
    if-ge v15, v2, :cond_3

    add-int/lit8 v4, v2, -0x1

    if-ge v15, v4, :cond_2

    .line 77
    sget v4, Lcom/radaee/view/GLBlock;->m_cell_size:I

    goto :goto_3

    :cond_2
    sub-int v4, v1, v8

    :goto_3
    move v10, v4

    .line 78
    iget-object v4, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    mul-int v5, v14, v2

    add-int v16, v5, v15

    move-object v5, v4

    new-instance v4, Lcom/radaee/view/GLBlock;

    move-object v6, v5

    iget-object v5, v0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    move-object v7, v6

    iget v6, v0, Lcom/radaee/view/GLPage;->m_pageno:I

    move-object/from16 v17, v7

    iget v7, v0, Lcom/radaee/view/GLPage;->m_scale:F

    invoke-direct/range {v4 .. v12}, Lcom/radaee/view/GLBlock;-><init>(Lcom/radaee/pdf/Document;IFIIIII)V

    aput-object v4, v17, v16

    add-int/2addr v8, v10

    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    :cond_3
    add-int/2addr v9, v11

    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 86
    :cond_4
    new-array v1, v3, [Lcom/radaee/view/GLBlock;

    iput-object v1, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    .line 87
    new-instance v4, Lcom/radaee/view/GLBlock;

    iget-object v5, v0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v6, v0, Lcom/radaee/view/GLPage;->m_pageno:I

    iget v7, v0, Lcom/radaee/view/GLPage;->m_scale:F

    iget v2, v0, Lcom/radaee/view/GLPage;->m_right:I

    iget v3, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int v10, v2, v3

    iget v2, v0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v3, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int v11, v2, v3

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v12}, Lcom/radaee/view/GLBlock;-><init>(Lcom/radaee/pdf/Document;IFIIIII)V

    aput-object v4, v1, v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_5
    return-void
.end method

.method public final gl_draw(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;IIIII)V
    .locals 29

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p6

    move/from16 v3, p7

    .line 148
    iget-boolean v4, v0, Lcom/radaee/view/GLPage;->m_dirty:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 150
    iput-boolean v5, v0, Lcom/radaee/view/GLPage;->m_dirty:Z

    .line 151
    invoke-virtual/range {p0 .. p2}, Lcom/radaee/view/GLPage;->gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 152
    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 154
    :cond_0
    iget v4, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int v4, v4, p4

    .line 155
    iget v6, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int v6, v6, p5

    .line 156
    iget v7, v0, Lcom/radaee/view/GLPage;->m_right:I

    sub-int v7, v7, p4

    .line 157
    iget v8, v0, Lcom/radaee/view/GLPage;->m_bottom:I

    sub-int v8, v8, p5

    if-gez v4, :cond_1

    const/4 v4, 0x0

    :cond_1
    if-gez v6, :cond_2

    const/4 v6, 0x0

    :cond_2
    if-le v7, v2, :cond_3

    move v7, v2

    :cond_3
    if-le v8, v3, :cond_4

    move v8, v3

    :cond_4
    if-le v7, v4, :cond_5

    if-le v8, v6, :cond_5

    shl-int/lit8 v11, v4, 0x10

    shl-int/lit8 v12, v6, 0x10

    shl-int/lit8 v13, v7, 0x10

    shl-int/lit8 v16, v8, 0x10

    const/high16 v20, 0x3f800000    # 1.0f

    const/high16 v21, 0x3f800000    # 1.0f

    const/high16 v19, 0x3f800000    # 1.0f

    move v14, v12

    move v15, v11

    move/from16 v17, v13

    move/from16 v18, v16

    move-object/from16 v9, p1

    move/from16 v10, p3

    .line 163
    invoke-static/range {v9 .. v21}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    .line 164
    :cond_5
    iget v4, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int v4, v4, p4

    .line 165
    iget v6, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int v6, v6, p5

    .line 166
    iget-object v7, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    const/4 v8, 0x1

    if-eqz v7, :cond_9

    .line 168
    array-length v9, v7

    sub-int/2addr v9, v8

    aget-object v7, v7, v9

    if-nez v7, :cond_6

    goto/16 :goto_5

    .line 171
    :cond_6
    invoke-virtual {v7}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v9

    .line 172
    invoke-virtual {v7}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v7

    .line 173
    iget v10, v0, Lcom/radaee/view/GLPage;->m_right:I

    iget v11, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int/2addr v10, v11

    .line 174
    iget v11, v0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v12, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int/2addr v11, v12

    .line 175
    iget-object v12, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    array-length v13, v12

    const/4 v14, 0x0

    :goto_0
    if-ge v14, v13, :cond_9

    aget-object v22, v12, v14

    .line 177
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v15

    mul-int v15, v15, v10

    div-int/2addr v15, v9

    add-int/2addr v15, v4

    .line 178
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v16

    mul-int v16, v16, v11

    div-int v16, v16, v7

    add-int v5, v6, v16

    .line 179
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v16

    mul-int v16, v16, v10

    div-int v16, v16, v9

    add-int v27, v4, v16

    .line 180
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v16

    mul-int v16, v16, v11

    div-int v16, v16, v7

    add-int v28, v6, v16

    if-lez v27, :cond_8

    if-ge v15, v2, :cond_8

    if-lez v28, :cond_8

    if-lt v5, v3, :cond_7

    goto :goto_1

    .line 182
    :cond_7
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->gl_make_text()Z

    move-result v16

    if-eqz v16, :cond_8

    const/16 v24, -0x1

    move-object/from16 v23, p1

    move/from16 v26, v5

    move/from16 v25, v15

    invoke-virtual/range {v22 .. v28}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    :cond_8
    :goto_1
    add-int/lit8 v14, v14, 0x1

    const/4 v5, 0x0

    goto :goto_0

    .line 185
    :cond_9
    iget-object v5, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    if-nez v5, :cond_a

    goto/16 :goto_5

    :cond_a
    neg-int v5, v4

    .line 187
    sget v7, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr v5, v7

    neg-int v7, v6

    .line 188
    sget v9, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr v7, v9

    sub-int/2addr v2, v4

    .line 189
    sget v9, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v9

    sub-int/2addr v3, v6

    .line 190
    sget v9, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v3, v9

    .line 191
    iget-object v9, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    array-length v10, v9

    const/4 v11, 0x0

    :goto_2
    if-ge v11, v10, :cond_f

    aget-object v12, v9, v11

    if-eqz v12, :cond_e

    .line 192
    invoke-virtual {v12, v5, v7, v2, v3}, Lcom/radaee/view/GLBlock;->isCross(IIII)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 193
    invoke-virtual {v12}, Lcom/radaee/view/GLBlock;->gl_make_text()Z

    move-result v13

    if-nez v13, :cond_c

    .line 195
    invoke-virtual {v1, v12}, Lcom/radaee/view/GLThread;->render_start(Lcom/radaee/view/GLBlock;)V

    .line 196
    iget-object v8, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    if-nez v8, :cond_b

    .line 197
    invoke-virtual {v12}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v8

    add-int v25, v4, v8

    invoke-virtual {v12}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v8

    add-int v26, v6, v8

    invoke-virtual {v12}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v8

    add-int v27, v4, v8

    invoke-virtual {v12}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v8

    add-int v28, v6, v8

    move-object/from16 v23, p1

    move/from16 v24, p3

    move-object/from16 v22, v12

    invoke-virtual/range {v22 .. v28}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    :cond_b
    move-object/from16 v12, p1

    const/4 v8, 0x0

    goto :goto_4

    :cond_c
    move-object/from16 v22, v12

    .line 199
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v12

    add-int v25, v4, v12

    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v12

    add-int v26, v6, v12

    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v12

    add-int v27, v4, v12

    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v12

    add-int v28, v6, v12

    move-object/from16 v23, p1

    move/from16 v24, p3

    invoke-virtual/range {v22 .. v28}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    goto :goto_3

    :cond_d
    move-object v13, v12

    move-object/from16 v12, p1

    .line 200
    invoke-virtual {v1, v12, v13}, Lcom/radaee/view/GLThread;->render_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLBlock;)Z

    goto :goto_4

    :cond_e
    :goto_3
    move-object/from16 v12, p1

    :goto_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    :cond_f
    move-object/from16 v12, p1

    if-eqz v8, :cond_10

    .line 202
    invoke-virtual/range {p0 .. p2}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    :cond_10
    :goto_5
    return-void
.end method

.method public final gl_draw2(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;IIIII)V
    .locals 29

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p6

    move/from16 v3, p7

    .line 215
    iget-boolean v4, v0, Lcom/radaee/view/GLPage;->m_dirty:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 216
    iput-boolean v5, v0, Lcom/radaee/view/GLPage;->m_dirty:Z

    .line 217
    invoke-virtual/range {p0 .. p2}, Lcom/radaee/view/GLPage;->gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    .line 218
    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 220
    :cond_0
    iget v4, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int v4, v4, p4

    .line 221
    iget v6, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int v6, v6, p5

    .line 222
    iget v7, v0, Lcom/radaee/view/GLPage;->m_right:I

    sub-int v7, v7, p4

    .line 223
    iget v8, v0, Lcom/radaee/view/GLPage;->m_bottom:I

    sub-int v8, v8, p5

    if-gez v4, :cond_1

    const/4 v4, 0x0

    :cond_1
    if-gez v6, :cond_2

    const/4 v6, 0x0

    :cond_2
    if-le v7, v2, :cond_3

    move v7, v2

    :cond_3
    if-le v8, v3, :cond_4

    move v8, v3

    :cond_4
    if-le v7, v4, :cond_5

    if-le v8, v6, :cond_5

    shl-int/lit8 v11, v4, 0x10

    shl-int/lit8 v12, v6, 0x10

    shl-int/lit8 v13, v7, 0x10

    shl-int/lit8 v16, v8, 0x10

    const/high16 v20, 0x3f800000    # 1.0f

    const/high16 v21, 0x3f800000    # 1.0f

    const/high16 v19, 0x3f800000    # 1.0f

    move v14, v12

    move v15, v11

    move/from16 v17, v13

    move/from16 v18, v16

    move-object/from16 v9, p1

    move/from16 v10, p3

    .line 229
    invoke-static/range {v9 .. v21}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    .line 230
    :cond_5
    iget v4, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int v4, v4, p4

    .line 231
    iget v6, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int v6, v6, p5

    .line 232
    iget-object v7, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    const/4 v8, 0x1

    if-eqz v7, :cond_8

    .line 234
    array-length v9, v7

    sub-int/2addr v9, v8

    aget-object v7, v7, v9

    if-eqz v7, :cond_8

    .line 236
    invoke-virtual {v7}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v9

    .line 237
    invoke-virtual {v7}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v7

    .line 238
    iget v10, v0, Lcom/radaee/view/GLPage;->m_right:I

    iget v11, v0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int/2addr v10, v11

    .line 239
    iget v11, v0, Lcom/radaee/view/GLPage;->m_bottom:I

    iget v12, v0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int/2addr v11, v12

    .line 240
    iget-object v12, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    array-length v13, v12

    const/4 v14, 0x0

    :goto_0
    if-ge v14, v13, :cond_8

    aget-object v22, v12, v14

    .line 242
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v15

    mul-int v15, v15, v10

    div-int/2addr v15, v9

    add-int/2addr v15, v4

    .line 243
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v16

    mul-int v16, v16, v11

    div-int v16, v16, v7

    add-int v5, v6, v16

    .line 244
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v16

    mul-int v16, v16, v10

    div-int v16, v16, v9

    add-int v27, v4, v16

    .line 245
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v16

    mul-int v16, v16, v11

    div-int v16, v16, v7

    add-int v28, v6, v16

    if-lez v27, :cond_7

    if-ge v15, v2, :cond_7

    if-lez v28, :cond_7

    if-lt v5, v3, :cond_6

    goto :goto_1

    .line 247
    :cond_6
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->gl_make_text()Z

    move-result v16

    if-eqz v16, :cond_7

    const/16 v24, -0x1

    move-object/from16 v23, p1

    move/from16 v26, v5

    move/from16 v25, v15

    invoke-virtual/range {v22 .. v28}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    :cond_7
    :goto_1
    add-int/lit8 v14, v14, 0x1

    const/4 v5, 0x0

    goto :goto_0

    .line 251
    :cond_8
    iget-object v5, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    if-nez v5, :cond_9

    goto/16 :goto_5

    :cond_9
    neg-int v5, v4

    neg-int v7, v6

    sub-int v9, v2, v4

    sub-int/2addr v3, v6

    sub-int v10, v5, v2

    .line 257
    sget v11, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr v10, v11

    .line 258
    sget v11, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int v11, v7, v11

    add-int/2addr v2, v9

    .line 259
    sget v12, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v2, v12

    .line 260
    sget v12, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr v12, v3

    .line 261
    iget-object v13, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    array-length v14, v13

    const/4 v15, 0x0

    :goto_2
    if-ge v15, v14, :cond_f

    move/from16 p4, v4

    aget-object v4, v13, v15

    if-eqz v4, :cond_e

    .line 262
    invoke-virtual {v4, v10, v11, v2, v12}, Lcom/radaee/view/GLBlock;->isCross(IIII)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 264
    invoke-virtual {v4, v5, v7, v9, v3}, Lcom/radaee/view/GLBlock;->isCross(IIII)Z

    move-result v16

    if-eqz v16, :cond_c

    .line 266
    invoke-virtual {v4}, Lcom/radaee/view/GLBlock;->gl_make_text()Z

    move-result v16

    if-nez v16, :cond_b

    .line 268
    invoke-virtual {v1, v4}, Lcom/radaee/view/GLThread;->render_start(Lcom/radaee/view/GLBlock;)V

    .line 269
    iget-object v8, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    if-nez v8, :cond_a

    .line 270
    invoke-virtual {v4}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v8

    add-int v25, p4, v8

    invoke-virtual {v4}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v8

    add-int v26, v6, v8

    invoke-virtual {v4}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v8

    add-int v27, p4, v8

    invoke-virtual {v4}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v8

    add-int v28, v6, v8

    move-object/from16 v23, p1

    move/from16 v24, p3

    move-object/from16 v22, v4

    invoke-virtual/range {v22 .. v28}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    :cond_a
    move-object/from16 v0, p1

    const/4 v8, 0x0

    goto :goto_4

    :cond_b
    move-object/from16 v22, v4

    .line 272
    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v4

    add-int v25, p4, v4

    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v4

    add-int v26, v6, v4

    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v4

    add-int v27, p4, v4

    invoke-virtual/range {v22 .. v22}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v4

    add-int v28, v6, v4

    move-object/from16 v23, p1

    move/from16 v24, p3

    invoke-virtual/range {v22 .. v28}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    goto :goto_3

    .line 274
    :cond_c
    invoke-virtual {v1, v4}, Lcom/radaee/view/GLThread;->render_start(Lcom/radaee/view/GLBlock;)V

    goto :goto_3

    :cond_d
    move-object/from16 v0, p1

    .line 275
    invoke-virtual {v1, v0, v4}, Lcom/radaee/view/GLThread;->render_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLBlock;)Z

    goto :goto_4

    :cond_e
    :goto_3
    move-object/from16 v0, p1

    :goto_4
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    move/from16 v4, p4

    goto :goto_2

    :cond_f
    move-object/from16 v0, p1

    if-eqz v8, :cond_10

    .line 277
    invoke-virtual/range {p0 .. p2}, Lcom/radaee/view/GLPage;->gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V

    :cond_10
    :goto_5
    return-void
.end method

.method public final gl_draw_curl(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;IIIII)V
    .locals 9

    .line 143
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/radaee/view/GLBlock;->gl_make_text()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    aget-object v0, v0, v1

    invoke-virtual {p2, v0}, Lcom/radaee/view/GLThread;->render_start(Lcom/radaee/view/GLBlock;)V

    .line 144
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    aget-object v2, p2, v1

    move-object v3, p1

    move v4, p3

    move v8, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    invoke-virtual/range {v2 .. v8}, Lcom/radaee/view/GLBlock;->gl_draw_curl(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    return-void
.end method

.method public final gl_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V
    .locals 5

    .line 301
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 302
    :goto_0
    iget-object v1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 304
    aget-object v1, v1, v0

    .line 305
    invoke-virtual {p2, p1, v1}, Lcom/radaee/view/GLThread;->render_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLBlock;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    new-instance v3, Lcom/radaee/view/GLBlock;

    iget-object v4, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v3, v1, v4}, Lcom/radaee/view/GLBlock;-><init>(Lcom/radaee/view/GLBlock;Lcom/radaee/pdf/Document;)V

    aput-object v3, v2, v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public final gl_end_zoom(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V
    .locals 4

    .line 310
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    if-nez v0, :cond_0

    return-void

    .line 311
    :cond_0
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {p2, p1, v3}, Lcom/radaee/view/GLThread;->render_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLBlock;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 312
    iput-object p1, p0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    return-void
.end method

.method protected final gl_layout(II)V
    .locals 3

    const/4 v0, 0x0

    .line 46
    iput v0, p0, Lcom/radaee/view/GLPage;->m_left:I

    .line 47
    iput v0, p0, Lcom/radaee/view/GLPage;->m_top:I

    .line 48
    iput p1, p0, Lcom/radaee/view/GLPage;->m_right:I

    .line 49
    iput p2, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    .line 50
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v0

    .line 51
    iget-object v1, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    int-to-float p1, p1

    div-float/2addr p1, v0

    int-to-float p2, p2

    div-float/2addr p2, v1

    .line 53
    iput p2, p0, Lcom/radaee/view/GLPage;->m_scale:F

    cmpl-float p2, p2, p1

    if-lez p2, :cond_0

    .line 54
    iput p1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    :cond_0
    const/4 p1, 0x1

    .line 55
    iput-boolean p1, p0, Lcom/radaee/view/GLPage;->m_curl:Z

    .line 56
    iget p1, p0, Lcom/radaee/view/GLPage;->m_scale:F

    mul-float v0, v0, p1

    float-to-int p2, v0

    iput p2, p0, Lcom/radaee/view/GLPage;->m_pw:I

    mul-float v1, v1, p1

    float-to-int p1, v1

    .line 57
    iput p1, p0, Lcom/radaee/view/GLPage;->m_ph:I

    return-void
.end method

.method protected final gl_layout(IIF)V
    .locals 1

    .line 35
    iput p1, p0, Lcom/radaee/view/GLPage;->m_left:I

    .line 36
    iput p2, p0, Lcom/radaee/view/GLPage;->m_top:I

    .line 37
    iget-object p1, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget p2, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result p1

    mul-float p1, p1, p3

    float-to-int p1, p1

    iput p1, p0, Lcom/radaee/view/GLPage;->m_pw:I

    .line 38
    iget-object p1, p0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget p2, p0, Lcom/radaee/view/GLPage;->m_pageno:I

    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    mul-float p1, p1, p3

    float-to-int p1, p1

    iput p1, p0, Lcom/radaee/view/GLPage;->m_ph:I

    .line 39
    iget p2, p0, Lcom/radaee/view/GLPage;->m_left:I

    iget v0, p0, Lcom/radaee/view/GLPage;->m_pw:I

    add-int/2addr p2, v0

    iput p2, p0, Lcom/radaee/view/GLPage;->m_right:I

    .line 40
    iget p2, p0, Lcom/radaee/view/GLPage;->m_top:I

    add-int/2addr p2, p1

    iput p2, p0, Lcom/radaee/view/GLPage;->m_bottom:I

    .line 41
    iput p3, p0, Lcom/radaee/view/GLPage;->m_scale:F

    const/4 p1, 0x0

    .line 42
    iput-boolean p1, p0, Lcom/radaee/view/GLPage;->m_curl:Z

    return-void
.end method

.method public final gl_render(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V
    .locals 1

    .line 139
    iget-object p1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p2, p1}, Lcom/radaee/view/GLThread;->render_start(Lcom/radaee/view/GLBlock;)V

    return-void
.end method

.method protected gl_set_dirty()V
    .locals 1

    const/4 v0, 0x1

    .line 97
    iput-boolean v0, p0, Lcom/radaee/view/GLPage;->m_dirty:Z

    return-void
.end method

.method protected gl_set_dirty(FFFF)V
    .locals 18

    move-object/from16 v0, p0

    .line 108
    iget v1, v0, Lcom/radaee/view/GLPage;->m_scale:F

    mul-float v2, p1, v1

    float-to-int v2, v2

    .line 109
    iget v3, v0, Lcom/radaee/view/GLPage;->m_ph:I

    mul-float v4, p4, v1

    float-to-int v4, v4

    sub-int v4, v3, v4

    mul-float v5, p3, v1

    float-to-int v5, v5

    mul-float v1, v1, p2

    float-to-int v1, v1

    sub-int/2addr v3, v1

    .line 112
    iget-object v1, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    if-eqz v1, :cond_0

    .line 114
    array-length v6, v1

    add-int/lit8 v6, v6, -0x1

    aget-object v1, v1, v6

    .line 115
    invoke-virtual {v1}, Lcom/radaee/view/GLBlock;->GetRight()I

    move-result v6

    .line 116
    invoke-virtual {v1}, Lcom/radaee/view/GLBlock;->GetBottom()I

    move-result v1

    .line 117
    iget v7, v0, Lcom/radaee/view/GLPage;->m_pw:I

    if-ne v6, v7, :cond_5

    iget v6, v0, Lcom/radaee/view/GLPage;->m_ph:I

    if-eq v1, v6, :cond_0

    goto/16 :goto_2

    .line 119
    :cond_0
    iget-object v1, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    if-nez v1, :cond_1

    iget-object v1, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    array-length v1, v1

    new-array v1, v1, [Lcom/radaee/view/GLBlock;

    iput-object v1, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    :cond_1
    const/4 v1, 0x0

    .line 120
    :goto_0
    iget-object v6, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    array-length v7, v6

    if-ge v1, v7, :cond_5

    .line 122
    aget-object v6, v6, v1

    .line 123
    invoke-virtual {v6, v2, v4, v5, v3}, Lcom/radaee/view/GLBlock;->isCross(IIII)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 125
    iget-object v7, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    aget-object v7, v7, v1

    if-eqz v7, :cond_2

    invoke-virtual {v7}, Lcom/radaee/view/GLBlock;->has_render()Z

    move-result v7

    if-nez v7, :cond_4

    .line 126
    :cond_2
    iget-object v7, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    aput-object v6, v7, v1

    .line 127
    iget-object v7, v0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    new-instance v8, Lcom/radaee/view/GLBlock;

    iget-object v9, v0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v10, v0, Lcom/radaee/view/GLPage;->m_pageno:I

    iget v11, v0, Lcom/radaee/view/GLPage;->m_scale:F

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v12

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v13

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetW()I

    move-result v14

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetH()I

    move-result v15

    iget v6, v0, Lcom/radaee/view/GLPage;->m_ph:I

    move/from16 v16, v6

    invoke-direct/range {v8 .. v16}, Lcom/radaee/view/GLBlock;-><init>(Lcom/radaee/pdf/Document;IFIIIII)V

    aput-object v8, v7, v1

    goto :goto_1

    .line 132
    :cond_3
    iget-object v7, v0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    aget-object v8, v7, v1

    if-nez v8, :cond_4

    .line 133
    new-instance v9, Lcom/radaee/view/GLBlock;

    iget-object v10, v0, Lcom/radaee/view/GLPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v11, v0, Lcom/radaee/view/GLPage;->m_pageno:I

    iget v12, v0, Lcom/radaee/view/GLPage;->m_scale:F

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetX()I

    move-result v13

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetY()I

    move-result v14

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetW()I

    move-result v15

    invoke-virtual {v6}, Lcom/radaee/view/GLBlock;->GetH()I

    move-result v16

    iget v6, v0, Lcom/radaee/view/GLPage;->m_ph:I

    move/from16 v17, v6

    invoke-direct/range {v9 .. v17}, Lcom/radaee/view/GLBlock;-><init>(Lcom/radaee/pdf/Document;IFIIIII)V

    aput-object v9, v7, v1

    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    return-void
.end method

.method public final gl_sync(IIII)V
    .locals 5

    .line 280
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    if-nez v0, :cond_0

    .line 281
    invoke-virtual {p0}, Lcom/radaee/view/GLPage;->gl_alloc()V

    .line 283
    :cond_0
    iget v0, p0, Lcom/radaee/view/GLPage;->m_left:I

    sub-int/2addr v0, p1

    .line 284
    iget p1, p0, Lcom/radaee/view/GLPage;->m_top:I

    sub-int/2addr p1, p2

    .line 285
    iget-object p2, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    neg-int p2, v0

    .line 286
    sget v1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr p2, v1

    neg-int v1, p1

    .line 287
    sget v2, Lcom/radaee/view/GLBlock;->m_cell_size:I

    sub-int/2addr v1, v2

    sub-int/2addr p3, v0

    .line 288
    sget v0, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr p3, v0

    sub-int/2addr p4, p1

    .line 289
    sget p1, Lcom/radaee/view/GLBlock;->m_cell_size:I

    add-int/2addr p4, p1

    .line 290
    iget-object p1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    array-length v0, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    aget-object v3, p1, v2

    .line 291
    invoke-virtual {v3, p2, v1, p3, p4}, Lcom/radaee/view/GLBlock;->isCross(IIII)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 292
    invoke-virtual {v3}, Lcom/radaee/view/GLBlock;->gl_make_text()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Lcom/radaee/view/GLBlock;->has_render()Z

    move-result v4

    if-nez v4, :cond_2

    .line 293
    invoke-virtual {v3}, Lcom/radaee/view/GLBlock;->gl_start()Z

    .line 294
    invoke-virtual {v3}, Lcom/radaee/view/GLBlock;->bk_render()V

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method protected final gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLThread;)V
    .locals 5

    .line 316
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 318
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    if-eqz v0, :cond_1

    .line 320
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v0, v3

    .line 321
    invoke-virtual {p2, p1, v4}, Lcom/radaee/view/GLThread;->render_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLBlock;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 323
    :cond_0
    iput-object v1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    :cond_1
    return-void

    .line 327
    :cond_2
    iget-object p1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    iput-object p1, p0, Lcom/radaee/view/GLPage;->m_blks_zoom:[Lcom/radaee/view/GLBlock;

    .line 328
    iput-object v1, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    return-void
.end method

.method public vFinished()Z
    .locals 6

    .line 422
    iget-object v0, p0, Lcom/radaee/view/GLPage;->m_blks:[Lcom/radaee/view/GLBlock;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 423
    :cond_0
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_2

    aget-object v5, v0, v4

    if-eqz v5, :cond_1

    .line 424
    invoke-virtual {v5}, Lcom/radaee/view/GLBlock;->is_rendering()Z

    move-result v5

    if-eqz v5, :cond_1

    return v3

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method
