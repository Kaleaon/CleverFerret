.class public Lcom/example2014/components/Scroller;
.super Ljava/lang/Object;
.source "Scroller.java"


# static fields
.field private static ALPHA:F = 0.0f

.field private static DECELERATION_RATE:F = 0.0f

.field private static final DEFAULT_DURATION:I = 0xfa

.field private static END_TENSION:F = 0.0f

.field private static final FLING_MODE:I = 0x1

.field private static final NB_SAMPLES:I = 0x64

.field private static final SCROLL_MODE:I

.field private static final SPLINE:[F

.field private static START_TENSION:F

.field private static sViscousFluidNormalize:F

.field private static sViscousFluidScale:F


# instance fields
.field private mCurrX:I

.field private mCurrY:I

.field private mDeceleration:F

.field private mDeltaX:F

.field private mDeltaY:F

.field private mDuration:I

.field private mDurationReciprocal:F

.field private mFinalX:I

.field private mFinalY:I

.field private mFinished:Z

.field private mFlywheel:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mMaxX:I

.field private mMaxY:I

.field private mMinX:I

.field private mMinY:I

.field private mMode:I

.field private final mPpi:F

.field private mStartTime:J

.field private mStartX:I

.field private mStartY:I

.field private mVelocity:F


# direct methods
.method static constructor <clinit>()V
    .locals 14

    const-wide/high16 v0, 0x3fe8000000000000L    # 0.75

    .line 48
    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide v2, 0x3feccccccccccccdL    # 0.9

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    double-to-float v0, v0

    sput v0, Lcom/example2014/components/Scroller;->DECELERATION_RATE:F

    const/high16 v0, 0x44480000    # 800.0f

    .line 49
    sput v0, Lcom/example2014/components/Scroller;->ALPHA:F

    const v0, 0x3ecccccd    # 0.4f

    .line 50
    sput v0, Lcom/example2014/components/Scroller;->START_TENSION:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    .line 51
    sput v0, Lcom/example2014/components/Scroller;->END_TENSION:F

    const/16 v0, 0x65

    .line 53
    new-array v0, v0, [F

    sput-object v0, Lcom/example2014/components/Scroller;->SPLINE:[F

    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x64

    if-gt v2, v3, :cond_2

    int-to-float v3, v2

    const/high16 v4, 0x42c80000    # 100.0f

    div-float v4, v3, v4

    const/high16 v3, 0x3f800000    # 1.0f

    :goto_1
    sub-float v5, v3, v0

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    add-float/2addr v5, v0

    const/high16 v6, 0x40400000    # 3.0f

    mul-float v6, v6, v5

    sub-float v7, v1, v5

    mul-float v6, v6, v7

    .line 67
    sget v8, Lcom/example2014/components/Scroller;->START_TENSION:F

    mul-float v7, v7, v8

    sget v8, Lcom/example2014/components/Scroller;->END_TENSION:F

    mul-float v8, v8, v5

    add-float/2addr v7, v8

    mul-float v7, v7, v6

    mul-float v8, v5, v5

    mul-float v8, v8, v5

    add-float/2addr v7, v8

    sub-float v9, v7, v4

    .line 68
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    float-to-double v9, v9

    const-wide v11, 0x3ee4f8b588e368f1L    # 1.0E-5

    cmpg-double v13, v9, v11

    if-gez v13, :cond_0

    add-float/2addr v6, v8

    .line 73
    sget-object v3, Lcom/example2014/components/Scroller;->SPLINE:[F

    aput v6, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    cmpl-float v6, v7, v4

    if-lez v6, :cond_1

    move v3, v5

    goto :goto_1

    :cond_1
    move v0, v5

    goto :goto_1

    .line 75
    :cond_2
    sget-object v0, Lcom/example2014/components/Scroller;->SPLINE:[F

    aput v1, v0, v3

    const/high16 v0, 0x41000000    # 8.0f

    .line 78
    sput v0, Lcom/example2014/components/Scroller;->sViscousFluidScale:F

    .line 80
    sput v1, Lcom/example2014/components/Scroller;->sViscousFluidNormalize:F

    .line 81
    invoke-static {v1}, Lcom/example2014/components/Scroller;->viscousFluid(F)F

    move-result v0

    div-float/2addr v1, v0

    sput v1, Lcom/example2014/components/Scroller;->sViscousFluidNormalize:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, p1, v0}, Lcom/example2014/components/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V
    .locals 1

    const/4 v0, 0x1

    .line 100
    invoke-direct {p0, p1, p2, v0}, Lcom/example2014/components/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V
    .locals 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    .line 110
    iput-object p2, p0, Lcom/example2014/components/Scroller;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 111
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x43200000    # 160.0f

    mul-float p1, p1, p2

    iput p1, p0, Lcom/example2014/components/Scroller;->mPpi:F

    .line 112
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/example2014/components/Scroller;->computeDeceleration(F)F

    move-result p1

    iput p1, p0, Lcom/example2014/components/Scroller;->mDeceleration:F

    .line 113
    iput-boolean p3, p0, Lcom/example2014/components/Scroller;->mFlywheel:Z

    return-void
.end method

.method private computeDeceleration(F)F
    .locals 2

    const v0, 0x43c10b3d

    .line 128
    iget v1, p0, Lcom/example2014/components/Scroller;->mPpi:F

    mul-float v1, v1, v0

    mul-float v1, v1, p1

    return v1
.end method

.method static viscousFluid(F)F
    .locals 3

    .line 407
    sget v0, Lcom/example2014/components/Scroller;->sViscousFluidScale:F

    mul-float p0, p0, v0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v1, p0, v0

    if-gez v1, :cond_0

    neg-float v1, p0

    float-to-double v1, v1

    .line 409
    invoke-static {v1, v2}, Ljava/lang/Math;->exp(D)D

    move-result-wide v1

    double-to-float v1, v1

    sub-float/2addr v0, v1

    sub-float/2addr p0, v0

    goto :goto_0

    :cond_0
    sub-float p0, v0, p0

    float-to-double v1, p0

    .line 412
    invoke-static {v1, v2}, Ljava/lang/Math;->exp(D)D

    move-result-wide v1

    double-to-float p0, v1

    sub-float/2addr v0, p0

    const p0, 0x3f21d2a7

    mul-float v0, v0, p0

    const p0, 0x3ebc5ab2

    add-float/2addr p0, v0

    .line 415
    :goto_0
    sget v0, Lcom/example2014/components/Scroller;->sViscousFluidNormalize:F

    mul-float p0, p0, v0

    return p0
.end method


# virtual methods
.method public abortAnimation()V
    .locals 1

    .line 427
    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    .line 428
    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    const/4 v0, 0x1

    .line 429
    iput-boolean v0, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    return-void
.end method

.method public computeScrollOffset()Z
    .locals 7

    .line 232
    iget-boolean v0, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 236
    :cond_0
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/example2014/components/Scroller;->mStartTime:J

    sub-long/2addr v0, v2

    long-to-int v1, v0

    .line 238
    iget v0, p0, Lcom/example2014/components/Scroller;->mDuration:I

    const/4 v2, 0x1

    if-ge v1, v0, :cond_4

    .line 239
    iget v3, p0, Lcom/example2014/components/Scroller;->mMode:I

    if-eqz v3, :cond_2

    if-eq v3, v2, :cond_1

    goto/16 :goto_1

    :cond_1
    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float v3, v1, v0

    float-to-int v3, v3

    int-to-float v4, v3

    div-float/2addr v4, v0

    add-int/lit8 v5, v3, 0x1

    int-to-float v6, v5

    div-float/2addr v6, v0

    .line 256
    sget-object v0, Lcom/example2014/components/Scroller;->SPLINE:[F

    aget v3, v0, v3

    .line 257
    aget v0, v0, v5

    sub-float/2addr v1, v4

    sub-float/2addr v6, v4

    div-float/2addr v1, v6

    sub-float/2addr v0, v3

    mul-float v1, v1, v0

    add-float/2addr v3, v1

    .line 260
    iget v0, p0, Lcom/example2014/components/Scroller;->mStartX:I

    iget v1, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    sub-int/2addr v1, v0

    int-to-float v1, v1

    mul-float v1, v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    .line 262
    iget v1, p0, Lcom/example2014/components/Scroller;->mMaxX:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    .line 263
    iget v1, p0, Lcom/example2014/components/Scroller;->mMinX:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    .line 265
    iget v0, p0, Lcom/example2014/components/Scroller;->mStartY:I

    iget v1, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    sub-int/2addr v1, v0

    int-to-float v1, v1

    mul-float v3, v3, v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    .line 267
    iget v1, p0, Lcom/example2014/components/Scroller;->mMaxY:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    .line 268
    iget v1, p0, Lcom/example2014/components/Scroller;->mMinY:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    .line 270
    iget v1, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    iget v3, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    if-ne v1, v3, :cond_5

    iget v1, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    if-ne v0, v1, :cond_5

    .line 271
    iput-boolean v2, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    goto :goto_1

    :cond_2
    int-to-float v0, v1

    .line 241
    iget v1, p0, Lcom/example2014/components/Scroller;->mDurationReciprocal:F

    mul-float v0, v0, v1

    .line 243
    iget-object v1, p0, Lcom/example2014/components/Scroller;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_3

    .line 244
    invoke-static {v0}, Lcom/example2014/components/Scroller;->viscousFluid(F)F

    move-result v0

    goto :goto_0

    .line 246
    :cond_3
    invoke-interface {v1, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    .line 248
    :goto_0
    iget v1, p0, Lcom/example2014/components/Scroller;->mStartX:I

    iget v3, p0, Lcom/example2014/components/Scroller;->mDeltaX:F

    mul-float v3, v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v1, v3

    iput v1, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    .line 249
    iget v1, p0, Lcom/example2014/components/Scroller;->mStartY:I

    iget v3, p0, Lcom/example2014/components/Scroller;->mDeltaY:F

    mul-float v0, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr v1, v0

    iput v1, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    goto :goto_1

    .line 278
    :cond_4
    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    .line 279
    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    iput v0, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    .line 280
    iput-boolean v2, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    :cond_5
    :goto_1
    return v2
.end method

.method public extendDuration(I)V
    .locals 1

    .line 441
    invoke-virtual {p0}, Lcom/example2014/components/Scroller;->timePassed()I

    move-result v0

    add-int/2addr v0, p1

    .line 442
    iput v0, p0, Lcom/example2014/components/Scroller;->mDuration:I

    const/high16 p1, 0x3f800000    # 1.0f

    int-to-float v0, v0

    div-float/2addr p1, v0

    .line 443
    iput p1, p0, Lcom/example2014/components/Scroller;->mDurationReciprocal:F

    const/4 p1, 0x0

    .line 444
    iput-boolean p1, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    return-void
.end method

.method public fling(IIIIIIII)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    .line 352
    iget-boolean v3, v0, Lcom/example2014/components/Scroller;->mFlywheel:Z

    if-eqz v3, :cond_0

    iget-boolean v3, v0, Lcom/example2014/components/Scroller;->mFinished:Z

    if-nez v3, :cond_0

    .line 353
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->getCurrVelocity()F

    move-result v3

    .line 355
    iget v4, v0, Lcom/example2014/components/Scroller;->mFinalX:I

    iget v5, v0, Lcom/example2014/components/Scroller;->mStartX:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    .line 356
    iget v5, v0, Lcom/example2014/components/Scroller;->mFinalY:I

    iget v6, v0, Lcom/example2014/components/Scroller;->mStartY:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    mul-float v6, v4, v4

    mul-float v7, v5, v5

    add-float/2addr v6, v7

    float-to-double v6, v6

    .line 357
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    double-to-float v6, v6

    div-float/2addr v4, v6

    div-float/2addr v5, v6

    mul-float v4, v4, v3

    mul-float v5, v5, v3

    move/from16 v3, p3

    int-to-float v6, v3

    .line 364
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    move-result v7

    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    move-result v8

    cmpl-float v7, v7, v8

    if-nez v7, :cond_1

    move/from16 v7, p4

    int-to-float v8, v7

    .line 365
    invoke-static {v8}, Ljava/lang/Math;->signum(F)F

    move-result v9

    invoke-static {v5}, Ljava/lang/Math;->signum(F)F

    move-result v10

    cmpl-float v9, v9, v10

    if-nez v9, :cond_2

    add-float/2addr v6, v4

    float-to-int v3, v6

    add-float/2addr v8, v5

    float-to-int v4, v8

    move v7, v4

    goto :goto_0

    :cond_0
    move/from16 v3, p3

    :cond_1
    move/from16 v7, p4

    :cond_2
    :goto_0
    const/4 v4, 0x1

    .line 371
    iput v4, v0, Lcom/example2014/components/Scroller;->mMode:I

    const/4 v4, 0x0

    .line 372
    iput-boolean v4, v0, Lcom/example2014/components/Scroller;->mFinished:Z

    mul-int v4, v3, v3

    mul-int v5, v7, v7

    add-int/2addr v4, v5

    int-to-double v4, v4

    .line 374
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v4, v4

    .line 376
    iput v4, v0, Lcom/example2014/components/Scroller;->mVelocity:F

    .line 377
    sget v5, Lcom/example2014/components/Scroller;->START_TENSION:F

    mul-float v5, v5, v4

    sget v6, Lcom/example2014/components/Scroller;->ALPHA:F

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->log(D)D

    move-result-wide v5

    .line 378
    sget v8, Lcom/example2014/components/Scroller;->DECELERATION_RATE:F

    float-to-double v8, v8

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v8, v10

    div-double v8, v5, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->exp(D)D

    move-result-wide v8

    const-wide v12, 0x408f400000000000L    # 1000.0

    mul-double v8, v8, v12

    double-to-int v8, v8

    iput v8, v0, Lcom/example2014/components/Scroller;->mDuration:I

    .line 379
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v8

    iput-wide v8, v0, Lcom/example2014/components/Scroller;->mStartTime:J

    .line 380
    iput v1, v0, Lcom/example2014/components/Scroller;->mStartX:I

    .line 381
    iput v2, v0, Lcom/example2014/components/Scroller;->mStartY:I

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v8, v4, v8

    if-nez v8, :cond_3

    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_3
    int-to-float v3, v3

    div-float/2addr v3, v4

    :goto_1
    if-nez v8, :cond_4

    goto :goto_2

    :cond_4
    int-to-float v7, v7

    div-float v9, v7, v4

    .line 386
    :goto_2
    sget v4, Lcom/example2014/components/Scroller;->ALPHA:F

    float-to-double v7, v4

    sget v4, Lcom/example2014/components/Scroller;->DECELERATION_RATE:F

    float-to-double v12, v4

    float-to-double v14, v4

    sub-double/2addr v14, v10

    div-double/2addr v12, v14

    mul-double v12, v12, v5

    .line 387
    invoke-static {v12, v13}, Ljava/lang/Math;->exp(D)D

    move-result-wide v4

    mul-double v7, v7, v4

    double-to-int v4, v7

    move/from16 v5, p5

    .line 389
    iput v5, v0, Lcom/example2014/components/Scroller;->mMinX:I

    move/from16 v5, p6

    .line 390
    iput v5, v0, Lcom/example2014/components/Scroller;->mMaxX:I

    move/from16 v5, p7

    .line 391
    iput v5, v0, Lcom/example2014/components/Scroller;->mMinY:I

    move/from16 v5, p8

    .line 392
    iput v5, v0, Lcom/example2014/components/Scroller;->mMaxY:I

    int-to-float v4, v4

    mul-float v3, v3, v4

    .line 394
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v1, v3

    iput v1, v0, Lcom/example2014/components/Scroller;->mFinalX:I

    .line 396
    iget v3, v0, Lcom/example2014/components/Scroller;->mMaxX:I

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Lcom/example2014/components/Scroller;->mFinalX:I

    .line 397
    iget v3, v0, Lcom/example2014/components/Scroller;->mMinX:I

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Lcom/example2014/components/Scroller;->mFinalX:I

    mul-float v4, v4, v9

    .line 399
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v1, v2

    iput v1, v0, Lcom/example2014/components/Scroller;->mFinalY:I

    .line 401
    iget v2, v0, Lcom/example2014/components/Scroller;->mMaxY:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Lcom/example2014/components/Scroller;->mFinalY:I

    .line 402
    iget v2, v0, Lcom/example2014/components/Scroller;->mMinY:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Lcom/example2014/components/Scroller;->mFinalY:I

    return-void
.end method

.method public final forceFinished(Z)V
    .locals 0

    .line 150
    iput-boolean p1, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    return-void
.end method

.method public getCurrVelocity()F
    .locals 3

    .line 187
    iget v0, p0, Lcom/example2014/components/Scroller;->mVelocity:F

    iget v1, p0, Lcom/example2014/components/Scroller;->mDeceleration:F

    invoke-virtual {p0}, Lcom/example2014/components/Scroller;->timePassed()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    const/high16 v2, 0x44fa0000    # 2000.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method public final getCurrX()I
    .locals 1

    .line 168
    iget v0, p0, Lcom/example2014/components/Scroller;->mCurrX:I

    return v0
.end method

.method public final getCurrY()I
    .locals 1

    .line 177
    iget v0, p0, Lcom/example2014/components/Scroller;->mCurrY:I

    return v0
.end method

.method public final getDuration()I
    .locals 1

    .line 159
    iget v0, p0, Lcom/example2014/components/Scroller;->mDuration:I

    return v0
.end method

.method public final getFinalX()I
    .locals 1

    .line 214
    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    return v0
.end method

.method public final getFinalY()I
    .locals 1

    .line 223
    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    return v0
.end method

.method public final getStartX()I
    .locals 1

    .line 196
    iget v0, p0, Lcom/example2014/components/Scroller;->mStartX:I

    return v0
.end method

.method public final getStartY()I
    .locals 1

    .line 205
    iget v0, p0, Lcom/example2014/components/Scroller;->mStartY:I

    return v0
.end method

.method public final isFinished()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    return v0
.end method

.method public isScrollingInDirection(FF)Z
    .locals 2

    .line 486
    iget-boolean v0, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    if-nez v0, :cond_0

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    iget v0, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    iget v1, p0, Lcom/example2014/components/Scroller;->mStartX:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_0

    .line 487
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result p1

    iget p2, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    iget v0, p0, Lcom/example2014/components/Scroller;->mStartY:I

    sub-int/2addr p2, v0

    int-to-float p2, p2

    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result p2

    cmpl-float p1, p1, p2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFinalX(I)V
    .locals 1

    .line 464
    iput p1, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    .line 465
    iget v0, p0, Lcom/example2014/components/Scroller;->mStartX:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iput p1, p0, Lcom/example2014/components/Scroller;->mDeltaX:F

    const/4 p1, 0x0

    .line 466
    iput-boolean p1, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    return-void
.end method

.method public setFinalY(I)V
    .locals 1

    .line 477
    iput p1, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    .line 478
    iget v0, p0, Lcom/example2014/components/Scroller;->mStartY:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iput p1, p0, Lcom/example2014/components/Scroller;->mDeltaY:F

    const/4 p1, 0x0

    .line 479
    iput-boolean p1, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    return-void
.end method

.method public final setFriction(F)V
    .locals 0

    .line 124
    invoke-direct {p0, p1}, Lcom/example2014/components/Scroller;->computeDeceleration(F)F

    move-result p1

    iput p1, p0, Lcom/example2014/components/Scroller;->mDeceleration:F

    return-void
.end method

.method public startScroll(IIII)V
    .locals 6

    const/16 v5, 0xfa

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 300
    invoke-virtual/range {v0 .. v5}, Lcom/example2014/components/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public startScroll(IIIII)V
    .locals 2

    const/4 v0, 0x0

    .line 317
    iput v0, p0, Lcom/example2014/components/Scroller;->mMode:I

    .line 318
    iput-boolean v0, p0, Lcom/example2014/components/Scroller;->mFinished:Z

    .line 319
    iput p5, p0, Lcom/example2014/components/Scroller;->mDuration:I

    .line 320
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/example2014/components/Scroller;->mStartTime:J

    .line 321
    iput p1, p0, Lcom/example2014/components/Scroller;->mStartX:I

    .line 322
    iput p2, p0, Lcom/example2014/components/Scroller;->mStartY:I

    add-int/2addr p1, p3

    .line 323
    iput p1, p0, Lcom/example2014/components/Scroller;->mFinalX:I

    add-int/2addr p2, p4

    .line 324
    iput p2, p0, Lcom/example2014/components/Scroller;->mFinalY:I

    int-to-float p1, p3

    .line 325
    iput p1, p0, Lcom/example2014/components/Scroller;->mDeltaX:F

    int-to-float p1, p4

    .line 326
    iput p1, p0, Lcom/example2014/components/Scroller;->mDeltaY:F

    .line 327
    iget p1, p0, Lcom/example2014/components/Scroller;->mDuration:I

    int-to-float p1, p1

    const/high16 p2, 0x3f800000    # 1.0f

    div-float/2addr p2, p1

    iput p2, p0, Lcom/example2014/components/Scroller;->mDurationReciprocal:F

    return-void
.end method

.method public timePassed()I
    .locals 4

    .line 453
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/example2014/components/Scroller;->mStartTime:J

    sub-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method
