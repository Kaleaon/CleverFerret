.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;
.super Landroidx/recyclerview/widget/ItemTouchHelper$Callback;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ShelfTouchHelper"
.end annotation


# instance fields
.field dragMoved:Z

.field mergeFrameShowed:Z

.field merged:Z

.field shelfMoveFrom:I

.field shelfMoveTo:I

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

    .line 7976
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;-><init>()V

    const/4 p1, -0x1

    .line 7977
    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveTo:I

    return-void
.end method


# virtual methods
.method public chooseDropTarget(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/util/List;II)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;II)",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    .line 8056
    invoke-super/range {p0 .. p4}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->chooseDropTarget(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/util/List;II)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v3

    .line 8057
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    .line 8058
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v6, -0x1

    iput v6, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    if-nez v3, :cond_2

    .line 8061
    iget-object v8, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v8}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v8

    if-nez v8, :cond_2

    .line 8062
    iget-object v8, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    add-int/2addr v8, v2

    .line 8063
    iget-object v9, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v9

    add-int v9, p4, v9

    const/high16 v10, 0x41a00000    # 20.0f

    .line 8064
    invoke-static {v10}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v10

    const/4 v11, 0x0

    .line 8065
    :goto_0
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v12

    if-ge v11, v12, :cond_2

    move-object/from16 v12, p2

    .line 8066
    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 8067
    iget-object v14, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v14

    .line 8068
    iget-object v15, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v15

    .line 8069
    iget-object v7, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v7

    .line 8070
    iget-object v6, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v6

    sub-int v16, v2, v14

    .line 8071
    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v10, :cond_1

    sub-int v5, p4, v15

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v10, :cond_1

    sub-int v5, v8, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v10, :cond_1

    sub-int v5, v9, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v10, :cond_1

    if-ge v2, v14, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 8073
    :goto_1
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v13}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v6

    iput v6, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    const/4 v5, 0x1

    .line 8074
    iput-boolean v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    goto :goto_2

    :cond_1
    const/4 v5, 0x1

    add-int/lit8 v11, v11, 0x1

    const/4 v6, -0x1

    goto :goto_0

    :cond_2
    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 8080
    :goto_2
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    if-eq v4, v6, :cond_5

    .line 8081
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v2, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTargetAtRight:Z

    const/4 v2, -0x1

    if-eq v4, v2, :cond_3

    .line 8083
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-virtual {v2, v4}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(I)V

    .line 8084
    :cond_3
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    invoke-virtual {v2, v4}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(I)V

    .line 8085
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v4

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    const/4 v7, -0x1

    if-eq v6, v7, :cond_4

    goto :goto_3

    :cond_4
    const/4 v5, 0x0

    :goto_3
    invoke-virtual {v2, v4, v1, v5}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->fillItemData(ILandroid/view/View;Z)V

    :cond_5
    return-object v3
.end method

