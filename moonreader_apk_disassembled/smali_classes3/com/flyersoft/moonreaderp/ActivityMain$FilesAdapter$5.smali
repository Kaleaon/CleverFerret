.class Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1770
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 13

    .line 1772
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1773
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1774
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/T$FileItem;

    iget-object v4, v4, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    .line 1775
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v3}, Lcom/flyersoft/tools/T$FileItem;->getImageRes()I

    move-result v3

    .line 1776
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v3

    goto :goto_2

    .line 1777
    :cond_1
    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    if-eq v3, v5, :cond_3

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->aishare:I

    if-ne v3, v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v3, 0x1

    :goto_2
    if-eqz v3, :cond_8

    .line 1780
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/tools/A;->files_from:I

    invoke-static {v3}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1781
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_4

    const/4 v1, 0x1

    .line 1782
    :cond_4
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileColumn:I

    if-ne v3, v2, :cond_6

    if-eqz v1, :cond_5

    .line 1784
    invoke-static {v0}, Lcom/flyersoft/tools/A;->addFavFolder(Ljava/lang/String;)V

    .line 1785
    check-cast p1, Landroid/widget/ImageView;

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->favorite1:I

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    .line 1787
    :cond_5
    invoke-static {v0}, Lcom/flyersoft/tools/A;->deleteFavFolder(Ljava/lang/String;)V

    .line 1788
    check-cast p1, Landroid/widget/ImageView;

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->favorite0:I

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1790
    :goto_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFilesRvAdapter()V

    return-void

    .line 1792
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    if-eqz v1, :cond_7

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->add_to_favorites:I

    goto :goto_4

    :cond_7
    sget v3, Lcom/flyersoft/moonreaderp/R$string;->remove_frome_favorites:I

    :goto_4
    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1793
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    .line 1794
    new-instance v3, Lcom/flyersoft/components/MyMenu;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;

    invoke-direct {v4, p0, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;ZLjava/lang/String;)V

    invoke-virtual {v3, v2, v4}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 1808
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void

    .line 1811
    :cond_8
    sget v3, Lcom/flyersoft/tools/A;->files_type:I

    const/4 v5, 0x2

    if-ne v3, v2, :cond_9

    const/4 v3, 0x2

    goto :goto_5

    :cond_9
    const/4 v3, 0x0

    .line 1812
    :goto_5
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v6

    const/4 v7, 0x6

    if-nez v6, :cond_a

    const/4 v6, 0x6

    goto :goto_6

    :cond_a
    if-eqz v0, :cond_b

    const/16 v6, 0xa

    goto :goto_6

    :cond_b
    const/16 v6, 0x9

    :goto_6
    add-int/2addr v6, v3

    new-array v6, v6, [Ljava/lang/String;

    .line 1814
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v8

    const-string v9, " "

    if-eqz v8, :cond_c

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    :goto_7
    invoke-virtual {v8, v10}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_8

    :cond_c
    invoke-static {v4}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->save_to_shelf:I

    goto :goto_7

    :cond_d
    move-object v8, v9

    :goto_8
    aput-object v8, v6, v3

    .line 1815
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v8

    if-eqz v8, :cond_e

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_e

    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v8

    if-nez v8, :cond_e

    .line 1816
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v10, "#html#"

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v10, v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "("

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v12, Lcom/flyersoft/moonreaderp/R$string;->save_to_shelf:I

    invoke-virtual {v11, v12}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/flyersoft/components/MyMenu;->addItemDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v3

    :cond_e
    add-int/lit8 v8, v3, 0x1

    .line 1818
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$array;->file_related:I

    invoke-static {v10, v11, v7}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    add-int/lit8 v7, v3, 0x2

    .line 1819
    const-string v8, "-"

    aput-object v8, v6, v7

    add-int/lit8 v7, v3, 0x3

    .line 1820
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$array;->file_related:I

    const/4 v12, 0x3

    invoke-static {v10, v11, v12}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v7

    .line 1821
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v10}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v10

    if-nez v10, :cond_f

    .line 1822
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v11, v6, v7

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " | "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v12, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v11, v12}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v7

    :cond_f
    add-int/lit8 v7, v3, 0x4

    .line 1823
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$array;->file_related:I

    const/4 v12, 0x4

    invoke-static {v10, v11, v12}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v7

    add-int/lit8 v7, v3, 0x5

    .line 1824
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$array;->file_related:I

    const/4 v12, 0x5

    invoke-static {v10, v11, v12}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v7

    .line 1826
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v7

    if-eqz v7, :cond_12

    add-int/lit8 v7, v3, 0x6

    .line 1827
    aput-object v8, v6, v7

    add-int/lit8 v7, v3, 0x7

    .line 1828
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    invoke-virtual {v10, v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v7

    add-int/lit8 v7, v3, 0x8

    .line 1829
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v11, Lcom/flyersoft/moonreaderp/R$array;->file_related:I

    invoke-static {v10, v11, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v7

    if-eqz v0, :cond_11

    add-int/lit8 v0, v3, 0x9

    .line 1831
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_10

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {v5, v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v9

    :cond_10
    aput-object v9, v6, v0

    :cond_11
    if-lez v3, :cond_12

    .line 1833
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->open_folder:I

    invoke-virtual {v0, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v1

    .line 1834
    aput-object v8, v6, v2

    .line 1838
    :cond_12
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;

    invoke-direct {v1, p0, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;ILjava/lang/String;)V

    invoke-virtual {v0, v6, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 1883
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
