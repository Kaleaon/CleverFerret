.class public Lcom/flyersoft/views/picview/ComicView;
.super Landroid/widget/ImageView;
.source "ComicView.java"

# interfaces
.implements Lcom/flyersoft/views/picview/IComicView;


# instance fields
.field public backgroundColor:Ljava/lang/Integer;

.field public drawBackground:Z

.field public mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

.field private mPendingScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/picview/ComicView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/views/picview/ComicView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 51
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 74
    iput-boolean p1, p0, Lcom/flyersoft/views/picview/ComicView;->drawBackground:Z

    .line 52
    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 53
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->init()V

    return-void
.end method


# virtual methods
.method public canZoom()Z
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->canZoom()Z

    move-result v0

    return v0
.end method

.method public getDisplayMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getIPhotoViewImplementation()Lcom/flyersoft/views/picview/IComicView;
    .locals 1

    .line 282
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    return-object v0
.end method

.method public getImageMatrix()Landroid/graphics/Matrix;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getMaximumScale()F
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMediumScale()F
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getScale()F
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getVisibleRectangleBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_1

    .line 58
    :cond_0
    new-instance v0, Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_2

    .line 62
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/picview/ComicView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    :cond_2
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 309
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->init()V

    .line 310
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->cleanup()V

    const/4 v0, 0x0

    .line 303
    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    .line 304
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 80
    :try_start_0
    iget-boolean v0, p0, Lcom/flyersoft/views/picview/ComicView;->drawBackground:Z

    if-eqz v0, :cond_2

    .line 81
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 82
    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicView;->backgroundColor:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    if-eqz v1, :cond_1

    const/4 v1, -0x1

    goto :goto_0

    :cond_1
    const/high16 v1, -0x1000000

    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 83
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 85
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 98
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_0
    nop

    .line 89
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 91
    :try_start_1
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x3

    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x3

    invoke-static {p1, v0, v1, v2}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/ComicView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    .line 94
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    return-void
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setAllowParentInterceptOnEdge(Z)V

    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setDisplayMatrix(Landroid/graphics/Matrix;)Z

    move-result p1

    return p1
.end method

.method protected setFrame(IIII)Z
    .locals 0

    .line 214
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->setFrame(IIII)Z

    move-result p1

    .line 215
    iget-object p2, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-eqz p2, :cond_0

    .line 216
    invoke-virtual {p2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    :cond_0
    return p1
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 190
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 191
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-eqz p1, :cond_0

    .line 192
    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    :cond_0
    return-void
.end method

.method public setImageResource(I)V
    .locals 0

    .line 198
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 199
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-eqz p1, :cond_0

    .line 200
    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    :cond_0
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 0

    .line 206
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 207
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-eqz p1, :cond_0

    .line 208
    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    :cond_0
    return-void
.end method

.method public setMaximumScale(F)V
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setMaximumScale(F)V

    return-void
.end method

.method public setMediumScale(F)V
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setMediumScale(F)V

    return-void
.end method

.method public setMinimumScale(F)V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setMinimumScale(F)V

    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1

    .line 287
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setOnMatrixChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnMatrixChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;)V

    return-void
.end method

.method public setOnPhotoTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;)V
    .locals 1

    .line 233
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnPhotoTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;)V

    return-void
.end method

.method public setOnScaleChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;)V
    .locals 1

    .line 292
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnScaleChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;)V

    return-void
.end method

.method public setOnSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;)V
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;)V

    return-void
.end method

.method public setOnViewTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;)V
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setOnViewTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;)V

    return-void
.end method

.method public setRotationBy(F)V
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setRotationBy(F)V

    return-void
.end method

.method public setRotationTo(F)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setRotationTo(F)V

    return-void
.end method

.method public setScale(F)V
    .locals 1

    .line 243
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(F)V

    return-void
.end method

.method public setScale(FFFZ)V
    .locals 1

    .line 253
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FFFZ)V

    return-void
.end method

.method public setScale(FZ)V
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FZ)V

    return-void
.end method

.method public setScaleLevels(FFF)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScaleLevels(FFF)V

    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-eqz v0, :cond_0

    .line 259
    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void

    .line 261
    :cond_0
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setZoomTransitionDuration(I)V

    return-void
.end method

.method public setZoomable(Z)V
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setZoomable(Z)V

    return-void
.end method
