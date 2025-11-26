.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;
.super Landroidx/recyclerview/widget/ItemTouchHelper$Callback;
.source "PrefGroupBooks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MergedDragItem"
.end annotation


# instance fields
.field dragMoved:Z

.field shelfMoveFrom:I

.field shelfMoveTo:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 627
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {p0}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;-><init>()V

    const/4 p1, -0x1

    .line 628
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveFrom:I

    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveTo:I

    return-void
.end method


# virtual methods
.method public clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 3

    .line 710
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismissed:Z

    if-eqz v0, :cond_0

    return-void

    .line 713
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 714
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->inItemDragging:Z

    .line 715
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "clearView: from "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveFrom:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " to "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveTo:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->dragMoved:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    aput-object p1, v1, p2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 717
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveFrom:I

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveTo:I

    if-eq p1, v1, :cond_2

    .line 718
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    const/4 p1, 0x0

    .line 719
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_1

    .line 720
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 721
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 722
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    if-ge p1, v0, :cond_2

    .line 723
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iput v0, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    .line 726
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->dragMoved:Z

    xor-int/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->showRemoveButton(Z)V

    .line 728
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 729
    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->dragMoved:Z

    .line 730
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v1, p2}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawView(Landroid/view/View;FFZ)V

    return-void
.end method

.method public getMovementFlags(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)I
    .locals 0

    const/16 p1, 0xf

    const/4 p2, 0x0

    .line 661
    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->makeMovementFlags(II)I

    move-result p1

    return p1
.end method

.method public onChildDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;FFIZ)V
    .locals 5

    .line 633
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->onChildDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;FFIZ)V

    move-object p1, p0

    .line 635
    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    if-ne p3, p2, :cond_c

    .line 637
    :try_start_0
    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p2

    int-to-float p2, p2

    add-float/2addr p2, p4

    .line 638
    iget-object p4, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object p4, p4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p4}, Landroid/view/View;->getTop()I

    move-result p4

    int-to-float p4, p4

    add-float/2addr p4, p5

    const/4 p5, 0x0

    const/4 p6, 0x1

    const/4 p7, 0x0

    cmpg-float v0, p4, p5

    if-ltz v0, :cond_1

    .line 639
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p4

    iget-object v1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    cmpg-float v1, p2, p5

    if-ltz v1, :cond_3

    .line 640
    iget-object v1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, p2

    iget-object v2, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v1, 0x1

    :goto_3
    if-nez v0, :cond_5

    if-eqz v1, :cond_4

    goto :goto_4

    .line 652
    :cond_4
    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p5, p5, p7}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawView(Landroid/view/View;FFZ)V

    return-void

    .line 642
    :cond_5
    :goto_4
    iget-object p5, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p5, p5, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object p5, p5, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p5}, Landroid/view/View;->getWidth()I

    move-result p5

    div-int/lit8 p5, p5, 0x3

    .line 643
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x3

    .line 644
    iget-object v1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, p2

    int-to-float v2, p5

    cmpg-float v1, v1, v2

    if-gez v1, :cond_6

    const/4 v1, 0x1

    goto :goto_5

    :cond_6
    const/4 v1, 0x0

    .line 645
    :goto_5
    iget-object v2, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, p4

    int-to-float v3, v0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_7

    const/4 v2, 0x1

    goto :goto_6

    :cond_7
    const/4 v2, 0x0

    .line 646
    :goto_6
    iget-object v3, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getWidth()I

    move-result v3

    sub-int/2addr v3, p5

    int-to-float p5, v3

    cmpl-float p5, p2, p5

    if-lez p5, :cond_8

    const/4 p5, 0x1

    goto :goto_7

    :cond_8
    const/4 p5, 0x0

    .line 647
    :goto_7
    iget-object v3, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getHeight()I

    move-result v3

    sub-int/2addr v3, v0

    int-to-float v0, v3

    cmpl-float v0, p4, v0

    if-lez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_8

    :cond_9
    const/4 v0, 0x0

    .line 648
    :goto_8
    iget-object v3, p3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v4, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p3

    invoke-virtual {v4, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {v3, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 649
    iget-object p3, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    iget-object v3, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v4, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rvCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {v4}, Landroidx/cardview/widget/CardView;->getLeft()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr p2, v4

    iget-object v4, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rvCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {v4}, Landroidx/cardview/widget/CardView;->getTop()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr p4, v4

    if-nez v1, :cond_b

    if-nez v2, :cond_b

    if-nez p5, :cond_b

    if-eqz v0, :cond_a

    goto :goto_9

    :cond_a
    const/4 p6, 0x0

    :cond_b
    :goto_9
    invoke-virtual {p3, v3, p2, p4, p6}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawView(Landroid/view/View;FFZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p2, v0

    .line 654
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_c
    return-void
.end method

.method public onMove(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 4

    .line 666
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "move"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    aput-object p1, v1, v3

    const/4 p1, 0x2

    aput-object v0, v1, p1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 667
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismissed:Z

    if-eqz p1, :cond_0

    return v2

    .line 670
    :cond_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    .line 671
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p2

    .line 673
    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveTo:I

    if-ne p1, p2, :cond_1

    return v2

    .line 676
    :cond_1
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p1, p3, :cond_5

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-lt p2, p3, :cond_2

    goto :goto_2

    :cond_2
    if-ge p1, p2, :cond_3

    move p3, p1

    :goto_0
    if-ge p3, p2, :cond_4

    .line 681
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    add-int/lit8 v1, p3, 0x1

    invoke-static {v0, p3, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    move p3, v1

    goto :goto_0

    :cond_3
    move p3, p1

    :goto_1
    if-le p3, p2, :cond_4

    .line 684
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    add-int/lit8 v1, p3, -0x1

    invoke-static {v0, p3, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    add-int/lit8 p3, p3, -0x1

    goto :goto_1

    .line 687
    :cond_4
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 689
    iput-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->dragMoved:Z

    return v3

    :cond_5
    :goto_2
    return v2
.end method

.method public onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 5

    .line 695
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    if-ne p2, v0, :cond_0

    .line 698
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-boolean v2, v3, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->inItemDragging:Z

    .line 699
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v3

    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveTo:I

    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveFrom:I

    .line 700
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iput-object p1, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 701
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    iput-boolean v1, v3, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideCheckFinished:Z

    .line 702
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v4

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3, v4, p1, v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->fillItemData(ILandroid/view/View;Z)V

    .line 705
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v3, "*onSelectedChanged: "

    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->shelfMoveTo:I

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "state: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-boolean v3, v3, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->inItemDragging:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    aput-object p2, v4, v2

    aput-object v3, v4, v0

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public onSwiped(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    return-void
.end method