.method public clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 10

    .line 8092
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 8093
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/flyersoft/views/BookShelfView;->inItemDragging:Z

    .line 8095
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "clearView: from "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveTo:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    aput-object p1, v2, v0

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    const/4 p1, -0x1

    if-nez p2, :cond_2

    .line 8149
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    if-eqz v2, :cond_0

    goto :goto_0

    .line 8153
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    invoke-virtual {p2, v2}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->setLongTapSelectItem(I)V

    .line 8154
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    goto :goto_1

    .line 8150
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetDragState(Lcom/flyersoft/moonreaderp/ActivityMain;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V

    .line 8151
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 8156
    :goto_1
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->merged:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    .line 8157
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p1, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    return-void

    .line 8100
    :cond_2
    :try_start_0
    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    iget v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveTo:I

    .line 8102
    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->merged:Z

    if-nez v4, :cond_10

    if-eq v2, v3, :cond_10

    if-ltz v2, :cond_10

    if-ltz v3, :cond_10

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_10

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v3, v2, :cond_10

    if-nez v3, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    .line 8104
    :goto_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8105
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    if-eqz v2, :cond_4

    const/4 v6, 0x1

    goto :goto_3

    :cond_4
    add-int/lit8 v6, v3, -0x1

    :goto_3
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8109
    iget v6, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    if-ltz v6, :cond_a

    if-eqz v2, :cond_5

    .line 8111
    iget-object v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->addToShelfTop(Ljava/lang/String;)V

    const/4 v2, 0x1

    goto/16 :goto_8

    .line 8114
    :cond_5
    iget v2, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    if-ltz v2, :cond_6

    .line 8115
    iget-object v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2, v5}, Lcom/flyersoft/tools/A;->addToShelfTopAfterBook(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    const/4 v5, 0x0

    goto :goto_4

    .line 8118
    :cond_6
    iget-object v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->removeFromShelfTop(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v5, 0x1

    .line 8121
    :goto_4
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_7
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8122
    iget v8, v7, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    if-gez v8, :cond_8

    if-ne v7, v4, :cond_7

    .line 8123
    :cond_8
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v8

    iget-object v9, v7, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v8

    iput v8, v7, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    goto :goto_5

    .line 8124
    :cond_9
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v6}, Lcom/flyersoft/views/BookShelfView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    move v6, v5

    const/4 v5, 0x0

    goto :goto_a

    .line 8126
    :cond_a
    iget v6, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    if-ltz v6, :cond_d

    if-eqz v2, :cond_b

    .line 8128
    iget-object v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->addToShelfTop(Ljava/lang/String;)V

    goto :goto_6

    .line 8130
    :cond_b
    iget-object v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2, v5}, Lcom/flyersoft/tools/A;->addToShelfTopAfterBook(Ljava/lang/String;Ljava/lang/String;)V

    .line 8132
    :goto_6
    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    invoke-static {v4, v0, v2}, Lcom/flyersoft/tools/A;->updateShelfSortAfterTopChanged(Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V

    .line 8133
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iput v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    .line 8135
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v2}, Lcom/flyersoft/views/BookShelfView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 8136
    new-array v2, v0, [I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getShelfSort([I)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-lez v2, :cond_c

    const/4 v2, 0x1

    goto :goto_7

    :cond_c
    const/4 v2, 0x0

    :goto_7
    move v5, v2

    const/4 v2, 0x1

    goto :goto_9

    :cond_d
    const/4 v2, 0x0

    :goto_8
    const/4 v5, 0x0

    :goto_9
    const/4 v6, 0x0

    :goto_a
    if-nez v2, :cond_11

    if-eqz v6, :cond_f

    .line 8142
    :try_start_1
    new-array v2, v0, [I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getShelfSort([I)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_e

    const/4 v5, 0x1

    goto :goto_b

    :cond_e
    const/4 v5, 0x0

    .line 8143
    :goto_b
    invoke-static {v4, v1, p1}, Lcom/flyersoft/tools/A;->updateShelfSortAfterTopChanged(Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V

    .line 8145
    :cond_f
    iget-object v2, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    new-array v4, v0, [I

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/A;->addShelfSort(Ljava/lang/String;I[I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_c

    :catchall_0
    move-exception v2

    goto :goto_f

    :cond_10
    const/4 v5, 0x0

    .line 8149
    :cond_11
    :goto_c
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    if-nez v2, :cond_13

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    if-eqz v2, :cond_12

    goto :goto_d

    .line 8153
    :cond_12
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    invoke-virtual {p2, v2}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->setLongTapSelectItem(I)V

    .line 8154
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    goto :goto_e

    .line 8150
    :cond_13
    :goto_d
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetDragState(Lcom/flyersoft/moonreaderp/ActivityMain;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V

    .line 8151
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 8156
    :goto_e
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->merged:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    .line 8157
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p1, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    if-eqz v5, :cond_14

    .line 8160
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookShelfView;->post(Ljava/lang/Runnable;)Z

    :cond_14
    return-void

    :catchall_1
    move-exception v2

    const/4 v5, 0x0

    .line 8149
    :goto_f
    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    if-nez v3, :cond_16

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    if-eqz v3, :cond_15

    goto :goto_10

    .line 8153
    :cond_15
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    invoke-virtual {p2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->setLongTapSelectItem(I)V

    .line 8154
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    goto :goto_11

    .line 8150
    :cond_16
    :goto_10
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetDragState(Lcom/flyersoft/moonreaderp/ActivityMain;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V

    .line 8151
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 8156
    :goto_11
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->merged:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    .line 8157
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p1, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    if-eqz v5, :cond_17

    .line 8160
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookShelfView;->post(Ljava/lang/Runnable;)Z

    .line 8168
    :cond_17
    throw v2
.end method

.method public getMovementFlags(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)I
    .locals 2

    .line 7981
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAllowDrag()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 7983
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    iget-boolean p1, p1, Lcom/flyersoft/views/BookShelfView;->fastScrollShowing:Z

    if-eqz p1, :cond_1

    return v0

    .line 7985
    :cond_1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    .line 7986
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lt p1, p2, :cond_2

    return v0

    .line 7989
    :cond_2
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->getSelectedCount()I

    move-result p2

    const/4 v1, 0x2

    if-lt p2, v1, :cond_3

    return v0

    .line 7991
    :cond_3
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    if-nez p2, :cond_4

    .line 7992
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->getFirstSelected()I

    move-result p2

    const/4 v1, -0x1

    if-eq p2, v1, :cond_4

    if-eq p2, p1, :cond_4

    return v0

    .line 7997
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_5

    const/4 p1, 0x3

    goto :goto_0

    :cond_5
    const/16 p1, 0xf

    .line 7999
    :goto_0
    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->makeMovementFlags(II)I

    move-result p1

    return p1
.end method

.method public onMove(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 4

    .line 8004
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    .line 8005
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    .line 8006
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "move from to"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    aput-object p2, v1, v3

    const/4 p2, 0x2

    aput-object p3, v1, p2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 8008
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lt v0, p2, :cond_0

    .line 8009
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/lit8 v0, p2, -0x1

    .line 8011
    :cond_0
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveTo:I

    if-ne p1, v0, :cond_1

    return v2

    :cond_1
    if-ge p1, v0, :cond_2

    move p2, p1

    :goto_0
    if-ge p2, v0, :cond_3

    .line 8017
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    add-int/lit8 v1, p2, 0x1

    invoke-static {p3, p2, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    move p2, v1

    goto :goto_0

    :cond_2
    move p2, p1

    :goto_1
    if-le p2, v0, :cond_3

    .line 8020
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    add-int/lit8 v1, p2, -0x1

    invoke-static {p3, p2, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    .line 8023
    :cond_3
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateListShelfBooksIndex(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 8025
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p2}, Lcom/flyersoft/views/BookShelfView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p2

    invoke-virtual {p2, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 8027
    iput-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->dragMoved:Z

    return v3
.end method

.method public onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 7

    .line 8033
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper$Callback;->onSelectedChanged(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    .line 8034
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/flyersoft/views/BookShelfView;->inItemDragging:Z

    const/4 v0, 0x2

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    if-ne p2, v0, :cond_1

    .line 8037
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->mergeFrameShowed:Z

    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->merged:Z

    .line 8038
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    iput-boolean v2, v3, Lcom/flyersoft/views/BookShelfView;->inItemDragging:Z

    .line 8039
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v3

    iput v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveTo:I

    iput v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveFrom:I

    .line 8040
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p1, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 8041
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3, p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetDragState(Lcom/flyersoft/moonreaderp/ActivityMain;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V

    .line 8042
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    goto :goto_0

    :cond_0
    if-nez p2, :cond_1

    .line 8045
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    if-eqz v3, :cond_1

    .line 8046
    iput-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->merged:Z

    .line 8047
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v5

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    invoke-virtual {v3, v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeShelfItem(II)V

    .line 8048
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput v4, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    .line 8051
    :cond_1
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onSelectedChanged: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->shelfMoveTo:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v3, v4, v1

    aput-object p2, v4, v2

    aput-object p1, v4, v0

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public onSwiped(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    return-void
.end method
