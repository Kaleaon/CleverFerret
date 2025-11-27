.class Lcom/flyersoft/moonreaderp/ActivityMain$86;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->setShelfBooksAdapter(Z)V
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

    .line 7914
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$86;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 7917
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 7918
    check-cast p1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->findFirstVisibleItem()I

    move-result p2

    sput p2, Lcom/flyersoft/tools/A;->shelf_last_item:I

    .line 7919
    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getScrollOffset()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->shelf_last_offset:I

    return-void
.end method
