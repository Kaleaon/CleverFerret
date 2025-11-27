.class public Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AllAnnotsAdapter"
.end annotation


# instance fields
.field column:I

.field onBookClick:Landroid/view/View$OnClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12460
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 12447
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    const/4 v0, 0x2

    .line 12459
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->column:I

    .line 12518
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    .line 12461
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getListColumn()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->column:I

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 4

    .line 12464
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 12465
    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->column:I

    div-int v2, v0, v1

    const/4 v3, 0x1

    if-le v1, v3, :cond_0

    rem-int/2addr v0, v1

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    add-int/2addr v2, v3

    return v2
.end method

.method public getItemCount()I
    .locals 1

    .line 12456
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 12

    .line 12470
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->column:I

    new-array v1, v0, [Landroid/view/View;

    .line 12472
    check-cast p2, Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 12473
    :goto_0
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_1

    if-ge v3, v0, :cond_0

    .line 12475
    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    aput-object v4, v1, v3

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_1
    if-ge p2, v0, :cond_6

    .line 12478
    iget v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->column:I

    mul-int v3, v3, p1

    add-int/2addr v3, p2

    .line 12479
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v3, v4, :cond_2

    .line 12480
    aget-object v3, v1, p2

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    .line 12483
    :cond_2
    aget-object v4, v1, p2

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12485
    aget-object v4, v1, p2

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 12486
    aget-object v5, v1, p2

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->countTv:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 12487
    aget-object v6, v1, p2

    sget v7, Lcom/flyersoft/moonreaderp/R$id;->fileTv:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 12488
    aget-object v7, v1, p2

    sget v8, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/views/ShelfImageView;

    .line 12489
    invoke-virtual {v7}, Lcom/flyersoft/views/ShelfImageView;->initPadding()V

    .line 12491
    sget-boolean v8, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v8, :cond_3

    sget-boolean v8, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v8, :cond_4

    .line 12492
    :cond_3
    aget-object v8, v1, p2

    sget v9, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroidx/cardview/widget/CardView;

    invoke-static {}, Lcom/flyersoft/tools/C;->getBookCardColor()I

    move-result v9

    invoke-virtual {v8, v9}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 12493
    :cond_4
    sget-boolean v8, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v8, :cond_5

    .line 12494
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12495
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12496
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/flyersoft/material/components/icons/R$color;->material_grey_400:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12499
    :cond_5
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 12500
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, ""

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v10, v8, v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetAnnotCount(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12502
    invoke-static {v8}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v5

    .line 12503
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v9, v8, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetBookName(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;

    move-result-object v5

    .line 12504
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetbookNameCache(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12505
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12506
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12507
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v5, 0x0

    invoke-virtual {v4, v7, v8, v2, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 12509
    aget-object v4, v1, p2

    sget v5, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12510
    aget-object v4, v1, p2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 12511
    aget-object v4, v1, p2

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12512
    aget-object v4, v1, p2

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 12513
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 12514
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->onAnnotBookOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_2
    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_1

    :cond_6
    return-void
.end method

.method public myNotifyDataSetChanged()V
    .locals 3

    .line 12423
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetAnnotBooksList(Lcom/flyersoft/moonreaderp/ActivityMain;ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    .line 12424
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowTotalAnnotsCount(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    .line 12425
    invoke-super {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 12444
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 5

    .line 12431
    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->column:I

    new-array v0, p2, [Landroid/view/View;

    .line 12432
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->linearlayout:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    :goto_0
    if-ge v3, p2, :cond_0

    .line 12434
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->bookmarks_book_item:I

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v3

    .line 12435
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v4, -0x2

    invoke-direct {v1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x40a00000    # 5.0f

    .line 12436
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 12437
    aget-object v2, v0, v3

    invoke-virtual {p1, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 12439
    :cond_0
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
