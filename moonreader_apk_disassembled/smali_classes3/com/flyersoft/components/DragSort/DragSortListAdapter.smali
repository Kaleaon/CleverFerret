.class public abstract Lcom/flyersoft/components/DragSort/DragSortListAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "DragSortListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CharSequence:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;"
    }
.end annotation


# instance fields
.field protected mContext:Landroid/content/Context;

.field public mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOnItemSortListener:Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;

.field onItemChanged:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method static bridge synthetic -$$Nest$fgetmOnItemSortListener(Lcom/flyersoft/components/DragSort/DragSortListAdapter;)Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mOnItemSortListener:Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;)V"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mContext:Landroid/content/Context;

    .line 30
    iput-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mList:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public abstract onBindDragSortItemViewHolder(Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;I)V
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 40
    check-cast p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;

    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onBindDragSortItemViewHolder(Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;I)V

    .line 43
    iget-object p2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vSort:Landroid/view/View;

    new-instance v0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;-><init>(Lcom/flyersoft/components/DragSort/DragSortListAdapter;Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 52
    iget-object p2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    new-instance v0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$2;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/DragSort/DragSortListAdapter$2;-><init>(Lcom/flyersoft/components/DragSort/DragSortListAdapter;Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;)V

    invoke-virtual {p2, v0}, Landroid/widget/CheckBox;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 60
    iget-object p2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    new-instance v0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/DragSort/DragSortListAdapter$3;-><init>(Lcom/flyersoft/components/DragSort/DragSortListAdapter;Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;)V

    invoke-virtual {p2, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.method public abstract onCheckBoxChanged(ILandroid/widget/CompoundButton;)V
.end method

.method public abstract onCreateDragSortItemViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onCreateDragSortItemViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public setOnItemSortListener(Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->mOnItemSortListener:Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;

    return-void
.end method

.method public abstract swapped(II)V
.end method
