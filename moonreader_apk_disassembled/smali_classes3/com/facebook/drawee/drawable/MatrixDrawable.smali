.class public Lcom/facebook/drawee/drawable/MatrixDrawable;
.super Lcom/facebook/drawee/drawable/ForwardingDrawable;
.source "MatrixDrawable.java"


# instance fields
.field private mDrawMatrix:Landroid/graphics/Matrix;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mMatrix:Landroid/graphics/Matrix;

.field private mUnderlyingHeight:I

.field private mUnderlyingWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;)V
    .locals 0

    .line 41
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    .line 31
    iput p1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingWidth:I

    .line 32
    iput p1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingHeight:I

    .line 42
    iput-object p2, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method private configureBounds()V
    .locals 4

    .line 108
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    .line 114
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    iput v2, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingWidth:I

    .line 115
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    iput v3, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingHeight:I

    if-lez v2, :cond_2

    if-gtz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 124
    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 125
    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    iput-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    return-void

    .line 121
    :cond_2
    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    const/4 v0, 0x0

    .line 122
    iput-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method private configureBoundsIfUnderlyingChanged()V
    .locals 3

    .line 95
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 100
    :cond_0
    iget v1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingWidth:I

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mUnderlyingHeight:I

    .line 101
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    if-eq v1, v0, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    .line 102
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 75
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBoundsIfUnderlyingChanged()V

    .line 76
    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 78
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 79
    iget-object v1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 80
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 81
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    .line 84
    :cond_0
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getTransform(Landroid/graphics/Matrix;)V
    .locals 1

    .line 132
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->getTransform(Landroid/graphics/Matrix;)V

    .line 133
    iget-object v0, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mDrawMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_0

    .line 134
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    :cond_0
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 90
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 91
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    return-void
.end method

.method public setCurrent(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 47
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->setCurrent(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 48
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    return-object p1
.end method

.method public setMatrix(Landroid/graphics/Matrix;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/facebook/drawee/drawable/MatrixDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 69
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->configureBounds()V

    .line 70
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/MatrixDrawable;->invalidateSelf()V

    return-void
.end method
