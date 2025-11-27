.class Lcom/flyersoft/moonreaderp/ActivityMain$121;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->init_dash_data(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10167
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$121;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 10170
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 10171
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$121;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->dashRv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->findFirstVisibleItem()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->lastDashItem:I

    .line 10172
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$121;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget p2, Lcom/flyersoft/tools/A;->lastDashItem:I

    if-lez p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceFavVisible(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    return-void
.end method
