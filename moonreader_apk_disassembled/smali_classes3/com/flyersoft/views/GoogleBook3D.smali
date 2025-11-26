.class public Lcom/flyersoft/views/GoogleBook3D;
.super Ljava/lang/Object;
.source "GoogleBook3D.java"


# static fields
.field static final LEFT:I = 0x2

.field static Q0XSrc:F = -0.39375f

.field static Q0XTgt:F = -1.5f

.field static Q1XSrc:F = -0.45f

.field static Q1ZSrc:F = -0.02f

.field static final RIGHT:I = 0x1

.field public static final useSeekBar:Z = true


# instance fields
.field Bezier:Landroid/graphics/PointF;

.field P0:Landroid/graphics/PointF;

.field P0Q:Landroid/graphics/PointF;

.field P1:Landroid/graphics/PointF;

.field Q:Landroid/graphics/PointF;

.field Q0:Landroid/graphics/PointF;

.field Q1:Landroid/graphics/PointF;

.field QP1:Landroid/graphics/PointF;

.field mDir:I

.field mDownX:F

.field mFBPosition:Ljava/nio/FloatBuffer;

.field mFBShadow:Ljava/nio/FloatBuffer;

.field mFBTexcoord:Ljava/nio/FloatBuffer;

.field final mFOV:F

.field private mFromT:F

