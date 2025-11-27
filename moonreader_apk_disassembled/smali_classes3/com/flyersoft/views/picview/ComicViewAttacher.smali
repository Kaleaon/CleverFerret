.class public Lcom/flyersoft/views/picview/ComicViewAttacher;
.super Ljava/lang/Object;
.source "ComicViewAttacher.java"

# interfaces
.implements Lcom/flyersoft/views/picview/IComicView;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/flyersoft/views/picview/OnGestureListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;,
        Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;,
        Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;,
        Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;,
        Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;,
        Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;,
        Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field static final EDGE_BOTH:I = 0x2

.field static final EDGE_LEFT:I = 0x0

.field static final EDGE_NONE:I = -0x1

.field static final EDGE_RIGHT:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "ComicViewAttacher"

.field static SINGLE_TOUCH:I


# instance fields
.field ZOOM_DURATION:I

.field public doubleTapListener:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;

.field private mAllowParentInterceptOnEdge:Z

.field private final mBaseMatrix:Landroid/graphics/Matrix;

.field private mBaseRotation:F

.field private mBlockParentIntercept:Z

.field private mCurrentFlingRunnable:Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;

.field private final mDisplayRect:Landroid/graphics/RectF;

.field private final mDrawMatrix:Landroid/graphics/Matrix;

.field public mGestureDetector:Landroid/view/GestureDetector;

.field private mImageView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIvBottom:I

.field private mIvLeft:I

.field private mIvRight:I

.field private mIvTop:I

.field private mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private mMatrixChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;

