.class public Lcom/facebook/drawee/view/DraweeTransition;
.super Landroid/transition/Transition;
.source "DraweeTransition.java"


# static fields
.field private static final PROPNAME_BOUNDS:Ljava/lang/String; = "draweeTransition:bounds"


# instance fields
.field private final mFromFocusPoint:Landroid/graphics/PointF;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mFromScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

.field private final mToFocusPoint:Landroid/graphics/PointF;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mToScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;


# direct methods
.method static bridge synthetic -$$Nest$fgetmToFocusPoint(Lcom/facebook/drawee/view/DraweeTransition;)Landroid/graphics/PointF;
    .locals 0

    iget-object p0, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToFocusPoint:Landroid/graphics/PointF;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmToScale(Lcom/facebook/drawee/view/DraweeTransition;)Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;
    .locals 0

    iget-object p0, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V
    .locals 1

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/facebook/drawee/view/DraweeTransition;-><init>(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 0
    .param p3    # Landroid/graphics/PointF;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/graphics/PointF;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 64
    invoke-direct {p0}, Landroid/transition/Transition;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/facebook/drawee/view/DraweeTransition;->mFromScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    .line 66
    iput-object p2, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    .line 67
    iput-object p3, p0, Lcom/facebook/drawee/view/DraweeTransition;->mFromFocusPoint:Landroid/graphics/PointF;

    .line 68
    iput-object p4, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToFocusPoint:Landroid/graphics/PointF;

    return-void
.end method

.method private captureValues(Landroid/transition/TransitionValues;)V
    .locals 4

    .line 129
    iget-object v0, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    instance-of v0, v0, Lcom/facebook/drawee/view/GenericDraweeView;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p1, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    .line 132
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object p1, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    const/4 v3, 0x0

    invoke-direct {v1, v3, v3, v2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 130
    const-string p1, "draweeTransition:bounds"

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static createTransitionSet(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)Landroid/transition/TransitionSet;
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-static {p0, p1, v0, v0}, Lcom/facebook/drawee/view/DraweeTransition;->createTransitionSet(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/transition/TransitionSet;

    move-result-object p0

    return-object p0
.end method

.method public static createTransitionSet(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/transition/TransitionSet;
    .locals 2
    .param p2    # Landroid/graphics/PointF;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/PointF;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    new-instance v0, Landroid/transition/TransitionSet;

    invoke-direct {v0}, Landroid/transition/TransitionSet;-><init>()V

    .line 54
    new-instance v1, Landroid/transition/ChangeBounds;

    invoke-direct {v1}, Landroid/transition/ChangeBounds;-><init>()V

    invoke-virtual {v0, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    .line 55
    new-instance v1, Lcom/facebook/drawee/view/DraweeTransition;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/facebook/drawee/view/DraweeTransition;-><init>(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    invoke-virtual {v0, v1}, Landroid/transition/TransitionSet;->addTransition(Landroid/transition/Transition;)Landroid/transition/TransitionSet;

    return-object v0
.end method


# virtual methods
.method public captureEndValues(Landroid/transition/TransitionValues;)V
    .locals 0

    .line 82
    invoke-direct {p0, p1}, Lcom/facebook/drawee/view/DraweeTransition;->captureValues(Landroid/transition/TransitionValues;)V

    return-void
.end method

.method public captureStartValues(Landroid/transition/TransitionValues;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lcom/facebook/drawee/view/DraweeTransition;->captureValues(Landroid/transition/TransitionValues;)V

    return-void
.end method

.method public createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 9
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 p1, 0x0

    if-eqz p2, :cond_3

    if-nez p3, :cond_0

    goto :goto_0

    .line 91
    :cond_0
    iget-object v0, p2, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    const-string v1, "draweeTransition:bounds"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/graphics/Rect;

    .line 92
    iget-object p3, p3, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v6, p3

    check-cast v6, Landroid/graphics/Rect;

    if-eqz v5, :cond_3

    if-nez v6, :cond_1

    goto :goto_0

    .line 96
    :cond_1
    iget-object p3, p0, Lcom/facebook/drawee/view/DraweeTransition;->mFromScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    iget-object v0, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    if-ne p3, v0, :cond_2

    iget-object p3, p0, Lcom/facebook/drawee/view/DraweeTransition;->mFromFocusPoint:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToFocusPoint:Landroid/graphics/PointF;

    if-ne p3, v0, :cond_2

    return-object p1

    .line 99
    :cond_2
    iget-object p1, p2, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    check-cast p1, Lcom/facebook/drawee/view/GenericDraweeView;

    .line 100
    new-instance v2, Lcom/facebook/drawee/drawable/ScalingUtils$InterpolatingScaleType;

    iget-object v3, p0, Lcom/facebook/drawee/view/DraweeTransition;->mFromScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    iget-object v4, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToScale:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    iget-object v7, p0, Lcom/facebook/drawee/view/DraweeTransition;->mFromFocusPoint:Landroid/graphics/PointF;

    iget-object v8, p0, Lcom/facebook/drawee/view/DraweeTransition;->mToFocusPoint:Landroid/graphics/PointF;

    invoke-direct/range {v2 .. v8}, Lcom/facebook/drawee/drawable/ScalingUtils$InterpolatingScaleType;-><init>(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 103
    invoke-virtual {p1}, Lcom/facebook/drawee/view/GenericDraweeView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object p2

    check-cast p2, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {p2, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    const/4 p2, 0x2

    .line 105
    new-array p2, p2, [F

    fill-array-data p2, :array_0

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    .line 106
    new-instance p3, Lcom/facebook/drawee/view/DraweeTransition$1;

    invoke-direct {p3, p0, v2}, Lcom/facebook/drawee/view/DraweeTransition$1;-><init>(Lcom/facebook/drawee/view/DraweeTransition;Lcom/facebook/drawee/drawable/ScalingUtils$InterpolatingScaleType;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 114
    new-instance p3, Lcom/facebook/drawee/view/DraweeTransition$2;

    invoke-direct {p3, p0, p1}, Lcom/facebook/drawee/view/DraweeTransition$2;-><init>(Lcom/facebook/drawee/view/DraweeTransition;Lcom/facebook/drawee/view/GenericDraweeView;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-object p2

    :cond_3
    :goto_0
    return-object p1

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
