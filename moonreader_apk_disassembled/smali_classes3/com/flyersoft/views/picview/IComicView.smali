.class public interface abstract Lcom/flyersoft/views/picview/IComicView;
.super Ljava/lang/Object;
.source "IComicView.java"


# static fields
.field public static final DEFAULT_MAX_SCALE:F = 3.0f

.field public static final DEFAULT_MID_SCALE:F = 1.75f

.field public static final DEFAULT_MIN_SCALE:F = 1.0f

.field public static final DEFAULT_ZOOM_DURATION:I = 0xc8


# virtual methods
.method public abstract canZoom()Z
.end method

.method public abstract getDisplayMatrix(Landroid/graphics/Matrix;)V
.end method

.method public abstract getDisplayRect()Landroid/graphics/RectF;
.end method

.method public abstract getIPhotoViewImplementation()Lcom/flyersoft/views/picview/IComicView;
.end method

.method public abstract getMaximumScale()F
.end method

.method public abstract getMediumScale()F
.end method

.method public abstract getMinimumScale()F
.end method

.method public abstract getScale()F
.end method

.method public abstract getScaleType()Landroid/widget/ImageView$ScaleType;
.end method

.method public abstract getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
.end method

.method public abstract setAllowParentInterceptOnEdge(Z)V
.end method

.method public abstract setDisplayMatrix(Landroid/graphics/Matrix;)Z
.end method

.method public abstract setMaximumScale(F)V
.end method

.method public abstract setMediumScale(F)V
.end method

.method public abstract setMinimumScale(F)V
.end method

.method public abstract setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
.end method

.method public abstract setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
.end method

.method public abstract setOnMatrixChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;)V
.end method

.method public abstract setOnPhotoTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;)V
.end method

.method public abstract setOnScaleChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;)V
.end method

.method public abstract setOnSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;)V
.end method

.method public abstract setOnViewTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;)V
.end method

.method public abstract setRotationBy(F)V
.end method

.method public abstract setRotationTo(F)V
.end method

.method public abstract setScale(F)V
.end method

.method public abstract setScale(FFFZ)V
.end method

.method public abstract setScale(FZ)V
.end method

.method public abstract setScaleLevels(FFF)V
.end method

.method public abstract setScaleType(Landroid/widget/ImageView$ScaleType;)V
.end method

.method public abstract setZoomTransitionDuration(I)V
.end method

.method public abstract setZoomable(Z)V
.end method
