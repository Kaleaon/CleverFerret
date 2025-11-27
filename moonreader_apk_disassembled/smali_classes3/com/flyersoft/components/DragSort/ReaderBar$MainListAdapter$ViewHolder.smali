.class Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;
.super Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;
.source "ReaderBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;Landroid/view/View;)V
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

    .line 363
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;->this$0:Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;

    .line 364
    invoke-direct {p0, p2}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onItemClear()V
    .locals 2

    .line 395
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;->itemView:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mask:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    .line 396
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onItemSelected()V
    .locals 2

    .line 389
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter$ViewHolder;->itemView:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mask:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    .line 390
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public setCheckBox(Landroid/view/View;)Landroid/widget/CheckBox;
    .locals 1

    .line 379
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->checkbox:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    return-object p1
.end method

.method public setImageView(Landroid/view/View;)Landroid/widget/ImageView;
    .locals 1

    .line 374
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->imageview:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    return-object p1
.end method

.method public setItemLayout(Landroid/view/View;)Lcom/flyersoft/components/DragSort/DragSortItemLayout;
    .locals 1

    .line 369
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->item_layout:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    return-object p1
.end method

.method public setSort(Landroid/view/View;)Landroid/view/View;
    .locals 1

    .line 384
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->fl_sort:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
