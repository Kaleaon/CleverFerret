.class Lcom/flyersoft/moonreaderp/ActivityMain$13;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initRecentLvDragSelect()V
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

    .line 1405
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$13;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelectChange(IIZ)V
    .locals 2

    .line 1408
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$13;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->doSelectChange(IIZ)V

    return-void
.end method
