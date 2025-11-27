.class public Lcom/flyersoft/views/ProgressViews/ProgressWheel;
.super Landroid/view/View;
.source "ProgressWheel.java"


# instance fields
.field private barColor:I

.field private barLength:I

.field private barPaint:Landroid/graphics/Paint;

.field public barPaint2:Landroid/graphics/Paint;

.field private barWidth:I

.field private circleBounds:Landroid/graphics/RectF;

.field private circleColor:I

.field private circleInnerContour:Landroid/graphics/RectF;

.field private circleOuterContour:Landroid/graphics/RectF;

.field private circlePaint:Landroid/graphics/Paint;

.field private circleRadius:I

.field private contourColor:I

.field private contourPaint:Landroid/graphics/Paint;

.field private contourSize:F

.field private delayMillis:I

.field private fullRadius:I

.field private innerCircleBounds:Landroid/graphics/RectF;

.field isSpinning:Z

.field private layoutHeight:I

.field private layoutWidth:I

.field private paddingBottom:I

.field private paddingLeft:I

.field private paddingRight:I

.field private paddingTop:I

.field private progress:F

.field private rimColor:I

.field private rimPaint:Landroid/graphics/Paint;

.field private rimWidth:I

.field private spinSpeed:F

.field private splitText:[Ljava/lang/String;

.field private text:Ljava/lang/String;

.field private textColor:I

.field private textPaint:Landroid/graphics/Paint;

.field private textSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 74
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutHeight:I

    .line 25
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutWidth:I

    const/16 v1, 0x64

    .line 26
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->fullRadius:I

    const/16 v1, 0x50

    .line 27
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleRadius:I

    const/16 v1, 0x3c

    .line 28
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barLength:I

    const/16 v1, 0x14

    .line 29
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    .line 30
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    .line 31
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textSize:I

    const/4 v1, 0x0

    .line 32
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    const/4 v2, 0x5

    .line 35
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingTop:I

    .line 36
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingBottom:I

    .line 37
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingLeft:I

    .line 38
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    const/high16 v2, -0x56000000

    .line 41
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barColor:I

    .line 42
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourColor:I

    .line 43
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleColor:I

    const v2, -0x55222223

    .line 44
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimColor:I

    const/high16 v2, -0x1000000

    .line 45
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textColor:I

    .line 48
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    .line 49
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint2:Landroid/graphics/Paint;

    .line 50
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circlePaint:Landroid/graphics/Paint;

    .line 51
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    .line 52
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    .line 53
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    .line 56
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->innerCircleBounds:Landroid/graphics/RectF;

    .line 57
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 58
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleOuterContour:Landroid/graphics/RectF;

    .line 59
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleInnerContour:Landroid/graphics/RectF;

    const/high16 v2, 0x40000000    # 2.0f

    .line 63
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->spinSpeed:F

    const/16 v2, 0xa

    .line 65
    iput v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->delayMillis:I

    .line 66
    iput v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    .line 67
    iput-boolean v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    .line 70
    const-string v1, ""

    iput-object v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->text:Ljava/lang/String;

    .line 71
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->splitText:[Ljava/lang/String;

    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x40a00000    # 5.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    return-void
.end method

.method private scheduleRedraw()V
    .locals 2

    .line 265
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->spinSpeed:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    const/high16 v1, 0x43b40000    # 360.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 267
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    .line 269
    :cond_0
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->delayMillis:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->postInvalidateDelayed(J)V

    return-void
.end method

.method private setupBounds()V
    .locals 9

    .line 187
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutWidth:I

    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutHeight:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 190
    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutWidth:I

    sub-int/2addr v1, v0

    .line 191
    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutHeight:I

    sub-int/2addr v2, v0

    .line 194
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingTop()I

    move-result v0

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingTop:I

    .line 195
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingBottom()I

    move-result v0

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingBottom:I

    .line 196
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingLeft()I

    move-result v0

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingLeft:I

    .line 197
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingRight()I

    move-result v0

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    .line 199
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getWidth()I

    move-result v0

    .line 200
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getHeight()I

    move-result v1

    .line 202
    new-instance v2, Landroid/graphics/RectF;

    iget v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingLeft:I

    int-to-float v3, v3

    iget v4, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    int-to-float v5, v4

    const/high16 v6, 0x3fc00000    # 1.5f

    mul-float v5, v5, v6

    add-float/2addr v3, v5

    iget v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingTop:I

    int-to-float v5, v5

    int-to-float v7, v4

    mul-float v7, v7, v6

    add-float/2addr v5, v7

    iget v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    sub-int v7, v0, v7

    int-to-float v7, v7

    int-to-float v8, v4

    mul-float v8, v8, v6

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingBottom:I

    sub-int v8, v1, v8

    int-to-float v8, v8

    int-to-float v4, v4

    mul-float v4, v4, v6

    sub-float/2addr v8, v4

    invoke-direct {v2, v3, v5, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->innerCircleBounds:Landroid/graphics/RectF;

    .line 207
    new-instance v2, Landroid/graphics/RectF;

    iget v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingLeft:I

    iget v4, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingTop:I

    add-int/2addr v5, v4

    int-to-float v5, v5

    iget v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    sub-int v6, v0, v6

    sub-int/2addr v6, v4

    int-to-float v6, v6

    iget v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingBottom:I

    sub-int/2addr v1, v7

    sub-int/2addr v1, v4

    int-to-float v1, v1

    invoke-direct {v2, v3, v5, v6, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 212
    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    iget v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v5, v5

    div-float/2addr v5, v4

    add-float/2addr v3, v5

    iget v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v5, v4

    add-float/2addr v3, v5

    iget-object v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v6, v6

    div-float/2addr v6, v4

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v6, v4

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    iget v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v7, v7

    div-float/2addr v7, v4

    sub-float/2addr v6, v7

    iget v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v7, v4

    sub-float/2addr v6, v7

    invoke-direct {v1, v2, v3, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleInnerContour:Landroid/graphics/RectF;

    .line 217
    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v3, v3

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v5, v5

    div-float/2addr v5, v4

    sub-float/2addr v3, v5

    iget v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v5, v4

    sub-float/2addr v3, v5

    iget-object v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v6, v6

    div-float/2addr v6, v4

    add-float/2addr v5, v6

    iget v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v6, v4

    add-float/2addr v5, v6

    iget-object v6, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    iget v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v7, v7

    div-float/2addr v7, v4

    add-float/2addr v6, v7

    iget v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    div-float/2addr v7, v4

    add-float/2addr v6, v7

    invoke-direct {v1, v2, v3, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleOuterContour:Landroid/graphics/RectF;

    .line 223
    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->fullRadius:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    .line 224
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleRadius:I

    return-void
.end method

.method private setupPaints()V
    .locals 3

    .line 154
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 155
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 156
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 157
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 158
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint2:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 159
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint2:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 160
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint2:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 162
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 163
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 164
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 165
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 167
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circlePaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 168
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circlePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 169
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circlePaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 171
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 172
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 173
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 174
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 176
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 177
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 178
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 179
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method public getBarColor()I
    .locals 1

    .line 420
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barColor:I

    return v0
.end method

.method public getBarLength()I
    .locals 1

    .line 355
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barLength:I

    return v0
.end method

.method public getBarWidth()I
    .locals 1

    .line 363
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    return v0
.end method

.method public getCircleColor()I
    .locals 1

    .line 432
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleColor:I

    return v0
.end method

.method public getCircleRadius()I
    .locals 1

    .line 347
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleRadius:I

    return v0
.end method

.method public getContourColor()I
    .locals 1

    .line 504
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourColor:I

    return v0
.end method

.method public getContourSize()F
    .locals 1

    .line 516
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    return v0
.end method

.method public getDelayMillis()I
    .locals 1

    .line 496
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->delayMillis:I

    return v0
.end method

.method public getPaddingBottom()I
    .locals 1

    .line 396
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingBottom:I

    return v0
.end method

.method public getPaddingLeft()I
    .locals 1

    .line 404
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingLeft:I

    return v0
.end method

.method public getPaddingRight()I
    .locals 1

    .line 412
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    return v0
.end method

.method public getPaddingTop()I
    .locals 1

    .line 388
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingTop:I

    return v0
.end method

.method public getProgress()I
    .locals 1

    .line 527
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    float-to-int v0, v0

    return v0
.end method

.method public getRimColor()I
    .locals 1

    .line 444
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimColor:I

    return v0
.end method

.method public getRimShader()Landroid/graphics/Shader;
    .locals 1

    .line 456
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v0

    return-object v0
.end method

.method public getRimWidth()I
    .locals 1

    .line 484
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    return v0
.end method

.method public getSpinSpeed()F
    .locals 1

    .line 476
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->spinSpeed:F

    return v0
.end method

.method public getTextColor()I
    .locals 1

    .line 464
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textColor:I

    return v0
.end method

.method public getTextSize()I
    .locals 1

    .line 376
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textSize:I

    return v0
.end method

.method public incrementProgress()V
    .locals 1

    const/4 v0, 0x1

    .line 310
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->incrementProgress(I)V

    return-void
.end method

.method public incrementProgress(I)V
    .locals 2

    const/4 v0, 0x0

    .line 314
    iput-boolean v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    .line 315
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    int-to-float p1, p1

    add-float/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    const/high16 p1, 0x43b40000    # 360.0f

    cmpl-float v1, v0, p1

    if-lez v1, :cond_0

    rem-float/2addr v0, p1

    .line 317
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    .line 318
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->postInvalidate()V

    return-void
.end method

.method public isSpinning()Z
    .locals 1

    .line 276
    iget-boolean v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 232
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 234
    iget-object v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->innerCircleBounds:Landroid/graphics/RectF;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circlePaint:Landroid/graphics/Paint;

    const/high16 v2, 0x43b40000    # 360.0f

    const/high16 v3, 0x43b40000    # 360.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    move-object v6, v0

    .line 236
    iget-object v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    const/high16 v8, 0x43b40000    # 360.0f

    const/high16 v9, 0x43b40000    # 360.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 237
    iget-object v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleOuterContour:Landroid/graphics/RectF;

    iget-object v11, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 240
    iget-boolean p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    if-eqz p1, :cond_0

    .line 241
    iget-object v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    const/high16 v0, 0x42b40000    # 90.0f

    sub-float v8, p1, v0

    iget p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barLength:I

    int-to-float v9, p1

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 242
    iget p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barLength:I

    const/16 v1, 0x168

    if-ne p1, v1, :cond_1

    .line 243
    iget-object v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    sub-float v8, p1, v0

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    int-to-float v9, p1

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint2:Landroid/graphics/Paint;

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_0

    .line 245
    :cond_0
    iget-object v7, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    iget v9, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    const/high16 v8, -0x3d4c0000    # -90.0f

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 248
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->descent()F

    move-result p1

    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->ascent()F

    move-result v0

    sub-float/2addr p1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    .line 249
    iget-object v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->descent()F

    move-result v1

    sub-float/2addr p1, v1

    .line 251
    iget-object v1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->splitText:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 252
    iget-object v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    div-float/2addr v5, v0

    .line 255
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    sub-float/2addr v7, v5

    .line 256
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    add-float/2addr v5, p1

    iget-object v8, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    .line 253
    invoke-virtual {v6, v4, v7, v5, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 259
    :cond_2
    iget-boolean p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    if-eqz p1, :cond_3

    .line 260
    invoke-direct {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->scheduleRedraw()V

    :cond_3
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 89
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 96
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getMeasuredWidth()I

    move-result v0

    .line 97
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getMeasuredHeight()I

    move-result v1

    .line 98
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    .line 99
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    .line 107
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    .line 108
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    if-le v0, v1, :cond_1

    move v0, v1

    goto :goto_0

    .line 116
    :cond_0
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 130
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingLeft()I

    move-result p1

    add-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingRight()I

    move-result p2

    add-int/2addr p1, p2

    .line 131
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingTop()I

    move-result p2

    add-int/2addr v0, p2

    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->getPaddingBottom()I

    move-result p2

    add-int/2addr v0, p2

    .line 129
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->setMeasuredDimension(II)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 141
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 142
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutWidth:I

    .line 143
    iput p2, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->layoutHeight:I

    .line 144
    invoke-direct {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->setupBounds()V

    .line 145
    invoke-direct {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->setupPaints()V

    .line 146
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->invalidate()V

    return-void
.end method

.method public resetCount()V
    .locals 1

    const/4 v0, 0x0

    .line 283
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    .line 284
    const-string v0, "0%"

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->setText(Ljava/lang/String;)V

    .line 285
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->invalidate()V

    return-void
.end method

.method public setBarColor(I)V
    .locals 1

    .line 424
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barColor:I

    .line 426
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 427
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setBarLength(I)V
    .locals 0

    .line 359
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barLength:I

    return-void
.end method

.method public setBarWidth(I)V
    .locals 1

    .line 367
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    .line 369
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    int-to-float p1, p1

    .line 370
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 371
    iget-object p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barPaint2:Landroid/graphics/Paint;

    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->barWidth:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_0
    return-void
.end method

.method public setCircleColor(I)V
    .locals 1

    .line 436
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleColor:I

    .line 438
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circlePaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 439
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setCircleRadius(I)V
    .locals 0

    .line 351
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->circleRadius:I

    return-void
.end method

.method public setContourColor(I)V
    .locals 1

    .line 508
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourColor:I

    .line 510
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 511
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setContourSize(F)V
    .locals 1

    .line 520
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourSize:F

    .line 522
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->contourPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 523
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_0
    return-void
.end method

.method public setDelayMillis(I)V
    .locals 0

    .line 500
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->delayMillis:I

    return-void
.end method

.method public setPaddingBottom(I)V
    .locals 0

    .line 400
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingBottom:I

    return-void
.end method

.method public setPaddingLeft(I)V
    .locals 0

    .line 408
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingLeft:I

    return-void
.end method

.method public setPaddingRight(I)V
    .locals 0

    .line 416
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingRight:I

    return-void
.end method

.method public setPaddingTop(I)V
    .locals 0

    .line 392
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->paddingTop:I

    return-void
.end method

.method public setProgress(I)V
    .locals 1

    const/4 v0, 0x0

    .line 326
    iput-boolean v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    int-to-float p1, p1

    .line 327
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    .line 328
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->postInvalidate()V

    return-void
.end method

.method public setRimColor(I)V
    .locals 1

    .line 448
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimColor:I

    .line 450
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 451
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setRimShader(Landroid/graphics/Shader;)V
    .locals 1

    .line 460
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void
.end method

.method public setRimWidth(I)V
    .locals 1

    .line 488
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimWidth:I

    .line 490
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    int-to-float p1, p1

    .line 491
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_0
    return-void
.end method

.method public setSpinSpeed(F)V
    .locals 0

    .line 480
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->spinSpeed:F

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1

    .line 342
    iput-object p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->text:Ljava/lang/String;

    .line 343
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->splitText:[Ljava/lang/String;

    return-void
.end method

.method public setTextColor(I)V
    .locals 1

    .line 468
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textColor:I

    .line 470
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 471
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    return-void
.end method

.method public setTextSize(I)V
    .locals 1

    .line 380
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textSize:I

    .line 382
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->textPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    int-to-float p1, p1

    .line 383
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_0
    return-void
.end method

.method public startSpinning()V
    .locals 1

    const/4 v0, 0x1

    .line 302
    iput-boolean v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    .line 303
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->postInvalidate()V

    return-void
.end method

.method public stopSpinning()V
    .locals 1

    const/4 v0, 0x0

    .line 292
    iput-boolean v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->isSpinning:Z

    const/4 v0, 0x0

    .line 293
    iput v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->progress:F

    .line 294
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressWheel;->postInvalidate()V

    return-void
.end method
