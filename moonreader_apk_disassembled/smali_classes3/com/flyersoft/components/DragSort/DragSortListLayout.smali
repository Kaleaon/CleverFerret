.class public Lcom/flyersoft/components/DragSort/DragSortListLayout;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "DragSortListLayout.java"

# interfaces
.implements Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;


# instance fields
.field private final dragSortCallback:Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;

.field private mItemTouchHelper:Landroidx/recyclerview/widget/ItemTouchHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/DragSort/DragSortListLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/components/DragSort/DragSortListLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    new-instance p2, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {p2}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {p0, p2}, Lcom/flyersoft/components/DragSort/DragSortListLayout;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 37
    new-instance p2, Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;-><init>(Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;)V

    iput-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListLayout;->dragSortCallback:Lcom/flyersoft/components/DragSort/ItemTouchHelperCallback;

    .line 38
    new-instance p3, Landroidx/recyclerview/widget/ItemTouchHelper;

    invoke-direct {p3, p2}, Landroidx/recyclerview/widget/ItemTouchHelper;-><init>(Landroidx/recyclerview/widget/ItemTouchHelper$Callback;)V

    iput-object p3, p0, Lcom/flyersoft/components/DragSort/DragSortListLayout;->mItemTouchHelper:Landroidx/recyclerview/widget/ItemTouchHelper;

    .line 39
    invoke-virtual {p3, p0}, Landroidx/recyclerview/widget/ItemTouchHelper;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 41
    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {p2, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 42
    invoke-virtual {p0, p2}, Lcom/flyersoft/components/DragSort/DragSortListLayout;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method


# virtual methods
.method public onItemMove(II)V
    .locals 2

    .line 63
    invoke-virtual {p0}, Lcom/flyersoft/components/DragSort/DragSortListLayout;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    .line 64
    invoke-virtual {v0}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->getList()Ljava/util/List;

    move-result-object v1

    .line 65
    invoke-static {v1, p1, p2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 66
    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->swapped(II)V

    .line 67
    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->notifyItemMoved(II)V

    return-void
.end method

.method public onStartDrags(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortListLayout;->mItemTouchHelper:Landroidx/recyclerview/widget/ItemTouchHelper;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/ItemTouchHelper;->startDrag(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 1

    .line 48
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 49
    instance-of v0, p1, Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    if-eqz v0, :cond_0

    .line 50
    check-cast p1, Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    .line 51
    invoke-virtual {p1, p0}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->setOnItemSortListener(Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;)V

    :cond_0
    return-void
.end method
