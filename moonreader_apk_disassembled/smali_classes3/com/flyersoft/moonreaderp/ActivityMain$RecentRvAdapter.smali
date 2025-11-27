.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;
.super Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RecentRvAdapter"
.end annotation


# instance fields
.field public checked:[Z

.field height:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field type:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 10579
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 10580
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    .line 10581
    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->height:I

    .line 10582
    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    return-void
.end method

.method private fillStatisticsInfo(Landroid/view/View;I)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    .line 10681
    sget-wide v3, Lcom/flyersoft/tools/A;->statistics_time:J

    long-to-float v3, v3

    const/high16 v4, 0x42700000    # 60.0f

    div-float/2addr v3, v4

    div-float/2addr v3, v4

    const/high16 v5, 0x447a0000    # 1000.0f

    div-float/2addr v3, v5

    const v6, 0x3dcccccd    # 0.1f

    const/4 v7, 0x0

    cmpl-float v8, v3, v7

    if-nez v8, :cond_0

    const v3, 0x3dcccccd    # 0.1f

    .line 10684
    :cond_0
    sget-wide v8, Lcom/flyersoft/tools/A;->statistics_time:J

    long-to-float v8, v8

    div-float/2addr v8, v4

    div-float/2addr v8, v5

    cmpl-float v7, v8, v7

    if-nez v7, :cond_1

    goto :goto_0

    :cond_1
    move v6, v8

    .line 10687
    :goto_0
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->t1:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    const/4 v8, 0x6

    const/4 v9, 0x5

    const/4 v10, 0x4

    const/4 v11, 0x3

    const/4 v12, 0x2

    const/4 v13, 0x1

    if-nez v2, :cond_2

    .line 10688
    iget-object v14, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->books_on_shelf:I

    invoke-virtual {v14, v15}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v14

    :goto_1
    const/high16 v16, 0x42700000    # 60.0f

    const/high16 v17, 0x447a0000    # 1000.0f

    goto/16 :goto_2

    :cond_2
    if-ne v2, v13, :cond_3

    .line 10689
    iget-object v14, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->read_books:I

    invoke-virtual {v14, v15}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_1

    .line 10690
    :cond_3
    const-string v14, "</b>"

    const-string v15, "<b>"

    if-ne v2, v12, :cond_4

    const/high16 v16, 0x42700000    # 60.0f

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v15, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/high16 v17, 0x447a0000    # 1000.0f

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->read_hour:I

    invoke-virtual {v15, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v14

    goto :goto_2

    :cond_4
    const/high16 v16, 0x42700000    # 60.0f

    const/high16 v17, 0x447a0000    # 1000.0f

    if-ne v2, v11, :cond_5

    .line 10691
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->read_words_minute:I

    invoke-virtual {v5, v15}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v14

    goto :goto_2

    :cond_5
    if-ne v2, v10, :cond_6

    .line 10692
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->turn_pages:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_2

    :cond_6
    if-ne v2, v9, :cond_7

    .line 10693
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->read_time_page:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_2

    :cond_7
    if-ne v2, v8, :cond_8

    .line 10694
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->turn_pages_hour:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_2

    .line 10695
    :cond_8
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->read_hour_day:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 10687
    :goto_2
    invoke-virtual {v7, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10696
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->c1:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 10697
    const-string v5, ""

    if-nez v2, :cond_9

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getBookCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_4

    :cond_9
    if-ne v2, v13, :cond_a

    .line 10698
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getReadBookCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_4

    .line 10699
    :cond_a
    const-string v7, "0.0"

    if-ne v2, v12, :cond_b

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/text/DecimalFormat;

    invoke-direct {v3, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sget-wide v5, Lcom/flyersoft/tools/A;->statistics_time:J

    long-to-float v5, v5

    div-float v5, v5, v16

    div-float v5, v5, v16

    div-float v5, v5, v17

    float-to-double v5, v5

    invoke-virtual {v3, v5, v6}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_4

    .line 10700
    :cond_b
    const-string v12, "0"

    if-ne v2, v11, :cond_c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/text/DecimalFormat;

    invoke-direct {v3, v12}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sget-wide v7, Lcom/flyersoft/tools/A;->statistics_words:J

    long-to-float v5, v7

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-virtual {v3, v5, v6}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_4

    :cond_c
    if-ne v2, v10, :cond_d

    .line 10701
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v5, Lcom/flyersoft/tools/A;->statistics_pages:J

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    :cond_d
    if-ne v2, v9, :cond_f

    .line 10702
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v5, Lcom/flyersoft/tools/A;->statistics_pages:J

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-nez v3, :cond_e

    goto :goto_3

    :cond_e
    sget-wide v5, Lcom/flyersoft/tools/A;->statistics_time:J

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    sget-wide v7, Lcom/flyersoft/tools/A;->statistics_pages:J

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    :goto_3
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    :cond_f
    if-ne v2, v8, :cond_10

    .line 10703
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/text/DecimalFormat;

    invoke-direct {v5, v12}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sget-wide v6, Lcom/flyersoft/tools/A;->statistics_pages:J

    long-to-float v6, v6

    div-float/2addr v6, v3

    float-to-double v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 10704
    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/text/DecimalFormat;

    invoke-direct {v3, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sget-wide v5, Lcom/flyersoft/tools/A;->statistics_time:J

    long-to-float v5, v5

    div-float v5, v5, v16

    div-float v5, v5, v16

    div-float v5, v5, v17

    sget-wide v6, Lcom/flyersoft/tools/A;->statistics_days:J

    long-to-float v6, v6

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-virtual {v3, v5, v6}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 10696
    :goto_4
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10705
    sget-boolean v2, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v2, :cond_11

    .line 10706
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->c1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/high16 v2, 0x41f00000    # 30.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    :cond_11
    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 2

    .line 10538
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    .line 10539
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public doSelectChange(IIZ)V
    .locals 1

    if-ltz p1, :cond_2

    .line 10564
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-gt p1, p2, :cond_1

    .line 10567
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    aput-boolean p3, v0, p1

    const/4 v0, 0x0

    .line 10568
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 10570
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 10571
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->getSelectedCount()I

    move-result p1

    .line 10572
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_2

    .line 10574
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_2
    :goto_1
    return-void
.end method

.method public getItemCount()I
    .locals 2

    .line 10670
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 10676
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    :cond_0
    const/16 v0, 0x8

    return v0

    .line 10672
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 10673
    :cond_2
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 10674
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->favFolderList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 10675
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentFavBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 10524
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 10525
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

    .line 10511
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    array-length v0, v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 10512
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    .line 10513
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 10514
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 10515
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_1

    .line 10516
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

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

.method public inverseChecked(I)V
    .locals 4

    .line 10543
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 10545
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 10546
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 10547
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->getSelectedCount()I

    move-result v0

    .line 10548
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    if-nez v0, :cond_1

    .line 10550
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_1
    const/4 v0, 0x0

    .line 10551
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 11

    .line 10597
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    .line 10598
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    iput p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->position:I

    .line 10599
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v1, 0x0

    if-nez p2, :cond_1

    sget-boolean v2, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v2, :cond_0

    const/high16 v2, 0x41000000    # 8.0f

    goto :goto_0

    :cond_0
    const/high16 v2, 0x40c00000    # 6.0f

    :goto_0
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    iput v2, p1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->leftMargin:I

    .line 10601
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    const/4 v2, 0x2

    if-eq p1, v2, :cond_16

    const/4 v2, 0x3

    if-eq p1, v2, :cond_15

    const/4 v2, 0x5

    if-eq p1, v2, :cond_14

    const/4 v2, 0x4

    const/4 v3, 0x1

    if-ne p1, v2, :cond_2

    .line 10624
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkBooks:Ljava/util/ArrayList;

    :goto_2
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_3

    :cond_2
    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentFavBooks:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    goto :goto_3

    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_2

    .line 10625
    :goto_3
    iget v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    if-ne v4, v3, :cond_4

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->recentFavBooks:Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$BookInfo;

    goto :goto_4

    :cond_4
    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v4

    .line 10626
    :goto_4
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->cover:Landroid/widget/ImageView;

    check-cast v6, Lcom/facebook/drawee/view/SimpleDraweeView;

    iget-object v7, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    invoke-virtual {v5, v6, p1, v1, v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 10627
    iget v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    if-ne v5, v3, :cond_5

    .line 10628
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->cover:Landroid/widget/ImageView;

    check-cast v5, Lcom/flyersoft/views/ShelfImageView;

    invoke-virtual {v5, v4}, Lcom/flyersoft/views/ShelfImageView;->setCloudIcon(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 10630
    :cond_5
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget v6, Lcom/flyersoft/moonreaderp/R$id;->gauge:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;

    const/16 v6, 0x8

    .line 10631
    invoke-virtual {v5, v6}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setVisibility(I)V

    .line 10632
    sget-boolean v6, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    if-eqz v6, :cond_9

    .line 10633
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getPositionSp()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 10634
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getPositionSp()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, ""

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 10635
    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_9

    .line 10636
    sget-boolean v8, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v8, :cond_6

    .line 10637
    invoke-virtual {v5}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    const/high16 v9, 0x42200000    # 40.0f

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v10

    iput v10, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10638
    invoke-virtual {v5}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    iput v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 v8, 0x41200000    # 10.0f

    .line 10639
    invoke-virtual {v5, v8}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setTextSize(F)V

    .line 10641
    :cond_6
    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    add-int/2addr v7, v3

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v6

    .line 10642
    invoke-virtual {v5, v1}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setVisibility(I)V

    if-gez v6, :cond_7

    const/4 v7, 0x0

    goto :goto_5

    :cond_7
    move v7, v6

    .line 10643
    :goto_5
    invoke-virtual {v5, v7}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setProgress(I)V

    if-gez v6, :cond_8

    .line 10644
    const-string v6, "0%"

    goto :goto_6

    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "%"

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_6
    invoke-virtual {v5, v6}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setText(Ljava/lang/CharSequence;)V

    .line 10649
    :cond_9
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getVisibility()I

    move-result v5

    if-nez v5, :cond_a

    .line 10650
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v6, p1, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10651
    :cond_a
    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v5, :cond_b

    .line 10652
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->menuB:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v6, 0x40a00000    # 5.0f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    iput v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 10653
    :cond_b
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->menuB:Landroid/view/View;

    iget v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    if-ne v6, v2, :cond_c

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_7

    :cond_c
    if-ne v6, v3, :cond_d

    move-object p1, v4

    :cond_d
    :goto_7
    invoke-virtual {v5, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 10655
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    array-length v2, p1

    if-ge p2, v2, :cond_e

    aget-boolean p1, p1, p2

    if-eqz p1, :cond_e

    const/4 v1, 0x1

    .line 10656
    :cond_e
    sget-boolean p1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz p1, :cond_10

    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_10

    .line 10657
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/cardview/widget/CardView;

    if-eqz v1, :cond_f

    const p2, 0x882d0ec

    goto :goto_8

    .line 10658
    :cond_f
    invoke-static {}, Lcom/flyersoft/tools/C;->getDashRoundLayColor()I

    move-result p2

    .line 10657
    :goto_8
    invoke-virtual {p1, p2}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 10659
    :cond_10
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x17

    if-lt p1, p2, :cond_12

    .line 10660
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    sget p2, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 10661
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    if-eqz v1, :cond_11

    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    const v0, 0x502196f3

    invoke-direct {p2, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_9

    :cond_11
    const/4 p2, 0x0

    :goto_9
    invoke-static {p1, p2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 10663
    :cond_12
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    if-eqz v1, :cond_13

    .line 10664
    sget p2, Lcom/flyersoft/material/components/icons/R$drawable;->list_selector_background_transition_holo_dark:I

    goto :goto_a

    :cond_13
    sget p2, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    .line 10663
    :goto_a
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 10603
    :cond_14
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->base:Landroid/view/View;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->fillStatisticsInfo(Landroid/view/View;I)V

    return-void

    .line 10607
    :cond_15
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsSite;

    .line 10608
    iget-object p2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->cover:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/opds/N;->getLibraryImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10609
    iget-object p2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 10613
    :cond_16
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->favFolderList:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 10614
    iget-object p2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->cover:Landroid/widget/ImageView;

    sget-object v1, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->webdav:I

    goto :goto_b

    .line 10615
    :cond_17
    sget-object v1, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->dropbox:I

    goto :goto_b

    .line 10616
    :cond_18
    sget-object v1, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->gdrive:I

    goto :goto_b

    .line 10617
    :cond_19
    sget-object v1, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->ftp:I

    goto :goto_b

    .line 10618
    :cond_1a
    invoke-static {p1}, Lcom/flyersoft/tools/miscellaneous/SD;->isSDPath(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->extsdcard:I

    goto :goto_b

    .line 10619
    :cond_1b
    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->sdcardfolder:I

    .line 10614
    :goto_b
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 10620
    iget-object p2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->bookName2:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    .line 10587
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    .line 10588
    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->recent_statistics_item:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    if-ne p2, v0, :cond_1

    .line 10589
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->recent_library_item:I

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p2, v0, :cond_2

    .line 10590
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->recent_files_item:I

    goto :goto_0

    .line 10591
    :cond_2
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->recent_grid_item:I

    :goto_0
    const/4 v0, 0x0

    .line 10587
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 10592
    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->height:I

    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->type:I

    invoke-direct {p2, v0, p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;II)V

    return-object p2
.end method

.method public selectAll()V
    .locals 3

    const/4 v0, 0x0

    .line 10531
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_0

    const/4 v2, 0x1

    .line 10532
    aput-boolean v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 10533
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 10534
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public setChecked(I)V
    .locals 3

    .line 10555
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 10557
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 10558
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 10559
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 10560
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
