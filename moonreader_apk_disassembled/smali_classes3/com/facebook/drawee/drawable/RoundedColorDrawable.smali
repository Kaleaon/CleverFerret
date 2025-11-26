.class public Lcom/facebook/drawee/drawable/RoundedColorDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedColorDrawable.java"

# interfaces
.implements Lcom/facebook/drawee/drawable/Rounded;


# instance fields
.field private mAlpha:I

.field private mBorderColor:I

.field final mBorderPath:Landroid/graphics/Path;

.field final mBorderRadii:[F

.field private mBorderWidth:F

.field private mColor:I

.field mInsideBorderRadii:[F
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mIsCircle:Z

.field private mPadding:F

.field final mPaint:Landroid/graphics/Paint;

.field private mPaintFilterBitmap:Z

.field final mPath:Landroid/graphics/Path;

.field private final mRadii:[F

.field private mScaleDownInsideBorders:Z

.field private final mTempRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(FI)V
    .locals 0

    .line 81
    invoke-direct {p0, p2}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;-><init>(I)V

    .line 82
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->setRadius(F)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 48
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/16 v0, 0x8

    .line 27
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    .line 28
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderRadii:[F

    .line 30
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mIsCircle:Z

    const/4 v1, 0x0

    .line 32
    iput v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    .line 33
    iput v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPadding:F

    .line 34
    iput v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderColor:I

    .line 35
    iput-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mScaleDownInsideBorders:Z

    .line 36
    iput-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaintFilterBitmap:Z

    .line 37
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPath:Landroid/graphics/Path;

    .line 38
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderPath:Landroid/graphics/Path;

    .line 39
    iput v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mColor:I

    .line 40
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    const/16 v0, 0xff

    .line 41
    iput v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    .line 49
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->setColor(I)V

    return-void
.end method

.method public constructor <init>([FI)V
    .locals 0

    .line 70
    invoke-direct {p0, p2}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;-><init>(I)V

    .line 71
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->setRadii([F)V

    return-void
.end method

.method public static fromColorDrawable(Landroid/graphics/drawable/ColorDrawable;)Lcom/facebook/drawee/drawable/RoundedColorDrawable;
    .locals 1

    .line 59
    new-instance v0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p0

    invoke-direct {v0, p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;-><init>(I)V

    return-object v0
.end method

.method private updatePath()V
    .locals 7

    .line 319
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 320
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 321
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 323
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float v3, v1, v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 324
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mIsCircle:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    div-float/2addr v0, v2

    .line 326
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v4, v5, v0, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 328
    :goto_0
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderRadii:[F

    array-length v4, v3

    if-ge v0, v4, :cond_1

    .line 329
    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    aget v4, v4, v0

    iget v5, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPadding:F

    add-float/2addr v4, v5

    iget v5, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    div-float/2addr v5, v2

    sub-float/2addr v4, v5

    aput v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 331
    :cond_1
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v4, v3, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 333
    :goto_1
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    neg-float v4, v3

    div-float/2addr v4, v2

    neg-float v3, v3

    div-float/2addr v3, v2

    invoke-virtual {v0, v4, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 335
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPadding:F

    iget-boolean v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mScaleDownInsideBorders:Z

    if-eqz v3, :cond_2

    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    :goto_2
    add-float/2addr v0, v3

    .line 336
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 337
    iget-boolean v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mIsCircle:Z

    if-eqz v3, :cond_3

    .line 338
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    div-float/2addr v1, v2

    .line 339
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v3, v4, v1, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    goto :goto_4

    .line 340
    :cond_3
    iget-boolean v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mScaleDownInsideBorders:Z

    if-eqz v2, :cond_6

    .line 341
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mInsideBorderRadii:[F

    if-nez v2, :cond_4

    const/16 v2, 0x8

    .line 342
    new-array v2, v2, [F

    iput-object v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mInsideBorderRadii:[F

    .line 344
    :cond_4
    :goto_3
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mInsideBorderRadii:[F

    array-length v3, v2

    if-ge v1, v3, :cond_5

    .line 345
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    aget v3, v3, v1

    iget v4, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    sub-float/2addr v3, v4

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 347
    :cond_5
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v3, v2, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    goto :goto_4

    .line 349
    :cond_6
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 351
    :goto_4
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mTempRect:Landroid/graphics/RectF;

    neg-float v0, v0

    invoke-virtual {v1, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mColor:I

    iget v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    invoke-static {v1, v2}, Lcom/facebook/drawee/drawable/DrawableUtils;->multiplyColorAlpha(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 94
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 95
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->getPaintFilterBitmap()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 96
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 97
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderColor:I

    iget v2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    invoke-static {v1, v2}, Lcom/facebook/drawee/drawable/DrawableUtils;->multiplyColorAlpha(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 99
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 100
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 101
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public getAlpha()I
    .locals 1

    .line 295
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    return v0
.end method

.method public getBorderColor()I
    .locals 1

    .line 204
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderColor:I

    return v0
.end method

.method public getBorderWidth()F
    .locals 1

    .line 210
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    return v0
.end method

.method public getColor()I
    .locals 1

    .line 178
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mColor:I

    return v0
.end method

.method public getOpacity()I
    .locals 2

    .line 315
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mColor:I

    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    invoke-static {v0, v1}, Lcom/facebook/drawee/drawable/DrawableUtils;->multiplyColorAlpha(II)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/drawee/drawable/DrawableUtils;->getOpacityFromColor(I)I

    move-result v0

    return v0
.end method

.method public getPadding()F
    .locals 1

    .line 225
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPadding:F

    return v0
.end method

.method public getPaintFilterBitmap()Z
    .locals 1

    .line 267
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaintFilterBitmap:Z

    return v0
.end method

.method public getRadii()[F
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    return-object v0
.end method

.method public getScaleDownInsideBorders()Z
    .locals 1

    .line 245
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mScaleDownInsideBorders:Z

    return v0
.end method

.method public isCircle()Z
    .locals 1

    .line 120
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mIsCircle:Z

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 87
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 88
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 282
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    if-eq p1, v0, :cond_0

    .line 283
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mAlpha:I

    .line 284
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setBorder(IF)V
    .locals 1

    .line 189
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderColor:I

    if-eq v0, p1, :cond_0

    .line 190
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderColor:I

    .line 191
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    .line 194
    :cond_0
    iget p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_1

    .line 195
    iput p2, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mBorderWidth:F

    .line 196
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    .line 197
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    :cond_1
    return-void
.end method

.method public setCircle(Z)V
    .locals 0

    .line 112
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mIsCircle:Z

    .line 113
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    .line 114
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    return-void
.end method

.method public setColor(I)V
    .locals 1

    .line 166
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mColor:I

    if-eq v0, p1, :cond_0

    .line 167
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mColor:I

    .line 168
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method

.method public setPadding(F)V
    .locals 1

    .line 215
    iget v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPadding:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 216
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPadding:F

    .line 217
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    .line 218
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setPaintFilterBitmap(Z)V
    .locals 1

    .line 258
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaintFilterBitmap:Z

    if-eq v0, p1, :cond_0

    .line 259
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mPaintFilterBitmap:Z

    .line 260
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setRadii([F)V
    .locals 4

    if-nez p1, :cond_0

    .line 132
    iget-object p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([FF)V

    goto :goto_1

    .line 134
    :cond_0
    array-length v0, p1

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    const-string v3, "radii should have exactly 8 values"

    invoke-static {v0, v3}, Lcom/facebook/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 135
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 137
    :goto_1
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    .line 138
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    return-void
.end method

.method public setRadius(F)V
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 154
    :goto_0
    const-string v1, "radius should be non negative"

    invoke-static {v0, v1}, Lcom/facebook/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 155
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mRadii:[F

    invoke-static {v0, p1}, Ljava/util/Arrays;->fill([FF)V

    .line 156
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    .line 157
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    return-void
.end method

.method public setRepeatEdgePixels(Z)V
    .locals 0

    return-void
.end method

.method public setScaleDownInsideBorders(Z)V
    .locals 1

    .line 235
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mScaleDownInsideBorders:Z

    if-eq v0, p1, :cond_0

    .line 236
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->mScaleDownInsideBorders:Z

    .line 237
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->updatePath()V

    .line 238
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedColorDrawable;->invalidateSelf()V

    :cond_0
    return-void
.end method
