.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RecentRvViewHolder"
.end annotation


# instance fields
.field base:Landroid/view/View;

.field bookName2:Landroid/widget/TextView;

.field cover:Landroid/widget/ImageView;

.field menuB:Landroid/view/View;

.field position:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field type:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;II)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 10717
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 10718
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 10719
    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->type:I

    .line 10720
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    const/4 v0, 0x5

    if-ne p4, v0, :cond_0

    .line 10722
    check-cast p2, Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateStatisticsCardNightColors(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 10724
    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    invoke-virtual {p1, p2, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateCardViewNightMode(Landroid/view/View;Z)V

    :goto_0
    const/4 p2, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    if-ge p4, v0, :cond_4

    .line 10727
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->myBookName2:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    .line 10728
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->cover:Landroid/widget/ImageView;

    const/4 v4, 0x1

    if-eqz p4, :cond_1

    if-eq p4, v4, :cond_1

    if-ne p4, p2, :cond_2

    .line 10730
    :cond_1
    check-cast v3, Lcom/flyersoft/views/ShelfImageView;

    invoke-virtual {v3}, Lcom/flyersoft/views/ShelfImageView;->initPadding()V

    :cond_2
    if-ne p4, v1, :cond_3

    .line 10732
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->cover:Landroid/widget/ImageView;

    check-cast v3, Lcom/google/android/material/imageview/ShapeableImageView;

    .line 10733
    invoke-virtual {v3}, Lcom/google/android/material/imageview/ShapeableImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10734
    invoke-virtual {v3}, Lcom/google/android/material/imageview/ShapeableImageView;->getShapeAppearanceModel()Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v6

    iget v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int v7, p3, v7

    iget v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v7, v5

    div-int/2addr v7, v2

    int-to-float v5, v7

    invoke-virtual {v6, v5}, Lcom/google/android/material/shape/ShapeAppearanceModel;->withCornerSize(F)Lcom/google/android/material/shape/ShapeAppearanceModel;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/android/material/imageview/ShapeableImageView;->setShapeAppearanceModel(Lcom/google/android/material/shape/ShapeAppearanceModel;)V

    .line 10736
    :cond_3
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 10737
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 10738
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_4
    const/4 v3, -0x1

    if-ne p4, v0, :cond_5

    .line 10742
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    new-instance p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    invoke-direct {p2, p3, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10743
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_5
    if-eq p4, v2, :cond_9

    if-ne p4, v1, :cond_6

    goto :goto_2

    .line 10748
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    new-instance v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    mul-int/lit8 p3, p3, 0x49

    div-int/lit8 p3, p3, 0x64

    invoke-direct {v1, p3, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10749
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->menuB:Landroid/view/View;

    if-ne p4, p2, :cond_7

    .line 10751
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->menuB:I

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 10752
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->menuB:Landroid/view/View;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->onAnnotBookOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 10754
    :cond_7
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->onRecentItemOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_1
    if-nez p4, :cond_8

    .line 10756
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_8
    return-void

    .line 10745
    :cond_9
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    new-instance p2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    invoke-direct {p2, p3, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10746
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 10776
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->type:I

    if-nez v0, :cond_0

    .line 10777
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    if-nez p1, :cond_b

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLvVisible()Z

    move-result p1

    if-nez p1, :cond_b

    .line 10778
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->inverseChecked(I)V

    return-void

    .line 10781
    :cond_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_9

    const/4 v2, 0x2

    if-eq v0, v2, :cond_8

    const/4 v3, 0x3

    if-eq v0, v3, :cond_7

    const/4 v4, 0x4

    if-eq v0, v4, :cond_6

    const/4 v4, 0x5

    if-eq v0, v4, :cond_2

    .line 10837
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 10838
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 10839
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void

    .line 10783
    :cond_2
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    if-nez p1, :cond_3

    .line 10784
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBoard:Z

    .line 10785
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 10786
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBoard:Z

    .line 10788
    :cond_3
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    if-ne p1, v1, :cond_4

    .line 10789
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showRecentMore(I)V

    .line 10791
    :cond_4
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    if-ne p1, v2, :cond_5

    .line 10792
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showRecentMore(I)V

    .line 10794
    :cond_5
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    if-ne p1, v3, :cond_b

    .line 10795
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showRecentMore(I)V

    return-void

    .line 10800
    :cond_6
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;Landroid/os/Looper;)V

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    .line 10804
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;->sendEmptyMessage(I)Z

    .line 10805
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 10806
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBoard:Z

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBookmarks:Z

    return-void

    .line 10810
    :cond_7
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;Landroid/os/Looper;)V

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    .line 10815
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;->sendEmptyMessage(I)Z

    .line 10816
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    .line 10817
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBoard:Z

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashLib:Z

    return-void

    .line 10821
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->favFolderList:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->goToQuickFolderTab(Ljava/lang/String;)V

    .line 10822
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBoard:Z

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashFiles:Z

    return-void

    .line 10826
    :cond_9
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 10827
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 10829
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentFavBooks:Ljava/util/ArrayList;

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 10830
    iget-object v0, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 10831
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->openShelfBookFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_b
    return-void

    .line 10833
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 10762
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->type:I

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 10764
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 10765
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 10766
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->inverseChecked(I)V

    .line 10767
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->getSelectedCount()I

    move-result p1

    if-lez p1, :cond_2

    .line 10768
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    invoke-virtual {p1, v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setStartSelectPosition(I)V

    .line 10769
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_2
    return v0
.end method
