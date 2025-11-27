.class public Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;
.super Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FilesAdapter"
.end annotation


# instance fields
.field public checked:[Z

.field onCoverClick:Landroid/view/View$OnClickListener;

.field onFileClick:Landroid/view/View$OnClickListener;

.field onFileLongClick:Landroid/view/View$OnLongClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method static bridge synthetic -$$Nest$mgetView(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;ILandroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getView(ILandroid/view/View;)V

    return-void
.end method

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

    .line 1492
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 1610
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 1732
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onCoverClick:Landroid/view/View$OnClickListener;

    .line 1744
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFileClick:Landroid/view/View$OnClickListener;

    .line 1755
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFileLongClick:Landroid/view/View$OnLongClickListener;

    .line 1770
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    .line 1493
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    return-void
.end method

.method private fillItemData(ILandroid/view/View;)V
    .locals 25

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    if-nez v2, :cond_0

    return-void

    .line 1625
    :cond_0
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    if-le v1, v3, :cond_1

    const/4 v1, 0x4

    .line 1626
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1
    const/4 v3, 0x0

    .line 1630
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1631
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v6, v5

    if-le v6, v1, :cond_2

    aget-boolean v5, v5, v1

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_3

    .line 1633
    sget v6, Lcom/flyersoft/material/components/icons/R$drawable;->list_selector_background_transition_holo_dark:I

    invoke-virtual {v2, v6}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    .line 1635
    :cond_3
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1637
    :goto_1
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->fileImage:I

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/views/ShelfImageView;

    .line 1638
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->fileName:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 1639
    invoke-static {}, Lcom/flyersoft/tools/C;->getFileTitleColor()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1640
    invoke-virtual {v7}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v8

    sget-boolean v9, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v8, v9}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 1642
    iget-object v8, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/T$FileItem;

    iget-object v8, v8, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    .line 1643
    iget-object v9, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/tools/T$FileItem;

    iget-object v9, v9, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    .line 1645
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v10}, Lcom/flyersoft/tools/T$FileItem;->getImageRes()I

    move-result v10

    .line 1646
    sget v11, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    if-eq v10, v11, :cond_5

    sget v11, Lcom/flyersoft/moonreaderp/R$drawable;->aishare:I

    if-ne v10, v11, :cond_4

    goto :goto_2

    :cond_4
    const/4 v11, 0x0

    goto :goto_3

    :cond_5
    :goto_2
    const/4 v11, 0x1

    .line 1648
    :goto_3
    iget-object v12, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v13, Lcom/flyersoft/tools/A;->fileCoverSize:I

    invoke-virtual {v12, v6, v13}, Lcom/flyersoft/moonreaderp/ActivityMain;->resetImageViewHeight(Landroid/widget/ImageView;I)V

    .line 1649
    iget-object v12, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v12, v6, v9, v10, v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->getIconDrawable(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IZ)V

    .line 1651
    sget-boolean v10, Lcom/flyersoft/tools/A;->fileUseGrid:Z

    if-eqz v10, :cond_7

    .line 1652
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1653
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1654
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 1655
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v5, :cond_6

    const v3, -0x383839

    .line 1657
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    goto/16 :goto_1e

    .line 1659
    :cond_6
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto/16 :goto_1e

    .line 1661
    :cond_7
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 1662
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/tools/T$FileItem;

    iget-wide v12, v10, Lcom/flyersoft/tools/T$FileItem;->date:J

    .line 1663
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/tools/T$FileItem;

    iget-wide v14, v10, Lcom/flyersoft/tools/T$FileItem;->size:J

    .line 1665
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->fileDate:I

    invoke-virtual {v2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 1666
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v4, 0x10

    if-le v3, v4, :cond_8

    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v3, v3, -0x6

    int-to-float v3, v3

    goto :goto_4

    :cond_8
    const/high16 v3, 0x41200000    # 10.0f

    :goto_4
    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1668
    invoke-static {v9}, Lcom/flyersoft/tools/A;->isSupportedFile(Ljava/lang/String;)Z

    move-result v3

    .line 1669
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v4

    move/from16 v17, v3

    const-string v3, " - "

    const-string v18, ""

    if-nez v4, :cond_f

    if-eqz v17, :cond_9

    .line 1670
    invoke-static {v8}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    :cond_9
    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_5
    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1671
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v8, Lcom/flyersoft/tools/A;->files_type:I

    move/from16 v19, v11

    const/16 v11, 0xa

    if-eq v8, v11, :cond_b

    sget v8, Lcom/flyersoft/tools/A;->files_type:I

    const/4 v11, 0x7

    if-eq v8, v11, :cond_b

    sget v8, Lcom/flyersoft/tools/A;->files_type:I

    const/4 v11, 0x3

    if-eq v8, v11, :cond_b

    sget v8, Lcom/flyersoft/tools/A;->files_type:I

    const/4 v11, 0x5

    if-ne v8, v11, :cond_a

    goto :goto_6

    :cond_a
    move-object/from16 v8, v18

    goto :goto_7

    .line 1672
    :cond_b
    :goto_6
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\n"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_7
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1673
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/T;->dateTimeToStr2(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v19, :cond_c

    move-object/from16 v8, v18

    goto :goto_8

    .line 1674
    :cond_c
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v11, v14, v15}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_8
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v17, :cond_d

    move-object/from16 v3, v18

    goto :goto_9

    .line 1675
    :cond_d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getFileExt2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_9
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1671
    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez v19, :cond_e

    if-nez v17, :cond_e

    .line 1676
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v3, v3, -0x2

    goto :goto_a

    :cond_e
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    :goto_a
    int-to-float v3, v3

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setTextSize(F)V

    goto/16 :goto_17

    :cond_f
    move/from16 v19, v11

    .line 1680
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1681
    const-string v11, "/"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v20

    const-wide/16 v21, 0x0

    if-nez v20, :cond_18

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v20

    if-eqz v20, :cond_10

    goto/16 :goto_12

    .line 1690
    :cond_10
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v4

    sget v4, Lcom/flyersoft/tools/A;->files_type:I

    move-wide/from16 v23, v12

    const/4 v12, 0x1

    if-ne v4, v12, :cond_11

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v13, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-static {v13, v9, v12}, Lcom/flyersoft/tools/T;->getSubPath(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "<br>"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_b

    :cond_11
    move-object/from16 v4, v18

    :goto_b
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    cmp-long v4, v23, v21

    if-nez v4, :cond_12

    move-object/from16 v4, v18

    goto :goto_c

    .line 1691
    :cond_12
    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->dateTimeToStr2(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v4

    :goto_c
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    cmp-long v3, v14, v21

    if-nez v3, :cond_13

    move-object/from16 v3, v18

    goto :goto_d

    .line 1692
    :cond_13
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3, v14, v15}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    :goto_d
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1693
    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_16

    if-nez v19, :cond_16

    if-nez v17, :cond_14

    goto :goto_f

    .line 1695
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " - <b>"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1694
    invoke-virtual {v0, v9}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getFileExt2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "</b>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v17, :cond_15

    .line 1695
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->getReadProgressText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    :cond_15
    move-object/from16 v4, v18

    :goto_e
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_10

    :cond_16
    :goto_f
    move-object/from16 v3, v18

    :goto_10
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1690
    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v17, :cond_17

    .line 1697
    invoke-static {v9}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_11

    :cond_17
    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_11
    move-object v8, v3

    const/4 v3, 0x0

    goto :goto_15

    :cond_18
    :goto_12
    move-object/from16 v20, v4

    move-wide/from16 v23, v12

    .line 1683
    :try_start_0
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    if-eqz v3, :cond_19

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-virtual {v3, v9}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    goto :goto_13

    .line 1684
    :cond_19
    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    array-length v3, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_13

    :catch_0
    nop

    const/4 v3, 0x0

    :goto_13
    cmp-long v4, v23, v21

    if-nez v4, :cond_1a

    move-object/from16 v4, v18

    goto :goto_14

    .line 1687
    :cond_1a
    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->dateTimeToStr2(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v4

    :goto_14
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1699
    :goto_15
    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1b

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_1b

    if-nez v17, :cond_1b

    .line 1700
    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v4, v4, -0x2

    int-to-float v4, v4

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setTextSize(F)V

    goto :goto_16

    .line 1702
    :cond_1b
    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    int-to-float v4, v4

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setTextSize(F)V

    :goto_16
    if-nez v3, :cond_1c

    .line 1705
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_17

    .line 1707
    :cond_1c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "  <font color=\"#888888\">("

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")</font>"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_17
    if-eqz v19, :cond_20

    .line 1711
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFtp()Z

    move-result v4

    if-eqz v4, :cond_1e

    sget-object v18, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    :cond_1d
    :goto_18
    move-object/from16 v4, v18

    goto :goto_19

    :cond_1e
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWebDav()Z

    move-result v4

    if-eqz v4, :cond_1d

    sget-object v18, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    goto :goto_18

    :goto_19
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1712
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v3}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1f

    .line 1713
    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->favorite1:I

    goto :goto_1a

    :cond_1f
    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->favorite0:I

    :goto_1a
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1b

    .line 1715
    :cond_20
    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->item_overflow3:I

    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1717
    :goto_1b
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1718
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/high16 v3, 0x41000000    # 8.0f

    if-nez v1, :cond_21

    .line 1720
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    goto :goto_1c

    :cond_21
    const/4 v4, 0x0

    .line 1721
    :goto_1c
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/16 v16, 0x1

    add-int/lit8 v5, v5, -0x1

    if-ne v1, v5, :cond_22

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    goto :goto_1d

    :cond_22
    const/4 v3, 0x0

    :goto_1d
    const/4 v5, 0x0

    .line 1720
    invoke-virtual {v2, v5, v4, v5, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 1722
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/flyersoft/views/ShelfImageView;->setTag(Ljava/lang/Object;)V

    .line 1723
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onCoverClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v6, v3}, Lcom/flyersoft/views/ShelfImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1724
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFileLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v6, v3}, Lcom/flyersoft/views/ShelfImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1727
    :goto_1e
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1728
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFileClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1729
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFileLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method private getView(ILandroid/view/View;)V
    .locals 0

    .line 1618
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->fillItemData(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 2

    .line 1553
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    .line 1554
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 1555
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileSelctLay:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method public doSelectChange(IIZ)V
    .locals 1

    if-ltz p1, :cond_3

    .line 1583
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-gt p1, p2, :cond_1

    .line 1586
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    aput-boolean p3, v0, p1

    const/4 v0, 0x0

    .line 1587
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 1589
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 1590
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getSelectedCount()I

    move-result p1

    .line 1591
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_2

    .line 1593
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 1594
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileSelctLay:Landroid/widget/LinearLayout;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void

    .line 1596
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowSelectBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    :cond_3
    :goto_1
    return-void
.end method

.method public getFileExt2(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1604
    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1606
    const-string p1, ""

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 1607
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getFilename(I)Ljava/lang/String;
    .locals 1

    .line 1600
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/T$FileItem;

    iget-object p1, p1, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 1510
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1534
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 1535
    array-length v3, v2

    if-ge v0, v3, :cond_0

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
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1514
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 1515
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1516
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v3, v2

    if-ge v1, v3, :cond_0

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_0

    .line 1517
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/T$FileItem;

    iget-object v2, v2, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public inverseChecked(I)V
    .locals 4

    .line 1559
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1561
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 1562
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 1563
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getSelectedCount()I

    move-result v0

    .line 1564
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    if-nez v0, :cond_1

    .line 1566
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 1567
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileSelctLay:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_1
    const/4 v0, 0x0

    .line 1569
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public isSelectedCloudFolder()Z
    .locals 4

    .line 1523
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    const/4 v0, 0x0

    .line 1524
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 1525
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_2

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_2

    .line 1526
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v0}, Lcom/flyersoft/tools/T$FileItem;->getImageRes()I

    move-result v0

    .line 1527
    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    if-eq v0, v2, :cond_1

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->aishare:I

    if-ne v0, v2, :cond_0

    goto :goto_1

    :cond_0
    return v1

    :cond_1
    :goto_1
    const/4 v0, 0x1

    return v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 1505
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 1498
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 1499
    sget-boolean v0, Lcom/flyersoft/tools/A;->fileUseGrid:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->file_grid:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->file_row:I

    :goto_0
    const/4 v1, 0x0

    .line 1498
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 1500
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public selectAll()V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1542
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    const/4 v3, 0x1

    .line 1544
    aput-boolean v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1546
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 1547
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 1548
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    array-length v0, v0

    if-lez v0, :cond_1

    .line 1549
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowSelectBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    :cond_1
    return-void
.end method

.method public setChecked(I)V
    .locals 3

    .line 1573
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1575
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 1576
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 1577
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 1578
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 1579
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowSelectBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
