.class Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;
.super Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;
.source "SelectBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 360
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    .line 361
    invoke-direct {p0, p2}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onItemClear()V
    .locals 3

    .line 394
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->itemView:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mask:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    .line 395
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_1

    .line 398
    iget-object v2, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    iget-object v2, v2, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 399
    iget-object v2, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    iget-object v2, v2, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/DragSort/SortItem;

    iget-boolean v2, v2, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    if-nez v2, :cond_0

    .line 400
    iget-object v1, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    iget-object v1, v1, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    const/4 v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    if-nez v1, :cond_3

    .line 404
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    iget-boolean v0, v0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->positionUpdate:Z

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    return-void

    .line 405
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onItemSelected()V
    .locals 2

    .line 387
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->itemView:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mask:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    .line 388
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 389
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    iput-boolean v1, v0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->positionUpdate:Z

    return-void
.end method

.method public setCheckBox(Landroid/view/View;)Landroid/widget/CheckBox;
    .locals 1

    .line 376
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->checkbox:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    return-object p1
.end method

.method public setImageView(Landroid/view/View;)Landroid/widget/ImageView;
    .locals 1

    .line 371
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->imageview:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    return-object p1
.end method

.method public setItemLayout(Landroid/view/View;)Lcom/flyersoft/components/DragSort/DragSortItemLayout;
    .locals 1

    .line 366
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->item_layout:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    return-object p1
.end method

.method public setSort(Landroid/view/View;)Landroid/view/View;
    .locals 1

    .line 382
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->fl_sort:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
