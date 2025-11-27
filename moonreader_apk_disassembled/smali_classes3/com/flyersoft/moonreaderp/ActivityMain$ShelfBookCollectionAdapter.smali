.class public Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ShelfBookCollectionAdapter"
.end annotation


# instance fields
.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method static bridge synthetic -$$Nest$msortItems(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->sortItems()V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7709
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 7725
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 7819
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 7828
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    .line 7710
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->sortItems()V

    return-void
.end method

.method private sortItems()V
    .locals 4

    .line 7738
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_2

    .line 7740
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 7752
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookCollection;

    const/4 v2, -0x2

    .line 7753
    iput v2, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    goto :goto_0

    .line 7754
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    invoke-static {v0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 7755
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 7756
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    invoke-static {v2}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iput v2, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    goto :goto_1

    .line 7757
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 7766
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 7771
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .line 7734
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 11

    .line 7775
    check-cast p2, Landroid/widget/LinearLayout;

    .line 7777
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto/16 :goto_4

    .line 7779
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 7780
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 7781
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 7782
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 7785
    const-string v4, " ("

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const/4 v6, 0x1

    const-string v7, ")"

    const/4 v8, 0x0

    if-eqz v5, :cond_1

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 7786
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v6

    invoke-virtual {v1, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v5

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    .line 7788
    :goto_0
    const-string v9, "<"

    invoke-virtual {v1, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    const-string v9, ">"

    invoke-virtual {v1, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_2

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 7789
    :cond_2
    invoke-virtual {v1, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 7790
    sget v4, Lcom/flyersoft/moonreaderp/R$drawable;->calibre:I

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    :cond_3
    if-lez v5, :cond_4

    .line 7793
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 7794
    :cond_4
    sget v4, Lcom/flyersoft/moonreaderp/R$drawable;->img_list_library_blue:I

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 7797
    :goto_1
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->siteName:I

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 7798
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 7799
    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 7801
    sget v4, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v6, 0x6

    const-string v7, ")</font>"

    if-ne v4, v6, :cond_5

    .line 7802
    iget-object v4, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    const/4 v5, 0x0

    iget-boolean v6, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    invoke-static {v4, v1, v5, v6}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 7803
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "<big>"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Lcom/flyersoft/tools/BookDb;->getRatingText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</big> <font color=\"#888888\">("

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 7805
    :cond_5
    sget v4, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v6, 0x5

    if-ne v4, v6, :cond_6

    .line 7806
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "<br><small><font color=\"#888888\">("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")</font></small>"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_6
    if-lez v5, :cond_7

    .line 7808
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " <font color=\"#888888\">("

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 7810
    :cond_7
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7812
    :goto_2
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->putontop:I

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget v2, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    if-ltz v2, :cond_8

    goto :goto_3

    :cond_8
    const/16 v8, 0x8

    :goto_3
    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 7813
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 7814
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7815
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 7816
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_9
    :goto_4
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 7722
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 7715
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->collection_list_item:I

    const/4 v1, 0x0

    .line 7716
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 7717
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