.field private final mMatrixValues:[F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mPhotoTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

.field private mScaleChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;

.field private mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mScrollEdge:I

.field private mSingleFlingListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;

.field private final mSuppMatrix:Landroid/graphics/Matrix;

.field private mViewTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;

.field private mZoomEnabled:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetmInterpolator(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/view/animation/Interpolator;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmLongClickListener(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/view/View$OnLongClickListener;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher;)Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSingleFlingListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmSuppMatrix(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetDrawMatrix(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/graphics/Matrix;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msetImageViewMatrix(Lcom/flyersoft/views/picview/ComicViewAttacher;Landroid/graphics/Matrix;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetDEBUG()Z
    .locals 1

    sget-boolean v0, Lcom/flyersoft/views/picview/ComicViewAttacher;->DEBUG:Z

    return v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 55
    const-string v0, "ComicViewAttacher"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/views/picview/ComicViewAttacher;->DEBUG:Z

    const/4 v0, 0x1

    .line 65
    sput v0, Lcom/flyersoft/views/picview/ComicViewAttacher;->SINGLE_TOUCH:I

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 1

    const/4 v0, 0x1

    .line 155
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;-><init>(Landroid/widget/ImageView;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Z)V
    .locals 2

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mInterpolator:Landroid/view/animation/Interpolator;

    const/16 v0, 0xc8

    .line 58
    iput v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->ZOOM_DURATION:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 67
    iput v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    const/high16 v0, 0x3fe00000    # 1.75f

    .line 68
    iput v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMidScale:F

    const/high16 v0, 0x40400000    # 3.0f

    .line 69
    iput v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    const/4 v0, 0x1

    .line 71
    iput-boolean v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mAllowParentInterceptOnEdge:Z

    const/4 v1, 0x0

    .line 72
    iput-boolean v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBlockParentIntercept:Z

    .line 132
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 133
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 134
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 135
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    const/16 v1, 0x9

    .line 136
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixValues:[F

    const/4 v1, 0x2

    .line 148
    iput v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScrollEdge:I

    .line 152
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 159
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 161
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setDrawingCacheEnabled(Z)V

    .line 162
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 164
    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 169
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 171
    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 176
    :cond_1
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 175
    invoke-static {v0, p0}, Lcom/flyersoft/views/picview/VersionedGestureDetector;->newInstance(Landroid/content/Context;Lcom/flyersoft/views/picview/OnGestureListener;)Lcom/flyersoft/views/picview/GestureDetector;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    .line 178
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/views/picview/ComicViewAttacher$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/views/picview/ComicViewAttacher$1;-><init>(Lcom/flyersoft/views/picview/ComicViewAttacher;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    .line 208
    new-instance p1, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;-><init>(Lcom/flyersoft/views/picview/ComicViewAttacher;)V

    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->doubleTapListener:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;

    .line 209
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    const/4 p1, 0x0

    .line 210
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseRotation:F

    .line 213
    invoke-virtual {p0, p2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setZoomable(Z)V

    return-void
.end method

.method private cancelFling()V
    .locals 1

    .line 705
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mCurrentFlingRunnable:Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;

    if-eqz v0, :cond_0

    .line 706
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->cancelFling()V

    const/4 v0, 0x0

    .line 707
    iput-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mCurrentFlingRunnable:Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;

    :cond_0
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .locals 1

    .line 719
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkMatrixBounds()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 720
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    return-void
.end method

.method private checkImageViewScaleType()V
    .locals 2

    .line 725
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 731
    instance-of v1, v0, Lcom/flyersoft/views/picview/IComicView;

    if-nez v1, :cond_1

    .line 732
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 733
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The ImageView\'s ScaleType has been changed since attaching a ComicViewAttacher. You should call setScaleType on the ComicViewAttacher instead of on the ImageView"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method private checkMatrixBounds()Z
    .locals 12

    .line 740
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 745
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v2

    if-nez v2, :cond_1

    return v1

    .line 750
    :cond_1
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v4

    .line 753
    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x0

    cmpg-float v10, v3, v5

    if-gtz v10, :cond_4

    .line 755
    sget-object v10, Lcom/flyersoft/views/picview/ComicViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    if-eq v10, v8, :cond_3

    if-eq v10, v7, :cond_2

    sub-float/2addr v5, v3

    div-float/2addr v5, v6

    .line 763
    iget v3, v2, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :cond_2
    sub-float/2addr v5, v3

    .line 760
    iget v3, v2, Landroid/graphics/RectF;->top:F

    :goto_0
    sub-float/2addr v5, v3

    goto :goto_2

    .line 757
    :cond_3
    iget v3, v2, Landroid/graphics/RectF;->top:F

    goto :goto_1

    .line 766
    :cond_4
    iget v3, v2, Landroid/graphics/RectF;->top:F

    cmpl-float v3, v3, v9

    if-lez v3, :cond_5

    .line 767
    iget v3, v2, Landroid/graphics/RectF;->top:F

    :goto_1
    neg-float v5, v3

    goto :goto_2

    .line 768
    :cond_5
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    cmpg-float v3, v3, v5

    if-gez v3, :cond_6

    .line 769
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_6
    const/4 v5, 0x0

    .line 772
    :goto_2
    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v0

    int-to-float v0, v0

    const/4 v3, 0x1

    cmpg-float v10, v4, v0

    if-gtz v10, :cond_9

    .line 774
    sget-object v1, Lcom/flyersoft/views/picview/ComicViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v9, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v9

    aget v1, v1, v9

    if-eq v1, v8, :cond_8

    if-eq v1, v7, :cond_7

    sub-float/2addr v0, v4

    div-float/2addr v0, v6

    .line 782
    iget v1, v2, Landroid/graphics/RectF;->left:F

    goto :goto_3

    :cond_7
    sub-float/2addr v0, v4

    .line 779
    iget v1, v2, Landroid/graphics/RectF;->left:F

    :goto_3
    sub-float/2addr v0, v1

    goto :goto_4

    .line 776
    :cond_8
    iget v0, v2, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    :goto_4
    move v9, v0

    .line 785
    iput v8, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScrollEdge:I

    goto :goto_5

    .line 786
    :cond_9
    iget v4, v2, Landroid/graphics/RectF;->left:F

    cmpl-float v4, v4, v9

    if-lez v4, :cond_a

    .line 787
    iput v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScrollEdge:I

    .line 788
    iget v0, v2, Landroid/graphics/RectF;->left:F

    neg-float v9, v0

    goto :goto_5

    .line 789
    :cond_a
    iget v1, v2, Landroid/graphics/RectF;->right:F

    cmpg-float v1, v1, v0

    if-gez v1, :cond_b

    .line 790
    iget v1, v2, Landroid/graphics/RectF;->right:F

    sub-float v9, v0, v1

    .line 791
    iput v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScrollEdge:I

    goto :goto_5

    :cond_b
    const/4 v0, -0x1

    .line 793
    iput v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScrollEdge:I

    .line 797
    :goto_5
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v9, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return v3
.end method

.method private static checkZoomLevels(FFF)V
    .locals 0

    cmpl-float p0, p0, p1

    if-gez p0, :cond_1

    cmpl-float p0, p1, p2

    if-gez p0, :cond_0

    return-void

    .line 80
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Medium zoom has to be less than Maximum zoom. Call setMaximumZoom() with a more appropriate value"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 77
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Minimum zoom has to be less than Medium zoom. Call setMinimumZoom() with a more appropriate value"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .locals 4

    .line 808
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 811
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 813
    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    .line 814
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    const/4 v3, 0x0

    .line 813
    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 815
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 816
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getDrawMatrix()Landroid/graphics/Matrix;
    .locals 2

    .line 699
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 700
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 701
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method private getImageViewHeight(Landroid/widget/ImageView;)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 958
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method private getImageViewWidth(Landroid/widget/ImageView;)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 952
    :cond_0
    invoke-virtual {p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .locals 1

    .line 847
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 848
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixValues:[F

    aget p1, p1, p2

    return p1
.end method

.method private static hasDrawable(Landroid/widget/ImageView;)Z
    .locals 0

    if-eqz p0, :cond_0

    .line 89
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 100
    :cond_0
    sget-object v0, Lcom/flyersoft/views/picview/ComicViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    return v1

    .line 102
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " is not supported in PhotoView"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private resetMatrix()V
    .locals 1

    .line 855
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 856
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseRotation:F

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setRotationBy(F)V

    .line 857
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 858
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkMatrixBounds()Z

    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    .line 862
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 865
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkImageViewScaleType()V

    .line 866
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 869
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;

    if-eqz v0, :cond_0

    .line 870
    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 872
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;

    invoke-interface {v0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    :cond_0
    return-void
.end method

.method private static setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V
    .locals 2

    if-eqz p0, :cond_0

    .line 118
    instance-of v0, p0, Lcom/flyersoft/views/picview/IComicView;

    if-nez v0, :cond_0

    .line 119
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_0
    return-void
.end method

.method private updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V
    .locals 8

    .line 884
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_9

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 889
    :cond_0
    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v1

    int-to-float v1, v1

    .line 890
    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v0

    int-to-float v0, v0

    .line 891
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    .line 892
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    .line 894
    iget-object v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    int-to-float v2, v2

    div-float v3, v1, v2

    int-to-float p1, p1

    div-float v4, v0, p1

    .line 899
    iget-object v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    const/high16 v7, 0x40000000    # 2.0f

    if-ne v5, v6, :cond_1

    .line 900
    iget-object v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sub-float/2addr v1, v2

    div-float/2addr v1, v7

    sub-float/2addr v0, p1

    div-float/2addr v0, v7

    invoke-virtual {v3, v1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_0

    .line 903
    :cond_1
    iget-object v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v5, v6, :cond_2

    .line 904
    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 905
    iget-object v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v3, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 906
    iget-object v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    div-float/2addr v1, v7

    mul-float p1, p1, v3

    sub-float/2addr v0, p1

    div-float/2addr v0, v7

    invoke-virtual {v4, v1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_0

    .line 909
    :cond_2
    iget-object v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v5, v6, :cond_3

    const/high16 v5, 0x3f800000    # 1.0f

    .line 910
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 911
    iget-object v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v3, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 912
    iget-object v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    div-float/2addr v1, v7

    mul-float p1, p1, v3

    sub-float/2addr v0, p1

    div-float/2addr v0, v7

    invoke-virtual {v4, v1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    .line 916
    :cond_3
    new-instance v3, Landroid/graphics/RectF;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4, v2, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 917
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5, v4, v4, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 919
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseRotation:F

    float-to-int v0, v0

    rem-int/lit16 v0, v0, 0xb4

    if-eqz v0, :cond_4

    .line 920
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v4, v4, p1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 923
    :cond_4
    sget-object p1, Lcom/flyersoft/views/picview/ComicViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_8

    const/4 v0, 0x3

    if-eq p1, v0, :cond_7

    const/4 v0, 0x4

    if-eq p1, v0, :cond_6

    const/4 v0, 0x5

    if-eq p1, v0, :cond_5

    goto :goto_0

    .line 938
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p1, v3, v5, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_0

    .line 925
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 926
    invoke-virtual {p1, v3, v5, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_0

    .line 934
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p1, v3, v5, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_0

    .line 930
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p1, v3, v5, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 946
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->resetMatrix()V

    :cond_9
    :goto_1
    return-void
.end method


# virtual methods
.method public canZoom()Z
    .locals 1

    .line 240
    iget-boolean v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mZoomEnabled:Z

    return v0
.end method

.method public cleanup()V
    .locals 4

    .line 251
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    return-void

    .line 255
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 259
    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 260
    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 261
    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 265
    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 268
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->cancelFling()V

    .line 271
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_3

    .line 272
    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 276
    :cond_3
    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;

    .line 277
    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mPhotoTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

    .line 278
    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mViewTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;

    .line 281
    iput-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public getDisplayMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    .line 688
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .locals 1

    .line 286
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkMatrixBounds()Z

    .line 287
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getIPhotoViewImplementation()Lcom/flyersoft/views/picview/IComicView;
    .locals 0

    return-object p0
.end method

.method public getImageMatrix()Landroid/graphics/Matrix;
    .locals 1

    .line 712
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .locals 4

    .line 334
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 335
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 340
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->cleanup()V

    const/4 v1, 0x1

    .line 341
    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "ImageView no longer exists. You should not use this ComicViewAttacher any more."

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_1
    return-object v0
.end method

.method public getMaximumScale()F
    .locals 1

    .line 360
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    return v0
.end method

.method public getMediumScale()F
    .locals 1

    .line 355
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMinimumScale()F
    .locals 1

    .line 350
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    return v0
.end method

.method getOnPhotoTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;
    .locals 1

    .line 588
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mPhotoTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

    return-object v0
.end method

.method getOnViewTapListener()Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;
    .locals 1

    .line 598
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mViewTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;

    return-object v0
.end method

.method public getScale()F
    .locals 6

    .line 365
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v4, 0x3

    invoke-direct {p0, v1, v4}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    float-to-double v4, v1

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    .line 370
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getSuppMatrix(Landroid/graphics/Matrix;)V
    .locals 1

    .line 695
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 823
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 824
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public onDrag(FF)V
    .locals 6

    .line 375
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    invoke-interface {v0}, Lcom/flyersoft/views/picview/GestureDetector;->isScaling()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 379
    :cond_0
    sget-boolean v0, Lcom/flyersoft/views/picview/ComicViewAttacher;->DEBUG:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    .line 381
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    new-array v5, v1, [Ljava/lang/Object;

    aput-object v0, v5, v2

    aput-object v4, v5, v3

    const-string v0, "onDrag: dx: %.2f. dy: %.2f"

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v0, v4, v2

    .line 380
    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 384
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 385
    iget-object v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 386
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkAndDisplayMatrix()V

    .line 397
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    .line 398
    iget-boolean v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    invoke-interface {v0}, Lcom/flyersoft/views/picview/GestureDetector;->isScaling()Z

    move-result v0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBlockParentIntercept:Z

    if-nez v0, :cond_4

    .line 399
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScrollEdge:I

    if-eq v0, v1, :cond_3

    if-nez v0, :cond_2

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v1

    if-gez v1, :cond_3

    :cond_2
    if-ne v0, v3, :cond_5

    const/high16 v0, -0x40800000    # -1.0f

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_5

    :cond_3
    if-eqz p2, :cond_5

    .line 403
    invoke-interface {p2, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return-void

    :cond_4
    if-eqz p2, :cond_5

    .line 408
    invoke-interface {p2, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_5
    :goto_0
    return-void
.end method

.method public onFling(FFFF)V
    .locals 2

    .line 416
    sget-boolean v0, Lcom/flyersoft/views/picview/ComicViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 417
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onFling. sX: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, " sY: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, " Vx: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, " Vy: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p2, v0

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 421
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    .line 422
    new-instance p2, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;-><init>(Lcom/flyersoft/views/picview/ComicViewAttacher;Landroid/content/Context;)V

    iput-object p2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mCurrentFlingRunnable:Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;

    .line 423
    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v0

    .line 424
    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v1

    float-to-int p3, p3

    float-to-int p4, p4

    .line 423
    invoke-virtual {p2, v0, v1, p3, p4}, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->fling(IIII)V

    .line 425
    iget-object p2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mCurrentFlingRunnable:Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onGlobalLayout()V
    .locals 6

    .line 430
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 433
    iget-boolean v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_1

    .line 434
    invoke-virtual {v0}, Landroid/widget/ImageView;->getTop()I

    move-result v1

    .line 435
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v2

    .line 436
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v3

    .line 437
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLeft()I

    move-result v4

    .line 446
    iget v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvTop:I

    if-ne v1, v5, :cond_0

    iget v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvBottom:I

    if-ne v3, v5, :cond_0

    iget v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvLeft:I

    if-ne v4, v5, :cond_0

    iget v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvRight:I

    if-eq v2, v5, :cond_2

    .line 449
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 452
    iput v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvTop:I

    .line 453
    iput v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvRight:I

    .line 454
    iput v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvBottom:I

    .line 455
    iput v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mIvLeft:I

    return-void

    .line 458
    :cond_1
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    return-void
.end method

.method public onScale(FFF)V
    .locals 5

    .line 465
    sget-boolean v0, Lcom/flyersoft/views/picview/ComicViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 468
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v1, 0x2

    aput-object v2, v3, v1

    .line 467
    const-string v1, "onScale: scale: %.2f. fX: %.2f. fY: %.2f"

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v1, v0, v4

    .line 466
    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 471
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_1

    cmpg-float v0, p1, v2

    if-gez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_3

    cmpl-float v0, p1, v2

    if-lez v0, :cond_2

    goto :goto_0

    :cond_2
    return-void

    .line 472
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;

    if-eqz v0, :cond_4

    .line 473
    invoke-interface {v0, p1, p2, p3}, Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;->onScaleChange(FFF)V

    .line 475
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 476
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10

    .line 485
    iget-boolean v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mZoomEnabled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 486
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 487
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-eq v2, v3, :cond_1

    const/4 v0, 0x3

    if-eq v2, v0, :cond_1

    :cond_0
    move-object v5, p0

    goto :goto_1

    .line 506
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v0

    iget v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    .line 507
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 509
    new-instance v4, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v6

    iget v7, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    .line 510
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;-><init>(Lcom/flyersoft/views/picview/ComicViewAttacher;FFFF)V

    .line 509
    invoke-virtual {p1, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    const/4 p1, 0x1

    goto :goto_2

    :cond_2
    move-object v5, p0

    if-eqz v0, :cond_3

    .line 492
    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0

    .line 494
    :cond_3
    new-array p1, v3, [Ljava/lang/Object;

    const-string v0, "onTouch getParent() returned null"

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 499
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->cancelFling()V

    :goto_1
    const/4 p1, 0x0

    .line 518
    :goto_2
    iget-object v0, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    if-eqz v0, :cond_7

    .line 519
    invoke-interface {v0}, Lcom/flyersoft/views/picview/GestureDetector;->isScaling()Z

    move-result p1

    .line 520
    iget-object v0, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    invoke-interface {v0}, Lcom/flyersoft/views/picview/GestureDetector;->isDragging()Z

    move-result v0

    .line 522
    iget-object v2, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    invoke-interface {v2, p2}, Lcom/flyersoft/views/picview/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    if-nez p1, :cond_4

    .line 524
    iget-object p1, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    invoke-interface {p1}, Lcom/flyersoft/views/picview/GestureDetector;->isScaling()Z

    move-result p1

    if-nez p1, :cond_4

    const/4 p1, 0x1

    goto :goto_3

    :cond_4
    const/4 p1, 0x0

    :goto_3
    if-nez v0, :cond_5

    .line 525
    iget-object v0, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleDragDetector:Lcom/flyersoft/views/picview/GestureDetector;

    invoke-interface {v0}, Lcom/flyersoft/views/picview/GestureDetector;->isDragging()Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x1

    goto :goto_4

    :cond_5
    const/4 v0, 0x0

    :goto_4
    if-eqz p1, :cond_6

    if-eqz v0, :cond_6

    const/4 v1, 0x1

    .line 527
    :cond_6
    iput-boolean v1, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBlockParentIntercept:Z

    move p1, v2

    .line 531
    :cond_7
    iget-object v0, v5, Lcom/flyersoft/views/picview/ComicViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_8

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p2

    if-eqz p2, :cond_8

    return v3

    :cond_8
    return p1

    :cond_9
    move-object v5, p0

    return v1
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 0

    .line 542
    iput-boolean p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mAllowParentInterceptOnEdge:Z

    return-void
.end method

.method public setBaseRotation(F)V
    .locals 1

    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    .line 313
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseRotation:F

    .line 314
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    .line 315
    iget p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mBaseRotation:F

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setRotationBy(F)V

    .line 316
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .locals 2

    if-eqz p1, :cond_2

    .line 296
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 301
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    .line 305
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 306
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 307
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkMatrixBounds()Z

    const/4 p1, 0x1

    return p1

    .line 293
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Matrix cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMaximumScale(F)V
    .locals 2

    .line 559
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkZoomLevels(FFF)V

    .line 560
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    return-void
.end method

.method public setMediumScale(F)V
    .locals 2

    .line 553
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkZoomLevels(FFF)V

    .line 554
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMidScale:F

    return-void
.end method

.method public setMinimumScale(F)V
    .locals 2

    .line 547
    iget v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMidScale:F

    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkZoomLevels(FFF)V

    .line 548
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 221
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    return-void

    .line 223
    :cond_0
    new-instance p1, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;-><init>(Lcom/flyersoft/views/picview/ComicViewAttacher;)V

    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->doubleTapListener:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;

    .line 224
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 573
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public setOnMatrixChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;)V
    .locals 0

    .line 578
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMatrixChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnMatrixChangedListener;

    return-void
.end method

.method public setOnPhotoTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;)V
    .locals 0

    .line 583
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mPhotoTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnPhotoTapListener;

    return-void
.end method

.method public setOnScaleChangeListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;)V
    .locals 0

    .line 230
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleChangeListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnScaleChangeListener;

    return-void
.end method

.method public setOnSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;)V
    .locals 0

    .line 235
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSingleFlingListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;

    return-void
.end method

.method public setOnViewTapListener(Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;)V
    .locals 0

    .line 593
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mViewTapListener:Lcom/flyersoft/views/picview/ComicViewAttacher$OnViewTapListener;

    return-void
.end method

.method public setRotationBy(F)V
    .locals 2

    .line 327
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 328
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method public setRotationTo(F)V
    .locals 2

    .line 321
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 322
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method public setScale(F)V
    .locals 1

    const/4 v0, 0x0

    .line 603
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FZ)V

    return-void
.end method

.method public setScale(FFFZ)V
    .locals 8

    .line 621
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 625
    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    cmpg-float v1, p1, v1

    if-ltz v1, :cond_2

    iget v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    cmpl-float v1, p1, v1

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_1

    .line 632
    new-instance v2, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v4

    move-object v3, p0

    move v5, p1

    move v6, p2

    move v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;-><init>(Lcom/flyersoft/views/picview/ComicViewAttacher;FFFF)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1
    move-object v3, p0

    move v5, p1

    move v6, p2

    move v7, p3

    .line 635
    iget-object p1, v3, Lcom/flyersoft/views/picview/ComicViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v5, v5, v6, v7}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 636
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkAndDisplayMatrix()V

    return-void

    :cond_2
    :goto_0
    move-object v3, p0

    const/4 p1, 0x1

    .line 626
    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "Scale must be within the range of minScale and maxScale"

    const/4 p3, 0x0

    aput-object p2, p1, p3

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void

    :cond_3
    move-object v3, p0

    return-void
.end method

.method public setScale(FZ)V
    .locals 2

    .line 608
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 612
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 613
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    .line 611
    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setScale(FFFZ)V

    :cond_0
    return-void
.end method

.method public setScaleLevels(FFF)V
    .locals 0

    .line 565
    invoke-static {p1, p2, p3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->checkZoomLevels(FFF)V

    .line 566
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMinScale:F

    .line 567
    iput p2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMidScale:F

    .line 568
    iput p3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mMaxScale:F

    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    .line 651
    invoke-static {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_0

    .line 652
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 655
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    :cond_0
    return-void
.end method

.method public setZoomInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 0

    .line 646
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .locals 0

    if-gez p1, :cond_0

    const/16 p1, 0xc8

    .line 831
    :cond_0
    iput p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->ZOOM_DURATION:I

    return-void
.end method

.method public setZoomable(Z)V
    .locals 0

    .line 661
    iput-boolean p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mZoomEnabled:Z

    .line 662
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->update()V

    return-void
.end method

.method public update()V
    .locals 2

    .line 666
    invoke-virtual {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 669
    iget-boolean v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_0

    .line 671
    invoke-static {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 674
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 677
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->resetMatrix()V

    :cond_1
    return-void
.end method
