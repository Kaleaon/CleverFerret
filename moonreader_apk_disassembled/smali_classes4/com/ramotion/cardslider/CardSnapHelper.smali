.class public Lcom/ramotion/cardslider/CardSnapHelper;
.super Landroidx/recyclerview/widget/LinearSnapHelper;
.source "CardSnapHelper.java"


# instance fields
.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroidx/recyclerview/widget/LinearSnapHelper;-><init>()V

    return-void
.end method


# virtual methods
.method public attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 40
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearSnapHelper;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    if-eqz p1, :cond_1

    .line 42
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v0, v0, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 43
    :cond_0
    new-instance p1, Ljava/security/InvalidParameterException;

    const-string v0, "LayoutManager must be instance of CardSliderLayoutManager"

    invoke-direct {p1, v0}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 46
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/ramotion/cardslider/CardSnapHelper;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroid/view/View;)[I
    .locals 7

    .line 108
    check-cast p1, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    .line 109
    invoke-virtual {p1, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v0

    .line 110
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardLeft()I

    move-result v1

    .line 111
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardLeft()I

    move-result v2

    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardWidth()I

    move-result v3

    const/4 v4, 0x2

    div-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 112
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardLeft()I

    move-result v3

    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardWidth()I

    move-result v5

    add-int/2addr v3, v5

    .line 114
    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v5, v4, v5

    const/4 v6, 0x1

    aput v5, v4, v6

    if-ge v0, v2, :cond_1

    .line 116
    invoke-virtual {p1, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result p2

    .line 117
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v2

    if-eq p2, v2, :cond_0

    sub-int/2addr v2, p2

    neg-int p2, v2

    .line 119
    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardWidth()I

    move-result p1

    mul-int p2, p2, p1

    aput p2, v4, v5

    goto :goto_0

    :cond_0
    sub-int/2addr v0, v1

    .line 121
    aput v0, v4, v5

    goto :goto_0

    :cond_1
    sub-int/2addr v0, v3

    add-int/2addr v0, v6

    .line 124
    aput v0, v4, v5

    .line 127
    :goto_0
    aget p1, v4, v5

    if-eqz p1, :cond_2

    .line 128
    iget-object p2, p0, Lcom/ramotion/cardslider/CardSnapHelper;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {p2, p1, v5, v0}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollBy(IILandroid/view/animation/Interpolator;)V

    .line 131
    :cond_2
    filled-new-array {v5, v5}, [I

    move-result-object p1

    return-object p1
.end method

.method protected createSnapScroller(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/LinearSmoothScroller;
    .locals 1

    .line 137
    check-cast p1, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    iget-object v0, p0, Lcom/ramotion/cardslider/CardSnapHelper;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getSmoothScroller(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/LinearSmoothScroller;

    move-result-object p1

    return-object p1
.end method

.method public findSnapView(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroid/view/View;
    .locals 0

    .line 101
    check-cast p1, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getTopView()Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public findTargetSnapPosition(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;II)I
    .locals 4

    .line 51
    move-object v0, p1

    check-cast v0, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    .line 53
    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result v1

    const/4 v2, -0x1

    if-nez v1, :cond_0

    return v2

    .line 58
    :cond_0
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;

    add-int/lit8 v3, v1, -0x1

    .line 61
    invoke-interface {p1, v3}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object p1

    if-nez p1, :cond_1

    return v2

    .line 66
    :cond_1
    invoke-virtual {p0, p2, p3}, Lcom/ramotion/cardslider/CardSnapHelper;->calculateScrollDistance(II)[I

    move-result-object p2

    const/4 p3, 0x0

    aget p2, p2, p3

    if-lez p2, :cond_2

    .line 70
    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardWidth()I

    move-result p3

    div-int/2addr p2, p3

    int-to-double p2, p2

    invoke-static {p2, p3}, Ljava/lang/Math;->floor(D)D

    move-result-wide p2

    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getCardWidth()I

    move-result p3

    div-int/2addr p2, p3

    int-to-double p2, p2

    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p2

    :goto_0
    double-to-int p2, p2

    .line 75
    invoke-static {p2}, Ljava/lang/Integer;->signum(I)I

    move-result p3

    const/4 v3, 0x3

    .line 76
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    mul-int p3, p3, p2

    .line 78
    iget p1, p1, Landroid/graphics/PointF;->x:F

    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_3

    neg-int p3, p3

    :cond_3
    if-nez p3, :cond_4

    return v2

    .line 86
    :cond_4
    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result p1

    if-ne p1, v2, :cond_5

    return v2

    :cond_5
    add-int/2addr p1, p3

    if-ltz p1, :cond_7

    if-lt p1, v1, :cond_6

    goto :goto_1

    :cond_6
    return p1

    :cond_7
    :goto_1
    return v2
.end method
