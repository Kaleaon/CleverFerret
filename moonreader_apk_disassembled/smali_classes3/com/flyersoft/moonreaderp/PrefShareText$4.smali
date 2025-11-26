.class Lcom/flyersoft/moonreaderp/PrefShareText$4;
.super Ljava/lang/Object;
.source "PrefShareText.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;->createSlideAdapter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 295
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 298
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->layoutManger:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->isSmoothScrolling()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 300
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->layoutManger:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 304
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p1

    if-ne p1, v0, :cond_2

    :goto_0
    return-void

    .line 308
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 309
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$monActiveCardChange(Lcom/flyersoft/moonreaderp/PrefShareText;I)V

    return-void
.end method
