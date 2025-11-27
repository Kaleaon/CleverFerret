.class public Lcom/radaee/view/GLBlock;
.super Ljava/lang/Object;
.source "GLBlock.java"


# static fields
.field public static m_cell_size:I = 0x0

.field private static final m_shadow_base:I = 0x64

.field private static final m_shadow_factor:I = 0x4

.field private static final m_text:Ljava/nio/IntBuffer;


# instance fields
.field private m_dib:Lcom/radaee/pdf/DIB;

.field private m_dib_tmp:Lcom/radaee/pdf/DIB;

.field private final m_doc:Lcom/radaee/pdf/Document;

.field private m_draw_cnt:I

.field private final m_h:I

.field private m_page:Lcom/radaee/pdf/Page;

.field private final m_pageno:I

.field private final m_ph:I

.field private final m_scale:F

.field private m_status:I

.field private m_texture:I

.field private m_texture_tmp:I

.field private final m_vect:Ljava/nio/IntBuffer;

.field private final m_w:I

.field private final m_x:I

.field private final m_y:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    .line 55
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-static {v0}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object v0

    sput-object v0, Lcom/radaee/view/GLBlock;->m_text:Ljava/nio/IntBuffer;

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x10000
        0x0
        0x0
        0x10000
        0x10000
        0x10000
    .end array-data
.end method

.method protected constructor <init>(Lcom/radaee/pdf/Document;IFIIIII)V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_doc:Lcom/radaee/pdf/Document;

    .line 76
    iput p2, p0, Lcom/radaee/view/GLBlock;->m_pageno:I

    .line 77
    iput p3, p0, Lcom/radaee/view/GLBlock;->m_scale:F

    .line 78
    iput p4, p0, Lcom/radaee/view/GLBlock;->m_x:I

    .line 79
    iput p5, p0, Lcom/radaee/view/GLBlock;->m_y:I

    .line 80
    iput p6, p0, Lcom/radaee/view/GLBlock;->m_w:I

    .line 81
    iput p7, p0, Lcom/radaee/view/GLBlock;->m_h:I

    .line 82
    iput p8, p0, Lcom/radaee/view/GLBlock;->m_ph:I

    const/16 p1, 0x8

    .line 83
    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    const/4 p1, 0x0

    .line 84
    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    .line 85
    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    const/4 p1, 0x0

    .line 86
    iput p1, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    .line 87
    iput p1, p0, Lcom/radaee/view/GLBlock;->m_status:I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x10000
        0x0
        0x0
        0x10000
        0x10000
        0x10000
    .end array-data
.end method

.method protected constructor <init>(Lcom/radaee/view/GLBlock;Lcom/radaee/pdf/Document;)V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p2, p0, Lcom/radaee/view/GLBlock;->m_doc:Lcom/radaee/pdf/Document;

    .line 60
    iget p2, p1, Lcom/radaee/view/GLBlock;->m_pageno:I

    iput p2, p0, Lcom/radaee/view/GLBlock;->m_pageno:I

    .line 61
    iget p2, p1, Lcom/radaee/view/GLBlock;->m_scale:F

    iput p2, p0, Lcom/radaee/view/GLBlock;->m_scale:F

    .line 62
    iget p2, p1, Lcom/radaee/view/GLBlock;->m_x:I

    iput p2, p0, Lcom/radaee/view/GLBlock;->m_x:I

    .line 63
    iget p2, p1, Lcom/radaee/view/GLBlock;->m_y:I

    iput p2, p0, Lcom/radaee/view/GLBlock;->m_y:I

    .line 64
    iget p2, p1, Lcom/radaee/view/GLBlock;->m_w:I

    iput p2, p0, Lcom/radaee/view/GLBlock;->m_w:I

    .line 65
    iget p2, p1, Lcom/radaee/view/GLBlock;->m_h:I

    iput p2, p0, Lcom/radaee/view/GLBlock;->m_h:I

    .line 66
    iget p1, p1, Lcom/radaee/view/GLBlock;->m_ph:I

    iput p1, p0, Lcom/radaee/view/GLBlock;->m_ph:I

    const/16 p1, 0x8

    .line 67
    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    .line 69
    iput-object p1, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    const/4 p1, 0x0

    .line 70
    iput p1, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    .line 71
    iput p1, p0, Lcom/radaee/view/GLBlock;->m_status:I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x10000
        0x0
        0x0
        0x10000
        0x10000
        0x10000
    .end array-data
.end method

