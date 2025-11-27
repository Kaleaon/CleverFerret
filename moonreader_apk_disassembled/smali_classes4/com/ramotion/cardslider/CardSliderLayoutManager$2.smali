.class Lcom/ramotion/cardslider/CardSliderLayoutManager$2;
.super Landroidx/recyclerview/widget/LinearSmoothScroller;
.source "CardSliderLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ramotion/cardslider/CardSliderLayoutManager;->getSmoothScroller(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/LinearSmoothScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;


# direct methods
.method constructor <init>(Lcom/ramotion/cardslider/CardSliderLayoutManager;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 423
    iput-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public calculateDxToMakeVisible(Landroid/view/View;I)I
    .locals 3

    .line 426
    iget-object p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {p2, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p1

    .line 427
    iget-object p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$fgetactiveCardLeft(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I

    move-result p2

    if-le p1, p2, :cond_0

    .line 428
    iget-object p2, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {p2}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$fgetactiveCardLeft(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I

    move-result p2

    sub-int/2addr p2, p1

    return p2

    .line 433
    :cond_0
    iget-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getTopView()Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 435
    iget-object v0, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v0, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    .line 436
    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->getTargetPosition()I

    move-result v1

    if-eq v0, v1, :cond_2

    .line 437
    iget-object v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v1, p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result p1

    .line 438
    iget-object v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$fgetactiveCardLeft(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I

    move-result v1

    if-lt p1, v1, :cond_2

    iget-object v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$fgetactiveCardRight(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I

    move-result v1

    if-ge p1, v1, :cond_2

    .line 439
    iget-object v1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {v1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$fgetactiveCardRight(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I

    move-result v1

    sub-int/2addr v1, p1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    const/4 v1, 0x0

    .line 444
    :goto_0
    iget-object p1, p0, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->this$0:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-static {p1}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->-$$Nest$fgetcardWidth(Lcom/ramotion/cardslider/CardSliderLayoutManager;)I

    move-result p1

    invoke-virtual {p0}, Lcom/ramotion/cardslider/CardSliderLayoutManager$2;->getTargetPosition()I

    move-result v2

    sub-int/2addr v0, v2

    add-int/lit8 v0, v0, -0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    mul-int p1, p1, p2

    add-int/2addr v1, p1

    return v1
.end method

.method protected calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .locals 0

    const/high16 p1, 0x3f000000    # 0.5f

    return p1
.end method
