.class public Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;
.super Lcom/flyersoft/components/DragSort/DragSortListAdapter;
.source "ReaderBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DragSort/ReaderBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MainListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flyersoft/components/DragSort/DragSortListAdapter<",
        "Lcom/flyersoft/components/DragSort/SortItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;",
            "Lcom/flyersoft/tools/T$OnResult;",
            ")V"
        }
    .end annotation

    .line 328
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 329
    iput-object p3, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;->onItemChanged:Lcom/flyersoft/tools/T$OnResult;

    return-void
.end method


# virtual methods
.method public onBindDragSortItemViewHolder(Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;I)V
    .locals 2

    .line 340
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/components/DragSort/SortItem;

    .line 341
    iget-object v0, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    iget-object v1, p2, Lcom/flyersoft/components/DragSort/SortItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 342
    iget-object v0, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    iget-boolean v1, p2, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 343
    iget v0, p2, Lcom/flyersoft/components/DragSort/SortItem;->icon:I

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vImage:Landroid/widget/ImageView;

    iget p2, p2, Lcom/flyersoft/components/DragSort/SortItem;->icon:I

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 346
    :cond_0
    iget-object p2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vImage:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 347
    :goto_0
    iget-object p2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 348
    iget-object p1, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->dragSortItemLayout:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    invoke-static {p1}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    return-void
.end method

.method public onCheckBoxChanged(ILandroid/widget/CompoundButton;)V
    .locals 0

    return-void
.end method

.method public onCreateDragSortItemViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;
    .locals 2

    .line 334
    iget-object p2, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->drag_sort_item_list:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 335
    new-instance p2, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;-><init>(Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public swapped(II)V
    .locals 0

    .line 353
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;->onItemChanged:Lcom/flyersoft/tools/T$OnResult;

    if-eqz p1, :cond_0

    .line 354
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;->onItemChanged:Lcom/flyersoft/tools/T$OnResult;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
