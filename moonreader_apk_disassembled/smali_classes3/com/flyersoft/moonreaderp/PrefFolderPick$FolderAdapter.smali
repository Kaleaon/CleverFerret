.class public Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefFolderPick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FolderAdapter"
.end annotation


# instance fields
.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onOpClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;


# direct methods
.method static bridge synthetic -$$Nest$mdeleteBackup(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->deleteBackup(I)V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 400
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 413
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 497
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 518
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->onOpClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private deleteBackup(I)V
    .locals 2

    .line 547
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 548
    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 549
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 426
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 430
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 422
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 11

    .line 438
    check-cast p2, Landroid/widget/LinearLayout;

    .line 440
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    .line 441
    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 443
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    .line 444
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v2

    .line 446
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->siteName:I

    invoke-virtual {p2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 447
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    invoke-virtual {p2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/ShelfImageView;

    .line 449
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {p2, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 450
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v7, v7, Lcom/flyersoft/moonreaderp/PrefFolderPick;->backupFileOnly:Z

    const/4 v8, 0x0

    if-eqz v7, :cond_0

    if-nez v2, :cond_0

    const/4 v7, 0x0

    goto :goto_0

    :cond_0
    const/16 v7, 0x8

    :goto_0
    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 451
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 452
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v7, v7, Lcom/flyersoft/moonreaderp/PrefFolderPick;->backupFileOnly:Z

    if-eqz v7, :cond_1

    .line 453
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->onOpClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 455
    :cond_1
    invoke-virtual {v5, v8, v8, v8, v8}, Lcom/flyersoft/views/ShelfImageView;->setPadding(IIII)V

    .line 456
    invoke-virtual {v5, v8}, Lcom/flyersoft/views/ShelfImageView;->setVisibility(I)V

    if-eqz v0, :cond_3

    .line 457
    sget-boolean v6, Lcom/flyersoft/tools/A;->amoled:Z

    if-nez v6, :cond_2

    const v6, -0x666667

    goto :goto_1

    :cond_2
    const v6, -0x858586

    goto :goto_1

    :cond_3
    const v6, -0xaaaaab

    .line 458
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 461
    const-string v8, "res:///"

    if-eqz v2, :cond_7

    .line 462
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/flyersoft/views/ShelfImageView;->setImageURI(Landroid/net/Uri;)V

    const/high16 v5, 0x41800000    # 16.0f

    .line 463
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz v0, :cond_4

    const v5, -0x111112

    goto :goto_2

    :cond_4
    const v5, -0xbdbdbe

    .line 464
    :goto_2
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 465
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 466
    array-length v6, v5

    if-lez v6, :cond_b

    .line 467
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, " <font color=\"#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_6

    .line 468
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-nez v0, :cond_5

    const-string v0, "999999"

    goto :goto_3

    :cond_5
    const-string v0, "7a7a7a"

    goto :goto_3

    :cond_6
    const-string v0, "555555"

    :goto_3
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\">("

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v0, v5

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")</font>"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 467
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    move-object v1, v0

    goto/16 :goto_4

    .line 469
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->soundFileOnly:Z

    const/high16 v9, 0x41600000    # 14.0f

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->isSoundFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 470
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->speaker:I

    invoke-virtual {v5, v0}, Lcom/flyersoft/views/ShelfImageView;->setImageResource(I)V

    .line 471
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 472
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_4

    .line 474
    :cond_8
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 475
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 476
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->imagesOnly:Z

    if-eqz v0, :cond_9

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 477
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/flyersoft/views/ShelfImageView;->setImageURI(Landroid/net/Uri;)V

    goto :goto_4

    .line 478
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->booksOnly:Z

    if-eqz v0, :cond_a

    invoke-static {v7}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 479
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Lcom/flyersoft/tools/A;->getFileIcon(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/flyersoft/views/ShelfImageView;->setImageURI(Landroid/net/Uri;)V

    goto :goto_4

    :cond_a
    const/4 v0, 0x4

    .line 481
    invoke-virtual {v5, v0}, Lcom/flyersoft/views/ShelfImageView;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    .line 484
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 487
    :cond_b
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->backupFileOnly:Z

    if-eqz v0, :cond_c

    if-nez v2, :cond_c

    .line 488
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "<br>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    .line 489
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v2, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    .line 488
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    .line 490
    :cond_c
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 493
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 494
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 410
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 404
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->folder_item:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 405
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
