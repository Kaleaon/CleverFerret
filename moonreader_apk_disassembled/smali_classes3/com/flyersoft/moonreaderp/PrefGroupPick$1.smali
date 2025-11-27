.class Lcom/flyersoft/moonreaderp/PrefGroupPick$1;
.super Ljava/lang/Object;
.source "PrefGroupPick.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupPick;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 105
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 108
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->titleEt:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 109
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->titleEt:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    sget v2, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    iput v2, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfCoverSize:I

    .line 111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->initColumnCount()V

    .line 112
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupPick;)I

    move-result v4

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5, v1}, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-direct {v1, v2}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupPick;)V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    .line 114
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    return-void
.end method
