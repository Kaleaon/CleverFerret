.class public Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NetBookListAdapter"
.end annotation


# instance fields
.field bookList:Lcom/flyersoft/opds/OpdsEntries;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

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

    .line 6319
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 6346
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 6423
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 6320
    sget-boolean v0, Lcom/flyersoft/tools/A;->libraryUseGrid:Z

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetFileOrNetColumn(Lcom/flyersoft/moonreaderp/ActivityMain;Z)I

    move-result v0

    iput v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    .line 6321
    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetlastBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Lcom/flyersoft/opds/OpdsEntries;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->bookList:Lcom/flyersoft/opds/OpdsEntries;

    return-void
.end method

.method private fillItemData(ILandroid/view/View;)V
    .locals 6

    if-nez p2, :cond_0

    return-void

    .line 6381
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->bookList:Lcom/flyersoft/opds/OpdsEntries;

    if-eqz v0, :cond_a

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-le p1, v0, :cond_1

    goto/16 :goto_7

    :cond_1
    const/4 v0, 0x0

    .line 6386
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6387
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6389
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->bookList:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/opds/OpdsEntry;

    .line 6390
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    if-le v3, v1, :cond_2

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fileImage:I

    goto :goto_0

    :cond_2
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    :goto_0
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/views/ShelfImageView;

    .line 6391
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4, v3, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getNetBookDrawable(Lcom/flyersoft/views/ShelfImageView;Lcom/flyersoft/opds/OpdsEntry;)V

    .line 6392
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/tools/A;->netCoverSize:I

    invoke-virtual {v4, v3, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->resetImageViewHeight(Landroid/widget/ImageView;I)V

    .line 6394
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    if-le v3, v1, :cond_3

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fileName:I

    goto :goto_1

    :cond_3
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->siteName:I

    :goto_1
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 6395
    invoke-static {}, Lcom/flyersoft/tools/C;->getFileTitleColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6396
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    sget-boolean v5, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 6397
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    if-le v4, v1, :cond_4

    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    sub-int/2addr v4, v1

    goto :goto_2

    :cond_4
    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    :goto_2
    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6398
    iget-object v4, v2, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6400
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    if-ne v4, v1, :cond_9

    .line 6401
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->siteSummary:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 6402
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v4, 0x10

    if-le v3, v4, :cond_5

    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v3, v3, -0x5

    int-to-float v3, v3

    goto :goto_3

    :cond_5
    const/high16 v3, 0x41300000    # 11.0f

    :goto_3
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6403
    const-string v3, ""

    .line 6405
    :try_start_0
    invoke-virtual {v2}, Lcom/flyersoft/opds/OpdsEntry;->itemType()I

    move-result v4

    if-nez v4, :cond_6

    .line 6406
    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    goto :goto_4

    .line 6408
    :cond_6
    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "\n"

    const-string v5, " "

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 6409
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v4, 0x12c

    if-le v2, v4, :cond_7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "..."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v2

    .line 6412
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_7
    move-object v2, v3

    .line 6414
    :goto_4
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_8

    const/high16 v1, 0x41000000    # 8.0f

    .line 6415
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    goto :goto_5

    :cond_8
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {p2, v0, v1, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_6

    :cond_9
    const/4 v0, 0x0

    .line 6417
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6419
    :goto_6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 6420
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_a
    :goto_7
    const/4 p1, 0x4

    .line 6382
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 5

    .line 6359
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->bookList:Lcom/flyersoft/opds/OpdsEntries;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 6360
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    div-int v2, v0, v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    const/4 v4, 0x1

    if-le v3, v4, :cond_1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    rem-int/2addr v0, v3

    if-lez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    add-int/2addr v2, v1

    return v2
.end method

.method public getItemCount()I
    .locals 1

    .line 6355
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 5

    .line 6366
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    new-array v1, v0, [Landroid/view/View;

    .line 6367
    check-cast p2, Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 6368
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    const/4 v4, 0x1

    if-le v3, v4, :cond_1

    const/4 v3, 0x0

    .line 6369
    :goto_0
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_1

    if-ge v3, v0, :cond_0

    .line 6371
    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    aput-object v4, v1, v3

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v2, v0, :cond_2

    .line 6374
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    mul-int p2, p2, p1

    add-int/2addr p2, v2

    aget-object v3, v1, v2

    invoke-direct {p0, p2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->fillItemData(ILandroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 6343
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 6

    .line 6327
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    new-array v0, p2, [Landroid/view/View;

    .line 6328
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->netColumn:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-le v1, v2, :cond_0

    .line 6329
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->linearlayout:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    :goto_0
    if-ge v3, p2, :cond_1

    .line 6331
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->file_grid:I

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v3

    .line 6332
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/high16 v4, 0x40a00000    # 5.0f

    const/4 v5, -0x1

    invoke-direct {v1, v5, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 6333
    aget-object v2, v0, v3

    invoke-virtual {p1, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 6336
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->net_list_item:I

    invoke-virtual {p2, v1, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    aput-object p1, v0, v3

    .line 6338
    :cond_1
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
