.class public Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;
.super Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RecentListAdapter"
.end annotation


# instance fields
.field public checked:[Z

.field public list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field onBookAuthorClick:Landroid/view/View$OnClickListener;

.field onBookClick:Landroid/view/View$OnClickListener;

.field onBookLongClick:Landroid/view/View$OnLongClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
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

    .line 10937
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 10952
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 11227
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onBookAuthorClick:Landroid/view/View$OnClickListener;

    .line 11252
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    .line 11265
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    .line 10938
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->createList()Z

    return-void
.end method

.method private fillItemData(ILandroid/view/View;)V
    .locals 18

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v4, 0x1

    .line 11099
    invoke-virtual {v3, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 11100
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v6, 0x0

    if-ge v2, v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11101
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v2, v0, :cond_2

    :goto_1
    return-void

    .line 11104
    :cond_2
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    .line 11105
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 11106
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v8

    sget-boolean v9, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v8, v9}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 11107
    sget v8, Lcom/flyersoft/moonreaderp/R$id;->myBookAuthor:I

    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 11108
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->description:I

    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 11109
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->progresTv:I

    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 11110
    sget v11, Lcom/flyersoft/moonreaderp/R$id;->progressLine:I

    invoke-virtual {v3, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/views/ProgressViews/ProgressLineView;

    .line 11111
    sget v12, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {v3, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/views/ShelfImageView;

    .line 11113
    sget-boolean v13, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-nez v13, :cond_3

    .line 11114
    iput-boolean v4, v12, Lcom/flyersoft/views/ShelfImageView;->forceHasShadow:Z

    .line 11115
    sget v13, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_light:I

    iput v13, v12, Lcom/flyersoft/views/ShelfImageView;->shadowRes:I

    .line 11117
    :cond_3
    invoke-virtual {v12}, Lcom/flyersoft/views/ShelfImageView;->initPadding()V

    .line 11118
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->tagImage:I

    invoke-virtual {v3, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/ImageView;

    .line 11120
    sget-boolean v14, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v14, :cond_4

    sget-boolean v14, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v14, :cond_5

    .line 11121
    :cond_4
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v3, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroidx/cardview/widget/CardView;

    invoke-static {}, Lcom/flyersoft/tools/C;->getBookCardColor()I

    move-result v15

    invoke-virtual {v14, v15}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 11122
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v14

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11123
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v14

    const/16 v15, -0x64

    invoke-static {v14, v15}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v14

    .line 11124
    invoke-virtual {v8, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11125
    invoke-virtual {v10, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11126
    invoke-virtual {v9, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11129
    :cond_5
    sget v14, Lcom/flyersoft/tools/A;->shelfFontSize:I

    .line 11130
    sget-boolean v15, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    const/16 v16, 0x4

    if-eqz v15, :cond_7

    :cond_6
    const/4 v15, 0x0

    goto :goto_2

    :cond_7
    sget-boolean v15, Lcom/flyersoft/tools/A;->isSmalltablet:Z

    if-eqz v15, :cond_8

    const/4 v15, -0x1

    goto :goto_2

    :cond_8
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v15

    if-eqz v15, :cond_6

    const/4 v15, 0x2

    :goto_2
    sub-int v5, v14, v15

    int-to-float v5, v5

    .line 11131
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v5, 0xf

    if-le v14, v5, :cond_9

    .line 11132
    sget v5, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v5, v5, -0x4

    goto :goto_3

    :cond_9
    const/16 v5, 0xc

    :goto_3
    sub-int/2addr v5, v15

    int-to-float v5, v5

    .line 11133
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 11134
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 11135
    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez v5, :cond_b

    sget-boolean v5, Lcom/flyersoft/tools/A;->isLargePhone:Z

    if-nez v5, :cond_b

    .line 11136
    sget-boolean v5, Lcom/flyersoft/tools/A;->isSmallPhone:Z

    if-nez v5, :cond_a

    const/4 v5, 0x3

    goto :goto_4

    :cond_a
    const/4 v5, 0x2

    :goto_4
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 11139
    :cond_b
    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    const/16 v14, 0x64

    if-eqz v5, :cond_c

    .line 11140
    iget-object v5, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v15, Lcom/flyersoft/tools/A;->recentCoverSize:I

    invoke-virtual {v5, v15}, Lcom/flyersoft/moonreaderp/ActivityMain;->listStyleBookHeight(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x60

    div-int/2addr v5, v14

    goto :goto_5

    .line 11142
    :cond_c
    iget-object v5, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v5}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getWidth()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2d

    div-int/2addr v5, v14

    .line 11143
    sget v15, Lcom/flyersoft/tools/A;->recentCoverSize:I

    mul-int v5, v5, v15

    invoke-static {}, Lcom/flyersoft/tools/A;->defShelfCoverSize()I

    move-result v15

    div-int/2addr v5, v15

    .line 11144
    iget-object v15, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v15}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetrecentColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v15

    if-le v15, v4, :cond_d

    mul-int/lit8 v5, v5, 0x37

    .line 11145
    div-int/2addr v5, v14

    .line 11148
    :cond_d
    :goto_5
    invoke-virtual {v12}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v15

    if-nez v15, :cond_10

    .line 11150
    invoke-virtual {v3, v6, v6}, Landroid/view/View;->measure(II)V

    .line 11151
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    mul-int/lit8 v16, v5, 0x46

    div-int/lit8 v6, v16, 0x64

    invoke-direct {v15, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x11

    .line 11152
    iput v5, v15, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 11153
    sget-boolean v5, Lcom/flyersoft/tools/A;->isSmalltablet:Z

    if-eqz v5, :cond_e

    const/high16 v5, 0x40000000    # 2.0f

    .line 11154
    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    iput v5, v15, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 11155
    :cond_e
    invoke-virtual {v12, v15}, Lcom/flyersoft/views/ShelfImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 11156
    iget-object v5, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetrecentColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v5

    const/4 v6, -0x2

    if-le v5, v4, :cond_f

    .line 11157
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x1

    invoke-direct {v5, v15, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x40a00000    # 5.0f

    .line 11158
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 11159
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_6

    :cond_f
    const/4 v15, -0x1

    .line 11161
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v15, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 11162
    :goto_6
    iget-object v5, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    iget-object v6, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    const/16 v15, 0x387

    invoke-virtual {v6, v15, v14, v14, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 11165
    :cond_10
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->overLay:I

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget-object v6, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    array-length v14, v6

    if-ge v2, v14, :cond_11

    aget-boolean v6, v6, v2

    if-eqz v6, :cond_11

    sget v6, Lcom/flyersoft/material/components/icons/R$drawable;->list_selector_background_transition_holo_dark:I

    goto :goto_7

    .line 11166
    :cond_11
    sget v6, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    .line 11165
    :goto_7
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V

    const/16 v5, 0x8

    .line 11169
    invoke-virtual {v13, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 11170
    invoke-static {v7}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v5

    .line 11172
    iget-object v6, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v6, v7, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11173
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v13, 0x6

    if-ge v6, v13, :cond_12

    const/4 v6, 0x1

    goto :goto_8

    :cond_12
    const/4 v6, 0x0

    :goto_8
    const/4 v13, 0x0

    invoke-virtual {v0, v12, v7, v6, v13}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 11174
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getPositionSp()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    const-string v6, ""

    if-eqz v0, :cond_13

    .line 11175
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getPositionSp()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 11176
    const-string v12, ":"

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    const/4 v15, -0x1

    if-eq v13, v15, :cond_13

    .line 11177
    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    add-int/2addr v12, v4

    invoke-virtual {v0, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v0

    move v12, v0

    goto :goto_9

    :cond_13
    const/4 v12, 0x0

    .line 11182
    :goto_9
    invoke-static {v7}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object v13

    .line 11183
    iget-wide v14, v13, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    const-wide/16 v16, 0x0

    const-string v4, "0"

    cmp-long v0, v14, v16

    if-lez v0, :cond_15

    iget-wide v14, v13, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    cmp-long v0, v14, v16

    if-lez v0, :cond_15

    .line 11185
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v14, Ljava/text/DecimalFormat;

    const-string v15, "0.00"

    invoke-direct {v14, v15}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v2, v13, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    long-to-float v2, v2

    const/high16 v3, 0x42700000    # 60.0f

    div-float/2addr v2, v3

    div-float/2addr v2, v3

    const/high16 v15, 0x447a0000    # 1000.0f

    div-float/2addr v2, v15

    move-object/from16 v16, v4

    const/high16 v17, 0x42700000    # 60.0f

    float-to-double v3, v2

    :try_start_1
    invoke-virtual {v14, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 11186
    :try_start_2
    iget-wide v3, v13, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    long-to-float v0, v3

    div-float v0, v0, v17

    div-float/2addr v0, v15

    const/4 v3, 0x0

    cmpl-float v3, v0, v3

    if-lez v3, :cond_14

    .line 11188
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/text/DecimalFormat;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object/from16 v14, v16

    :try_start_3
    invoke-direct {v4, v14}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v16, v14

    :try_start_4
    iget-wide v14, v13, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    long-to-float v14, v14

    div-float/2addr v14, v0

    float-to-double v14, v14

    invoke-virtual {v4, v14, v15}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-object v4, v0

    goto :goto_a

    :catch_0
    move-exception v0

    move-object/from16 v16, v14

    goto :goto_c

    :cond_14
    move-object/from16 v4, v16

    :goto_a
    move-object v0, v4

    const/4 v3, 0x0

    move-object v4, v2

    goto :goto_d

    :catch_1
    move-exception v0

    goto :goto_c

    :catch_2
    move-exception v0

    goto :goto_b

    :catch_3
    move-exception v0

    move-object/from16 v16, v4

    :goto_b
    move-object/from16 v2, v16

    :goto_c
    const/4 v3, 0x0

    .line 11190
    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    move-object v4, v2

    move-object/from16 v0, v16

    goto :goto_d

    :cond_15
    move-object/from16 v16, v4

    const/4 v3, 0x0

    move-object/from16 v0, v16

    move-object v4, v0

    .line 11193
    :goto_d
    invoke-direct {v1, v5, v7}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getAuthor(Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 11194
    invoke-virtual {v8, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11196
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v4, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz v4, :cond_16

    move-object v4, v6

    goto :goto_e

    :cond_16
    const-string v4, " "

    :goto_e
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v14, Lcom/flyersoft/moonreaderp/R$string;->hours:I

    invoke-virtual {v4, v14}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 11197
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSpeedTagShort()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 11198
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v14, v14, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    const-string v15, "<b>"

    const/4 v3, 0x1

    if-ne v14, v3, :cond_17

    move-object v14, v15

    goto :goto_f

    :cond_17
    move-object v14, v6

    :goto_f
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11199
    iget-object v14, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v14, v14, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    const-string v16, "#FFFFFF"

    const-string v17, "#000000"

    if-ne v14, v3, :cond_19

    sget-boolean v14, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v14, :cond_18

    move-object/from16 v14, v16

    goto :goto_10

    :cond_18
    move-object/from16 v14, v17

    :goto_10
    invoke-static {v2, v14}, Lcom/flyersoft/tools/T;->getColorHtml(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_19
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11200
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    if-ne v2, v3, :cond_1a

    const-string v2, "</b>, "

    goto :goto_11

    :cond_1a
    const-string v2, ", "

    :goto_11
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11201
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1b

    goto :goto_12

    :cond_1b
    move-object v15, v6

    :goto_12
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11202
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    if-ne v2, v3, :cond_1d

    sget-boolean v2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v2, :cond_1c

    move-object/from16 v2, v16

    goto :goto_13

    :cond_1c
    move-object/from16 v2, v17

    :goto_13
    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->getColorHtml(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1d
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11203
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    if-ne v0, v3, :cond_1e

    const-string v6, "</b>"

    :cond_1e
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 11204
    invoke-static {v7, v13}, Lcom/flyersoft/tools/BookDb;->getReadDateRange(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$ReadStatistics;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1f

    .line 11206
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<br>"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1f
    if-eqz v5, :cond_20

    .line 11207
    iget-object v2, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_20

    .line 11208
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<br>#"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->trimDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 11209
    :cond_20
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11210
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 11211
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onBookAuthorClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-gez v12, :cond_21

    .line 11214
    const-string v0, "0%"

    goto :goto_14

    :cond_21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_14
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-gez v12, :cond_22

    const/4 v6, 0x0

    goto :goto_15

    :cond_22
    move v6, v12

    .line 11215
    :goto_15
    iput v6, v11, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    .line 11216
    invoke-virtual {v11}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->postInvalidate()V

    .line 11218
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    move-object/from16 v3, p2

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 11219
    invoke-virtual {v0, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 11220
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->onRecentItemOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11221
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 11222
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11223
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method private getAuthor(Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    .line 11247
    iget-object v0, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 11248
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    return-object p1

    .line 11249
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "("

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "."

    const-string v1, ""

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private sortListByHours(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 11000
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    if-nez v0, :cond_0

    goto :goto_3

    .line 11002
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11003
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 11004
    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object v2

    .line 11005
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    .line 11006
    iget-wide v3, v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-nez v7, :cond_1

    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    iget-wide v3, v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    long-to-float v3, v3

    iget-wide v4, v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    long-to-float v4, v4

    div-float/2addr v3, v4

    :goto_1
    iput v3, v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->speed:F

    .line 11007
    :cond_2
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 11009
    :cond_3
    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 11018
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 11019
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 11020
    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    :goto_3
    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 2

    .line 11050
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    .line 11051
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public createList()Z
    .locals 9

    .line 10967
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    .line 10968
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetrecent_searcy_key(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_5

    .line 10969
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    .line 10970
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetrecent_searcy_key(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 10971
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 10972
    invoke-static {v5}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v6

    .line 10973
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1

    const/4 v7, 0x1

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    :goto_1
    if-nez v7, :cond_4

    if-eqz v6, :cond_4

    .line 10975
    iget-object v7, v6, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v8, :cond_3

    iget-object v7, v6, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v8, :cond_3

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    .line 10976
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-eq v6, v8, :cond_2

    goto :goto_2

    :cond_2
    const/4 v7, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v7, 0x1

    :cond_4
    :goto_3
    if-eqz v7, :cond_0

    .line 10978
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 10981
    :cond_5
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    .line 10983
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->sortListByHours(Ljava/util/ArrayList;)V

    if-eqz v0, :cond_8

    .line 10985
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eq v1, v4, :cond_7

    goto :goto_4

    :cond_7
    const/4 v1, 0x0

    goto :goto_5

    :cond_8
    :goto_4
    const/4 v1, 0x1

    :goto_5
    if-nez v1, :cond_a

    .line 10987
    :goto_6
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_a

    .line 10988
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    goto :goto_7

    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_a
    move v3, v1

    :goto_7
    if-eqz v3, :cond_b

    .line 10994
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    :cond_b
    return v3
.end method

.method public doSelectChange(IIZ)V
    .locals 1

    if-ltz p1, :cond_2

    .line 11075
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-gt p1, p2, :cond_1

    .line 11078
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    aput-boolean p3, v0, p1

    const/4 v0, 0x0

    .line 11079
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 11081
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 11082
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getSelectedCount()I

    move-result p1

    .line 11083
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_2

    .line 11085
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_2
    :goto_1
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .line 10961
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 11089
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->list:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 11036
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 11037
    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public getSelectedFiles()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 11024
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    array-length v0, v0

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 11025
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    .line 11026
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 11027
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 11028
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_1

    .line 11029
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 0

    .line 11093
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->fillItemData(ILandroid/view/View;)V

    return-void
.end method

.method public inverseChecked(I)V
    .locals 3

    .line 11055
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 11057
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 11058
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 11059
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 11060
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getSelectedCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 11061
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_1
    const/4 v0, 0x0

    .line 11062
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 10949
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 10943
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->recent_list_big:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 10944
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public selectAll()V
    .locals 3

    const/4 v0, 0x0

    .line 11043
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_0

    const/4 v2, 0x1

    .line 11044
    aput-boolean v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 11045
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 11046
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public setChecked(I)V
    .locals 3

    .line 11066
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 11068
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 11069
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 11070
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 11071
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
