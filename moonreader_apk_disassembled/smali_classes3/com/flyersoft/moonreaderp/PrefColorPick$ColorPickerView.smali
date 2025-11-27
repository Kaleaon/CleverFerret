.class Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;
.super Landroid/view/View;
.source "PrefColorPick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefColorPick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ColorPickerView"
.end annotation


# static fields
.field private static final PI:F = 3.1415925f


# instance fields
.field private CENTER_X:I

.field private CENTER_Y:I

.field private mCenterPaint:Landroid/graphics/Paint;

.field private final mColors:[I

.field private mHSVColors:[I

.field private mHSVPaint:Landroid/graphics/Paint;

.field private mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mRedrawHSV:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;I)V
    .locals 2

    .line 481
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 485
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

    const/4 p1, 0x7

    .line 486
    new-array p1, p1, [I

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mColors:[I

    .line 488
    new-instance p2, Landroid/graphics/SweepGradient;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p2, v0, v0, p1, v1}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 489
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mPaint:Landroid/graphics/Paint;

    .line 490
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 491
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mPaint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 493
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mCenterPaint:Landroid/graphics/Paint;

    .line 494
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 495
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mCenterPaint:Landroid/graphics/Paint;

    const/high16 p2, 0x40a00000    # 5.0f

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 p1, -0x1000000

    const/4 p2, -0x1

    .line 496
    filled-new-array {p1, p3, p2}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mHSVColors:[I

    .line 497
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mHSVPaint:Landroid/graphics/Paint;

    const/high16 p2, 0x41200000    # 10.0f

    .line 498
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void

    nop

    :array_0
    .array-data 4
        -0x10000
        -0xff01
        -0xffff01
        -0xff0001
        -0xff0100
        -0x100
        -0x10000
    .end array-data
.end method

.method private ave(IIF)I
    .locals 0

    sub-int/2addr p2, p1

    int-to-float p2, p2

    mul-float p3, p3, p2

    .line 525
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p2

    add-int/2addr p1, p2

    return p1
.end method

.method private getLinearGradient()Landroid/graphics/LinearGradient;
    .locals 8

    .line 520
    new-instance v0, Landroid/graphics/LinearGradient;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mHSVColors:[I

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/high16 v1, -0x3d380000    # -100.0f

    const/4 v2, 0x0

    const/high16 v3, 0x42c80000    # 100.0f

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    return-object v0
.end method

.method private interpColor([IF)I
    .locals 5

    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_0

    const/4 p2, 0x0

    .line 530
    aget p1, p1, p2

    return p1

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_1

    .line 533
    array-length p2, p1

    add-int/lit8 p2, p2, -0x1

    aget p1, p1, p2

    return p1

    .line 535
    :cond_1
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    mul-float p2, p2, v0

    float-to-int v0, p2

    int-to-float v1, v0

    sub-float/2addr p2, v1

    .line 538
    aget v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    .line 539
    aget p1, p1, v0

    .line 540
    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    invoke-direct {p0, v0, v2, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->ave(IIF)I

    move-result v0

    .line 541
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-direct {p0, v2, v3, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->ave(IIF)I

    move-result v2

    .line 542
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-direct {p0, v3, v4, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->ave(IIF)I

    move-result v3

    .line 543
    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-direct {p0, v1, p1, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->ave(IIF)I

    move-result p1

    .line 544
    invoke-static {v0, v2, v3, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    return p1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 504
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_X:I

    .line 505
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_Y:I

    .line 506
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_X:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 507
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_X:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float v1, v1, v2

    sub-float/2addr v0, v1

    .line 508
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_X:I

    int-to-float v2, v1

    int-to-float v1, v1

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 509
    new-instance v1, Landroid/graphics/RectF;

    neg-float v2, v0

    invoke-direct {v1, v2, v2, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 510
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mRedrawHSV:Z

    if-eqz v0, :cond_0

    .line 511
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mCenterPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    .line 512
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mHSVColors:[I

    const/4 v2, 0x1

    aput v0, v1, v2

    .line 513
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mHSVPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->getLinearGradient()Landroid/graphics/LinearGradient;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 514
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, 0x42c80000    # 100.0f

    const/high16 v2, 0x42dc0000    # 110.0f

    const/high16 v3, -0x3d380000    # -100.0f

    const/high16 v4, 0x43020000    # 130.0f

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mHSVPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 551
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_X:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    .line 552
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->CENTER_Y:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    .line 554
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_1

    if-eq p1, v2, :cond_0

    const/4 v3, 0x2

    if-eq p1, v3, :cond_1

    goto :goto_0

    .line 587
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mCenterPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;->colorChanged(I)V

    goto :goto_0

    :cond_1
    float-to-double v3, v1

    float-to-double v0, v0

    .line 577
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p1, v0

    const v0, 0x40c90fda

    div-float/2addr p1, v0

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p1, v0

    .line 582
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mCenterPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mColors:[I

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->interpColor([IF)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 584
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mListener:Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$ColorPickerView;->mCenterPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;->colorChanged(I)V

    :goto_0
    return v2
.end method
