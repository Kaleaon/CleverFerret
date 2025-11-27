.class public Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;
.super Ljava/lang/Object;
.source "DefaultOnDoubleTapListener.java"

# interfaces
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;
    }
.end annotation


# instance fields
.field onSingleTap:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;

.field private photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/picview/ComicViewAttacher;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->setPhotoViewAttacher(Lcom/flyersoft/views/picview/ComicViewAttacher;)V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 85
    iget-object v0, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 v1, 0x1

    .line 89
    :try_start_0
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v0

    .line 90
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 91
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 93
    iget-object v3, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMediumScale()F

    move-result v3

    cmpg-float v3, v0, v3

    if-gez v3, :cond_1

    .line 94
    iget-object v0, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMediumScale()F

    move-result v3

    invoke-virtual {v0, v3, v2, p1, v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FFFZ)V

    goto :goto_0

    .line 95
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMediumScale()F

    move-result v3

    cmpl-float v3, v0, v3

    if-ltz v3, :cond_2

    iget-object v3, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMaximumScale()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_2

    .line 96
    iget-object v0, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMaximumScale()F

    move-result v3

    invoke-virtual {v0, v3, v2, p1, v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FFFZ)V

    goto :goto_0

    .line 98
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getMinimumScale()F

    move-result v3

    invoke-virtual {v0, v3, v2, p1, v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FFFZ)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_0
    return v1
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 47
    iget-object v0, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->onSingleTap:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;

    if-eqz v0, :cond_0

    .line 48
    invoke-interface {v0, p1}, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;->onTap(Landroid/view/MotionEvent;)V

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 53
    :cond_1
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 55
    iget-object v2, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getOnPhotoTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 56
    iget-object v2, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 59
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 62
    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 64
    iget p1, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, p1

    .line 65
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result p1

    div-float/2addr v3, p1

    .line 66
    iget p1, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, p1

    .line 67
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result p1

    div-float/2addr v4, p1

    .line 69
    iget-object p1, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getOnPhotoTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

    move-result-object p1

    invoke-interface {p1, v0, v3, v4}, Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;->onPhotoTap(Landroid/view/View;FF)V

    const/4 p1, 0x1

    return p1

    .line 72
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getOnPhotoTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

    move-result-object v2

    invoke-interface {v2}, Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;->onOutsidePhotoTap()V

    .line 76
    :cond_3
    iget-object v2, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getOnViewTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 77
    iget-object v2, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getOnViewTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v2, v0, v3, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;->onViewTap(Landroid/view/View;FF)V

    :cond_4
    return v1
.end method

.method public setOnSingleTap(Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->onSingleTap:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;

    return-void
.end method

.method public setPhotoViewAttacher(Lcom/flyersoft/views/picview/ComicViewAttacher;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->photoViewAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    return-void
.end method
