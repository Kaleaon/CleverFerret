.class Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DashRvAdapter"
.end annotation


# instance fields
.field holderCaches:[Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

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

    .line 10205
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 10206
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->getItemCount()I

    move-result p1

    new-array p1, p1, [Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->holderCaches:[Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    const/4 v0, 0x6

    return v0
.end method

.method public getItemViewType(I)I
    .locals 0

    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/4 v3, 0x0

    .line 10229
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    const/4 v4, 0x6

    const/16 v7, 0x3c

    const/4 v8, 0x4

    const/4 v9, 0x2

    const/16 v11, 0x5a

    const/4 v12, 0x3

    const/4 v13, 0x5

    if-ge v2, v4, :cond_a

    .line 10234
    move-object v4, v1

    check-cast v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;

    .line 10235
    iget-object v14, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v15, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {v14, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroidx/recyclerview/widget/RecyclerView;

    .line 10236
    iget-object v15, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->holderCaches:[Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    aget-object v15, v15, v2

    const/16 v16, 0x50

    const/16 v5, 0x8

    if-nez v15, :cond_8

    .line 10237
    new-instance v15, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/16 v17, 0x41

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v15, v6, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v14, v15}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    if-eq v2, v13, :cond_3

    if-ne v2, v8, :cond_0

    goto :goto_1

    :cond_0
    if-eq v2, v12, :cond_2

    if-ne v2, v9, :cond_1

    goto :goto_0

    :cond_1
    const/16 v6, 0x64

    goto :goto_2

    :cond_2
    :goto_0
    const/16 v6, 0x41

    goto :goto_2

    :cond_3
    :goto_1
    const/16 v6, 0x50

    :goto_2
    if-ne v2, v13, :cond_5

    :cond_4
    :goto_3
    const/16 v15, 0x5a

    :goto_4
    const/16 v18, 0x64

    goto :goto_5

    :cond_5
    if-ne v2, v8, :cond_6

    const/16 v15, 0x46

    goto :goto_4

    :cond_6
    if-eq v2, v12, :cond_4

    if-ne v2, v9, :cond_7

    goto :goto_3

    :cond_7
    const/16 v15, 0x3c

    goto :goto_4

    .line 10240
    :goto_5
    invoke-virtual {v14}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3, v15}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mrecentCoverHeight(Lcom/flyersoft/moonreaderp/ActivityMain;I)I

    move-result v3

    mul-int v3, v3, v6

    div-int/lit8 v3, v3, 0x64

    iput v3, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 10241
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    new-instance v6, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v10, -0x1

    const/4 v15, -0x2

    invoke-direct {v6, v10, v15}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10242
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->more:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(I)V

    .line 10243
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->more:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10244
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10245
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->calendar:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10246
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 10247
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    invoke-static {v3, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetDashTheme(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V

    goto :goto_6

    :cond_8
    const/16 v17, 0x41

    const/16 v18, 0x64

    .line 10249
    :goto_6
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-ge v2, v13, :cond_9

    const/4 v6, 0x0

    goto :goto_7

    :cond_9
    const/16 v6, 0x8

    :goto_7
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    if-ge v2, v13, :cond_b

    .line 10251
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->calendar:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 10252
    iget-object v3, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->more:I

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_8

    :cond_a
    const/16 v16, 0x50

    const/16 v17, 0x41

    const/16 v18, 0x64

    const/4 v4, 0x0

    move-object v14, v4

    .line 10255
    :cond_b
    :goto_8
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->holderCaches:[Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    aput-object v1, v3, v2

    if-eqz v2, :cond_13

    const/4 v1, 0x1

    if-eq v2, v1, :cond_12

    if-eq v2, v9, :cond_11

    if-eq v2, v12, :cond_10

    if-eq v2, v8, :cond_f

    if-eq v2, v13, :cond_c

    goto/16 :goto_a

    .line 10308
    :cond_c
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v1, v14, :cond_14

    .line 10309
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 10311
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->more:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsMore:Landroid/widget/TextView;

    .line 10312
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->calendar:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->calencardB:Landroid/widget/TextView;

    .line 10313
    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v1, :cond_d

    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result v1

    goto :goto_9

    .line 10314
    :cond_d
    sget-boolean v1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v1, :cond_e

    const v1, -0x616162

    goto :goto_9

    :cond_e
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/flyersoft/material/components/icons/R$color;->material_blue_400:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 10315
    :goto_9
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsMore:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10316
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->calencardB:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10317
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsMore:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<b>"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->statistics_by_year:I

    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "</b>"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10318
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->calencardB:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->calendar:I

    invoke-virtual {v3, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10320
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$minitBookmarksRvEvents(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V

    .line 10321
    iget-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->read_statistics:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 10322
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->statisticsRv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3, v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mrecentCoverHeight(Lcom/flyersoft/moonreaderp/ActivityMain;I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x50

    div-int/lit8 v4, v4, 0x64

    invoke-direct {v2, v3, v4, v13}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;II)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void

    .line 10299
    :cond_f
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v1, v14, :cond_14

    .line 10300
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 10301
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkMore2:Landroid/view/View;

    .line 10302
    iget-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->button_bookmarks:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 10303
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateBookmarkRvAdapter(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 10289
    :cond_10
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->libRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v1, v14, :cond_14

    .line 10290
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->libRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 10291
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->libMore2:Landroid/view/View;

    .line 10292
    iget-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->netlibrary:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 10293
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    .line 10294
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->libRv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3, v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mrecentCoverHeight(Lcom/flyersoft/moonreaderp/ActivityMain;I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x41

    div-int/lit8 v4, v4, 0x64

    invoke-direct {v2, v3, v4, v12}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;II)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void

    .line 10279
    :cond_11
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->filesRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v1, v14, :cond_14

    .line 10280
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->filesRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 10281
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->filesMore2:Landroid/view/View;

    .line 10282
    iget-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->myfiles:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 10283
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$minitFilesRvEvents(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V

    .line 10284
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateFilesRvAdapter(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 10269
    :cond_12
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->favRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v1, v14, :cond_14

    .line 10270
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->favRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 10271
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->favMore2:Landroid/view/View;

    .line 10272
    iget-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 10273
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$minitFavRvEvents(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V

    .line 10274
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateFavRvAdapter(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 10259
    :cond_13
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eq v1, v14, :cond_14

    .line 10260
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 10261
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->more2:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentMore2:Landroid/view/View;

    .line 10262
    iget-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;->base:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 10263
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$minitRecentRvDragSelect(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 10264
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3, v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mrecentCoverHeight(Lcom/flyersoft/moonreaderp/ActivityMain;I)I

    move-result v4

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;II)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    :cond_14
    :goto_a
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 10211
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->holderCaches:[Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    aget-object p1, p1, p2

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    const/4 p1, 0x6

    const/4 v0, 0x0

    if-ge p2, p1, :cond_1

    .line 10216
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->main_dash_item:I

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 10219
    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p2, v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvItemHolder;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V

    return-object p2

    .line 10221
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->main_dash_encourage:I

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 10222
    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdHolder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p2, v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$DashRvAdHolder;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;)V

    return-object p2
.end method