.method protected static create_buf([B)Ljava/nio/ByteBuffer;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 50
    :cond_0
    array-length v0, p0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 51
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    const/4 p0, 0x0

    .line 52
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-object v0
.end method

.method protected static create_buf([I)Ljava/nio/IntBuffer;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 37
    :cond_0
    :try_start_0
    array-length v1, p0

    shl-int/lit8 v1, v1, 0x2

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 38
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 39
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v1

    .line 40
    invoke-virtual {v1, p0}, Ljava/nio/IntBuffer;->put([I)Ljava/nio/IntBuffer;

    const/4 p0, 0x0

    .line 41
    invoke-virtual {v1, p0}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    :catchall_0
    return-object v0
.end method

.method private drawLT(Ljavax/microedition/khronos/opengles/GL10;IIIII)V
    .locals 71

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    const/16 v14, 0xde1

    .line 336
    invoke-interface {v1, v14, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 344
    iget v15, v0, Lcom/radaee/view/GLBlock;->m_w:I

    add-int v2, v15, v11

    const/16 v17, 0x1

    shr-int/lit8 v2, v2, 0x1

    shr-int/lit8 v3, v12, 0x1

    add-int v4, v2, v11

    shr-int/lit8 v4, v4, 0x1

    add-int v5, v3, v12

    shr-int/lit8 v5, v5, 0x1

    if-gtz v12, :cond_0

    const-wide v6, -0x3f07960000000000L    # -100000.0

    goto :goto_0

    :cond_0
    sub-int v6, v15, v11

    int-to-double v6, v6

    rsub-int/lit8 v8, v12, 0x0

    int-to-double v8, v8

    div-double/2addr v6, v8

    :goto_0
    move-wide/from16 v18, v6

    int-to-double v6, v3

    sub-int v2, v15, v2

    int-to-double v8, v2

    mul-double v8, v8, v18

    sub-double/2addr v6, v8

    int-to-double v8, v5

    sub-int v2, v15, v4

    int-to-double v4, v2

    mul-double v4, v4, v18

    sub-double/2addr v8, v4

    const-wide/16 v20, 0x0

    add-double v4, v6, v20

    double-to-int v2, v4

    div-double v6, v6, v18

    double-to-int v4, v6

    add-int v22, v4, v15

    add-double v4, v8, v20

    double-to-int v4, v4

    div-double v8, v8, v18

    double-to-int v5, v8

    add-int/2addr v5, v15

    add-int v6, v15, v11

    shr-int/lit8 v20, v6, 0x1

    add-int v6, v2, v12

    shr-int/lit8 v21, v6, 0x1

    add-int v6, v22, v11

    shr-int/lit8 v32, v6, 0x1

    add-int v6, v15, v20

    shl-int/lit8 v7, v15, 0x1

    add-int/2addr v6, v7

    const/4 v7, 0x2

    shr-int/lit8 v33, v6, 0x2

    add-int v6, v4, v21

    shl-int/lit8 v8, v2, 0x1

    add-int/2addr v6, v8

    shr-int/lit8 v34, v6, 0x2

    add-int v6, v32, v5

    shl-int/lit8 v8, v22, 0x1

    add-int/2addr v6, v8

    shr-int/lit8 v35, v6, 0x2

    shr-int/lit8 v28, v12, 0x3

    const-wide v8, -0x3f07961000000000L    # -99999.0

    const/high16 v23, 0x42000000    # 32.0f

    const/16 v6, 0x20

    const/16 v24, 0x3

    const/high16 v36, 0x3f000000    # 0.5f

    const v37, 0x3ecccccd    # 0.4f

    cmpg-double v27, v18, v8

    if-ltz v27, :cond_e

    add-int/lit16 v8, v15, 0x7530

    if-le v4, v8, :cond_1

    goto/16 :goto_c

    :cond_1
    if-eq v11, v15, :cond_c

    const/16 v8, -0x7530

    if-ge v5, v8, :cond_2

    move/from16 v10, p6

    move-object v0, v1

    move v12, v13

    move/from16 v50, v15

    const/16 v1, 0xde1

    const/high16 v2, 0x3f800000    # 1.0f

    const/16 v3, 0x20

    const/4 v11, 0x3

    const v13, 0x3f4ccccd    # 0.8f

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    goto/16 :goto_a

    :cond_2
    sub-int v6, v15, v11

    if-le v12, v6, :cond_3

    mul-int/lit8 v8, v12, 0x3

    mul-int/lit8 v6, v6, 0x2

    .line 433
    div-int/2addr v8, v6

    move/from16 v23, v8

    const/16 v38, 0x1

    goto :goto_1

    :cond_3
    mul-int/lit8 v6, v6, 0x3

    mul-int/lit8 v8, v12, 0x2

    .line 438
    div-int/2addr v6, v8

    move/from16 v38, v6

    const/16 v23, 0x1

    :goto_1
    add-int v6, v15, v15

    shr-int/lit8 v39, v6, 0x1

    add-int v6, v4, v2

    shr-int/lit8 v40, v6, 0x1

    add-int v6, v5, v22

    shr-int/lit8 v27, v6, 0x1

    const/4 v6, 0x2

    .line 446
    iget v7, v0, Lcom/radaee/view/GLBlock;->m_h:I

    if-le v4, v7, :cond_4

    if-gez v5, :cond_4

    move/from16 v44, v2

    move/from16 v43, v3

    move/from16 v50, v15

    goto/16 :goto_7

    :cond_4
    const-wide/high16 v41, 0x40f0000000000000L    # 65536.0

    move/from16 v29, v5

    const/high16 v30, 0x3f800000    # 1.0f

    const/16 v26, 0x0

    if-le v4, v7, :cond_6

    int-to-double v5, v15

    sub-int v8, v7, v4

    int-to-double v9, v8

    div-double v9, v9, v18

    sub-double/2addr v5, v9

    double-to-int v8, v5

    move v5, v2

    const/4 v2, 0x0

    move v6, v3

    const/4 v3, 0x0

    move v9, v6

    const/4 v6, 0x0

    move v10, v9

    move v9, v7

    move/from16 v45, v4

    move/from16 v44, v5

    move/from16 v43, v10

    move/from16 v4, v29

    const/4 v5, 0x0

    const/16 v10, 0x40

    .line 451
    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    move-object v0, v1

    const/4 v1, 0x3

    const/16 v24, 0x0

    .line 452
    invoke-interface {v0, v14, v13}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/4 v2, 0x3

    shl-int/lit8 v1, v4, 0x10

    shl-int/lit8 v3, v15, 0x10

    shl-int/lit8 v4, v45, 0x10

    shl-int/lit8 v5, v22, 0x10

    shl-int/lit8 v7, v15, 0x10

    shl-int/lit8 v8, v44, 0x10

    move v6, v15

    const/high16 v15, 0x10000

    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v16, 0x10000

    const/16 v31, 0x3

    const/4 v2, 0x0

    const/high16 v47, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    const/16 v48, 0x40

    const/4 v10, 0x0

    const/high16 v11, 0x10000

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v49, 0xde1

    const/high16 v14, 0x10000

    move/from16 v50, v6

    move v6, v2

    move/from16 v52, v29

    .line 453
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v10, p2

    move-object v9, v0

    const/16 v11, 0xde1

    .line 456
    invoke-interface {v9, v11, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move-object/from16 v10, p0

    .line 458
    iget v0, v10, Lcom/radaee/view/GLBlock;->m_w:I

    int-to-double v1, v0

    iget v3, v10, Lcom/radaee/view/GLBlock;->m_h:I

    sub-int v4, v45, v3

    int-to-double v4, v4

    div-double v4, v4, v18

    add-double v12, v1, v4

    move/from16 v4, v52

    int-to-double v14, v4

    sub-int/2addr v0, v4

    .line 460
    div-int/lit8 v0, v0, 0x50

    int-to-double v0, v0

    double-to-int v2, v12

    sub-int v5, v2, v4

    const/16 v6, 0x42

    .line 466
    new-array v7, v6, [I

    const/16 v51, 0x0

    .line 467
    aput v4, v7, v51

    .line 468
    aput v24, v7, v17

    move/from16 v25, v27

    sub-int v27, v35, v23

    const/16 v29, 0x5

    const/16 v31, 0x2

    move/from16 v23, v4

    move-object/from16 v30, v7

    .line 469
    invoke-static/range {v23 .. v31}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 471
    new-array v4, v6, [I

    .line 472
    aput v2, v4, v51

    .line 473
    iget v7, v10, Lcom/radaee/view/GLBlock;->m_h:I

    aput v7, v4, v17

    add-int v58, v25, v5

    add-int v60, v27, v5

    add-int v61, v28, v3

    const/16 v62, 0x5

    const/16 v64, 0x2

    move/from16 v56, v2

    move/from16 v59, v3

    move-object/from16 v63, v4

    move/from16 v57, v7

    .line 474
    invoke-static/range {v56 .. v64}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 478
    new-array v7, v6, [I

    .line 479
    aput v50, v7, v51

    .line 480
    aput v45, v7, v17

    sub-int v5, v34, v38

    const/16 v46, 0x42

    const/4 v6, 0x5

    const/4 v8, 0x2

    move-wide/from16 v18, v0

    move/from16 v4, v33

    move/from16 v2, v39

    move/from16 v3, v40

    move/from16 v1, v45

    move/from16 v0, v50

    .line 481
    invoke-static/range {v0 .. v8}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-object/from16 v23, v7

    move-wide/from16 v24, v12

    move-wide/from16 v26, v14

    const/4 v0, 0x0

    :goto_2
    const/16 v1, 0x40

    if-ge v0, v1, :cond_9

    add-int/lit8 v2, v0, 0x1

    .line 485
    aget v3, v23, v2

    iget v4, v10, Lcom/radaee/view/GLBlock;->m_h:I

    if-le v3, v4, :cond_5

    .line 486
    aget v3, v63, v0

    shl-int/lit8 v3, v3, 0x10

    aget v4, v63, v2

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v0, 0x2

    aget v6, v63, v5

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v7, v0, 0x3

    aget v8, v63, v7

    shl-int/lit8 v8, v8, 0x10

    aget v12, v30, v0

    shl-int/lit8 v12, v12, 0x10

    aget v2, v30, v2

    shl-int/lit8 v2, v2, 0x10

    aget v5, v30, v5

    shl-int/lit8 v5, v5, 0x10

    aget v7, v30, v7

    shl-int/lit8 v7, v7, 0x10

    mul-double v13, v24, v41

    double-to-int v13, v13

    iget v14, v10, Lcom/radaee/view/GLBlock;->m_w:I

    div-int/2addr v13, v14

    add-double v15, v24, v18

    move/from16 p2, v2

    mul-double v1, v15, v41

    double-to-int v1, v1

    div-int/2addr v1, v14

    move v15, v12

    mul-double v11, v26, v41

    double-to-int v2, v11

    div-int/2addr v2, v14

    add-double v11, v26, v18

    mul-double v11, v11, v41

    double-to-int v11, v11

    div-int/2addr v11, v14

    const/16 v16, 0x0

    const/high16 v10, 0x10000

    const/high16 v12, 0x10000

    const/4 v14, 0x0

    move/from16 v29, v0

    move-object v0, v9

    move v9, v13

    move v13, v2

    move v2, v4

    move v4, v8

    move v8, v7

    move v7, v5

    move v5, v15

    move v15, v11

    move v11, v1

    move v1, v3

    move v3, v6

    move/from16 v6, p2

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    goto :goto_3

    :cond_5
    move/from16 v29, v0

    .line 492
    aget v0, v23, v29

    shl-int/lit8 v1, v0, 0x10

    move v0, v2

    shl-int/lit8 v2, v3, 0x10

    add-int/lit8 v4, v29, 0x2

    aget v5, v23, v4

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, v29, 0x3

    aget v7, v23, v6

    move v8, v4

    shl-int/lit8 v4, v7, 0x10

    aget v9, v30, v29

    shl-int/lit8 v9, v9, 0x10

    aget v0, v30, v0

    move v10, v6

    shl-int/lit8 v6, v0, 0x10

    aget v8, v30, v8

    shl-int/lit8 v8, v8, 0x10

    aget v10, v30, v10

    move v11, v7

    move v7, v8

    shl-int/lit8 v8, v10, 0x10

    sub-int/2addr v3, v0

    shl-int/lit8 v0, v3, 0x10

    div-int v0, v0, v59

    sub-int v3, v11, v10

    shl-int/lit8 v3, v3, 0x10

    div-int v12, v3, v59

    mul-double v10, v26, v41

    move-object/from16 v3, p0

    iget v13, v3, Lcom/radaee/view/GLBlock;->m_w:I

    int-to-double v14, v13

    div-double/2addr v10, v14

    double-to-int v10, v10

    add-double v14, v26, v18

    mul-double v14, v14, v41

    move v11, v0

    move/from16 p2, v1

    int-to-double v0, v13

    div-double/2addr v14, v0

    double-to-int v15, v14

    const/16 v16, 0x0

    move v3, v5

    move v5, v9

    const/high16 v9, 0x10000

    move v0, v11

    const/high16 v11, 0x10000

    const/4 v14, 0x0

    move/from16 v1, p2

    move v13, v10

    move v10, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    :goto_3
    add-double v24, v24, v18

    add-double v26, v26, v18

    add-int/lit8 v0, v29, 0x2

    move-object/from16 v10, p0

    move-object/from16 v9, p1

    const/16 v11, 0xde1

    goto/16 :goto_2

    :cond_6
    move/from16 v10, p2

    move/from16 v44, v2

    move/from16 v43, v3

    move v1, v4

    move/from16 v50, v15

    move/from16 v25, v27

    move/from16 v11, v29

    const/16 v24, 0x0

    if-gez v11, :cond_8

    int-to-double v2, v11

    mul-double v12, v2, v18

    double-to-int v3, v12

    const/4 v6, 0x0

    const/4 v2, 0x0

    move/from16 v8, v50

    move v9, v7

    move-object/from16 v0, p0

    move v5, v1

    move/from16 v4, v50

    move-object/from16 v1, p1

    .line 508
    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    move-object v0, v1

    move/from16 v57, v3

    move v9, v5

    const/16 v2, 0xde1

    move/from16 v1, p5

    .line 509
    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    shl-int/lit8 v1, v11, 0x10

    shl-int/lit8 v3, v50, 0x10

    shl-int/lit8 v4, v9, 0x10

    shl-int/lit8 v5, v22, 0x10

    shl-int/lit8 v7, v50, 0x10

    shl-int/lit8 v8, v44, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/16 v49, 0xde1

    const/4 v2, 0x0

    move/from16 v45, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    move/from16 v29, v11

    const/high16 v11, 0x10000

    move-wide v13, v12

    const/4 v12, 0x0

    move-wide/from16 v18, v13

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move v6, v2

    move/from16 v66, v45

    move/from16 v65, v50

    .line 510
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v10, p2

    move-object v9, v0

    const/16 v11, 0xde1

    .line 513
    invoke-interface {v9, v11, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move/from16 v1, v66

    int-to-double v12, v1

    .line 517
    div-int/lit8 v4, v1, 0x50

    int-to-double v14, v4

    move/from16 v0, v65

    neg-int v10, v0

    sub-double v2, v18, v12

    double-to-int v2, v2

    const/16 v3, 0x42

    .line 521
    new-array v4, v3, [I

    const/16 v56, 0x0

    const/16 v51, 0x0

    .line 522
    aput v56, v4, v51

    .line 523
    aput v57, v4, v17

    add-int v58, v39, v10

    add-int v59, v40, v2

    add-int v60, v33, v10

    sub-int v5, v34, v38

    add-int v61, v5, v2

    const/16 v62, 0x5

    const/16 v64, 0x2

    move-object/from16 v63, v4

    .line 524
    invoke-static/range {v56 .. v64}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 526
    new-array v2, v3, [I

    .line 527
    aput v29, v2, v51

    .line 528
    aput v24, v2, v17

    sub-int v27, v35, v23

    move/from16 v4, v29

    const/16 v29, 0x5

    const/16 v31, 0x2

    move-object/from16 v30, v2

    move/from16 v23, v4

    .line 529
    invoke-static/range {v23 .. v31}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 531
    new-array v7, v3, [I

    .line 532
    aput v0, v7, v51

    .line 533
    aput v1, v7, v17

    const/4 v6, 0x5

    const/4 v8, 0x2

    move/from16 v4, v33

    move/from16 v2, v39

    move/from16 v3, v40

    .line 534
    invoke-static/range {v0 .. v8}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v50, v0

    move-object/from16 v23, v7

    move-wide/from16 v24, v18

    const/4 v0, 0x0

    move-wide/from16 v18, v12

    :goto_4
    const/16 v1, 0x40

    if-ge v0, v1, :cond_9

    .line 538
    aget v2, v30, v0

    aget v3, v63, v0

    if-ge v2, v3, :cond_7

    .line 539
    aget v2, v23, v0

    shl-int/lit8 v2, v2, 0x10

    add-int/lit8 v4, v0, 0x1

    aget v5, v23, v4

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, v0, 0x2

    aget v7, v23, v6

    shl-int/lit8 v7, v7, 0x10

    add-int/lit8 v8, v0, 0x3

    aget v12, v23, v8

    shl-int/lit8 v12, v12, 0x10

    move v1, v2

    move v2, v5

    const/16 v48, 0x40

    shl-int/lit8 v5, v3, 0x10

    aget v3, v63, v4

    shl-int/lit8 v3, v3, 0x10

    aget v4, v63, v6

    shl-int/lit8 v4, v4, 0x10

    aget v6, v63, v8

    shl-int/lit8 v8, v6, 0x10

    move/from16 p2, v12

    mul-double v11, v18, v41

    double-to-int v6, v11

    move-object/from16 v11, p0

    iget v12, v11, Lcom/radaee/view/GLBlock;->m_h:I

    div-int/2addr v6, v12

    sub-double v26, v18, v14

    move v13, v0

    move/from16 v16, v1

    mul-double v0, v26, v41

    double-to-int v0, v0

    div-int/2addr v0, v12

    move/from16 v26, v0

    mul-double v0, v24, v41

    double-to-int v0, v0

    div-int/2addr v0, v12

    sub-double v38, v24, v14

    move/from16 v27, v0

    mul-double v0, v38, v41

    double-to-int v0, v0

    div-int/2addr v0, v12

    const/high16 v9, 0x10000

    const/high16 v11, 0x10000

    move v1, v13

    const/4 v13, 0x0

    move-wide/from16 v38, v14

    const/4 v15, 0x0

    move/from16 v12, v26

    move/from16 v14, v27

    move/from16 v27, v1

    move/from16 v26, v10

    move/from16 v1, v16

    move/from16 v16, v0

    move v10, v6

    move-object/from16 v0, p1

    move v6, v3

    move v3, v7

    move v7, v4

    move/from16 v4, p2

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    goto/16 :goto_5

    :cond_7
    move/from16 v27, v0

    move/from16 v26, v10

    move-wide/from16 v38, v14

    .line 546
    aget v0, v23, v27

    shl-int/lit8 v1, v0, 0x10

    add-int/lit8 v0, v27, 0x1

    aget v4, v23, v0

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v27, 0x2

    aget v6, v23, v5

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v7, v27, 0x3

    aget v8, v23, v7

    shl-int/lit8 v8, v8, 0x10

    move v9, v5

    shl-int/lit8 v5, v2, 0x10

    aget v0, v30, v0

    shl-int/lit8 v0, v0, 0x10

    aget v10, v30, v9

    move v11, v7

    shl-int/lit8 v7, v10, 0x10

    aget v11, v30, v11

    shl-int/lit8 v11, v11, 0x10

    mul-double v12, v18, v41

    double-to-int v12, v12

    move-object/from16 v13, p0

    iget v14, v13, Lcom/radaee/view/GLBlock;->m_h:I

    div-int/2addr v12, v14

    sub-double v15, v18, v38

    move/from16 v29, v0

    move/from16 p2, v1

    mul-double v0, v15, v41

    double-to-int v0, v0

    div-int/2addr v0, v14

    sub-int/2addr v3, v2

    shl-int/lit8 v1, v3, 0x10

    div-int v1, v1, v26

    mul-double v2, v24, v41

    double-to-int v2, v2

    div-int/2addr v2, v14

    aget v3, v63, v9

    sub-int/2addr v3, v10

    shl-int/lit8 v3, v3, 0x10

    div-int v15, v3, v26

    sub-double v9, v24, v38

    mul-double v9, v9, v41

    double-to-int v3, v9

    div-int v16, v3, v14

    const/high16 v9, 0x10000

    move v14, v2

    move v2, v4

    move v4, v8

    move v8, v11

    const/high16 v11, 0x10000

    move v13, v1

    move v3, v6

    move v10, v12

    move/from16 v6, v29

    move/from16 v1, p2

    move v12, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    :goto_5
    sub-double v18, v18, v38

    sub-double v24, v24, v38

    add-int/lit8 v0, v27, 0x2

    move-object/from16 v9, p1

    move/from16 v10, v26

    move-wide/from16 v14, v38

    const/16 v11, 0xde1

    goto/16 :goto_4

    :cond_8
    move v9, v1

    move/from16 v29, v11

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v2, 0x0

    move v5, v7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v6, v50

    .line 559
    invoke-direct/range {v0 .. v7}, Lcom/radaee/view/GLBlock;->drawTrangle(Ljavax/microedition/khronos/opengles/GL10;IIIIII)V

    .line 560
    iget v6, v0, Lcom/radaee/view/GLBlock;->m_w:I

    iget v7, v0, Lcom/radaee/view/GLBlock;->m_h:I

    move/from16 v4, v29

    move/from16 v8, v50

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    move-object v0, v1

    move/from16 v45, v9

    const/16 v2, 0xde1

    const/16 v24, 0x0

    move/from16 v1, p5

    .line 561
    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    shl-int/lit8 v1, v29, 0x10

    shl-int/lit8 v3, v50, 0x10

    shl-int/lit8 v4, v45, 0x10

    shl-int/lit8 v5, v22, 0x10

    shl-int/lit8 v7, v50, 0x10

    shl-int/lit8 v8, v44, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/16 v49, 0xde1

    const/4 v2, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v11, 0x10000

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move v6, v2

    move/from16 v67, v29

    .line 562
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v10, p2

    move-object v9, v0

    const/16 v11, 0xde1

    .line 565
    invoke-interface {v9, v11, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move-object/from16 v10, p0

    .line 568
    iget v0, v10, Lcom/radaee/view/GLBlock;->m_w:I

    int-to-double v1, v0

    iget v3, v10, Lcom/radaee/view/GLBlock;->m_h:I

    sub-int v4, v45, v3

    int-to-double v4, v4

    div-double v4, v4, v18

    add-double/2addr v1, v4

    move/from16 v4, v67

    int-to-double v12, v4

    sub-int/2addr v0, v4

    .line 570
    div-int/lit8 v0, v0, 0x50

    int-to-double v14, v0

    double-to-int v0, v1

    sub-int v1, v0, v4

    const/16 v2, 0x42

    .line 576
    new-array v5, v2, [I

    const/16 v51, 0x0

    .line 577
    aput v4, v5, v51

    .line 578
    aput v24, v5, v17

    sub-int v27, v35, v23

    const/16 v29, 0x5

    const/16 v31, 0x2

    move/from16 v23, v4

    move-object/from16 v30, v5

    .line 579
    invoke-static/range {v23 .. v31}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 581
    new-array v4, v2, [I

    .line 582
    aput v0, v4, v51

    .line 583
    iget v5, v10, Lcom/radaee/view/GLBlock;->m_h:I

    aput v5, v4, v17

    add-int v58, v25, v1

    add-int v60, v27, v1

    add-int v61, v28, v3

    const/16 v62, 0x5

    const/16 v64, 0x2

    move/from16 v56, v0

    move/from16 v59, v3

    move-object/from16 v63, v4

    move/from16 v57, v5

    .line 584
    invoke-static/range {v56 .. v64}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 588
    new-array v7, v2, [I

    .line 589
    aput v50, v7, v51

    .line 590
    aput v45, v7, v17

    sub-int v5, v34, v38

    const/4 v6, 0x5

    const/4 v8, 0x2

    move/from16 v4, v33

    move/from16 v2, v39

    move/from16 v3, v40

    move/from16 v1, v45

    move/from16 v0, v50

    .line 591
    invoke-static/range {v0 .. v8}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-object/from16 v18, v7

    const/4 v0, 0x0

    :goto_6
    const/16 v1, 0x40

    if-ge v0, v1, :cond_9

    .line 595
    aget v2, v18, v0

    shl-int/lit8 v2, v2, 0x10

    add-int/lit8 v3, v0, 0x1

    aget v4, v18, v3

    move v1, v2

    const/16 v48, 0x40

    shl-int/lit8 v2, v4, 0x10

    add-int/lit8 v19, v0, 0x2

    aget v5, v18, v19

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, v0, 0x3

    aget v7, v18, v6

    move v8, v4

    shl-int/lit8 v4, v7, 0x10

    aget v0, v30, v0

    shl-int/lit8 v0, v0, 0x10

    aget v3, v30, v3

    move/from16 v16, v6

    shl-int/lit8 v6, v3, 0x10

    aget v23, v30, v19

    shl-int/lit8 v23, v23, 0x10

    aget v16, v30, v16

    move/from16 v24, v8

    shl-int/lit8 v8, v16, 0x10

    sub-int v3, v24, v3

    shl-int/lit8 v3, v3, 0x10

    div-int v3, v3, v59

    sub-int v7, v7, v16

    shl-int/lit8 v7, v7, 0x10

    div-int v7, v7, v59

    mul-double v24, v12, v41

    iget v11, v10, Lcom/radaee/view/GLBlock;->m_w:I

    move/from16 v16, v0

    move/from16 p2, v1

    int-to-double v0, v11

    div-double v0, v24, v0

    double-to-int v0, v0

    add-double v24, v12, v14

    mul-double v12, v24, v41

    move/from16 v26, v0

    int-to-double v0, v11

    div-double/2addr v12, v0

    double-to-int v0, v12

    move v10, v3

    move v3, v5

    move/from16 v5, v16

    const/16 v16, 0x0

    const/high16 v9, 0x10000

    const/high16 v11, 0x10000

    move-wide v12, v14

    const/4 v14, 0x0

    move-wide/from16 v69, v12

    move/from16 v13, v26

    move-wide/from16 v26, v69

    move/from16 v1, p2

    move v15, v0

    move v12, v7

    move/from16 v7, v23

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move-object/from16 v10, p0

    move-object/from16 v9, p1

    move/from16 v0, v19

    move-wide/from16 v12, v24

    move-wide/from16 v14, v26

    const/16 v11, 0xde1

    goto :goto_6

    :cond_9
    :goto_7
    add-int v15, v20, v50

    shr-int/lit8 v25, v15, 0x1

    add-int v2, v21, v44

    shr-int/lit8 v26, v2, 0x1

    add-int v22, v32, v22

    shr-int/lit8 v5, v22, 0x1

    shr-int/lit8 v6, p4, 0x2

    const/16 v13, 0x42

    .line 613
    new-array v10, v13, [I

    const/4 v14, 0x0

    .line 614
    aput v35, v10, v14

    .line 615
    aput v28, v10, v17

    const/4 v9, 0x5

    const/4 v11, 0x2

    move/from16 v4, v28

    move/from16 v7, v32

    move/from16 v3, v35

    move/from16 v8, v43

    .line 616
    invoke-static/range {v3 .. v11}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v16, v3

    move/from16 v22, v4

    move/from16 v18, v5

    move/from16 v32, v6

    move v15, v7

    move-object/from16 v19, v10

    .line 617
    new-array v0, v13, [I

    .line 618
    aput v33, v0, v14

    .line 619
    aput v34, v0, v17

    const/16 v29, 0x5

    const/16 v31, 0x2

    move-object/from16 v30, v0

    move/from16 v27, v20

    move/from16 v28, v21

    move/from16 v23, v33

    move/from16 v24, v34

    .line 620
    invoke-static/range {v23 .. v31}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v20, v24

    move-object/from16 v21, v30

    const/4 v10, 0x0

    :goto_8
    const/16 v0, 0x40

    if-ge v10, v0, :cond_a

    rsub-int/lit8 v1, v10, 0x40

    int-to-float v1, v1

    mul-float v2, v36, v1

    int-to-float v3, v10

    const/high16 v54, 0x3f800000    # 1.0f

    mul-float v4, v54, v3

    add-float/2addr v2, v4

    const/high16 v4, 0x42800000    # 64.0f

    div-float/2addr v2, v4

    mul-float v1, v1, v37

    const v12, 0x3f4ccccd    # 0.8f

    mul-float v3, v3, v12

    add-float/2addr v1, v3

    div-float/2addr v1, v4

    .line 626
    aget v3, v21, v10

    shl-int/lit8 v3, v3, 0x10

    add-int/lit8 v4, v10, 0x1

    aget v5, v21, v4

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v23, v10, 0x2

    aget v6, v21, v23

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v7, v10, 0x3

    aget v8, v21, v7

    shl-int/lit8 v8, v8, 0x10

    aget v9, v19, v10

    shl-int/lit8 v9, v9, 0x10

    aget v4, v19, v4

    shl-int/lit8 v4, v4, 0x10

    aget v10, v19, v23

    shl-int/lit8 v10, v10, 0x10

    aget v7, v19, v7

    shl-int/lit8 v7, v7, 0x10

    move v11, v2

    move/from16 p2, v10

    move v10, v2

    move v2, v3

    move v3, v5

    move v5, v8

    move/from16 v8, p2

    move/from16 p2, v7

    move v7, v4

    move v4, v6

    move v6, v9

    move/from16 v9, p2

    move-object/from16 v0, p1

    move v12, v1

    move/from16 p2, v15

    const v13, 0x3f4ccccd    # 0.8f

    const/high16 v15, 0x3f800000    # 1.0f

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move/from16 v15, p2

    move/from16 v10, v23

    const/16 v13, 0x42

    goto :goto_8

    :cond_a
    move-object/from16 v0, p1

    move/from16 v10, p6

    move/from16 p2, v15

    const/16 v1, 0xde1

    const v13, 0x3f4ccccd    # 0.8f

    const/high16 v15, 0x3f800000    # 1.0f

    .line 629
    invoke-interface {v0, v1, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/high16 v2, 0x3f800000    # 1.0f

    .line 630
    invoke-interface {v0, v15, v15, v13, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    shl-int/lit8 v3, v27, 0x10

    shl-int/lit8 v4, v28, 0x10

    shl-int/lit8 v5, p3, 0x10

    shl-int/lit8 v6, p4, 0x10

    shl-int/lit8 v7, p2, 0x10

    shl-int/lit8 v8, v43, 0x10

    .line 637
    filled-new-array/range {v3 .. v8}, [I

    move-result-object v9

    move/from16 v34, v3

    move/from16 v35, v4

    move v3, v7

    move v4, v8

    const/16 v7, 0x140c

    .line 638
    invoke-static {v9}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v0, v9, v7, v14, v8}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    const/4 v7, 0x5

    const/4 v11, 0x3

    .line 639
    invoke-interface {v0, v7, v14, v11}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 640
    invoke-interface {v0, v2, v2, v2, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    move/from16 v12, p5

    .line 642
    invoke-interface {v0, v1, v12}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move-object/from16 v7, p0

    .line 643
    iget v8, v7, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int v9, v8, p3

    mul-int/lit8 v9, v9, 0x68

    div-int/lit8 v9, v9, 0x64

    sub-int v9, v8, v9

    mul-int/lit8 v10, p4, 0x68

    .line 644
    div-int/lit8 v10, v10, 0x64

    sub-int v11, v8, v27

    mul-int/lit8 v11, v11, 0x68

    .line 645
    div-int/lit8 v11, v11, 0x64

    sub-int v11, v8, v11

    mul-int/lit8 v12, v28, 0x68

    .line 646
    div-int/lit8 v12, v12, 0x64

    sub-int v13, v8, p2

    mul-int/lit8 v13, v13, 0x68

    .line 647
    div-int/lit8 v13, v13, 0x64

    sub-int v27, v8, v13

    mul-int/lit8 v13, v43, 0x68

    .line 648
    div-int/lit8 v28, v13, 0x64

    sub-int v13, v8, v25

    mul-int/lit8 v13, v13, 0x66

    .line 650
    div-int/lit8 v13, v13, 0x64

    sub-int v13, v8, v13

    mul-int/lit8 v26, v26, 0x66

    .line 651
    div-int/lit8 v15, v26, 0x64

    sub-int v18, v8, v18

    mul-int/lit8 v18, v18, 0x66

    .line 652
    div-int/lit8 v18, v18, 0x64

    sub-int v25, v8, v18

    mul-int/lit8 v8, v32, 0x66

    .line 653
    div-int/lit8 v26, v8, 0x64

    const/16 v8, 0x42

    .line 655
    new-array v1, v8, [I

    .line 656
    aput v16, v1, v14

    .line 657
    aput v22, v1, v17

    const/16 v29, 0x5

    const/16 v31, 0x2

    move-object/from16 v30, v1

    move/from16 v23, v16

    move/from16 v24, v22

    .line 658
    invoke-static/range {v23 .. v31}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v1, v27

    move/from16 v16, v28

    move-object/from16 v18, v30

    .line 659
    new-array v8, v8, [I

    .line 660
    aput v33, v8, v14

    .line 661
    aput v20, v8, v17

    move-object/from16 v30, v8

    move/from16 v27, v11

    move/from16 v28, v12

    move/from16 v25, v13

    move/from16 v26, v15

    move/from16 v24, v20

    move/from16 v23, v33

    .line 662
    invoke-static/range {v23 .. v31}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    shl-int/lit8 v8, v9, 0x10

    shl-int/lit8 v9, v10, 0x10

    shl-int/lit8 v1, v1, 0x10

    shl-int/lit8 v10, v16, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    move v2, v6

    move v6, v9

    const/high16 v47, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    move v7, v1

    move v1, v5

    move v5, v8

    move v8, v10

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    const/16 v51, 0x0

    const/high16 v14, 0x10000

    .line 663
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    shl-int/lit8 v7, v27, 0x10

    shl-int/lit8 v8, v28, 0x10

    move/from16 v3, v34

    move/from16 v4, v35

    .line 666
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    const/4 v0, 0x0

    :goto_9
    const/16 v1, 0x40

    if-ge v0, v1, :cond_b

    .line 671
    aget v2, v19, v0

    shl-int/lit8 v2, v2, 0x10

    add-int/lit8 v17, v0, 0x1

    aget v3, v19, v17

    shl-int/lit8 v3, v3, 0x10

    add-int/lit8 v20, v0, 0x2

    aget v4, v19, v20

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v22, v0, 0x3

    aget v5, v19, v22

    shl-int/lit8 v5, v5, 0x10

    aget v6, v18, v0

    shl-int/lit8 v6, v6, 0x10

    aget v7, v18, v17

    shl-int/lit8 v7, v7, 0x10

    aget v8, v18, v20

    shl-int/lit8 v8, v8, 0x10

    aget v9, v18, v22

    shl-int/lit8 v9, v9, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    const/16 v48, 0x40

    const/4 v9, 0x0

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move/from16 v23, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    .line 674
    aget v0, v21, v23

    shl-int/lit8 v1, v0, 0x10

    aget v0, v21, v17

    shl-int/lit8 v2, v0, 0x10

    aget v0, v21, v20

    shl-int/lit8 v3, v0, 0x10

    aget v0, v21, v22

    shl-int/lit8 v4, v0, 0x10

    aget v0, v30, v23

    shl-int/lit8 v5, v0, 0x10

    aget v0, v30, v17

    shl-int/lit8 v6, v0, 0x10

    aget v0, v30, v20

    shl-int/lit8 v7, v0, 0x10

    aget v0, v30, v22

    shl-int/lit8 v8, v0, 0x10

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v0, v20

    goto :goto_9

    :cond_b
    move-object/from16 v0, p1

    const/16 v1, 0xde1

    const/4 v14, 0x0

    .line 678
    invoke-interface {v0, v1, v14}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/high16 v2, 0x3f800000    # 1.0f

    .line 679
    invoke-interface {v0, v2, v2, v2, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    return-void

    :cond_c
    move/from16 v10, p6

    move-object v0, v1

    move v12, v13

    move/from16 v50, v15

    const/16 v1, 0xde1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v11, 0x3

    const v13, 0x3f4ccccd    # 0.8f

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    const/16 v3, 0x20

    :goto_a
    const/4 v6, 0x0

    move-object/from16 v7, p0

    .line 403
    iget v4, v7, Lcom/radaee/view/GLBlock;->m_h:I

    const/high16 v47, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    move/from16 v5, p4

    move/from16 v8, v50

    move v9, v4

    move/from16 v3, p4

    move-object v1, v0

    move-object v0, v7

    const/16 v10, 0xde1

    move v7, v4

    move/from16 v4, v50

    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    .line 404
    invoke-interface {v1, v10, v12}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    mul-int/lit8 v2, p4, 0x3

    .line 405
    div-int/lit8 v17, v2, 0x8

    sub-int v18, p4, v17

    shr-int/lit8 v2, p4, 0x3

    add-int v3, v18, v2

    shl-int/lit8 v3, v3, 0x10

    .line 407
    iget v4, v0, Lcom/radaee/view/GLBlock;->m_w:I

    move v5, v2

    move v2, v3

    shl-int/lit8 v3, v4, 0x10

    sub-int v5, v18, v5

    shl-int/lit8 v6, v5, 0x10

    shl-int/lit8 v7, v4, 0x10

    const/high16 v54, 0x3f800000    # 1.0f

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/4 v1, 0x0

    const/4 v5, 0x0

    const/4 v9, 0x0

    const/16 v49, 0xde1

    const/4 v10, 0x0

    const/16 v53, 0x3

    const/high16 v11, 0x10000

    const/4 v12, 0x0

    const v55, 0x3f4ccccd    # 0.8f

    const/4 v13, 0x0

    const/16 v51, 0x0

    const/high16 v14, 0x10000

    move v4, v2

    move v8, v6

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    shl-int/lit8 v2, p4, 0x10

    move-object/from16 v13, p0

    .line 410
    iget v0, v13, Lcom/radaee/view/GLBlock;->m_w:I

    shl-int/lit8 v4, v0, 0x10

    shl-int/lit8 v7, v18, 0x10

    shl-int/lit8 v8, v0, 0x10

    move v3, v2

    const/4 v2, 0x0

    const/4 v6, 0x0

    move v5, v3

    move v9, v7

    move/from16 v11, v54

    move-object/from16 v0, p1

    move/from16 v1, p6

    const/high16 v10, 0x3f800000    # 1.0f

    const v12, 0x3f4ccccd    # 0.8f

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move v14, v3

    const/high16 v54, 0x3f800000    # 1.0f

    const v55, 0x3f4ccccd    # 0.8f

    .line 412
    div-int/lit8 v17, v17, 0x3

    const/4 v10, 0x0

    const/16 v15, 0x20

    :goto_b
    if-ge v10, v15, :cond_d

    mul-int v0, v17, v10

    .line 415
    div-int/2addr v0, v15

    add-int v0, v18, v0

    shl-int/lit8 v3, v0, 0x10

    iget v0, v13, Lcom/radaee/view/GLBlock;->m_w:I

    shl-int/lit8 v4, v0, 0x10

    add-int/lit8 v16, v10, 0x1

    mul-int v1, v17, v16

    div-int/2addr v1, v15

    add-int v1, v18, v1

    shl-int/lit8 v7, v1, 0x10

    shl-int/lit8 v8, v0, 0x10

    rsub-int/lit8 v0, v10, 0x20

    int-to-float v0, v0

    mul-float v1, v36, v0

    int-to-float v2, v10

    mul-float v10, v54, v2

    add-float/2addr v1, v10

    div-float v10, v1, v23

    mul-float v0, v0, v37

    mul-float v1, v55, v2

    add-float/2addr v0, v1

    div-float v12, v0, v23

    const/4 v2, 0x0

    const/4 v6, 0x0

    move v5, v3

    move v9, v7

    move v11, v10

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move/from16 v10, v16

    goto :goto_b

    :cond_d
    move-object/from16 v0, p1

    const/high16 v10, 0x3f800000    # 1.0f

    .line 419
    invoke-interface {v0, v10, v10, v10, v10}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    move/from16 v11, p5

    const/16 v1, 0xde1

    .line 420
    invoke-interface {v0, v1, v11}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    mul-int/lit8 v2, p4, 0x68

    .line 421
    div-int/lit8 v2, v2, 0x64

    .line 422
    iget v3, v13, Lcom/radaee/view/GLBlock;->m_w:I

    move v4, v3

    shl-int/lit8 v3, v4, 0x10

    shl-int/lit8 v6, v2, 0x10

    shl-int/lit8 v7, v4, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/16 v49, 0xde1

    const/4 v1, 0x0

    const/4 v5, 0x0

    const/4 v9, 0x0

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    move v2, v14

    const/high16 v14, 0x10000

    move v4, v2

    move v8, v6

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    const/4 v12, 0x0

    const/16 v13, 0xde1

    .line 425
    invoke-interface {v0, v13, v12}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void

    :cond_e
    :goto_c
    move-object v0, v1

    move v11, v13

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/16 v13, 0xde1

    const/16 v15, 0x20

    const/16 v53, 0x3

    const/high16 v54, 0x3f800000    # 1.0f

    const v55, 0x3f4ccccd    # 0.8f

    const/4 v6, 0x0

    move-object/from16 v7, p0

    .line 376
    iget v1, v7, Lcom/radaee/view/GLBlock;->m_h:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move/from16 v8, p3

    move v9, v1

    move v4, v1

    move-object v1, v0

    move-object v0, v7

    move v7, v4

    move/from16 v4, p3

    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    .line 377
    invoke-interface {v1, v13, v11}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 378
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int v2, v2, p3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v17, v2, 0x8

    mul-int/lit8 v2, v17, 0x2

    .line 379
    div-int/lit8 v2, v2, 0x3

    add-int v18, p3, v2

    shl-int/lit8 v4, v18, 0x10

    .line 380
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_h:I

    move v1, v4

    shl-int/lit8 v4, v2, 0x10

    mul-int/lit8 v3, v17, 0x4

    div-int/lit8 v3, v3, 0x3

    add-int v3, p3, v3

    shl-int/lit8 v5, v3, 0x10

    shl-int/lit8 v8, v2, 0x10

    const/16 v68, 0x20

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/4 v2, 0x0

    const/4 v9, 0x0

    const/high16 v47, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/high16 v11, 0x10000

    const/16 v51, 0x0

    const/4 v12, 0x0

    const/16 v49, 0xde1

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move v3, v1

    move v7, v5

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    shl-int/lit8 v2, p3, 0x10

    move-object/from16 v13, p0

    .line 383
    iget v0, v13, Lcom/radaee/view/GLBlock;->m_h:I

    shl-int/lit8 v7, v0, 0x10

    shl-int/lit8 v9, v0, 0x10

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v6, v2

    move v8, v1

    move/from16 v11, v54

    move-object/from16 v0, p1

    move v4, v1

    const/high16 v10, 0x3f800000    # 1.0f

    const v12, 0x3f4ccccd    # 0.8f

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move v14, v2

    const/high16 v54, 0x3f800000    # 1.0f

    const v55, 0x3f4ccccd    # 0.8f

    .line 385
    div-int/lit8 v17, v17, 0x3

    const/4 v10, 0x0

    const/16 v15, 0x20

    :goto_d
    if-ge v10, v15, :cond_f

    mul-int v0, v17, v10

    .line 388
    div-int/2addr v0, v15

    add-int v0, v18, v0

    shl-int/lit8 v2, v0, 0x10

    add-int/lit8 v16, v10, 0x1

    mul-int v0, v17, v16

    div-int/2addr v0, v15

    add-int v0, v18, v0

    shl-int/lit8 v4, v0, 0x10

    iget v0, v13, Lcom/radaee/view/GLBlock;->m_h:I

    shl-int/lit8 v7, v0, 0x10

    shl-int/lit8 v9, v0, 0x10

    int-to-float v0, v10

    mul-float v1, v36, v0

    rsub-int/lit8 v3, v10, 0x20

    int-to-float v3, v3

    mul-float v10, v54, v3

    add-float/2addr v1, v10

    div-float v10, v1, v23

    mul-float v0, v0, v37

    mul-float v1, v55, v3

    add-float/2addr v0, v1

    div-float v12, v0, v23

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v6, v2

    move v8, v4

    move v11, v10

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move/from16 v10, v16

    goto :goto_d

    :cond_f
    move-object/from16 v0, p1

    const/high16 v2, 0x3f800000    # 1.0f

    .line 392
    invoke-interface {v0, v2, v2, v2, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    move/from16 v1, p5

    const/16 v2, 0xde1

    .line 394
    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 395
    iget v1, v13, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int v3, v1, p3

    mul-int/lit8 v3, v3, 0x68

    div-int/lit8 v3, v3, 0x64

    sub-int/2addr v1, v3

    .line 396
    iget v3, v13, Lcom/radaee/view/GLBlock;->m_h:I

    shl-int/lit8 v4, v3, 0x10

    shl-int/lit8 v5, v1, 0x10

    shl-int/lit8 v8, v3, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/16 v49, 0xde1

    const/4 v2, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    move v1, v14

    const/high16 v14, 0x10000

    move v3, v1

    move v7, v5

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    const/16 v1, 0xde1

    const/4 v14, 0x0

    .line 399
    invoke-interface {v0, v1, v14}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void
.end method

.method private drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    shl-int/lit8 v2, p2, 0x10

    shl-int/lit8 v3, p3, 0x10

    shl-int/lit8 v4, p4, 0x10

    shl-int/lit8 v5, p5, 0x10

    shl-int/lit8 v6, p6, 0x10

    shl-int/lit8 v7, p7, 0x10

    shl-int/lit8 v8, p8, 0x10

    shl-int/lit8 v9, p9, 0x10

    move/from16 p2, v2

    move/from16 p3, v3

    move/from16 p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    move/from16 p7, v7

    move/from16 p8, v8

    move/from16 p9, v9

    .line 273
    filled-new-array/range {p2 .. p9}, [I

    move-result-object v2

    const/4 v3, 0x0

    .line 275
    aget v4, v2, v3

    iget v5, v0, Lcom/radaee/view/GLBlock;->m_w:I

    div-int/2addr v4, v5

    const/4 v6, 0x1

    .line 276
    aget v6, v2, v6

    iget v7, v0, Lcom/radaee/view/GLBlock;->m_h:I

    div-int/2addr v6, v7

    const/4 v8, 0x2

    .line 277
    aget v9, v2, v8

    div-int/2addr v9, v5

    const/4 v10, 0x3

    .line 278
    aget v10, v2, v10

    div-int/2addr v10, v7

    const/4 v11, 0x4

    .line 279
    aget v12, v2, v11

    div-int/2addr v12, v5

    const/4 v13, 0x5

    .line 280
    aget v14, v2, v13

    div-int/2addr v14, v7

    const/4 v15, 0x6

    .line 281
    aget v15, v2, v15

    div-int/2addr v15, v5

    const/4 v5, 0x7

    .line 282
    aget v5, v2, v5

    div-int/2addr v5, v7

    move/from16 p2, v4

    move/from16 p9, v5

    move/from16 p3, v6

    move/from16 p4, v9

    move/from16 p5, v10

    move/from16 p6, v12

    move/from16 p7, v14

    move/from16 p8, v15

    filled-new-array/range {p2 .. p9}, [I

    move-result-object v4

    .line 284
    invoke-static {v2}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object v2

    const/16 v5, 0x140c

    invoke-interface {v1, v8, v5, v3, v2}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 285
    invoke-static {v4}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object v2

    invoke-interface {v1, v8, v5, v3, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 286
    invoke-interface {v1, v13, v3, v11}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    return-void
.end method

.method public static drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V
    .locals 0

    .line 221
    filled-new-array/range {p2 .. p9}, [I

    move-result-object p2

    .line 222
    sget-object p3, Lcom/radaee/view/GLBlock;->m_text:Ljava/nio/IntBuffer;

    const/4 p4, 0x2

    const/16 p5, 0x140c

    const/4 p6, 0x0

    invoke-interface {p0, p4, p5, p6, p3}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 223
    invoke-static {p2}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p2

    invoke-interface {p0, p4, p5, p6, p2}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 227
    invoke-static {p10}, Lcom/radaee/pdf/Global;->themeR(F)F

    move-result p2

    invoke-static {p11}, Lcom/radaee/pdf/Global;->themeG(F)F

    move-result p3

    invoke-static {p12}, Lcom/radaee/pdf/Global;->themeB(F)F

    move-result p4

    const/high16 p5, 0x3f800000    # 1.0f

    invoke-interface {p0, p2, p3, p4, p5}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    const/16 p2, 0xde1

    .line 229
    invoke-interface {p0, p2, p1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/4 p1, 0x5

    const/4 p3, 0x4

    .line 233
    invoke-interface {p0, p1, p6, p3}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 234
    invoke-interface {p0, p2, p6}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void
.end method

.method public static drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V
    .locals 0

    .line 247
    filled-new-array/range {p1 .. p8}, [I

    move-result-object p1

    .line 256
    filled-new-array/range {p9 .. p16}, [I

    move-result-object p2

    .line 258
    invoke-static {p1}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p1

    const/4 p3, 0x2

    const/16 p4, 0x140c

    const/4 p5, 0x0

    invoke-interface {p0, p3, p4, p5, p1}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 259
    invoke-static {p2}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p1

    invoke-interface {p0, p3, p4, p5, p1}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    const/4 p1, 0x5

    const/4 p2, 0x4

    .line 260
    invoke-interface {p0, p1, p5, p2}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    return-void
.end method

.method private drawRB(Ljavax/microedition/khronos/opengles/GL10;IIIII)V
    .locals 78

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    const/16 v14, 0xde1

    .line 684
    invoke-interface {v1, v14, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 692
    iget v15, v0, Lcom/radaee/view/GLBlock;->m_w:I

    add-int v2, v15, v11

    const/16 v17, 0x1

    shr-int/lit8 v2, v2, 0x1

    .line 693
    iget v9, v0, Lcom/radaee/view/GLBlock;->m_h:I

    add-int v3, v9, v12

    shr-int/lit8 v3, v3, 0x1

    add-int v4, v2, v11

    shr-int/lit8 v4, v4, 0x1

    add-int v5, v3, v12

    shr-int/lit8 v5, v5, 0x1

    if-lt v12, v9, :cond_0

    const-wide v6, 0x40f86a0000000000L    # 100000.0

    goto :goto_0

    :cond_0
    sub-int v6, v15, v11

    int-to-float v6, v6

    sub-int v7, v9, v12

    int-to-float v7, v7

    div-float/2addr v6, v7

    float-to-double v6, v6

    :goto_0
    move-wide/from16 v18, v6

    sub-int v3, v9, v3

    int-to-double v6, v3

    int-to-double v2, v2

    mul-double v2, v2, v18

    sub-double/2addr v6, v2

    sub-int v2, v9, v5

    int-to-double v2, v2

    int-to-double v4, v4

    mul-double v4, v4, v18

    sub-double/2addr v2, v4

    int-to-double v4, v15

    mul-double v4, v4, v18

    add-double/2addr v4, v6

    double-to-int v4, v4

    sub-int v20, v9, v4

    neg-double v4, v6

    div-double v4, v4, v18

    double-to-int v8, v4

    int-to-double v4, v15

    mul-double v4, v4, v18

    add-double/2addr v4, v2

    double-to-int v4, v4

    sub-int v4, v9, v4

    neg-double v2, v2

    div-double v2, v2, v18

    double-to-int v3, v2

    const-wide v5, 0x40f869f000000000L    # 99999.0

    const/high16 v21, 0x42000000    # 32.0f

    const/16 v2, 0x20

    const/high16 v7, 0x3f800000    # 1.0f

    const/16 v16, 0x3

    const/16 v22, 0x10

    const/high16 v23, 0x3f000000    # 0.5f

    const v24, 0x3ecccccd    # 0.4f

    const v10, 0x3f4ccccd    # 0.8f

    cmpl-double v27, v18, v5

    if-gtz v27, :cond_e

    const/16 v5, -0x7530

    if-ge v4, v5, :cond_1

    goto/16 :goto_c

    :cond_1
    if-eq v11, v15, :cond_c

    if-ge v3, v5, :cond_2

    goto/16 :goto_a

    :cond_2
    add-int v2, v15, v11

    shr-int/lit8 v31, v2, 0x1

    add-int v2, v20, v12

    shr-int/lit8 v32, v2, 0x1

    add-int v2, v8, v11

    shr-int/lit8 v37, v2, 0x1

    add-int v2, v9, v12

    shr-int/lit8 v38, v2, 0x1

    add-int v2, v15, v31

    shl-int/lit8 v5, v15, 0x1

    add-int/2addr v2, v5

    const/4 v5, 0x2

    shr-int/lit8 v27, v2, 0x2

    add-int v2, v4, v32

    shl-int/lit8 v6, v20, 0x1

    add-int/2addr v2, v6

    shr-int/lit8 v28, v2, 0x2

    add-int v2, v37, v3

    shl-int/lit8 v6, v8, 0x1

    add-int/2addr v2, v6

    shr-int/lit8 v33, v2, 0x2

    add-int v2, v38, v9

    shl-int/lit8 v6, v9, 0x1

    add-int/2addr v2, v6

    shr-int/lit8 v34, v2, 0x2

    add-int v2, v15, v15

    shr-int/lit8 v21, v2, 0x1

    add-int v2, v4, v20

    shr-int/lit8 v29, v2, 0x1

    add-int v2, v3, v8

    shr-int/lit8 v30, v2, 0x1

    add-int v2, v9, v9

    shr-int/lit8 v35, v2, 0x1

    sub-int v2, v15, v11

    sub-int v6, v9, v12

    if-le v6, v2, :cond_3

    mul-int/lit8 v6, v6, 0x3

    mul-int/lit8 v2, v2, 0x2

    .line 784
    div-int/2addr v6, v2

    move/from16 v39, v6

    const/16 v36, 0x1

    goto :goto_1

    :cond_3
    mul-int/lit8 v6, v6, 0x3

    mul-int/lit8 v2, v2, 0x2

    .line 789
    div-int/2addr v6, v2

    move/from16 v36, v6

    const/16 v39, 0x1

    :goto_1
    const/16 v2, 0x40

    if-gez v3, :cond_4

    if-gez v4, :cond_4

    int-to-double v5, v15

    div-double v5, v5, v18

    double-to-int v4, v5

    sub-int v4, v15, v4

    int-to-double v5, v3

    mul-double v5, v5, v18

    double-to-int v3, v5

    add-int/2addr v3, v9

    const/16 v5, 0x40

    const/4 v2, 0x0

    move v7, v3

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/16 v18, 0x40

    const/4 v5, 0x0

    const/high16 v19, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    .line 794
    invoke-direct/range {v0 .. v7}, Lcom/radaee/view/GLBlock;->drawTrangle(Ljavax/microedition/khronos/opengles/GL10;IIIIII)V

    move/from16 v42, v8

    move/from16 v47, v9

    move/from16 v45, v15

    goto/16 :goto_7

    :cond_4
    const-wide/high16 v40, 0x40f0000000000000L    # 65536.0

    if-gez v4, :cond_6

    int-to-double v0, v4

    div-double v0, v0, v18

    double-to-int v2, v0

    add-int/2addr v2, v15

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v7, v4

    move v4, v2

    const/4 v2, 0x0

    move/from16 v18, v8

    move v8, v3

    const/4 v3, 0x0

    move/from16 v19, v7

    move v7, v9

    move-wide/from16 v43, v0

    move/from16 v42, v18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 799
    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    move-object v0, v1

    move v3, v8

    .line 800
    invoke-interface {v0, v14, v13}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    shl-int/lit8 v1, v3, 0x10

    shl-int/lit8 v2, v7, 0x10

    shl-int/lit8 v3, v15, 0x10

    shl-int/lit8 v4, v19, 0x10

    shl-int/lit8 v5, v42, 0x10

    shl-int/lit8 v6, v7, 0x10

    shl-int/lit8 v7, v15, 0x10

    move/from16 v18, v8

    shl-int/lit8 v8, v20, 0x10

    move/from16 v45, v15

    const/high16 v15, 0x10000

    const/16 v46, 0x3

    const/high16 v16, 0x10000

    move/from16 v47, v9

    const/4 v9, 0x0

    const v51, 0x3f4ccccd    # 0.8f

    const/4 v10, 0x0

    const/high16 v11, 0x10000

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v52, 0xde1

    const/high16 v14, 0x10000

    move/from16 v55, v18

    move/from16 v54, v47

    .line 801
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v10, p2

    move-object v12, v0

    const/16 v13, 0xde1

    .line 804
    invoke-interface {v12, v13, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move-object/from16 v14, p0

    .line 807
    iget v0, v14, Lcom/radaee/view/GLBlock;->m_w:I

    int-to-double v1, v0

    add-double v1, v1, v43

    move/from16 v3, v55

    int-to-double v4, v3

    sub-int/2addr v0, v3

    .line 809
    div-int/lit8 v0, v0, 0x50

    int-to-double v6, v0

    double-to-int v0, v1

    sub-int v18, v0, v3

    move/from16 v9, v54

    neg-int v15, v9

    const/16 v8, 0x42

    .line 813
    new-array v10, v8, [I

    const/16 v25, 0x0

    .line 814
    aput v3, v10, v25

    .line 815
    aput v9, v10, v17

    move-wide/from16 v43, v6

    sub-int v7, v33, v39

    move/from16 v47, v9

    const/4 v9, 0x5

    const/4 v11, 0x2

    move-wide/from16 v25, v4

    move/from16 v5, v30

    move/from16 v8, v34

    move/from16 v6, v35

    move/from16 v4, v47

    const/16 v12, 0x42

    const/4 v13, 0x0

    .line 816
    invoke-static/range {v3 .. v11}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-object/from16 v39, v10

    .line 818
    new-array v3, v12, [I

    .line 819
    aput v0, v3, v13

    const/16 v59, 0x0

    .line 820
    aput v59, v3, v17

    add-int v60, v30, v18

    add-int v61, v35, v15

    add-int v62, v7, v18

    add-int v63, v34, v15

    const/16 v64, 0x5

    const/16 v66, 0x2

    move/from16 v58, v0

    move-object/from16 v65, v3

    .line 821
    invoke-static/range {v58 .. v66}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 823
    new-array v7, v12, [I

    .line 824
    aput v45, v7, v13

    .line 825
    aput v19, v7, v17

    sub-int v5, v28, v36

    const/4 v6, 0x5

    const/4 v8, 0x2

    move-wide v9, v1

    move/from16 v1, v19

    move/from16 v2, v21

    move/from16 v4, v27

    move/from16 v3, v29

    move/from16 v0, v45

    .line 826
    invoke-static/range {v0 .. v8}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-object/from16 v19, v7

    move-wide/from16 v29, v25

    const/4 v0, 0x0

    move-wide/from16 v25, v9

    :goto_2
    const/16 v1, 0x40

    if-ge v0, v1, :cond_9

    add-int/lit8 v2, v0, 0x1

    .line 830
    aget v3, v19, v2

    if-gez v3, :cond_5

    .line 831
    aget v3, v65, v0

    shl-int/lit8 v3, v3, 0x10

    aget v4, v65, v2

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v0, 0x2

    aget v6, v65, v5

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v7, v0, 0x3

    aget v8, v65, v7

    shl-int/lit8 v8, v8, 0x10

    aget v9, v39, v0

    shl-int/lit8 v9, v9, 0x10

    aget v2, v39, v2

    shl-int/lit8 v2, v2, 0x10

    aget v5, v39, v5

    shl-int/lit8 v5, v5, 0x10

    aget v7, v39, v7

    shl-int/lit8 v7, v7, 0x10

    mul-double v10, v25, v40

    double-to-int v10, v10

    iget v11, v14, Lcom/radaee/view/GLBlock;->m_w:I

    div-int/2addr v10, v11

    add-double v35, v25, v43

    move/from16 p2, v2

    mul-double v1, v35, v40

    double-to-int v1, v1

    div-int/2addr v1, v11

    mul-double v12, v29, v40

    double-to-int v2, v12

    div-int v13, v2, v11

    add-double v35, v29, v43

    move v12, v0

    move v2, v1

    mul-double v0, v35, v40

    double-to-int v0, v0

    div-int/2addr v0, v11

    const/high16 v16, 0x10000

    move v11, v2

    move v2, v4

    move v4, v8

    move v8, v7

    move v7, v5

    move v5, v9

    move v9, v10

    const/4 v10, 0x0

    move v1, v12

    const/4 v12, 0x0

    const/high16 v14, 0x10000

    move/from16 v35, v1

    move v1, v3

    move v3, v6

    move/from16 v21, v15

    move/from16 v6, p2

    move v15, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    goto/16 :goto_3

    :cond_5
    move/from16 v35, v0

    move/from16 v21, v15

    .line 836
    aget v0, v19, v35

    shl-int/lit8 v1, v0, 0x10

    move v4, v2

    shl-int/lit8 v2, v3, 0x10

    add-int/lit8 v5, v35, 0x2

    aget v6, v19, v5

    move v7, v3

    shl-int/lit8 v3, v6, 0x10

    add-int/lit8 v8, v35, 0x3

    aget v9, v19, v8

    move v10, v4

    shl-int/lit8 v4, v9, 0x10

    aget v11, v39, v35

    move v12, v5

    shl-int/lit8 v5, v11, 0x10

    aget v13, v39, v10

    shl-int/lit8 v13, v13, 0x10

    aget v14, v39, v12

    move v15, v7

    shl-int/lit8 v7, v14, 0x10

    aget v16, v39, v8

    shl-int/lit8 v16, v16, 0x10

    sub-int v11, v0, v11

    shl-int/lit8 v11, v11, 0x10

    div-int v11, v11, v18

    move/from16 p2, v0

    move/from16 v36, v1

    int-to-double v0, v11

    mul-double v0, v0, v25

    aget v11, v65, v35

    sub-int v11, v11, p2

    shl-int/lit8 v11, v11, 0x10

    div-int v11, v11, v18

    move-wide/from16 v48, v0

    int-to-double v0, v11

    mul-double v0, v0, v29

    add-double v0, v48, v0

    double-to-int v0, v0

    move-object/from16 v1, p0

    iget v11, v1, Lcom/radaee/view/GLBlock;->m_w:I

    div-int/2addr v0, v11

    aget v10, v65, v10

    sub-int/2addr v10, v15

    move/from16 p2, v0

    int-to-long v0, v10

    shl-long v0, v0, v22

    long-to-int v1, v0

    div-int v10, v1, v21

    sub-int v0, v6, v14

    shl-int/lit8 v0, v0, 0x10

    div-int v0, v0, v18

    int-to-double v0, v0

    add-double v14, v25, v43

    mul-double v0, v0, v14

    aget v12, v65, v12

    sub-int/2addr v12, v6

    shl-int/lit8 v6, v12, 0x10

    div-int v6, v6, v18

    int-to-double v14, v6

    add-double v48, v29, v43

    mul-double v14, v14, v48

    add-double/2addr v0, v14

    double-to-int v0, v0

    div-int/2addr v0, v11

    aget v1, v65, v8

    sub-int/2addr v1, v9

    int-to-long v8, v1

    shl-long v8, v8, v22

    long-to-int v1, v8

    div-int v12, v1, v21

    mul-double v8, v29, v40

    int-to-double v14, v11

    div-double/2addr v8, v14

    double-to-int v1, v8

    mul-double v48, v48, v40

    int-to-double v8, v11

    div-double v8, v48, v8

    double-to-int v15, v8

    move/from16 v8, v16

    const/high16 v16, 0x10000

    const/high16 v14, 0x10000

    move/from16 v9, p2

    move v11, v0

    move v6, v13

    move-object/from16 v0, p1

    move v13, v1

    move/from16 v1, v36

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    :goto_3
    add-double v25, v25, v43

    add-double v29, v29, v43

    add-int/lit8 v0, v35, 0x2

    move-object/from16 v14, p0

    move/from16 v15, v21

    const/16 v12, 0x42

    const/4 v13, 0x0

    goto/16 :goto_2

    :cond_6
    move/from16 v10, p2

    move v1, v4

    move/from16 v42, v8

    move/from16 v47, v9

    move/from16 v45, v15

    move/from16 v25, v29

    if-gez v3, :cond_8

    move v8, v3

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move v6, v8

    move/from16 v8, v45

    move-object/from16 v0, p0

    move v9, v1

    move/from16 v4, v45

    move/from16 v7, v47

    move-object/from16 v1, p1

    .line 851
    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    move-object v0, v1

    move v3, v6

    const/16 v2, 0xde1

    move/from16 v1, p5

    .line 852
    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    shl-int/lit8 v1, v3, 0x10

    const/16 v52, 0xde1

    shl-int/lit8 v2, v47, 0x10

    move v8, v3

    shl-int/lit8 v3, v4, 0x10

    shl-int/lit8 v4, v9, 0x10

    shl-int/lit8 v5, v42, 0x10

    shl-int/lit8 v6, v47, 0x10

    shl-int/lit8 v7, v45, 0x10

    move/from16 v55, v8

    shl-int/lit8 v8, v20, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    move v11, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    move v12, v11

    const/high16 v11, 0x10000

    move v13, v12

    const/4 v12, 0x0

    move v14, v13

    const/4 v13, 0x0

    move/from16 v26, v14

    const/high16 v14, 0x10000

    move/from16 v68, v26

    move/from16 v67, v45

    move/from16 v69, v55

    .line 853
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v10, p2

    move-object v12, v0

    const/16 v13, 0xde1

    .line 856
    invoke-interface {v12, v13, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move/from16 v1, v68

    int-to-double v14, v1

    move-object/from16 v0, p0

    .line 859
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_h:I

    int-to-double v3, v2

    move/from16 v8, v69

    int-to-double v5, v8

    mul-double v5, v5, v18

    add-double/2addr v3, v5

    sub-int/2addr v2, v1

    .line 860
    div-int/lit8 v2, v2, 0x50

    int-to-double v5, v2

    move/from16 v2, v67

    neg-int v7, v2

    sub-double v9, v3, v14

    double-to-int v9, v9

    const/16 v10, 0x42

    .line 864
    new-array v11, v10, [I

    const/16 v58, 0x0

    const/4 v13, 0x0

    .line 865
    aput v58, v11, v13

    const/16 v53, 0x0

    double-to-int v13, v3

    .line 866
    aput v13, v11, v17

    add-int v60, v21, v7

    add-int v61, v25, v9

    add-int v62, v27, v7

    sub-int v16, v28, v36

    add-int v63, v16, v9

    const/16 v64, 0x5

    const/16 v66, 0x2

    move-object/from16 v65, v11

    move/from16 v59, v13

    .line 867
    invoke-static/range {v58 .. v66}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    const/16 v9, 0x42

    .line 869
    new-array v10, v9, [I

    .line 870
    aput v8, v10, v53

    .line 871
    aput v47, v10, v17

    move v11, v7

    sub-int v7, v33, v39

    const/16 v49, 0x42

    const/4 v9, 0x5

    move v13, v11

    const/4 v11, 0x2

    move-wide/from16 v18, v5

    move/from16 v5, v30

    move-wide/from16 v29, v18

    move-wide/from16 v18, v3

    move v3, v8

    move/from16 v26, v13

    move/from16 v8, v34

    move/from16 v6, v35

    move/from16 v4, v47

    const/16 v13, 0x42

    .line 872
    invoke-static/range {v3 .. v11}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-object/from16 v35, v10

    .line 874
    new-array v7, v13, [I

    .line 875
    aput v2, v7, v53

    .line 876
    aput v1, v7, v17

    const/4 v6, 0x5

    const/4 v8, 0x2

    move-object v9, v0

    move v0, v2

    move/from16 v5, v16

    move/from16 v2, v21

    move/from16 v3, v25

    move/from16 v4, v27

    .line 877
    invoke-static/range {v0 .. v8}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v45, v0

    move-object/from16 v21, v7

    move-wide/from16 v43, v14

    const/4 v0, 0x0

    :goto_4
    const/16 v1, 0x40

    if-ge v0, v1, :cond_9

    .line 881
    aget v2, v35, v0

    aget v3, v65, v0

    if-ge v2, v3, :cond_7

    .line 882
    aget v2, v21, v0

    shl-int/lit8 v2, v2, 0x10

    add-int/lit8 v4, v0, 0x1

    aget v5, v21, v4

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v6, v0, 0x2

    aget v7, v21, v6

    shl-int/lit8 v7, v7, 0x10

    add-int/lit8 v8, v0, 0x3

    aget v10, v21, v8

    shl-int/lit8 v10, v10, 0x10

    move v1, v2

    move v2, v5

    const/16 v48, 0x40

    shl-int/lit8 v5, v3, 0x10

    aget v3, v65, v4

    shl-int/lit8 v3, v3, 0x10

    aget v4, v65, v6

    shl-int/lit8 v4, v4, 0x10

    aget v6, v65, v8

    shl-int/lit8 v8, v6, 0x10

    mul-double v14, v43, v40

    double-to-int v6, v14

    iget v11, v9, Lcom/radaee/view/GLBlock;->m_h:I

    div-int/2addr v6, v11

    add-double v14, v43, v29

    mul-double v14, v14, v40

    double-to-int v14, v14

    div-int/2addr v14, v11

    move/from16 p2, v14

    mul-double v13, v18, v40

    double-to-int v13, v13

    div-int v14, v13, v11

    add-double v15, v18, v29

    move v13, v0

    move/from16 v25, v1

    mul-double v0, v15, v40

    double-to-int v0, v0

    div-int v16, v0, v11

    const/high16 v9, 0x10000

    const/high16 v11, 0x10000

    move v0, v13

    const/4 v13, 0x0

    const/4 v15, 0x0

    move v1, v6

    move v6, v3

    move v3, v7

    move v7, v4

    move v4, v10

    move v10, v1

    move/from16 v53, v0

    move-object v0, v12

    move/from16 v1, v25

    move/from16 v12, p2

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    goto/16 :goto_5

    :cond_7
    move/from16 v53, v0

    .line 887
    aget v0, v21, v53

    shl-int/lit8 v1, v0, 0x10

    add-int/lit8 v0, v53, 0x1

    aget v4, v21, v0

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v53, 0x2

    aget v6, v21, v5

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v7, v53, 0x3

    aget v8, v21, v7

    shl-int/lit8 v8, v8, 0x10

    move v9, v5

    shl-int/lit8 v5, v2, 0x10

    aget v0, v35, v0

    shl-int/lit8 v0, v0, 0x10

    aget v10, v35, v9

    move v11, v7

    shl-int/lit8 v7, v10, 0x10

    aget v11, v35, v11

    shl-int/lit8 v11, v11, 0x10

    mul-double v12, v43, v40

    double-to-int v12, v12

    move-object/from16 v13, p0

    iget v14, v13, Lcom/radaee/view/GLBlock;->m_h:I

    div-int/2addr v12, v14

    add-double v15, v43, v29

    move/from16 v25, v0

    move/from16 p2, v1

    mul-double v0, v15, v40

    double-to-int v0, v0

    div-int/2addr v0, v14

    sub-int/2addr v3, v2

    shl-int/lit8 v1, v3, 0x10

    div-int v1, v1, v26

    mul-double v2, v18, v40

    double-to-int v2, v2

    div-int/2addr v2, v14

    aget v3, v65, v9

    sub-int/2addr v3, v10

    shl-int/lit8 v3, v3, 0x10

    div-int v15, v3, v26

    add-double v9, v18, v29

    mul-double v9, v9, v40

    double-to-int v3, v9

    div-int v16, v3, v14

    const/high16 v9, 0x10000

    move v14, v2

    move v2, v4

    move v4, v8

    move v8, v11

    const/high16 v11, 0x10000

    move v13, v1

    move v3, v6

    move v10, v12

    move/from16 v6, v25

    move/from16 v1, p2

    move v12, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    :goto_5
    add-double v43, v43, v29

    add-double v18, v18, v29

    add-int/lit8 v0, v53, 0x2

    move-object/from16 v9, p0

    move-object/from16 v12, p1

    const/16 v13, 0x42

    const/16 v53, 0x0

    goto/16 :goto_4

    :cond_8
    move v9, v1

    move v8, v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v4, v45

    move/from16 v7, v47

    .line 899
    invoke-direct/range {v0 .. v7}, Lcom/radaee/view/GLBlock;->drawTrangle(Ljavax/microedition/khronos/opengles/GL10;IIIIII)V

    .line 900
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_w:I

    iget v7, v0, Lcom/radaee/view/GLBlock;->m_h:I

    move v5, v9

    move/from16 v9, v47

    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    move-object v0, v1

    move v7, v9

    const/16 v2, 0xde1

    move/from16 v1, p5

    move v9, v5

    .line 901
    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    shl-int/lit8 v1, v8, 0x10

    const/16 v52, 0xde1

    shl-int/lit8 v2, v7, 0x10

    shl-int/lit8 v3, v45, 0x10

    shl-int/lit8 v4, v9, 0x10

    shl-int/lit8 v5, v42, 0x10

    shl-int/lit8 v6, v7, 0x10

    move/from16 v47, v7

    shl-int/lit8 v7, v45, 0x10

    move/from16 v55, v8

    shl-int/lit8 v8, v20, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    move/from16 v26, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v11, 0x10000

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move/from16 v71, v26

    move/from16 v70, v47

    move/from16 v72, v55

    .line 902
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v10, p2

    move-object v12, v0

    const/16 v13, 0xde1

    .line 905
    invoke-interface {v12, v13, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move-object/from16 v14, p0

    .line 908
    iget v0, v14, Lcom/radaee/view/GLBlock;->m_w:I

    int-to-double v1, v0

    move/from16 v15, v71

    int-to-double v3, v15

    div-double v3, v3, v18

    add-double/2addr v1, v3

    move/from16 v8, v72

    int-to-double v3, v8

    sub-int/2addr v0, v8

    .line 910
    div-int/lit8 v0, v0, 0x50

    int-to-double v5, v0

    double-to-int v0, v1

    sub-int v18, v0, v8

    move/from16 v7, v70

    neg-int v9, v7

    const/16 v10, 0x42

    .line 914
    new-array v11, v10, [I

    move/from16 v16, v9

    const/4 v9, 0x0

    .line 915
    aput v8, v11, v9

    .line 916
    aput v7, v11, v17

    sub-int v19, v33, v39

    const/16 v53, 0x0

    const/4 v9, 0x5

    move-object v10, v11

    const/16 v49, 0x42

    const/4 v11, 0x2

    const/16 v12, 0x42

    const/4 v13, 0x0

    move-wide/from16 v74, v3

    move v4, v7

    move v3, v8

    move/from16 v7, v19

    move/from16 v8, v34

    move/from16 v19, v16

    move-wide/from16 v76, v5

    move/from16 v5, v30

    move-wide/from16 v29, v74

    move/from16 v6, v35

    move-wide/from16 v34, v76

    .line 917
    invoke-static/range {v3 .. v11}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v47, v4

    move-object/from16 v26, v10

    move-wide/from16 v43, v34

    move/from16 v34, v8

    .line 919
    new-array v3, v12, [I

    .line 920
    aput v0, v3, v13

    .line 921
    aput v13, v3, v17

    add-int v60, v5, v18

    add-int v61, v6, v19

    add-int v62, v7, v18

    add-int v63, v34, v19

    const/16 v64, 0x5

    const/16 v66, 0x2

    const/16 v59, 0x0

    move/from16 v58, v0

    move-object/from16 v65, v3

    .line 922
    invoke-static/range {v58 .. v66}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    .line 924
    new-array v7, v12, [I

    .line 925
    aput v45, v7, v13

    .line 926
    aput v15, v7, v17

    sub-int v5, v28, v36

    const/4 v6, 0x5

    const/4 v8, 0x2

    move-wide v9, v1

    move v1, v15

    move/from16 v2, v21

    move/from16 v3, v25

    move/from16 v4, v27

    move/from16 v0, v45

    .line 927
    invoke-static/range {v0 .. v8}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-object/from16 v21, v7

    move-wide v1, v9

    move-wide/from16 v3, v29

    const/4 v10, 0x0

    :goto_6
    const/16 v0, 0x40

    if-ge v10, v0, :cond_9

    .line 931
    aget v5, v21, v10

    move-wide v6, v1

    shl-int/lit8 v1, v5, 0x10

    add-int/lit8 v2, v10, 0x1

    aget v8, v21, v2

    move v9, v2

    shl-int/lit8 v2, v8, 0x10

    add-int/lit8 v25, v10, 0x2

    aget v11, v21, v25

    move-wide/from16 v29, v3

    shl-int/lit8 v3, v11, 0x10

    add-int/lit8 v4, v10, 0x3

    aget v15, v21, v4

    move/from16 v16, v4

    shl-int/lit8 v4, v15, 0x10

    aget v35, v26, v10

    move/from16 v36, v5

    shl-int/lit8 v5, v35, 0x10

    aget v39, v26, v9

    shl-int/lit8 v39, v39, 0x10

    aget v46, v26, v25

    move-wide/from16 v48, v6

    shl-int/lit8 v7, v46, 0x10

    aget v6, v26, v16

    shl-int/lit8 v6, v6, 0x10

    sub-int v35, v36, v35

    shl-int/lit8 v35, v35, 0x10

    div-int v0, v35, v18

    int-to-double v12, v0

    mul-double v12, v12, v48

    aget v0, v65, v10

    sub-int v0, v0, v36

    shl-int/lit8 v0, v0, 0x10

    div-int v0, v0, v18

    move/from16 p2, v1

    int-to-double v0, v0

    mul-double v0, v0, v29

    add-double/2addr v12, v0

    double-to-int v0, v12

    iget v1, v14, Lcom/radaee/view/GLBlock;->m_w:I

    div-int/2addr v0, v1

    aget v9, v65, v9

    sub-int/2addr v9, v8

    int-to-long v8, v9

    shl-long v8, v8, v22

    long-to-int v9, v8

    div-int v10, v9, v19

    sub-int v8, v11, v46

    shl-int/lit8 v8, v8, 0x10

    div-int v8, v8, v18

    int-to-double v8, v8

    add-double v35, v48, v43

    mul-double v8, v8, v35

    aget v12, v65, v25

    sub-int/2addr v12, v11

    shl-int/lit8 v11, v12, 0x10

    div-int v11, v11, v18

    int-to-double v11, v11

    add-double v48, v29, v43

    mul-double v11, v11, v48

    add-double/2addr v8, v11

    double-to-int v8, v8

    div-int v11, v8, v1

    aget v8, v65, v16

    sub-int/2addr v8, v15

    int-to-long v8, v8

    shl-long v8, v8, v22

    long-to-int v9, v8

    div-int v12, v9, v19

    mul-double v8, v29, v40

    move v13, v2

    move v15, v3

    int-to-double v2, v1

    div-double/2addr v8, v2

    double-to-int v2, v8

    mul-double v8, v48, v40

    move v3, v0

    int-to-double v0, v1

    div-double/2addr v8, v0

    double-to-int v0, v8

    const/high16 v16, 0x10000

    const/high16 v14, 0x10000

    move v1, v13

    move v13, v2

    move v2, v1

    move/from16 v1, p2

    move v9, v3

    move v8, v6

    move v3, v15

    move/from16 v6, v39

    move v15, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move-object/from16 v14, p0

    move/from16 v10, v25

    move-wide/from16 v1, v35

    move-wide/from16 v3, v48

    const/16 v12, 0x42

    const/4 v13, 0x0

    goto/16 :goto_6

    :cond_9
    :goto_7
    add-int v15, v31, v45

    shr-int/lit8 v29, v15, 0x1

    add-int v20, v32, v20

    shr-int/lit8 v30, v20, 0x1

    add-int v8, v37, v42

    shr-int/lit8 v35, v8, 0x1

    add-int v9, v38, v47

    shr-int/lit8 v36, v9, 0x1

    const/16 v13, 0x42

    .line 949
    new-array v0, v13, [I

    const/4 v14, 0x0

    .line 950
    aput v33, v0, v14

    .line 951
    aput v34, v0, v17

    const/16 v39, 0x5

    const/16 v41, 0x2

    move-object/from16 v40, v0

    .line 952
    invoke-static/range {v33 .. v41}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v39, v33

    move/from16 v15, v35

    move-object/from16 v18, v40

    move/from16 v40, v34

    .line 953
    new-array v0, v13, [I

    .line 954
    aput v27, v0, v14

    .line 955
    aput v28, v0, v17

    const/16 v33, 0x5

    const/16 v35, 0x2

    move-object/from16 v34, v0

    .line 956
    invoke-static/range {v27 .. v35}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    const/4 v10, 0x0

    :goto_8
    const/16 v0, 0x40

    if-ge v10, v0, :cond_a

    rsub-int/lit8 v1, v10, 0x40

    int-to-float v1, v1

    mul-float v2, v23, v1

    int-to-float v3, v10

    const/high16 v26, 0x3f800000    # 1.0f

    mul-float v4, v26, v3

    add-float/2addr v2, v4

    const/high16 v4, 0x42800000    # 64.0f

    div-float/2addr v2, v4

    mul-float v1, v1, v24

    const v12, 0x3f4ccccd    # 0.8f

    mul-float v3, v3, v12

    add-float/2addr v1, v3

    div-float/2addr v1, v4

    .line 962
    aget v3, v34, v10

    shl-int/lit8 v3, v3, 0x10

    add-int/lit8 v4, v10, 0x1

    aget v5, v34, v4

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v16, v10, 0x2

    aget v6, v34, v16

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v7, v10, 0x3

    aget v8, v34, v7

    shl-int/lit8 v8, v8, 0x10

    aget v9, v18, v10

    shl-int/lit8 v9, v9, 0x10

    aget v4, v18, v4

    shl-int/lit8 v4, v4, 0x10

    aget v10, v18, v16

    shl-int/lit8 v10, v10, 0x10

    aget v7, v18, v7

    shl-int/lit8 v7, v7, 0x10

    move v11, v2

    move v0, v10

    move v10, v2

    move v2, v3

    move v3, v5

    move v5, v8

    move v8, v0

    move v0, v7

    move v7, v4

    move v4, v6

    move v6, v9

    move v9, v0

    move-object/from16 v0, p1

    move v12, v1

    move/from16 v35, v15

    const v13, 0x3f4ccccd    # 0.8f

    const/high16 v15, 0x3f800000    # 1.0f

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move/from16 v10, v16

    move/from16 v15, v35

    const/16 v13, 0x42

    goto :goto_8

    :cond_a
    move-object/from16 v0, p1

    move/from16 v10, p6

    move/from16 v35, v15

    const/16 v1, 0xde1

    const v13, 0x3f4ccccd    # 0.8f

    const/high16 v15, 0x3f800000    # 1.0f

    .line 965
    invoke-interface {v0, v1, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/high16 v2, 0x3f800000    # 1.0f

    .line 966
    invoke-interface {v0, v15, v15, v13, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    shl-int/lit8 v3, v31, 0x10

    shl-int/lit8 v4, v32, 0x10

    shl-int/lit8 v5, p3, 0x10

    shl-int/lit8 v6, p4, 0x10

    shl-int/lit8 v7, v37, 0x10

    shl-int/lit8 v8, v38, 0x10

    .line 973
    filled-new-array/range {v3 .. v8}, [I

    move-result-object v9

    move/from16 v19, v3

    move/from16 v20, v4

    move v3, v7

    move v4, v8

    const/16 v7, 0x140c

    .line 974
    invoke-static {v9}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v0, v9, v7, v14, v8}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    const/4 v7, 0x5

    const/4 v11, 0x3

    .line 975
    invoke-interface {v0, v7, v14, v11}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 976
    invoke-interface {v0, v2, v2, v2, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    move/from16 v12, p5

    .line 978
    invoke-interface {v0, v1, v12}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    move-object/from16 v7, p0

    .line 979
    iget v8, v7, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int v9, v8, p3

    mul-int/lit8 v9, v9, 0x68

    div-int/lit8 v9, v9, 0x64

    sub-int v9, v8, v9

    .line 980
    iget v10, v7, Lcom/radaee/view/GLBlock;->m_h:I

    sub-int v11, v10, p4

    mul-int/lit8 v11, v11, 0x68

    div-int/lit8 v11, v11, 0x64

    sub-int v11, v10, v11

    sub-int v12, v8, v31

    mul-int/lit8 v12, v12, 0x68

    .line 981
    div-int/lit8 v12, v12, 0x64

    sub-int v12, v8, v12

    sub-int v13, v10, v32

    mul-int/lit8 v13, v13, 0x68

    .line 982
    div-int/lit8 v13, v13, 0x64

    sub-int v13, v10, v13

    sub-int v15, v8, v37

    mul-int/lit8 v15, v15, 0x68

    .line 983
    div-int/lit8 v15, v15, 0x64

    sub-int v43, v8, v15

    sub-int v15, v10, v38

    mul-int/lit8 v15, v15, 0x68

    .line 984
    div-int/lit8 v15, v15, 0x64

    sub-int v44, v10, v15

    sub-int v15, v8, v29

    mul-int/lit8 v15, v15, 0x66

    .line 986
    div-int/lit8 v15, v15, 0x64

    sub-int v15, v8, v15

    sub-int v16, v10, v30

    mul-int/lit8 v16, v16, 0x66

    .line 987
    div-int/lit8 v16, v16, 0x64

    sub-int v16, v10, v16

    sub-int v21, v8, v35

    mul-int/lit8 v21, v21, 0x66

    .line 988
    div-int/lit8 v21, v21, 0x64

    sub-int v41, v8, v21

    sub-int v8, v10, v36

    mul-int/lit8 v8, v8, 0x66

    .line 989
    div-int/lit8 v8, v8, 0x64

    sub-int v42, v10, v8

    const/16 v10, 0x42

    .line 991
    new-array v8, v10, [I

    .line 992
    aput v39, v8, v14

    .line 993
    aput v40, v8, v17

    const/16 v45, 0x5

    const/16 v47, 0x2

    move-object/from16 v46, v8

    .line 994
    invoke-static/range {v39 .. v47}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move/from16 v8, v43

    move/from16 v21, v44

    move-object/from16 v23, v46

    .line 995
    new-array v10, v10, [I

    .line 996
    aput v27, v10, v14

    .line 997
    aput v28, v10, v17

    move-object/from16 v46, v10

    move/from16 v43, v12

    move/from16 v44, v13

    move/from16 v41, v15

    move/from16 v42, v16

    move/from16 v39, v27

    move/from16 v40, v28

    .line 998
    invoke-static/range {v39 .. v47}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    shl-int/lit8 v9, v9, 0x10

    shl-int/lit8 v10, v11, 0x10

    shl-int/lit8 v8, v8, 0x10

    shl-int/lit8 v11, v21, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    move v1, v5

    move v5, v9

    const/16 v52, 0xde1

    const/4 v9, 0x0

    move v2, v6

    move v6, v10

    const/high16 v50, 0x3f800000    # 1.0f

    const v10, 0x8000

    move v7, v8

    move v8, v11

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    const/16 v53, 0x0

    const/high16 v14, 0x10000

    .line 999
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    shl-int/lit8 v7, v43, 0x10

    shl-int/lit8 v8, v44, 0x10

    move/from16 v3, v19

    move/from16 v4, v20

    .line 1002
    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    const/4 v0, 0x0

    :goto_9
    const/16 v1, 0x40

    if-ge v0, v1, :cond_b

    .line 1007
    aget v2, v18, v0

    shl-int/lit8 v2, v2, 0x10

    add-int/lit8 v17, v0, 0x1

    aget v3, v18, v17

    shl-int/lit8 v3, v3, 0x10

    add-int/lit8 v19, v0, 0x2

    aget v4, v18, v19

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v20, v0, 0x3

    aget v5, v18, v20

    shl-int/lit8 v5, v5, 0x10

    aget v6, v23, v0

    shl-int/lit8 v6, v6, 0x10

    aget v7, v23, v17

    shl-int/lit8 v7, v7, 0x10

    aget v8, v23, v19

    shl-int/lit8 v8, v8, 0x10

    aget v9, v23, v20

    shl-int/lit8 v9, v9, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    const/16 v48, 0x40

    const/4 v9, 0x0

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move/from16 v21, v0

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    .line 1010
    aget v0, v34, v21

    shl-int/lit8 v1, v0, 0x10

    aget v0, v34, v17

    shl-int/lit8 v2, v0, 0x10

    aget v0, v34, v19

    shl-int/lit8 v3, v0, 0x10

    aget v0, v34, v20

    shl-int/lit8 v4, v0, 0x10

    aget v0, v46, v21

    shl-int/lit8 v5, v0, 0x10

    aget v0, v46, v17

    shl-int/lit8 v6, v0, 0x10

    aget v0, v46, v19

    shl-int/lit8 v7, v0, 0x10

    aget v0, v46, v20

    shl-int/lit8 v8, v0, 0x10

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    move/from16 v0, v19

    goto :goto_9

    :cond_b
    move-object/from16 v0, p1

    const/16 v1, 0xde1

    const/4 v14, 0x0

    .line 1014
    invoke-interface {v0, v1, v14}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/high16 v3, 0x3f800000    # 1.0f

    .line 1015
    invoke-interface {v0, v3, v3, v3, v3}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    return-void

    :cond_c
    :goto_a
    move/from16 v10, p6

    move-object v0, v1

    move v12, v13

    move/from16 v45, v15

    const/16 v1, 0xde1

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v11, 0x3

    const v13, 0x3f4ccccd    # 0.8f

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v4, 0x20

    const/4 v2, 0x0

    const/high16 v50, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    move/from16 v8, v45

    move/from16 v9, p4

    move/from16 v7, p4

    move-object v1, v0

    move/from16 v4, v45

    const/16 v10, 0xde1

    move-object/from16 v0, p0

    .line 739
    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    .line 740
    invoke-interface {v1, v10, v12}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 741
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_h:I

    sub-int v3, v2, p4

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v17, v3, 0x8

    mul-int/lit8 v3, v17, 0x2

    .line 742
    div-int/2addr v3, v11

    add-int v18, p4, v3

    add-int v3, p4, v17

    sub-int v2, v2, p4

    shr-int/2addr v2, v11

    sub-int v4, v3, v2

    shl-int/lit8 v4, v4, 0x10

    .line 745
    iget v5, v0, Lcom/radaee/view/GLBlock;->m_w:I

    move v6, v3

    shl-int/lit8 v3, v5, 0x10

    add-int/2addr v2, v6

    shl-int/lit8 v6, v2, 0x10

    shl-int/lit8 v7, v5, 0x10

    const/high16 v26, 0x3f800000    # 1.0f

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/4 v1, 0x0

    const/4 v5, 0x0

    const/4 v9, 0x0

    const/16 v52, 0xde1

    const/4 v10, 0x0

    const/16 v56, 0x3

    const/high16 v11, 0x10000

    const/4 v12, 0x0

    const v57, 0x3f4ccccd    # 0.8f

    const/4 v13, 0x0

    const/16 v53, 0x0

    const/high16 v14, 0x10000

    move v2, v4

    move v8, v6

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    shl-int/lit8 v2, p4, 0x10

    move-object/from16 v13, p0

    .line 748
    iget v0, v13, Lcom/radaee/view/GLBlock;->m_w:I

    shl-int/lit8 v4, v0, 0x10

    shl-int/lit8 v7, v18, 0x10

    shl-int/lit8 v8, v0, 0x10

    move v3, v2

    const/4 v2, 0x0

    const/4 v6, 0x0

    move v5, v3

    move v9, v7

    move/from16 v11, v26

    move-object/from16 v0, p1

    move/from16 v1, p6

    const/high16 v10, 0x3f800000    # 1.0f

    const v12, 0x3f4ccccd    # 0.8f

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move v14, v3

    const/high16 v26, 0x3f800000    # 1.0f

    const v57, 0x3f4ccccd    # 0.8f

    .line 750
    div-int/lit8 v17, v17, 0x3

    const/4 v10, 0x0

    const/16 v15, 0x20

    :goto_b
    if-ge v10, v15, :cond_d

    mul-int v0, v17, v10

    .line 753
    div-int/2addr v0, v15

    add-int v0, v18, v0

    shl-int/lit8 v3, v0, 0x10

    iget v0, v13, Lcom/radaee/view/GLBlock;->m_w:I

    shl-int/lit8 v4, v0, 0x10

    add-int/lit8 v16, v10, 0x1

    mul-int v1, v17, v16

    div-int/2addr v1, v15

    add-int v1, v18, v1

    shl-int/lit8 v7, v1, 0x10

    shl-int/lit8 v8, v0, 0x10

    int-to-float v0, v10

    mul-float v1, v23, v0

    rsub-int/lit8 v2, v10, 0x20

    int-to-float v2, v2

    mul-float v10, v26, v2

    add-float/2addr v1, v10

    div-float v10, v1, v21

    mul-float v0, v0, v24

    mul-float v1, v57, v2

    add-float/2addr v0, v1

    div-float v12, v0, v21

    const/4 v2, 0x0

    const/4 v6, 0x0

    move v5, v3

    move v9, v7

    move v11, v10

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move/from16 v10, v16

    goto :goto_b

    :cond_d
    move-object/from16 v0, p1

    const/high16 v10, 0x3f800000    # 1.0f

    .line 757
    invoke-interface {v0, v10, v10, v10, v10}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    move/from16 v11, p5

    const/16 v1, 0xde1

    .line 758
    invoke-interface {v0, v1, v11}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 759
    iget v2, v13, Lcom/radaee/view/GLBlock;->m_h:I

    sub-int v3, v2, p4

    mul-int/lit8 v3, v3, 0x68

    div-int/lit8 v3, v3, 0x64

    sub-int/2addr v2, v3

    .line 760
    iget v3, v13, Lcom/radaee/view/GLBlock;->m_w:I

    move v4, v3

    shl-int/lit8 v3, v4, 0x10

    shl-int/lit8 v6, v2, 0x10

    shl-int/lit8 v7, v4, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/16 v52, 0xde1

    const/4 v1, 0x0

    const/4 v5, 0x0

    const/4 v9, 0x0

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    move v2, v14

    const/high16 v14, 0x10000

    move v4, v2

    move v8, v6

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    const/4 v12, 0x0

    const/16 v13, 0xde1

    .line 763
    invoke-interface {v0, v13, v12}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void

    :cond_e
    :goto_c
    move-object v0, v1

    move/from16 v47, v9

    move v11, v13

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/16 v13, 0xde1

    const/16 v15, 0x20

    const/high16 v26, 0x3f800000    # 1.0f

    const/16 v56, 0x3

    const v57, 0x3f4ccccd    # 0.8f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move/from16 v8, p3

    move/from16 v4, p3

    move/from16 v9, p4

    move-object v1, v0

    move/from16 v7, v47

    move-object/from16 v0, p0

    .line 713
    invoke-direct/range {v0 .. v9}, Lcom/radaee/view/GLBlock;->drawQuad(Ljavax/microedition/khronos/opengles/GL10;IIIIIIII)V

    .line 714
    invoke-interface {v1, v13, v11}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 715
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int v2, v2, p3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v17, v2, 0x8

    mul-int/lit8 v2, v17, 0x2

    .line 716
    div-int/lit8 v2, v2, 0x3

    add-int v18, p3, v2

    shl-int/lit8 v4, v18, 0x10

    .line 717
    iget v2, v0, Lcom/radaee/view/GLBlock;->m_h:I

    move v1, v4

    shl-int/lit8 v4, v2, 0x10

    mul-int/lit8 v3, v17, 0x4

    div-int/lit8 v3, v3, 0x3

    add-int v3, p3, v3

    shl-int/lit8 v5, v3, 0x10

    shl-int/lit8 v8, v2, 0x10

    const/16 v73, 0x20

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/4 v2, 0x0

    const/4 v9, 0x0

    const/high16 v50, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/high16 v11, 0x10000

    const/16 v53, 0x0

    const/4 v12, 0x0

    const/16 v52, 0xde1

    const/4 v13, 0x0

    const/high16 v14, 0x10000

    move v3, v1

    move v7, v5

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    shl-int/lit8 v2, p3, 0x10

    move-object/from16 v13, p0

    .line 720
    iget v0, v13, Lcom/radaee/view/GLBlock;->m_h:I

    shl-int/lit8 v7, v0, 0x10

    shl-int/lit8 v9, v0, 0x10

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v6, v2

    move v8, v1

    move/from16 v11, v26

    move-object/from16 v0, p1

    move v4, v1

    const/high16 v10, 0x3f800000    # 1.0f

    const v12, 0x3f4ccccd    # 0.8f

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move v14, v2

    const/high16 v26, 0x3f800000    # 1.0f

    const v57, 0x3f4ccccd    # 0.8f

    .line 722
    div-int/lit8 v17, v17, 0x3

    const/4 v10, 0x0

    const/16 v15, 0x20

    :goto_d
    if-ge v10, v15, :cond_f

    mul-int v0, v17, v10

    .line 725
    div-int/2addr v0, v15

    add-int v0, v18, v0

    shl-int/lit8 v2, v0, 0x10

    add-int/lit8 v16, v10, 0x1

    mul-int v0, v17, v16

    div-int/2addr v0, v15

    add-int v0, v18, v0

    shl-int/lit8 v4, v0, 0x10

    iget v0, v13, Lcom/radaee/view/GLBlock;->m_h:I

    shl-int/lit8 v7, v0, 0x10

    shl-int/lit8 v9, v0, 0x10

    int-to-float v0, v10

    mul-float v1, v23, v0

    rsub-int/lit8 v3, v10, 0x20

    int-to-float v3, v3

    mul-float v10, v26, v3

    add-float/2addr v1, v10

    div-float v10, v1, v21

    mul-float v0, v0, v24

    mul-float v1, v57, v3

    add-float/2addr v0, v1

    div-float v12, v0, v21

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v6, v2

    move v8, v4

    move v11, v10

    move-object/from16 v0, p1

    move/from16 v1, p6

    invoke-static/range {v0 .. v12}, Lcom/radaee/view/GLBlock;->drawQuadColor(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIFFF)V

    move/from16 v10, v16

    goto :goto_d

    :cond_f
    move-object/from16 v0, p1

    const/high16 v10, 0x3f800000    # 1.0f

    .line 729
    invoke-interface {v0, v10, v10, v10, v10}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    move/from16 v1, p5

    const/16 v2, 0xde1

    .line 730
    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 731
    iget v1, v13, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int v3, v1, p3

    mul-int/lit8 v3, v3, 0x68

    div-int/lit8 v3, v3, 0x64

    sub-int/2addr v1, v3

    .line 732
    iget v3, v13, Lcom/radaee/view/GLBlock;->m_h:I

    shl-int/lit8 v4, v3, 0x10

    shl-int/lit8 v5, v1, 0x10

    shl-int/lit8 v8, v3, 0x10

    const/high16 v15, 0x10000

    const/high16 v16, 0x10000

    const/16 v52, 0xde1

    const/4 v2, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const v10, 0x8000

    const/high16 v11, 0x10000

    const v12, 0x8000

    const/4 v13, 0x0

    move v1, v14

    const/high16 v14, 0x10000

    move v3, v1

    move v7, v5

    invoke-static/range {v0 .. v16}, Lcom/radaee/view/GLBlock;->drawQuadFixed(Ljavax/microedition/khronos/opengles/GL10;IIIIIIIIIIIIIIII)V

    const/16 v1, 0xde1

    const/4 v13, 0x0

    .line 735
    invoke-interface {v0, v1, v13}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void
.end method

.method private drawTrangle(Ljavax/microedition/khronos/opengles/GL10;IIIIII)V
    .locals 6

    shl-int/lit8 p2, p2, 0x10

    shl-int/lit8 p3, p3, 0x10

    shl-int/lit8 p4, p4, 0x10

    shl-int/lit8 p5, p5, 0x10

    shl-int/lit8 p6, p6, 0x10

    shl-int/lit8 p7, p7, 0x10

    .line 297
    filled-new-array/range {p2 .. p7}, [I

    move-result-object p2

    const/4 p3, 0x0

    .line 299
    aget p4, p2, p3

    iget p5, p0, Lcom/radaee/view/GLBlock;->m_w:I

    div-int v0, p4, p5

    const/4 p4, 0x1

    .line 300
    aget p4, p2, p4

    iget p6, p0, Lcom/radaee/view/GLBlock;->m_h:I

    div-int v1, p4, p6

    const/4 p4, 0x2

    .line 301
    aget p7, p2, p4

    div-int v2, p7, p5

    const/4 p7, 0x3

    .line 302
    aget v3, p2, p7

    div-int/2addr v3, p6

    const/4 v4, 0x4

    .line 303
    aget v4, p2, v4

    div-int/2addr v4, p5

    const/4 p5, 0x5

    .line 304
    aget v5, p2, p5

    div-int/2addr v5, p6

    filled-new-array/range {v0 .. v5}, [I

    move-result-object p6

    .line 306
    invoke-static {p2}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p2

    const/16 v0, 0x140c

    invoke-interface {p1, p4, v0, p3, p2}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 307
    invoke-static {p6}, Lcom/radaee/view/GLBlock;->create_buf([I)Ljava/nio/IntBuffer;

    move-result-object p2

    invoke-interface {p1, p4, v0, p3, p2}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 308
    invoke-interface {p1, p5, p3, p7}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    return-void
.end method

.method private static flate_bezier2(IIIIIII[II)I
    .locals 13

    move/from16 v0, p6

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    .line 314
    aput p4, p7, p8

    add-int/lit8 p0, p8, 0x1

    .line 315
    aput p5, p7, p0

    add-int/lit8 p0, p8, 0x2

    return p0

    :cond_0
    shl-int/lit8 v3, p2, 0x1

    add-int/2addr v3, p0

    add-int v3, v3, p4

    shr-int/lit8 v8, v3, 0x2

    shl-int/lit8 v3, p3, 0x1

    add-int/2addr v3, p1

    add-int v3, v3, p5

    shr-int/lit8 v9, v3, 0x2

    if-ge v0, v1, :cond_1

    .line 322
    aput v8, p7, p8

    add-int/lit8 p0, p8, 0x1

    .line 323
    aput v9, p7, p0

    add-int/lit8 p0, p8, 0x2

    .line 324
    aput p4, p7, p0

    add-int/lit8 p0, p8, 0x3

    .line 325
    aput p5, p7, p0

    add-int/lit8 p0, p8, 0x4

    return p0

    :cond_1
    add-int v1, p0, p2

    shr-int/lit8 v6, v1, 0x1

    add-int v1, p1, p3

    shr-int/lit8 v7, v1, 0x1

    add-int/lit8 v10, v0, -0x1

    move v4, p0

    move v5, p1

    move-object/from16 v11, p7

    move/from16 v12, p8

    .line 330
    invoke-static/range {v4 .. v12}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-result v12

    add-int p2, p2, p4

    shr-int/lit8 v6, p2, 0x1

    add-int p0, p3, p5

    shr-int/lit8 v7, p0, 0x1

    move v4, v8

    move v5, v9

    move/from16 v8, p4

    move/from16 v9, p5

    .line 331
    invoke-static/range {v4 .. v12}, Lcom/radaee/view/GLBlock;->flate_bezier2(IIIIIII[II)I

    move-result p0

    return p0
.end method


# virtual methods
.method protected final GetBottom()I
    .locals 2

    .line 1064
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_y:I

    iget v1, p0, Lcom/radaee/view/GLBlock;->m_h:I

    add-int/2addr v0, v1

    return v0
.end method

.method protected final GetH()I
    .locals 1

    .line 1072
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_h:I

    return v0
.end method

.method protected final GetPageNo()I
    .locals 1

    .line 1074
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_pageno:I

    return v0
.end method

.method protected final GetRight()I
    .locals 2

    .line 1060
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_x:I

    iget v1, p0, Lcom/radaee/view/GLBlock;->m_w:I

    add-int/2addr v0, v1

    return v0
.end method

.method protected final GetW()I
    .locals 1

    .line 1068
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_w:I

    return v0
.end method

.method protected final GetX()I
    .locals 1

    .line 1052
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_x:I

    return v0
.end method

.method protected final GetY()I
    .locals 1

    .line 1056
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_y:I

    return v0
.end method

.method protected final bk_destroy()V
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    iput-object v1, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_1

    .line 137
    iput-object v1, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    .line 138
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    :cond_1
    const/4 v0, 0x0

    .line 140
    iput v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    return-void
.end method

.method protected final bk_render()V
    .locals 8

    .line 99
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLBlock;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/GLBlock;->m_pageno:I

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    .line 102
    new-instance v0, Lcom/radaee/pdf/DIB;

    invoke-direct {v0}, Lcom/radaee/pdf/DIB;-><init>()V

    .line 103
    iget v2, p0, Lcom/radaee/view/GLBlock;->m_w:I

    iget v3, p0, Lcom/radaee/view/GLBlock;->m_h:I

    invoke-virtual {v0, v2, v3}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 104
    iget-object v2, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 105
    iput-object v0, p0, Lcom/radaee/view/GLBlock;->m_dib_tmp:Lcom/radaee/pdf/DIB;

    .line 106
    iget v2, p0, Lcom/radaee/view/GLBlock;->m_status:I

    if-eq v2, v1, :cond_1

    :goto_0
    return-void

    .line 108
    :cond_1
    iget-object v2, p0, Lcom/radaee/view/GLBlock;->m_doc:Lcom/radaee/pdf/Document;

    iget v3, p0, Lcom/radaee/view/GLBlock;->m_pageno:I

    invoke-virtual {v2, v3}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v2

    iget v3, p0, Lcom/radaee/view/GLBlock;->m_scale:F

    mul-float v2, v2, v3

    float-to-int v2, v2

    .line 109
    iget-object v3, p0, Lcom/radaee/view/GLBlock;->m_doc:Lcom/radaee/pdf/Document;

    iget v4, p0, Lcom/radaee/view/GLBlock;->m_pageno:I

    invoke-virtual {v3, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v3

    iget v4, p0, Lcom/radaee/view/GLBlock;->m_scale:F

    mul-float v3, v3, v4

    float-to-int v3, v3

    .line 110
    iget v4, p0, Lcom/radaee/view/GLBlock;->m_w:I

    if-gt v2, v4, :cond_2

    iget v4, p0, Lcom/radaee/view/GLBlock;->m_h:I

    if-gt v3, v4, :cond_2

    .line 112
    new-instance v4, Lcom/radaee/pdf/Matrix;

    iget v5, p0, Lcom/radaee/view/GLBlock;->m_scale:F

    neg-float v6, v5

    iget v7, p0, Lcom/radaee/view/GLBlock;->m_w:I

    sub-int/2addr v7, v2

    shr-int/lit8 v2, v7, 0x1

    int-to-float v2, v2

    iget v7, p0, Lcom/radaee/view/GLBlock;->m_h:I

    add-int/2addr v7, v3

    shr-int/lit8 v3, v7, 0x1

    int-to-float v3, v3

    invoke-direct {v4, v5, v6, v2, v3}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 113
    iget-object v2, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v4}, Lcom/radaee/pdf/Page;->Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z

    .line 114
    invoke-virtual {v4}, Lcom/radaee/pdf/Matrix;->Destroy()V

    goto :goto_1

    .line 118
    :cond_2
    new-instance v2, Lcom/radaee/pdf/Matrix;

    iget v3, p0, Lcom/radaee/view/GLBlock;->m_scale:F

    neg-float v4, v3

    iget v5, p0, Lcom/radaee/view/GLBlock;->m_x:I

    neg-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Lcom/radaee/view/GLBlock;->m_ph:I

    iget v7, p0, Lcom/radaee/view/GLBlock;->m_y:I

    sub-int/2addr v6, v7

    int-to-float v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 119
    iget-object v3, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v3, v0, v2}, Lcom/radaee/pdf/Page;->Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z

    .line 120
    invoke-virtual {v2}, Lcom/radaee/pdf/Matrix;->Destroy()V

    :goto_1
    const/4 v2, 0x0

    .line 122
    iput-object v2, p0, Lcom/radaee/view/GLBlock;->m_dib_tmp:Lcom/radaee/pdf/DIB;

    .line 123
    iget v2, p0, Lcom/radaee/view/GLBlock;->m_status:I

    if-ne v2, v1, :cond_3

    .line 125
    iput-object v0, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    const/4 v0, 0x2

    .line 126
    iput v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    return-void

    .line 129
    :cond_3
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    return-void
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1078
    invoke-virtual {p0}, Lcom/radaee/view/GLBlock;->bk_destroy()V

    .line 1079
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BLOCK NOT FREED."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/radaee/view/GLBlock;->m_status:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LEAK"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1080
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected final gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V
    .locals 4

    .line 169
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    .line 170
    iget v1, p0, Lcom/radaee/view/GLBlock;->m_draw_cnt:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/GLBlock;->m_draw_cnt:I

    const/4 v3, 0x0

    if-nez v0, :cond_3

    .line 173
    iget-object v0, p0, Lcom/radaee/view/GLBlock;->m_dib_tmp:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_1

    and-int/lit8 v1, v1, 0x7

    if-nez v1, :cond_1

    .line 176
    iget v1, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    if-eqz v1, :cond_0

    .line 177
    filled-new-array {v1}, [I

    move-result-object v1

    invoke-interface {p1, v2, v1, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 178
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->GLGenTexture()I

    move-result v0

    iput v0, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    .line 180
    :cond_1
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    if-nez v0, :cond_2

    if-ltz p2, :cond_2

    goto :goto_0

    :cond_2
    move p2, v0

    :goto_0
    move v0, p2

    goto :goto_1

    .line 183
    :cond_3
    iget p2, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    if-eqz p2, :cond_4

    .line 185
    filled-new-array {p2}, [I

    move-result-object p2

    invoke-interface {p1, v2, p2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 186
    iput v3, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    :cond_4
    :goto_1
    if-gez v0, :cond_5

    return-void

    .line 189
    :cond_5
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-virtual {p2, v3}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 190
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    shl-int/lit8 p3, p3, 0x10

    invoke-virtual {p2, p3}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 191
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    shl-int/lit8 p4, p4, 0x10

    invoke-virtual {p2, p4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 192
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    shl-int/lit8 p5, p5, 0x10

    invoke-virtual {p2, p5}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 193
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-virtual {p2, p4}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 194
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-virtual {p2, p3}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 195
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    shl-int/lit8 p3, p6, 0x10

    invoke-virtual {p2, p3}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 196
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-virtual {p2, p5}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 197
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-virtual {p2, p3}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 198
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-virtual {p2, v3}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 199
    sget-object p2, Lcom/radaee/view/GLBlock;->m_text:Ljava/nio/IntBuffer;

    const/4 p3, 0x2

    const/16 p4, 0x140c

    invoke-interface {p1, p3, p4, v3, p2}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 200
    iget-object p2, p0, Lcom/radaee/view/GLBlock;->m_vect:Ljava/nio/IntBuffer;

    invoke-interface {p1, p3, p4, v3, p2}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    const/16 p2, 0xde1

    .line 204
    invoke-interface {p1, p2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/4 p3, 0x5

    const/4 p4, 0x4

    .line 205
    invoke-interface {p1, p3, v3, p4}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 209
    invoke-interface {p1, p2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    return-void
.end method

.method protected final gl_draw_curl(Ljavax/microedition/khronos/opengles/GL10;IIIII)V
    .locals 7

    const/4 v2, 0x1

    if-eq p3, v2, :cond_2

    const/4 v2, 0x2

    if-eq p3, v2, :cond_0

    .line 1031
    iget v5, p0, Lcom/radaee/view/GLBlock;->m_w:I

    iget v6, p0, Lcom/radaee/view/GLBlock;->m_h:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/radaee/view/GLBlock;->gl_draw(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    return-void

    .line 1027
    :cond_0
    iget v2, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    if-nez v2, :cond_1

    move v6, p2

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v6}, Lcom/radaee/view/GLBlock;->drawRB(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    return-void

    :cond_1
    move-object v0, p0

    move-object v1, p1

    move v6, p2

    move v3, p4

    move v4, p5

    move v5, p6

    .line 1028
    invoke-direct/range {v0 .. v6}, Lcom/radaee/view/GLBlock;->drawRB(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    return-void

    .line 1023
    :cond_2
    iget v2, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    if-nez v2, :cond_3

    move v6, p2

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v6}, Lcom/radaee/view/GLBlock;->drawLT(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    return-void

    :cond_3
    move-object v0, p0

    move-object v1, p1

    move v6, p2

    move v3, p4

    move v4, p5

    move v5, p6

    .line 1024
    invoke-direct/range {v0 .. v6}, Lcom/radaee/view/GLBlock;->drawLT(Ljavax/microedition/khronos/opengles/GL10;IIIII)V

    return-void
.end method

.method protected final gl_end(Ljavax/microedition/khronos/opengles/GL10;)Z
    .locals 4

    .line 150
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 151
    iget-object v0, p0, Lcom/radaee/view/GLBlock;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->RenderCancel()V

    .line 152
    :cond_1
    iput v2, p0, Lcom/radaee/view/GLBlock;->m_status:I

    .line 153
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    if-eqz v0, :cond_2

    .line 155
    filled-new-array {v0}, [I

    move-result-object v0

    invoke-interface {p1, v3, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 156
    iput v1, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    .line 158
    :cond_2
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    if-eqz v0, :cond_3

    .line 160
    filled-new-array {v0}, [I

    move-result-object v0

    invoke-interface {p1, v3, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 161
    iput v1, p0, Lcom/radaee/view/GLBlock;->m_texture_tmp:I

    :cond_3
    return v3

    :cond_4
    :goto_0
    return v1
.end method

.method protected final gl_make_text()Z
    .locals 3

    .line 1038
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 1039
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v2, 0x0

    .line 1041
    iput-object v2, p0, Lcom/radaee/view/GLBlock;->m_dib:Lcom/radaee/pdf/DIB;

    .line 1042
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->GLGenTexture()I

    move-result v2

    iput v2, p0, Lcom/radaee/view/GLBlock;->m_texture:I

    .line 1043
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    return v1
.end method

.method protected final gl_start()Z
    .locals 1

    .line 144
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    .line 145
    iput v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    return v0
.end method

.method protected final has_render()Z
    .locals 1

    .line 91
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected final isCross(IIII)Z
    .locals 2

    .line 1048
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_x:I

    iget v1, p0, Lcom/radaee/view/GLBlock;->m_w:I

    add-int/2addr v1, v0

    if-ge p1, v1, :cond_0

    if-lt p3, v0, :cond_0

    iget p1, p0, Lcom/radaee/view/GLBlock;->m_y:I

    iget p3, p0, Lcom/radaee/view/GLBlock;->m_h:I

    add-int/2addr p3, p1

    if-ge p2, p3, :cond_0

    if-lt p4, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected final is_rendering()Z
    .locals 2

    .line 95
    iget v0, p0, Lcom/radaee/view/GLBlock;->m_status:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
