.class public Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;
.super Landroidx/recyclerview/widget/ItemTouchHelper$Callback;
.source "ItemTouchHelperCallback.java"


# instance fields
.field private isLongPressDrag:Z

.field private mOnItemSortListener:Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;


# direct methods
.method public constructor <init>(Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;->mOnItemSortListener:Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;

    return-void
.end method


# virtual methods
.method public clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 57
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 59
    instance-of p1, p2, Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;

    if-eqz p1, :cond_0

    .line 61
    check-cast p2, Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;

    .line 62
    invoke-interface {p2}, Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;->onItemClear()V

    :cond_0
    return-void
.end method

.method public getMovementFlags(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)I
    .locals 0

    const/4 p1, 0x3

    const/4 p2, 0x0

    .line 27
    invoke-static {p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->makeMovementFlags(II)I

    move-result p1

    return p1
.end method

.method public isLongPressDragEnabled()Z
    .locals 1

    .line 69
    iget-boolean v0, p0, Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;->isLongPressDrag:Z

    return v0
.end method

.method public onMove(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 0

    .line 32
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;->mOnItemSortListener:Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p2

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p3

    invoke-interface {p1, p2, p3}, Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;->onItemMove(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    if-eqz p2, :cond_0

    .line 46
    instance-of v0, p1, Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;

    if-eqz v0, :cond_0

    .line 48
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;

    .line 49
    invoke-interface {v0}, Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;->onItemSelected()V

    .line 52
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onSwiped(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    return-void
.end method

.method public setLongPressDragEnabled(Z)V
    .locals 0

    .line 73
    iput-boolean p1, p0, Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;->isLongPressDrag:Z

    return-void
.end method
