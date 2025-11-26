.class public Lcom/ramotion/cardslider/CardSliderLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
.source "CardSliderLayoutManager.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;,
        Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;
    }
.end annotation


# static fields
.field private static final DEFAULT_ACTIVE_CARD_LEFT_OFFSET:I = 0x32

.field private static final DEFAULT_CARDS_GAP:I = 0xc

.field private static final DEFAULT_CARD_WIDTH:I = 0x94

.field private static final LEFT_CARD_COUNT:I = 0x2


# instance fields
.field private activeCardCenter:I

.field private activeCardLeft:I

.field private activeCardRight:I

.field private cardWidth:I

.field private cardsGap:F

.field private final cardsXCoords:Landroid/util/SparseIntArray;

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private scrollRequestedPosition:I

.field private final viewCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private viewUpdater:Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;


# direct methods
.method static bridge synthetic -$$Nest$fgetactiveCardLeft(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I
    .locals 0

    iget p0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetactiveCardRight(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I
    .locals 0

    iget p0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetcardWidth(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I
    .locals 0

    iget p0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    return p0
.end method

.method static bridge synthetic -$$Nest$mupdateViewScale(Lcom/ramotion/cardslider/CardSliderLayoutManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->updateViewScale()V

    return-void
.end method

.method public constructor <init>(IIF)V
    .locals 1

    .line 162
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;-><init>()V

    .line 38
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    .line 39
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    const/4 v0, 0x0

    .line 48
    iput v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    const/4 v0, 0x0

    .line 163
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->initialize(IIFLcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 117
    invoke-direct {p0, p1, v0, v1, v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 4

    .line 125
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;-><init>()V

    .line 38
    new-instance p3, Landroid/util/SparseArray;

    invoke-direct {p3}, Landroid/util/SparseArray;-><init>()V

    iput-object p3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    .line 39
    new-instance p3, Landroid/util/SparseIntArray;

    invoke-direct {p3}, Landroid/util/SparseIntArray;-><init>()V

    iput-object p3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    const/4 p3, 0x0

    .line 48
    iput p3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    .line 126
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    invoke-virtual {p4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p4

    iget p4, p4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x43140000    # 148.0f

    mul-float v0, v0, p4

    float-to-int v0, v0

    const/high16 v1, 0x42480000    # 50.0f

    mul-float v1, v1, p4

    float-to-int v1, v1

    const/high16 v2, 0x41400000    # 12.0f

    mul-float p4, p4, v2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    .line 133
    invoke-direct {p0, v1, v0, p4, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->initialize(IIFLcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;)V

    return-void

    .line 140
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    sget-object v3, Lcom/flyersoft/moonreaderp/R$styleable;->CardSlider:[I

    invoke-virtual {v2, p2, v3, p3, p3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p3

    .line 142
    :try_start_0
    sget v2, Lcom/flyersoft/moonreaderp/R$styleable;->CardSlider_cardWidth:I

    invoke-virtual {p3, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    .line 143
    sget v2, Lcom/flyersoft/moonreaderp/R$styleable;->CardSlider_activeCardLeftOffset:I

    invoke-virtual {p3, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 144
    sget v2, Lcom/flyersoft/moonreaderp/R$styleable;->CardSlider_cardsGap:I

    invoke-virtual {p3, v2, p4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p4

    .line 145
    sget v2, Lcom/flyersoft/moonreaderp/R$styleable;->CardSlider_viewUpdater:I

    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    .line 150
    invoke-direct {p0, p1, v2, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->loadViewUpdater(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;

    move-result-object p1

    .line 151
    invoke-direct {p0, v1, v0, p4, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->initialize(IIFLcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;)V

    return-void

    :catchall_0
    move-exception p1

    .line 147
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    .line 148
    throw p1
.end method

.method private fill(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 6

    .line 628
    iget-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 630
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 631
    invoke-virtual {p0, v2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 632
    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 633
    iget-object v5, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v5, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 636
    :cond_0
    iget-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_1

    .line 637
    iget-object v3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->detachView(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 640
    :cond_1
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result p3

    if-nez p3, :cond_2

    .line 641
    invoke-direct {p0, p1, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->fillLeft(ILandroidx/recyclerview/widget/RecyclerView$Recycler;)V

    .line 642
    invoke-direct {p0, p1, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->fillRight(ILandroidx/recyclerview/widget/RecyclerView$Recycler;)V

    .line 645
    :cond_2
    iget-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    :goto_2
    if-ge v1, p1, :cond_3

    .line 646
    iget-object p3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {p3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleView(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method private fillLeft(ILandroidx/recyclerview/widget/RecyclerView$Recycler;)V
    .locals 10

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    goto :goto_2

    .line 655
    :cond_0
    iget v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    div-int/lit8 v1, v1, 0x2

    add-int/lit8 v2, p1, -0x3

    const/4 v3, 0x0

    .line 656
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    sub-int v4, p1, v2

    rsub-int/lit8 v4, v4, 0x2

    .line 657
    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int v0, v0, v1

    move v6, v0

    :goto_0
    if-ge v2, p1, :cond_2

    .line 660
    iget-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_1

    .line 662
    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->attachView(Landroid/view/View;)V

    .line 663
    iget-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 665
    :cond_1
    invoke-virtual {p2, v2}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v5

    .line 666
    invoke-virtual {p0, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->addView(Landroid/view/View;)V

    .line 667
    invoke-virtual {p0, v5, v3, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 668
    invoke-virtual {p0, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v9

    .line 669
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    add-int v8, v6, v0

    const/4 v7, 0x0

    move-object v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    :goto_1
    add-int/2addr v6, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    return-void
.end method

.method private fillRight(ILandroidx/recyclerview/widget/RecyclerView$Recycler;)V
    .locals 11

    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    :cond_0
    move-object v4, p0

    goto :goto_3

    .line 683
    :cond_1
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getWidth()I

    move-result v0

    .line 684
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result v1

    .line 687
    iget v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    const/4 v3, 0x1

    move v6, v2

    const/4 v2, 0x1

    :goto_0
    if-eqz v2, :cond_0

    if-ge p1, v1, :cond_0

    .line 691
    iget-object v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const/4 v10, 0x0

    if-eqz v2, :cond_2

    .line 693
    invoke-virtual {p0, v2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->attachView(Landroid/view/View;)V

    .line 694
    iget-object v4, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewCache:Landroid/util/SparseArray;

    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->remove(I)V

    move-object v4, p0

    goto :goto_1

    .line 696
    :cond_2
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v5

    .line 697
    invoke-virtual {p0, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->addView(Landroid/view/View;)V

    .line 698
    invoke-virtual {p0, v5, v10, v10}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 699
    invoke-virtual {p0, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v9

    .line 700
    iget v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    add-int v8, v6, v2

    const/4 v7, 0x0

    move-object v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    move-object v2, v5

    .line 703
    :goto_1
    invoke-virtual {p0, v2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v6

    .line 704
    iget v2, v4, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    add-int/2addr v2, v0

    if-ge v6, v2, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :goto_3
    return-void
.end method

.method private getAllowedLeftDelta(Landroid/view/View;II)I
    .locals 1

    .line 600
    invoke-virtual {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p1

    sub-int v0, p1, p2

    if-le v0, p3, :cond_0

    neg-int p1, p2

    return p1

    :cond_0
    sub-int/2addr p3, p1

    return p3
.end method

.method private getAllowedRightDelta(Landroid/view/View;II)I
    .locals 1

    .line 609
    invoke-virtual {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p1

    .line 610
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    add-int/2addr v0, p1

    if-ge v0, p3, :cond_0

    return p2

    :cond_0
    sub-int/2addr p1, p3

    return p1
.end method

.method private initialize(IIFLcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;)V
    .locals 0

    .line 167
    iput p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    .line 168
    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    add-int/2addr p2, p1

    .line 169
    iput p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    sub-int/2addr p2, p1

    .line 170
    div-int/lit8 p2, p2, 0x2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardCenter:I

    .line 171
    iput p3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsGap:F

    .line 173
    iput-object p4, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewUpdater:Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;

    if-nez p4, :cond_0

    .line 175
    new-instance p1, Lcom/ramotion/cardslider/DefaultViewUpdater;

    invoke-direct {p1}, Lcom/ramotion/cardslider/DefaultViewUpdater;-><init>()V

    iput-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewUpdater:Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;

    .line 177
    :cond_0
    iget-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewUpdater:Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;

    invoke-interface {p1, p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;->onLayoutManagerInitialized(Lcom/ramotion/cardslider/CardSliderLayoutManager;)V

    return-void
.end method

.method private layoutByCoords()V
    .locals 8

    .line 618
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    iget-object v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 620
    invoke-virtual {p0, v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 621
    iget-object v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v4

    .line 622
    iget v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    add-int v6, v4, v2

    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v7

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move-object v2, p0

    .line 624
    iget-object v0, v2, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    return-void
.end method

.method private loadViewUpdater(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;
    .locals 5

    .line 457
    const-string v0, ": Could not instantiate the ViewUpdater: "

    const/4 v1, 0x0

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 462
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_1

    .line 463
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 464
    :cond_1
    const-string v2, "."

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v2, p2

    goto :goto_0

    .line 467
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v4}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 472
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    .line 475
    invoke-virtual {p1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-class v2, Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1

    .line 477
    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    const/4 v2, 0x1

    .line 479
    invoke-virtual {p1, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 480
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 497
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": Class is not a ViewUpdater "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p1

    .line 494
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": Cannot access non-public constructor "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception p1

    .line 491
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_3
    move-exception p1

    .line 488
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_4
    move-exception p1

    .line 485
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": Unable to find ViewUpdater"

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_5
    move-exception p1

    .line 482
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": Error creating LayoutManager "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_3
    :goto_1
    return-object v1
.end method

.method private scrollLeft(I)I
    .locals 6

    .line 560
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 565
    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 566
    invoke-virtual {p0, v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_1

    .line 570
    invoke-virtual {p0, v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v1

    iget v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    sub-int/2addr v1, v2

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 575
    :cond_1
    iget v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    div-int/lit8 v1, v1, 0x2

    const/high16 v2, 0x3f800000    # 1.0f

    int-to-float v3, p1

    mul-float v3, v3, v2

    int-to-float v2, v1

    mul-float v3, v3, v2

    .line 576
    iget v2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    int-to-float v2, v2

    div-float/2addr v3, v2

    float-to-double v2, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    :goto_0
    if-ltz v0, :cond_3

    .line 579
    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 580
    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v4

    .line 582
    iget v5, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    if-le v4, v5, :cond_2

    .line 583
    invoke-direct {p0, v3, p1, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getAllowedLeftDelta(Landroid/view/View;II)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->offsetLeftAndRight(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    sub-int/2addr v5, v1

    :goto_1
    if-ltz v0, :cond_3

    .line 587
    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 588
    invoke-direct {p0, v3, v2, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getAllowedLeftDelta(Landroid/view/View;II)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->offsetLeftAndRight(I)V

    sub-int/2addr v5, v1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    return p1
.end method

.method private scrollRight(I)I
    .locals 11

    .line 505
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 511
    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 512
    iget v3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    invoke-virtual {p0, v2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    iget v5, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    mul-int v4, v4, v5

    add-int/2addr v3, v4

    .line 513
    invoke-direct {p0, v2, p1, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getAllowedRightDelta(Landroid/view/View;II)I

    move-result v2

    .line 515
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 516
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    :goto_0
    if-ltz v0, :cond_2

    .line 519
    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 520
    invoke-virtual {p0, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v6

    .line 522
    iget v7, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    if-lt v6, v7, :cond_1

    .line 523
    invoke-virtual {v3, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 525
    :cond_1
    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 529
    :cond_2
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 530
    iget v5, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    iget v7, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    mul-int v6, v6, v7

    add-int/2addr v5, v6

    .line 531
    invoke-direct {p0, v3, p1, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getAllowedRightDelta(Landroid/view/View;II)I

    move-result v5

    neg-int v5, v5

    .line 532
    invoke-virtual {v3, v5}, Landroid/view/View;->offsetLeftAndRight(I)V

    goto :goto_2

    .line 535
    :cond_3
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    div-int/lit8 v0, v0, 0x2

    const/high16 v3, 0x3f800000    # 1.0f

    int-to-float v5, v2

    mul-float v5, v5, v3

    int-to-float v3, v0

    mul-float v5, v5, v3

    .line 536
    iget v3, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    int-to-float v3, v3

    div-float/2addr v5, v3

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v3, v5

    .line 541
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v5

    const/4 v6, 0x0

    move-object v7, v6

    const/4 v6, 0x0

    :goto_3
    if-ge v1, v5, :cond_6

    .line 542
    invoke-virtual {v4, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    if-eqz v7, :cond_5

    .line 543
    invoke-virtual {p0, v7}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v7

    iget v9, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    if-lt v7, v9, :cond_4

    goto :goto_4

    .line 548
    :cond_4
    iget v7, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    mul-int v9, v0, v6

    sub-int/2addr v7, v9

    .line 549
    invoke-direct {p0, v8, v3, v7}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getAllowedRightDelta(Landroid/view/View;II)I

    move-result v7

    neg-int v7, v7

    invoke-virtual {v8, v7}, Landroid/view/View;->offsetLeftAndRight(I)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 544
    :cond_5
    :goto_4
    iget v7, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    invoke-virtual {p0, v8}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v9

    iget v10, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    mul-int v9, v9, v10

    add-int/2addr v7, v9

    .line 545
    invoke-direct {p0, v8, p1, v7}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getAllowedRightDelta(Landroid/view/View;II)I

    move-result v7

    neg-int v7, v7

    .line 546
    invoke-virtual {v8, v7}, Landroid/view/View;->offsetLeftAndRight(I)V

    :goto_5
    add-int/lit8 v1, v1, 0x1

    move-object v7, v8

    goto :goto_3

    :cond_6
    return v2
.end method

.method private updateViewScale()V
    .locals 5

    .line 710
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 711
    invoke-virtual {p0, v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 712
    invoke-virtual {p0, v2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v3

    .line 714
    iget v4, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 715
    iget-object v4, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->viewUpdater:Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;

    invoke-interface {v4, v2, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager$ViewUpdater;->updateView(Landroid/view/View;F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public canScrollHorizontally()Z
    .locals 1

    .line 254
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 2

    .line 292
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v1

    sub-int/2addr p1, v1

    int-to-float p1, p1

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method public generateDefaultLayoutParams()Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .locals 2

    .line 182
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public getActiveCardCenter()I
    .locals 1

    .line 411
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardCenter:I

    return v0
.end method

.method public getActiveCardLeft()I
    .locals 1

    .line 403
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardLeft:I

    return v0
.end method

.method public getActiveCardPosition()I
    .locals 9

    .line 346
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 354
    :cond_0
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_3

    .line 355
    invoke-virtual {p0, v4}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 356
    invoke-virtual {p0, v5}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v6

    .line 357
    iget v7, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    if-lt v6, v7, :cond_1

    goto :goto_1

    .line 361
    :cond_1
    invoke-static {v5}, Landroidx/core/view/ViewCompat;->getScaleX(Landroid/view/View;)F

    move-result v7

    cmpg-float v8, v3, v7

    if-gez v8, :cond_2

    .line 362
    iget v8, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardCenter:I

    if-ge v6, v8, :cond_2

    move-object v2, v5

    move v3, v7

    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    if-eqz v2, :cond_4

    .line 369
    invoke-virtual {p0, v2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    return v0

    :cond_4
    return v1
.end method

.method public getActiveCardRight()I
    .locals 1

    .line 407
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    return v0
.end method

.method public getCardWidth()I
    .locals 1

    .line 415
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    return v0
.end method

.method public getCardsGap()F
    .locals 1

    .line 419
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsGap:F

    return v0
.end method

.method public getSmoothScroller(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/LinearSmoothScroller;
    .locals 1

    .line 423
    new-instance v0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;-><init>(Lcom/ramotion/cardslider/CardSliderLayoutManager;Landroid/content/Context;)V

    return-object v0
.end method

.method public getTopView()Landroid/view/View;
    .locals 7

    .line 378
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 383
    :cond_0
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    int-to-float v0, v0

    .line 385
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    .line 386
    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 387
    invoke-virtual {p0, v4}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v5

    iget v6, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    if-lt v5, v6, :cond_1

    goto :goto_1

    .line 391
    :cond_1
    invoke-virtual {p0, v4}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v5

    .line 392
    iget v6, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->activeCardRight:I

    sub-int/2addr v6, v5

    int-to-float v5, v6

    cmpg-float v6, v5, v0

    if-gez v6, :cond_2

    move-object v1, v4

    move v0, v5

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return-object v1
.end method

.method public onAdapterChanged(Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 0

    .line 249
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->removeAllViews()V

    return-void
.end method

.method public onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 332
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 333
    iput-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V
    .locals 0

    .line 338
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    const/4 p1, 0x0

    .line 339
    iput-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 308
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result p1

    add-int/2addr p2, p3

    if-gt p2, p1, :cond_0

    add-int/lit8 p1, p1, -0x1

    .line 310
    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    :cond_0
    return-void
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 6

    .line 189
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 190
    invoke-virtual {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->removeAndRecycleAllViews(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    return-void

    .line 194
    :cond_0
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 198
    :cond_1
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v0

    .line 200
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 201
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 202
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    .line 203
    invoke-virtual {p0, v3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 204
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 206
    invoke-virtual {p0, v4}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 210
    :cond_3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 211
    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 212
    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v0, v0, -0x1

    .line 215
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result v3

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    add-int/2addr v3, v1

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_4

    const/4 v2, -0x1

    .line 217
    :cond_4
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 220
    :cond_5
    iput v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    .line 223
    :cond_6
    invoke-virtual {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    .line 224
    invoke-direct {p0, v0, p1, p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->fill(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 226
    iget-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    invoke-virtual {p1}, Landroid/util/SparseIntArray;->size()I

    move-result p1

    if-eqz p1, :cond_7

    .line 227
    invoke-direct {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->layoutByCoords()V

    .line 230
    :cond_7
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 231
    iget-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lcom/ramotion/cardslider/CardSliderLayoutManager$1;

    invoke-direct {p2, p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager$1;-><init>(Lcom/ramotion/cardslider/CardSliderLayoutManager;)V

    const-wide/16 v0, 0x19f

    invoke-virtual {p1, p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    return-void

    .line 238
    :cond_8
    invoke-direct {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->updateViewScale()V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 323
    instance-of v0, p1, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;

    if-eqz v0, :cond_0

    .line 324
    check-cast p1, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;

    .line 325
    iget p1, p1, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->anchorPos:I

    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    .line 326
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->requestLayout()V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 316
    new-instance v0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;

    invoke-direct {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;-><init>()V

    .line 317
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v1

    iput v1, v0, Lcom/ramotion/cardslider/CardSliderLayoutManager$SavedState;->anchorPos:I

    return-object v0
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 3

    const/4 v0, -0x1

    .line 269
    iput v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    if-gez p1, :cond_0

    .line 273
    iget v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardWidth:I

    neg-int v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRight(I)I

    move-result p1

    goto :goto_0

    .line 275
    :cond_0
    invoke-direct {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollLeft(I)I

    move-result p1

    .line 278
    :goto_0
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v0

    invoke-direct {p0, v0, p2, p3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->fill(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 279
    invoke-direct {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->updateViewScale()V

    .line 281
    iget-object p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    invoke-virtual {p2}, Landroid/util/SparseIntArray;->clear()V

    .line 282
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildCount()I

    move-result p2

    const/4 p3, 0x0

    :goto_1
    if-ge p3, p2, :cond_1

    .line 283
    invoke-virtual {p0, p3}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 284
    iget-object v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->cardsXCoords:Landroid/util/SparseIntArray;

    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p0, v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_1
    return p1
.end method

.method public scrollToPosition(I)V
    .locals 1

    if-ltz p1, :cond_1

    .line 259
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 263
    :cond_0
    iput p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager;->scrollRequestedPosition:I

    .line 264
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->requestLayout()V

    :cond_1
    :goto_0
    return-void
.end method

.method public smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;I)V
    .locals 0

    if-ltz p3, :cond_1

    .line 297
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getItemCount()I

    move-result p2

    if-lt p3, p2, :cond_0

    goto :goto_0

    .line 301
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getSmoothScroller(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/LinearSmoothScroller;

    move-result-object p1

    .line 302
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/LinearSmoothScroller;->setTargetPosition(I)V

    .line 303
    invoke-virtual {p0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
