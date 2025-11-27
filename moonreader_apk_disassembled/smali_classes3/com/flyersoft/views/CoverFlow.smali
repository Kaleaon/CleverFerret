.class public Lcom/flyersoft/views/CoverFlow;
.super Landroid/widget/Gallery;
.source "CoverFlow.java"


# instance fields
.field private imageHeight:F

.field private imageReflectionRatio:F

.field private imageWidth:F

.field private final mCamera:Landroid/graphics/Camera;

.field private mCoveflowCenter:I

.field private mMaxRotationAngle:I

.field private mMaxZoom:I

.field private reflectionGap:F

.field touchTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Landroid/widget/Gallery;-><init>(Landroid/content/Context;)V

    .line 18
    new-instance p1, Landroid/graphics/Camera;

    invoke-direct {p1}, Landroid/graphics/Camera;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    const/16 p1, 0x3c

    .line 19
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    const/16 p1, -0x78

    .line 20
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->mMaxZoom:I

    const/4 p1, 0x1

    .line 52
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/CoverFlow;->setStaticTransformationsEnabled(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x1010070

    .line 55
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/views/CoverFlow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 58
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Gallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    new-instance p3, Landroid/graphics/Camera;

    invoke-direct {p3}, Landroid/graphics/Camera;-><init>()V

    iput-object p3, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    const/16 p3, 0x3c

    .line 19
    iput p3, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    const/16 p3, -0x78

    .line 20
    iput p3, p0, Lcom/flyersoft/views/CoverFlow;->mMaxZoom:I

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/CoverFlow;->parseAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 60
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/CoverFlow;->setStaticTransformationsEnabled(Z)V

    return-void
.end method

.method private getCenterOfCoverflow()I
    .locals 2

    .line 83
    invoke-virtual {p0}, Lcom/flyersoft/views/CoverFlow;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/flyersoft/views/CoverFlow;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/flyersoft/views/CoverFlow;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Lcom/flyersoft/views/CoverFlow;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static getCenterOfView(Landroid/view/View;)I
    .locals 1

    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    div-int/lit8 p0, p0, 0x2

    add-int/2addr v0, p0

    return v0
.end method

.method private parseAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 148
    sget-object v0, Lcom/flyersoft/moonreaderp/R$styleable;->CoverFlow:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 150
    :try_start_0
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->CoverFlow_imageWidth:I

    const/high16 v0, 0x43f00000    # 480.0f

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/CoverFlow;->imageWidth:F

    .line 151
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->CoverFlow_imageHeight:I

    const/high16 v0, 0x43a00000    # 320.0f

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/CoverFlow;->imageHeight:F

    .line 152
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->CoverFlow_imageReflectionRatio:I

    const v0, 0x3e4ccccd    # 0.2f

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/CoverFlow;->imageReflectionRatio:F

    .line 153
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->CoverFlow_reflectionGap:I

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/CoverFlow;->reflectionGap:F

    const/16 p2, -0xf

    .line 154
    invoke-virtual {p0, p2}, Lcom/flyersoft/views/CoverFlow;->setSpacing(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 157
    throw p2
.end method

.method private transformImageBitmap(Landroid/widget/ImageView;Landroid/view/animation/Transformation;I)V
    .locals 9

    .line 125
    iget-object v0, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v0}, Landroid/graphics/Camera;->save()V

    .line 126
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    .line 128
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 130
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 131
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 133
    iget-object v2, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    const/high16 v3, 0x42c80000    # 100.0f

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v4, v3}, Landroid/graphics/Camera;->translate(FFF)V

    .line 136
    iget v2, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    if-ge v1, v2, :cond_0

    .line 137
    iget v2, p0, Lcom/flyersoft/views/CoverFlow;->mMaxZoom:I

    int-to-double v2, v2

    int-to-double v5, v1

    const-wide/high16 v7, 0x3ff8000000000000L    # 1.5

    mul-double v5, v5, v7

    add-double/2addr v2, v5

    double-to-float v1, v2

    .line 138
    iget-object v2, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v2, v4, v4, v1}, Landroid/graphics/Camera;->translate(FFF)V

    .line 141
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    int-to-float p3, p3

    invoke-virtual {v1, p3}, Landroid/graphics/Camera;->rotateY(F)V

    .line 142
    iget-object p3, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {p3, p2}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    int-to-float p1, p1

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p1, p3

    neg-float v1, p1

    int-to-float v0, v0

    div-float/2addr v0, p3

    neg-float p3, v0

    .line 143
    invoke-virtual {p2, v1, p3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 144
    invoke-virtual {p2, p1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 145
    iget-object p1, p0, Lcom/flyersoft/views/CoverFlow;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {p1}, Landroid/graphics/Camera;->restore()V

    return-void
.end method


# virtual methods
.method protected getChildStaticTransformation(Landroid/view/View;Landroid/view/animation/Transformation;)Z
    .locals 4

    .line 97
    invoke-static {p1}, Lcom/flyersoft/views/CoverFlow;->getCenterOfView(Landroid/view/View;)I

    move-result v0

    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 101
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->clear()V

    const/4 v2, 0x2

    .line 102
    invoke-virtual {p2, v2}, Landroid/view/animation/Transformation;->setTransformationType(I)V

    .line 104
    iget v2, p0, Lcom/flyersoft/views/CoverFlow;->mCoveflowCenter:I

    if-ne v0, v2, :cond_0

    .line 105
    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/flyersoft/views/CoverFlow;->transformImageBitmap(Landroid/widget/ImageView;Landroid/view/animation/Transformation;I)V

    goto :goto_1

    :cond_0
    sub-int/2addr v2, v0

    int-to-float v0, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 107
    iget v1, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 108
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    if-le v1, v2, :cond_2

    if-gez v0, :cond_1

    neg-int v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    .line 111
    :cond_2
    :goto_0
    move-object v1, p1

    check-cast v1, Landroid/widget/ImageView;

    invoke-direct {p0, v1, p2, v0}, Lcom/flyersoft/views/CoverFlow;->transformImageBitmap(Landroid/widget/ImageView;Landroid/view/animation/Transformation;I)V

    .line 114
    :goto_1
    iget-wide v0, p0, Lcom/flyersoft/views/CoverFlow;->touchTime:J

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-eqz p2, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/views/CoverFlow;->touchTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0xbb8

    cmp-long p2, v0, v2

    if-gez p2, :cond_4

    .line 115
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    :cond_4
    const/4 p1, 0x1

    return p1
.end method

.method public getImageHeight()F
    .locals 1

    .line 27
    iget v0, p0, Lcom/flyersoft/views/CoverFlow;->imageHeight:F

    return v0
.end method

.method public getImageReflectionRatio()F
    .locals 1

    .line 48
    iget v0, p0, Lcom/flyersoft/views/CoverFlow;->imageReflectionRatio:F

    return v0
.end method

.method public getImageWidth()F
    .locals 1

    .line 33
    iget v0, p0, Lcom/flyersoft/views/CoverFlow;->imageWidth:F

    return v0
.end method

.method public getMaxRotationAngle()I
    .locals 1

    .line 63
    iget v0, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    return v0
.end method

.method public getMaxZoom()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/flyersoft/views/CoverFlow;->mMaxZoom:I

    return v0
.end method

.method public getReflectionGap()F
    .locals 1

    .line 39
    iget v0, p0, Lcom/flyersoft/views/CoverFlow;->reflectionGap:F

    return v0
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    .line 121
    invoke-direct {p0}, Lcom/flyersoft/views/CoverFlow;->getCenterOfCoverflow()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/CoverFlow;->mCoveflowCenter:I

    .line 122
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Gallery;->onSizeChanged(IIII)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 92
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/views/CoverFlow;->touchTime:J

    .line 93
    invoke-super {p0, p1}, Landroid/widget/Gallery;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setImageHeight(F)V
    .locals 0

    .line 30
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->imageHeight:F

    return-void
.end method

.method public setImageReflectionRatio(F)V
    .locals 0

    .line 45
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->imageReflectionRatio:F

    return-void
.end method

.method public setImageWidth(F)V
    .locals 0

    .line 36
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->imageWidth:F

    return-void
.end method

.method public setMaxRotationAngle(I)V
    .locals 0

    .line 74
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->mMaxRotationAngle:I

    return-void
.end method

.method public setMaxZoom(I)V
    .locals 0

    .line 80
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->mMaxZoom:I

    return-void
.end method

.method public setReflectionGap(F)V
    .locals 0

    .line 42
    iput p1, p0, Lcom/flyersoft/views/CoverFlow;->reflectionGap:F

    return-void
.end method
