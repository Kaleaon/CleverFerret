.class Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;
.super Ljava/lang/Object;
.source "DragSortListAdapter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

.field final synthetic val$viewHolder:Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/DragSortListAdapter;Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    iput-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->val$viewHolder:Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->val$viewHolder:Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;

    invoke-virtual {v0}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->getAdapterPosition()I

    move-result v0

    .line 64
    iget-object v1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    iget-object v1, v1, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/DragSort/SortItem;

    iput-boolean p2, v1, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    .line 65
    iget-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    invoke-virtual {p2, v0, p1}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onCheckBoxChanged(ILandroid/widget/CompoundButton;)V

    .line 66
    iget-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    iget-object p2, p2, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onItemChanged:Lcom/flyersoft/tools/T$OnResult;

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 67
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    iget-object p1, p1, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onItemChanged:Lcom/flyersoft/tools/T$OnResult;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