.field mIndices:[S

.field mLength:[D

.field mOutPositions:[F

.field mOutShadowColor:[F

.field mOutTexcoords:[F

.field mPositions:[F

.field private mPreP1:D

.field mSBIndices:Ljava/nio/ShortBuffer;

.field mScreenWidth:F

.field mScreenWidthGL:F

.field mShadow:Lcom/flyersoft/views/GoogleBook3D;

.field mShadowColor:[F

.field mT:F

.field mTexcoords:[F

.field private mToT:F

.field mTx:F

.field mTz:F

.field mWidth:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(FF)V
    .locals 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->P0:Landroid/graphics/PointF;

    .line 55
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    .line 56
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->Q0:Landroid/graphics/PointF;

    .line 57
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    .line 58
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    .line 59
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->P0Q:Landroid/graphics/PointF;

    .line 60
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->QP1:Landroid/graphics/PointF;

    .line 61
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->Bezier:Landroid/graphics/PointF;

    .line 76
    iput p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mScreenWidthGL:F

    .line 77
    iput p2, p0, Lcom/flyersoft/views/GoogleBook3D;->mFOV:F

    return-void
.end method

.method private arrage(II)I
    .locals 1

    .line 452
    invoke-direct {p0, p1}, Lcom/flyersoft/views/GoogleBook3D;->factorial(I)I

    move-result v0

    sub-int/2addr p1, p2

    invoke-direct {p0, p1}, Lcom/flyersoft/views/GoogleBook3D;->factorial(I)I

    move-result p1

    div-int/2addr v0, p1

    invoke-direct {p0, p2}, Lcom/flyersoft/views/GoogleBook3D;->factorial(I)I

    move-result p1

    div-int/2addr v0, p1

    return v0
.end method

.method private bezierN([FF)[F
    .locals 12

    .line 438
    array-length v0, p1

    const/4 v1, 0x3

    div-int/2addr v0, v1

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    .line 439
    new-array v1, v1, [F

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v1, v3

    aput v4, v1, v2

    const/4 v5, 0x2

    aput v4, v1, v5

    const/4 v4, 0x0

    :goto_0
    if-gt v4, v0, :cond_0

    .line 441
    invoke-direct {p0, v0, v4}, Lcom/flyersoft/views/GoogleBook3D;->arrage(II)I

    move-result v6

    int-to-double v6, v6

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v8, p2

    float-to-double v8, v8

    sub-int v10, v0, v4

    int-to-double v10, v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    mul-double v6, v6, v8

    float-to-double v8, p2

    int-to-double v10, v4

    .line 442
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    mul-double v6, v6, v8

    double-to-float v6, v6

    .line 443
    aget v7, v1, v3

    mul-int/lit8 v8, v4, 0x3

    aget v9, p1, v8

    mul-float v9, v9, v6

    add-float/2addr v7, v9

    aput v7, v1, v3

    .line 444
    aget v7, v1, v2

    add-int/lit8 v9, v8, 0x1

    aget v9, p1, v9

    mul-float v9, v9, v6

    add-float/2addr v7, v9

    aput v7, v1, v2

    .line 445
    aget v7, v1, v5

    add-int/2addr v8, v5

    aget v8, p1, v8

    mul-float v8, v8, v6

    add-float/2addr v7, v8

    aput v7, v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static clamp(FFF)F
    .locals 1

    cmpg-float v0, p0, p1

    if-gez v0, :cond_0

    return p1

    :cond_0
    cmpl-float p1, p0, p2

    if-lez p1, :cond_1

    return p2

    :cond_1
    return p0
.end method

.method private factorial(I)I
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x1

    :goto_0
    if-le p1, v0, :cond_0

    add-int/lit8 v2, p1, -0x1

    mul-int v1, v1, p1

    move p1, v2

    goto :goto_0

    :cond_0
    return v1
.end method

.method private fitPointZ([FI)V
    .locals 8

    mul-int/lit8 p2, p2, 0x3

    .line 307
    aget v0, p1, p2

    add-int/lit8 p2, p2, 0x2

    .line 308
    aget v1, p1, p2

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_0

    sub-float/2addr v3, v0

    goto :goto_0

    :cond_0
    add-float/2addr v3, v0

    :goto_0
    float-to-double v2, v3

    .line 310
    iget v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mFOV:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v0, v4

    float-to-double v4, v0

    const-wide v6, 0x400921fb54442d18L    # Math.PI

    mul-double v4, v4, v6

    const-wide v6, 0x4066800000000000L    # 180.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->tan(D)D

    move-result-wide v4

    div-double/2addr v2, v4

    double-to-float v0, v2

    .line 311
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    aput v0, p1, p2

    return-void
.end method

.method private fitPointZ2([FI)V
    .locals 10

    mul-int/lit8 p2, p2, 0x3

    .line 316
    aget v0, p1, p2

    add-int/lit8 v1, p2, 0x2

    .line 317
    aget v2, p1, v1

    const/4 v3, 0x0

    cmpl-float v4, v0, v3

    if-eqz v4, :cond_2

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v6, v0, v5

    if-eqz v6, :cond_2

    cmpl-float v3, v2, v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 321
    :cond_0
    iget v3, p0, Lcom/flyersoft/views/GoogleBook3D;->mFOV:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v3, v6

    float-to-double v6, v3

    const-wide v8, 0x400921fb54442d18L    # Math.PI

    mul-double v6, v6, v8

    const-wide v8, 0x4066800000000000L    # 180.0

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    move-result-wide v6

    double-to-float v3, v6

    div-float v6, v2, v0

    .line 322
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float v3, v3, v6

    add-float/2addr v3, v5

    div-float/2addr v5, v3

    mul-float v6, v6, v0

    .line 324
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 325
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "x: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v7, ", z: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v7, ", maxX: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Alfred"

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    invoke-static {v0, v5}, Ljava/lang/Math;->min(FF)F

    move-result v6

    aput v6, p1, p2

    if-lez v4, :cond_1

    .line 328
    invoke-static {v0, v5}, Ljava/lang/Math;->min(FF)F

    move-result v0

    aput v0, p1, p2

    goto :goto_0

    :cond_1
    neg-float v4, v5

    .line 330
    invoke-static {v0, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    aput v0, p1, p2

    .line 332
    :goto_0
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result p2

    aput p2, p1, v1

    :cond_2
    :goto_1
    return-void
.end method

.method public static lowPassFilter(DDD)D
    .locals 0

    sub-double/2addr p2, p0

    mul-double p2, p2, p4

    add-double/2addr p0, p2

    return-wide p0
.end method

.method private rotatePoint([FIFF)V
    .locals 7

    const v0, 0x40490fdb    # (float)Math.PI

    const/4 v1, 0x0

    .line 296
    invoke-static {p3, v1, v0}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result p3

    float-to-double v2, p3

    .line 297
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float p3, v4

    .line 298
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v0, v2

    mul-int/lit8 p2, p2, 0x3

    .line 299
    aget v2, p1, p2

    add-int/lit8 v3, p2, 0x2

    .line 300
    aget v4, p1, v3

    mul-float v5, v2, p3

    mul-float v6, v4, v0

    sub-float/2addr v5, v6

    .line 301
    aput v5, p1, p2

    mul-float v4, v4, p3

    mul-float v2, v2, v0

    add-float/2addr v4, v2

    .line 302
    invoke-static {v4, v1, p4}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result p2

    aput p2, p1, v3

    return-void
.end method

.method private smooth(F)F
    .locals 2

    mul-float v0, p1, p1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float p1, p1, v1

    const/high16 v1, 0x40400000    # 3.0f

    sub-float/2addr v1, p1

    mul-float v0, v0, v1

    return v0
.end method

.method private updatePosBezier(FZ)V
    .locals 2

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    .line 190
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/GoogleBook3D;->updatePosComplex(FZ)V

    goto :goto_0

    .line 192
    :cond_0
    invoke-direct {p0, p1}, Lcom/flyersoft/views/GoogleBook3D;->updatePosSimple(F)V

    .line 195
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/views/GoogleBook3D;->updateTexcoords()V

    .line 198
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->setBuffer(Ljava/nio/FloatBuffer;[F)V

    .line 199
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mFBTexcoord:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutTexcoords:[F

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->setBuffer(Ljava/nio/FloatBuffer;[F)V

    .line 201
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    if-eqz v0, :cond_1

    .line 202
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/GoogleBook3D;->updateShadow(FZ)V

    :cond_1
    return-void
.end method

.method private updatePosComplex(FZ)V
    .locals 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 227
    iget-object v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    array-length v2, v2

    const/4 v3, 0x3

    div-int/2addr v2, v3

    .line 229
    iget v4, v0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x2

    if-ne v4, v7, :cond_0

    const/high16 v4, -0x40800000    # -1.0f

    .line 230
    invoke-static {v1, v4, v6}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result v1

    neg-float v1, v1

    goto :goto_0

    .line 234
    :cond_0
    invoke-static {v1, v6, v5}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result v1

    :goto_0
    const/16 v4, 0xf

    .line 240
    new-array v4, v4, [F

    const/4 v8, 0x0

    aput v6, v4, v8

    const/4 v9, 0x1

    aput v6, v4, v9

    aput v6, v4, v7

    const/high16 v10, 0x3e800000    # 0.25f

    aput v10, v4, v3

    const/4 v10, 0x4

    aput v6, v4, v10

    const/4 v11, 0x5

    aput v6, v4, v11

    const/4 v12, 0x6

    const v13, 0x3ecccccd    # 0.4f

    aput v13, v4, v12

    const/4 v12, 0x7

    aput v6, v4, v12

    const/16 v12, 0x8

    aput v6, v4, v12

    const v12, 0x3e4ccccd    # 0.2f

    add-float/2addr v12, v1

    .line 244
    invoke-static {v5, v12}, Ljava/lang/Math;->min(FF)F

    move-result v12

    const v13, 0x3eb33333    # 0.35f

    mul-float v12, v12, v13

    const v13, 0x3f266666    # 0.65f

    add-float/2addr v12, v13

    const/16 v13, 0x9

    aput v12, v4, v13

    const/16 v12, 0xa

    aput v6, v4, v12

    const/16 v12, 0xb

    aput v6, v4, v12

    const/16 v12, 0xc

    aput v5, v4, v12

    const/16 v12, 0xd

    aput v6, v4, v12

    const/16 v12, 0xe

    aput v6, v4, v12

    .line 249
    iget v6, v0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    float-to-double v12, v1

    const-wide v14, 0x400921fb54442d18L    # Math.PI

    mul-double v14, v14, v12

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    div-double v14, v14, v16

    double-to-float v14, v14

    const v15, 0x3e99999a    # 0.3f

    mul-float v15, v15, v6

    const/high16 v16, 0x40000000    # 2.0f

    if-eqz p2, :cond_1

    mul-float v14, v14, v16

    div-float v15, v15, v16

    :cond_1
    const v17, 0x4019999a    # 2.4f

    const/high16 v18, 0x3f800000    # 1.0f

    mul-float v5, v14, v17

    .line 256
    invoke-direct {v0, v4, v9, v5, v15}, Lcom/flyersoft/views/GoogleBook3D;->rotatePoint([FIFF)V

    const v5, 0x3fe66666    # 1.8f

    mul-float v5, v5, v14

    .line 257
    invoke-direct {v0, v4, v7, v5, v15}, Lcom/flyersoft/views/GoogleBook3D;->rotatePoint([FIFF)V

    const-wide/high16 v19, 0x3fe0000000000000L    # 0.5

    const v5, 0x3fcccccd    # 1.6f

    const/high16 v17, 0x3fc00000    # 1.5f

    cmpg-double v21, v12, v19

    if-gez v21, :cond_2

    mul-float v12, v14, v17

    mul-float v5, v5, v1

    .line 260
    invoke-static {v5, v15}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-direct {v0, v4, v3, v12, v5}, Lcom/flyersoft/views/GoogleBook3D;->rotatePoint([FIFF)V

    mul-float v14, v14, v18

    const v5, 0x3fa66666    # 1.3f

    mul-float v1, v1, v5

    .line 261
    invoke-static {v1, v15}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-direct {v0, v4, v10, v14, v1}, Lcom/flyersoft/views/GoogleBook3D;->rotatePoint([FIFF)V

    goto :goto_1

    :cond_2
    mul-float v12, v14, v17

    sub-float v1, v18, v1

    mul-float v1, v1, v5

    .line 263
    invoke-static {v1, v15}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-direct {v0, v4, v3, v12, v1}, Lcom/flyersoft/views/GoogleBook3D;->rotatePoint([FIFF)V

    mul-float v14, v14, v18

    .line 268
    invoke-direct {v0, v4, v10, v14, v15}, Lcom/flyersoft/views/GoogleBook3D;->rotatePoint([FIFF)V

    .line 272
    :goto_1
    iget v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    if-ne v1, v7, :cond_3

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v11, :cond_3

    mul-int/lit8 v5, v1, 0x3

    .line 274
    aget v7, v4, v5

    neg-float v7, v7

    aput v7, v4, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_3
    if-ge v1, v2, :cond_6

    .line 279
    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    mul-int/lit8 v7, v1, 0x3

    aget v10, v5, v7

    div-float v12, v6, v16

    add-float/2addr v10, v12

    add-int/lit8 v13, v7, 0x1

    .line 280
    aget v5, v5, v13

    const/4 v13, 0x0

    :goto_4
    if-ge v13, v11, :cond_4

    mul-int/lit8 v14, v13, 0x3

    add-int/2addr v14, v9

    .line 282
    aput v5, v4, v14

    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    :cond_4
    div-float/2addr v10, v6

    .line 284
    invoke-direct {v0, v4, v10}, Lcom/flyersoft/views/GoogleBook3D;->bezierN([FF)[F

    move-result-object v5

    if-eqz p2, :cond_5

    .line 286
    aget v10, v5, v8

    mul-float v10, v10, v12

    aput v10, v5, v8

    goto :goto_5

    .line 288
    :cond_5
    aget v10, v5, v8

    const/high16 v12, 0x3f000000    # 0.5f

    sub-float/2addr v10, v12

    mul-float v10, v10, v6

    aput v10, v5, v8

    .line 290
    :goto_5
    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    invoke-static {v5, v8, v10, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    return-void
.end method

.method private updatePosSimple(F)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 361
    iget v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-ne v2, v5, :cond_0

    const/high16 v2, -0x40800000    # -1.0f

    .line 362
    invoke-static {v1, v2, v4}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result v1

    add-float/2addr v1, v3

    .line 364
    invoke-direct {v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->smooth(F)F

    move-result v1

    goto :goto_0

    .line 366
    :cond_0
    invoke-static {v1, v4, v3}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result v1

    const v2, 0x3f99999a    # 1.2f

    mul-float v1, v1, v2

    .line 369
    :goto_0
    iget-object v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    array-length v2, v2

    div-int/lit8 v2, v2, 0x3

    .line 372
    iget-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->P0:Landroid/graphics/PointF;

    iget v6, v0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    neg-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    invoke-virtual {v3, v6, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 373
    iget v3, v0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    div-float v4, v3, v7

    neg-float v6, v3

    div-float/2addr v6, v7

    div-float/2addr v3, v7

    sub-float/2addr v6, v3

    mul-float v6, v6, v1

    add-float/2addr v4, v6

    float-to-double v3, v4

    .line 375
    iget-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    double-to-float v8, v3

    const v9, 0x3dcccccd    # 0.1f

    mul-float v9, v9, v1

    invoke-virtual {v6, v8, v9}, Landroid/graphics/PointF;->set(FF)V

    .line 376
    iput-wide v3, v0, Lcom/flyersoft/views/GoogleBook3D;->mPreP1:D

    float-to-double v3, v1

    .line 381
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    iget v6, v0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    float-to-double v10, v6

    mul-double v8, v8, v10

    const-wide v10, 0x3ff3333340000000L    # 1.2000000476837158

    mul-double v8, v8, v10

    div-float/2addr v6, v7

    float-to-double v10, v6

    .line 385
    iget-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->Q0:Landroid/graphics/PointF;

    sget v12, Lcom/flyersoft/views/GoogleBook3D;->Q0XSrc:F

    float-to-double v13, v12

    sget v15, Lcom/flyersoft/views/GoogleBook3D;->Q0XTgt:F

    sub-float/2addr v15, v12

    move-object/from16 p1, v6

    const/4 v12, 0x2

    float-to-double v5, v15

    mul-double v5, v5, v3

    add-double/2addr v13, v5

    double-to-float v5, v13

    double-to-float v6, v8

    move-object/from16 v8, p1

    invoke-virtual {v8, v5, v6}, Landroid/graphics/PointF;->set(FF)V

    mul-float v1, v1, v7

    float-to-double v5, v1

    const-wide/high16 v8, 0x3fd0000000000000L    # 0.25

    const-wide/high16 v13, 0x3fe0000000000000L    # 0.5

    cmpg-double v1, v3, v13

    if-gez v1, :cond_1

    .line 389
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    sub-double/2addr v5, v13

    mul-double v5, v5, v5

    sub-double/2addr v5, v8

    .line 390
    sget v1, Lcom/flyersoft/views/GoogleBook3D;->Q1ZSrc:F

    float-to-double v8, v1

    const-wide/high16 v15, -0x4030000000000000L    # -0.25

    div-double/2addr v8, v15

    mul-double v5, v5, v8

    move-wide/from16 v17, v13

    const/high16 p1, 0x40000000    # 2.0f

    const/4 v7, 0x2

    goto :goto_1

    .line 392
    :cond_1
    sget v1, Lcom/flyersoft/views/GoogleBook3D;->Q1ZSrc:F

    move-wide v15, v8

    const/high16 p1, 0x40000000    # 2.0f

    float-to-double v7, v1

    sub-double v8, v15, v7

    const-wide v15, 0x3fa999999999999aL    # 0.05

    move-wide/from16 v17, v13

    const/4 v7, 0x2

    float-to-double v12, v1

    add-double/2addr v12, v15

    div-double/2addr v8, v12

    sub-double v5, v5, v17

    mul-double v5, v5, v5

    sub-double/2addr v5, v8

    float-to-double v12, v1

    div-double/2addr v12, v8

    mul-double v5, v5, v12

    .line 395
    :goto_1
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    sget v8, Lcom/flyersoft/views/GoogleBook3D;->Q1XSrc:F

    float-to-double v12, v8

    float-to-double v8, v8

    sub-double/2addr v10, v8

    mul-double v10, v10, v3

    add-double/2addr v12, v10

    double-to-float v8, v12

    double-to-float v5, v5

    invoke-virtual {v1, v8, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 401
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    cmpl-float v1, v1, v5

    if-lez v1, :cond_2

    .line 402
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    iput v5, v1, Landroid/graphics/PointF;->x:F

    :cond_2
    cmpl-double v1, v3, v17

    if-lez v1, :cond_3

    .line 406
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    iget-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    cmpl-float v1, v1, v3

    if-lez v1, :cond_3

    .line 407
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    iget-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iput v3, v1, Landroid/graphics/PointF;->y:F

    :cond_3
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_4

    .line 414
    iget-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    mul-int/lit8 v4, v1, 0x3

    aget v3, v3, v4

    .line 415
    iget v5, v0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    div-float v6, v5, p1

    add-float/2addr v3, v6

    div-float/2addr v3, v5

    .line 416
    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->Q0:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->Q0:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v8, v9

    mul-float v8, v8, v3

    add-float/2addr v6, v8

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->Q0:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->Q1:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->Q0:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->y:F

    sub-float/2addr v9, v10

    mul-float v9, v9, v3

    add-float/2addr v8, v9

    invoke-virtual {v5, v6, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 417
    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->P0Q:Landroid/graphics/PointF;

    iget-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->P0:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->P0:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v8, v9

    mul-float v8, v8, v3

    add-float/2addr v6, v8

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->P0:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->P0:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->y:F

    sub-float/2addr v9, v10

    mul-float v9, v9, v3

    add-float/2addr v8, v9

    invoke-virtual {v5, v6, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 418
    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->QP1:Landroid/graphics/PointF;

    iget-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v8, v9

    mul-float v8, v8, v3

    add-float/2addr v6, v8

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->P1:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->Q:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->y:F

    sub-float/2addr v9, v10

    mul-float v9, v9, v3

    add-float/2addr v8, v9

    invoke-virtual {v5, v6, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 420
    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->Bezier:Landroid/graphics/PointF;

    iget-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->P0Q:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->QP1:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->P0Q:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v8, v9

    mul-float v8, v8, v3

    add-float/2addr v6, v8

    iget-object v8, v0, Lcom/flyersoft/views/GoogleBook3D;->P0Q:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    iget-object v9, v0, Lcom/flyersoft/views/GoogleBook3D;->QP1:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->P0Q:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->y:F

    sub-float/2addr v9, v10

    mul-float v9, v9, v3

    add-float/2addr v8, v9

    invoke-virtual {v5, v6, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 421
    iget-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->Bezier:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    aput v5, v3, v4

    .line 423
    iget-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    add-int/2addr v4, v7

    iget-object v5, v0, Lcom/flyersoft/views/GoogleBook3D;->Bezier:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->y:F

    aput v5, v3, v4

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2

    :cond_4
    return-void
.end method

.method private updateShadow(FZ)V
    .locals 7

    .line 467
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    array-length v1, v0

    div-int/lit8 v1, v1, 0x3

    add-int/lit8 v1, v1, -0x1

    mul-int/lit8 v1, v1, 0x3

    .line 468
    aget v2, v0, v1

    const/4 v3, 0x2

    add-int/2addr v1, v3

    .line 469
    aget v0, v0, v1

    .line 472
    iget v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mScreenWidthGL:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float v5, v1, v4

    sub-float/2addr v5, v2

    .line 473
    iget-object v2, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v6, v2, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    div-float/2addr v6, v4

    div-float/2addr v1, v4

    add-float/2addr v6, v1

    sub-float/2addr v6, v5

    iput v6, v2, Lcom/flyersoft/views/GoogleBook3D;->mTx:F

    .line 474
    iput v0, v2, Lcom/flyersoft/views/GoogleBook3D;->mTz:F

    if-eqz p2, :cond_5

    .line 478
    iget p2, p0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    if-ne p2, v3, :cond_0

    const/high16 p2, -0x40800000    # -1.0f

    .line 479
    invoke-static {p1, p2, v0}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result p1

    neg-float p1, p1

    goto :goto_0

    .line 481
    :cond_0
    invoke-static {p1, v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->clamp(FFF)F

    move-result p1

    :goto_0
    const p2, 0x3e4ccccc    # 0.19999999f

    const v2, 0x3f4ccccd    # 0.8f

    const v3, 0x3f19999a    # 0.6f

    cmpl-float v4, p1, v3

    if-lez v4, :cond_1

    cmpg-float v4, p1, v2

    if-gez v4, :cond_1

    sub-float/2addr p1, v3

    div-float/2addr p1, p2

    const/high16 p2, 0x3fc00000    # 1.5f

    mul-float p2, p2, p1

    add-float v0, p2, v1

    goto :goto_1

    :cond_1
    cmpl-float v3, p1, v2

    if-lez v3, :cond_2

    cmpg-float v3, p1, v1

    if-gez v3, :cond_2

    sub-float/2addr p1, v2

    div-float/2addr p1, p2

    const/high16 p2, -0x3fe00000    # -2.5f

    mul-float p2, p2, p1

    const/high16 p1, 0x40200000    # 2.5f

    add-float v0, p2, p1

    goto :goto_1

    :cond_2
    cmpl-float p1, p1, v1

    if-ltz p1, :cond_3

    goto :goto_1

    :cond_3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 500
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget-object p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    array-length p1, p1

    div-int/lit8 p1, p1, 0x3

    const/4 p2, 0x0

    :goto_2
    if-ge p2, p1, :cond_4

    .line 502
    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget-object v2, v1, Lcom/flyersoft/views/GoogleBook3D;->mOutShadowColor:[F

    mul-int/lit8 v3, p2, 0x4

    add-int/lit8 v3, v3, 0x3

    iget-object v1, v1, Lcom/flyersoft/views/GoogleBook3D;->mShadowColor:[F

    aget v1, v1, v3

    mul-float v1, v1, v0

    aput v1, v2, v3

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 504
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget-object p2, p1, Lcom/flyersoft/views/GoogleBook3D;->mFBShadow:Ljava/nio/FloatBuffer;

    iget-object p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mOutShadowColor:[F

    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/views/GoogleBook3D;->setBuffer(Ljava/nio/FloatBuffer;[F)V

    :cond_5
    return-void
.end method

.method private updateTexcoords()V
    .locals 10

    .line 208
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    .line 210
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/views/GoogleBook3D;->mLength:[D

    array-length v6, v5

    if-ge v4, v6, :cond_0

    .line 211
    iget-object v5, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    mul-int/lit8 v6, v4, 0x3

    aget v7, v5, v6

    add-int/lit8 v8, v4, -0x1

    mul-int/lit8 v8, v8, 0x3

    .line 212
    aget v9, v5, v8

    add-int/lit8 v6, v6, 0x2

    .line 213
    aget v6, v5, v6

    add-int/lit8 v8, v8, 0x2

    .line 214
    aget v5, v5, v8

    sub-float/2addr v7, v9

    mul-float v7, v7, v7

    sub-float/2addr v6, v5

    mul-float v6, v6, v6

    add-float/2addr v7, v6

    float-to-double v5, v7

    .line 215
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    add-double/2addr v1, v5

    .line 217
    iget-object v5, p0, Lcom/flyersoft/views/GoogleBook3D;->mLength:[D

    aput-wide v1, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 219
    :cond_0
    array-length v1, v5

    sub-int/2addr v1, v3

    aget-wide v1, v5, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v0, :cond_1

    .line 222
    iget-object v4, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutTexcoords:[F

    mul-int/lit8 v5, v3, 0x2

    iget-object v6, p0, Lcom/flyersoft/views/GoogleBook3D;->mLength:[D

    array-length v7, v6

    rem-int v7, v3, v7

    aget-wide v7, v6, v7

    div-double/2addr v7, v1

    double-to-float v6, v7

    aput v6, v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method attachShadow(Lcom/flyersoft/views/GoogleBook3D;)V
    .locals 0

    .line 463
    iput-object p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    return-void
.end method

.method generate(IIFFFZ)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    int-to-float v3, v1

    mul-float v4, v3, p3

    .line 81
    iput v4, v0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    add-int/lit8 v5, v1, 0x1

    .line 82
    new-array v6, v5, [D

    iput-object v6, v0, Lcom/flyersoft/views/GoogleBook3D;->mLength:[D

    mul-float v6, p5, p3

    const/high16 v7, 0x40000000    # 2.0f

    if-eqz p6, :cond_0

    neg-float v4, v4

    div-float v6, v4, v7

    :cond_0
    neg-int v4, v2

    int-to-float v4, v4

    div-float/2addr v4, v7

    mul-float v4, v4, p4

    const/high16 v7, 0x3f800000    # 1.0f

    div-float v8, v7, v3

    int-to-float v9, v2

    div-float v9, v7, v9

    add-int/lit8 v10, v2, 0x1

    mul-int v10, v10, v5

    mul-int/lit8 v11, v10, 0x3

    .line 92
    new-array v11, v11, [F

    iput-object v11, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    .line 93
    array-length v11, v11

    new-array v11, v11, [F

    iput-object v11, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    mul-int/lit8 v11, v10, 0x2

    .line 94
    new-array v11, v11, [F

    iput-object v11, v0, Lcom/flyersoft/views/GoogleBook3D;->mTexcoords:[F

    .line 95
    array-length v11, v11

    new-array v11, v11, [F

    iput-object v11, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutTexcoords:[F

    if-eqz p6, :cond_1

    mul-int/lit8 v10, v10, 0x4

    .line 97
    new-array v11, v10, [F

    iput-object v11, v0, Lcom/flyersoft/views/GoogleBook3D;->mShadowColor:[F

    .line 98
    new-array v10, v10, [F

    iput-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutShadowColor:[F

    :cond_1
    const v10, 0x3e99999a    # 0.3f

    div-float v3, v10, v3

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_0
    if-gt v12, v2, :cond_4

    const/4 v13, 0x0

    :goto_1
    if-gt v13, v1, :cond_3

    mul-int v14, v12, v5

    add-int/2addr v14, v13

    .line 110
    iget-object v15, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    mul-int/lit8 v16, v14, 0x3

    const/high16 p5, 0x3f800000    # 1.0f

    int-to-float v7, v13

    mul-float v17, v7, p3

    add-float v17, v6, v17

    aput v17, v15, v16

    add-int/lit8 v16, v16, 0x1

    const v17, 0x3e99999a    # 0.3f

    int-to-float v10, v12

    mul-float v18, v10, p4

    add-float v18, v4, v18

    .line 111
    aput v18, v15, v16

    .line 113
    iget-object v15, v0, Lcom/flyersoft/views/GoogleBook3D;->mTexcoords:[F

    mul-int/lit8 v16, v14, 0x2

    mul-float v18, v7, v8

    aput v18, v15, v16

    add-int/lit8 v16, v16, 0x1

    mul-float v10, v10, v9

    sub-float v10, p5, v10

    .line 114
    aput v10, v15, v16

    if-eqz p6, :cond_2

    .line 117
    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->mShadowColor:[F

    mul-int/lit8 v14, v14, 0x4

    add-int/lit8 v14, v14, 0x3

    mul-float v7, v7, v3

    sub-float v7, v17, v7

    aput v7, v10, v14

    .line 118
    iget-object v10, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutShadowColor:[F

    aput v7, v10, v14

    :cond_2
    add-int/lit8 v13, v13, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const v10, 0x3e99999a    # 0.3f

    goto :goto_1

    :cond_3
    const/high16 p5, 0x3f800000    # 1.0f

    const v17, 0x3e99999a    # 0.3f

    add-int/lit8 v12, v12, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const v10, 0x3e99999a    # 0.3f

    goto :goto_0

    :cond_4
    mul-int v3, v1, v2

    mul-int/lit8 v3, v3, 0x6

    .line 125
    new-array v3, v3, [S

    const/4 v4, 0x0

    const/4 v6, 0x0

    :goto_2
    if-ge v4, v2, :cond_6

    const/4 v7, 0x0

    :goto_3
    if-ge v7, v1, :cond_5

    add-int/lit8 v8, v6, 0x1

    mul-int v9, v4, v5

    add-int/2addr v9, v7

    int-to-short v10, v9

    .line 130
    aput-short v10, v3, v6

    add-int/lit8 v10, v6, 0x2

    add-int/lit8 v9, v9, 0x1

    int-to-short v9, v9

    .line 131
    aput-short v9, v3, v8

    add-int/lit8 v8, v6, 0x3

    add-int/lit8 v12, v4, 0x1

    mul-int v12, v12, v5

    add-int/2addr v12, v7

    int-to-short v13, v12

    .line 132
    aput-short v13, v3, v10

    add-int/lit8 v10, v6, 0x4

    .line 134
    aput-short v9, v3, v8

    add-int/lit8 v8, v6, 0x5

    add-int/lit8 v12, v12, 0x1

    int-to-short v9, v12

    .line 135
    aput-short v9, v3, v10

    add-int/lit8 v6, v6, 0x6

    .line 136
    aput-short v13, v3, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 140
    :cond_6
    iput-object v3, v0, Lcom/flyersoft/views/GoogleBook3D;->mIndices:[S

    .line 142
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    iget-object v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    array-length v3, v2

    invoke-static {v1, v11, v2, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mTexcoords:[F

    iget-object v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutTexcoords:[F

    array-length v3, v2

    invoke-static {v1, v11, v2, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 146
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 147
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    .line 148
    invoke-virtual {v1, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 150
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mTexcoords:[F

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 151
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 152
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mFBTexcoord:Ljava/nio/FloatBuffer;

    .line 153
    invoke-virtual {v1, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 155
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mIndices:[S

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 156
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 157
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mSBIndices:Ljava/nio/ShortBuffer;

    .line 158
    iget-object v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mIndices:[S

    invoke-virtual {v1, v2}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 159
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mSBIndices:Ljava/nio/ShortBuffer;

    invoke-virtual {v1, v11}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    if-eqz p6, :cond_7

    .line 162
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mShadowColor:[F

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 163
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 164
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mFBShadow:Ljava/nio/FloatBuffer;

    .line 165
    iget-object v2, v0, Lcom/flyersoft/views/GoogleBook3D;->mShadowColor:[F

    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 166
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mFBShadow:Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 169
    :cond_7
    invoke-virtual {v0}, Lcom/flyersoft/views/GoogleBook3D;->reset()V

    return-void
.end method

.method reset()V
    .locals 4

    .line 336
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutPositions:[F

    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 337
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mTexcoords:[F

    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mOutTexcoords:[F

    array-length v2, v1

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 338
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->setBuffer(Ljava/nio/FloatBuffer;[F)V

    .line 339
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mFBTexcoord:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mTexcoords:[F

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->setBuffer(Ljava/nio/FloatBuffer;[F)V

    .line 340
    iget-object v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    if-eqz v0, :cond_0

    .line 341
    iget-object v1, v0, Lcom/flyersoft/views/GoogleBook3D;->mFBShadow:Ljava/nio/FloatBuffer;

    iget-object v0, v0, Lcom/flyersoft/views/GoogleBook3D;->mOutShadowColor:[F

    invoke-virtual {p0, v1, v0}, Lcom/flyersoft/views/GoogleBook3D;->setBuffer(Ljava/nio/FloatBuffer;[F)V

    :cond_0
    const/4 v0, 0x0

    .line 343
    iput v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    .line 344
    iput v3, p0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    .line 345
    iget v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mPreP1:D

    return-void
.end method

.method setBuffer(Ljava/nio/FloatBuffer;[F)V
    .locals 3

    const/4 v0, 0x0

    .line 349
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x0

    .line 350
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_0

    .line 351
    aget v2, p2, v1

    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 353
    :cond_0
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method

.method setLeftEndX(I)F
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x3fc00000    # 1.5f

    sub-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p1, p1, v0

    .line 525
    sput p1, Lcom/flyersoft/views/GoogleBook3D;->Q0XTgt:F

    return p1
.end method

.method setLeftStartX(I)F
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float p1, p1, v0

    .line 520
    sput p1, Lcom/flyersoft/views/GoogleBook3D;->Q0XSrc:F

    return p1
.end method

.method setRightStartX(I)F
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p1, p1, v0

    .line 530
    sput p1, Lcom/flyersoft/views/GoogleBook3D;->Q1XSrc:F

    return p1
.end method

.method setRightStartZ(I)F
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    mul-float p1, p1, v0

    .line 535
    sput p1, Lcom/flyersoft/views/GoogleBook3D;->Q1ZSrc:F

    return p1
.end method

.method start(FFZ)V
    .locals 0

    const/4 p3, 0x0

    .line 173
    iput p3, p0, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    .line 174
    iput p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mDownX:F

    .line 175
    iput p2, p0, Lcom/flyersoft/views/GoogleBook3D;->mScreenWidth:F

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    cmpg-float p1, p1, p2

    if-gez p1, :cond_0

    const/4 p1, 0x2

    .line 177
    iput p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    return-void

    :cond_0
    const/4 p1, 0x1

    .line 179
    iput p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    return-void
.end method

.method startPageTurnAnimation(FF)V
    .locals 0

    .line 509
    iput p1, p0, Lcom/flyersoft/views/GoogleBook3D;->mFromT:F

    .line 510
    iput p2, p0, Lcom/flyersoft/views/GoogleBook3D;->mToT:F

    return-void
.end method

.method updatePageTurnAnimation(FZ)V
    .locals 2

    .line 514
    iget v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mFromT:F

    iget v1, p0, Lcom/flyersoft/views/GoogleBook3D;->mToT:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    .line 516
    invoke-direct {p0, v0, p2}, Lcom/flyersoft/views/GoogleBook3D;->updatePosBezier(FZ)V

    return-void
.end method

.method updatePos(FZ)V
    .locals 1

    .line 184
    iget v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    .line 185
    invoke-direct {p0, v0, p2}, Lcom/flyersoft/views/GoogleBook3D;->updatePosBezier(FZ)V

    return-void
.end method
