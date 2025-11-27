.class public Lcom/flyersoft/moonreaderp/PrefFolderPick;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;,
        Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;
    }
.end annotation


# instance fields
.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field backupFileOnly:Z

.field booksOnly:Z

.field dFolderArrow:Landroid/graphics/drawable/Drawable;

.field filenameTv:Landroid/widget/TextView;

.field filter:Ljava/lang/String;

.field folder:Ljava/lang/String;

.field folderList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field folderSV:Landroid/view/View;

.field folderTv:Landroid/widget/TextView;

.field fontsOnly:Z

.field imagesOnly:Z

.field inputFilename:Ljava/lang/String;

.field lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field onGetFolder:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

.field showInputFile:Z

.field soundFileOnly:Z

.field title:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$mcreateAdapter(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->createAdapter(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlistExtSdCards(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->listExtSdCards(Ljava/util/ArrayList;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V
    .locals 1

    .line 54
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->folder_picker:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 47
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->inputFilename:Ljava/lang/String;

    .line 56
    invoke-static {p3}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 57
    sget-object p1, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 58
    :cond_0
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->onGetFolder:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

    .line 59
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    .line 60
    invoke-static {p2}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->title:Ljava/lang/String;

    return-void
.end method

.method private acceptFile(Ljava/lang/String;)Z
    .locals 2

    .line 320
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->booksOnly:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 321
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 324
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->imagesOnly:Z

    if-eqz v0, :cond_1

    .line 325
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 328
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->fontsOnly:Z

    if-eqz v0, :cond_2

    .line 329
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    .line 332
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->backupFileOnly:Z

    if-eqz v0, :cond_3

    .line 333
    const-string v0, ".mrstd"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, ".mrpro"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    .line 336
    :cond_3
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->soundFileOnly:Z

    if-eqz v0, :cond_4

    .line 337
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->isSoundFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    .line 340
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->filter:Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 341
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->filenameMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    return v1

    :cond_5
    const/4 p1, 0x1

    return p1
.end method

.method private createAdapter(Ljava/lang/String;)V
    .locals 4

    .line 194
    const-string v0, "/storage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPaths()Ljava/util/ArrayList;

    move-result-object v0

    .line 196
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 197
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->listExtSdCards(Ljava/util/ArrayList;)V

    return-void

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderTv:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->select_path:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 205
    const-string p1, "/sdcard"

    .line 206
    :cond_1
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->createFolderList(Ljava/lang/String;)V

    .line 207
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    .line 208
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setPath()V

    .line 209
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 211
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private createFolderList(Ljava/lang/String;)V
    .locals 7

    .line 284
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 286
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_3

    .line 288
    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, p1, v3

    .line 289
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    .line 290
    sget-boolean v6, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v6, :cond_0

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 291
    :cond_0
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 292
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 294
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->acceptFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 295
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 298
    :cond_3
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$6;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$6;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-static {v0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 303
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$7;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$7;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-static {v1, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 314
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    .line 315
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 316
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method private initView()V
    .locals 5

    .line 132
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->listSv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 133
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v1, -0x777778

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->b1:Landroid/widget/Button;

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->b2:Landroid/widget/Button;

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->horizontalScrollView1:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderSV:Landroid/view/View;

    .line 143
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->folderTv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderTv:Landroid/widget/TextView;

    .line 144
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->filenameTv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->filenameTv:Landroid/widget/TextView;

    .line 145
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->showInputFile:Z

    const/16 v3, 0x8

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->filenameTv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->inputFilename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->createfolder:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->createfolder:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 151
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v0, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 152
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setBackgroundColor(I)V

    .line 155
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->extsdcard:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bookfolder:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$2;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->downloadfolder:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$3;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private listExtSdCards(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 184
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    .line 185
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 186
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 187
    :cond_0
    const-string p1, "/storage"

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    .line 188
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setPath()V

    .line 189
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->lv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    return-void
.end method

.method private setPath()V
    .locals 13

    .line 218
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderSV:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 219
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->foldersLay:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 220
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 222
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, ""

    const-string v4, "/"

    const/4 v5, 0x1

    if-gt v2, v5, :cond_0

    new-array v2, v5, [Ljava/lang/String;

    aput-object v3, v2, v1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 223
    :goto_0
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefFolderPick$4;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick$4;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V

    .line 240
    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->pathFolderWidth()I

    move-result v7

    .line 241
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->dFolderArrow:Landroid/graphics/drawable/Drawable;

    const/4 v9, -0x1

    if-nez v8, :cond_1

    .line 243
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v10, Lcom/flyersoft/moonreaderp/R$drawable;->arrow2:I

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iput-object v8, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->dFolderArrow:Landroid/graphics/drawable/Drawable;

    .line 244
    invoke-virtual {v8, v9}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 245
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->dFolderArrow:Landroid/graphics/drawable/Drawable;

    div-int/lit8 v10, v7, 0x6

    const/high16 v11, 0x41c00000    # 24.0f

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    invoke-virtual {v8, v1, v1, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_1
    move-object v8, v3

    .line 248
    :goto_1
    array-length v10, v2

    if-ge v1, v10, :cond_5

    .line 249
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-ne v1, v5, :cond_2

    move-object v8, v3

    goto :goto_2

    :cond_2
    move-object v8, v4

    :goto_2
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v8, v2, v1

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 250
    new-instance v10, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 251
    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 252
    aget-object v11, v2, v1

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-nez v11, :cond_3

    move-object v11, v4

    goto :goto_3

    :cond_3
    aget-object v11, v2, v1

    invoke-static {v11}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :goto_3
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v11, 0x11

    .line 253
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 254
    sget-boolean v11, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v11, :cond_4

    const/high16 v11, 0x41500000    # 13.0f

    goto :goto_4

    :cond_4
    const/high16 v11, 0x41400000    # 12.0f

    :goto_4
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 256
    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 257
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 258
    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 259
    sget v11, Lcom/flyersoft/material/components/icons/R$drawable;->my_about_selector:I

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 260
    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 261
    iget-object v11, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->dFolderArrow:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x0

    invoke-virtual {v10, v12, v12, v11, v12}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 262
    new-instance v11, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v11, v7, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 264
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderSV:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$5;

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick$5;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;[Ljava/lang/String;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method protected getUpFolder(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 273
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    goto :goto_0

    .line 274
    :cond_0
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    :goto_0
    move-object v1, v0

    .line 275
    :goto_1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x18

    if-lt v3, v4, :cond_2

    const/4 v2, 0x1

    :cond_2
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    and-int/2addr v0, v2

    if-eqz v0, :cond_5

    .line 276
    const-string v0, "/storage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "/sdcard"

    goto :goto_2

    :cond_3
    move-object p1, v0

    .line 277
    :goto_2
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 278
    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPath()Ljava/lang/String;

    move-result-object p1

    :cond_4
    return-object p1

    :cond_5
    return-object v1
.end method

.method public isSoundFile(Ljava/lang/String;)Z
    .locals 2

    .line 554
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 555
    const-string v0, ".mp3"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".3gp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".flac"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, ".aac"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 556
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".mid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".wav"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".ogg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 360
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->b1:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    .line 365
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->onGetFolder:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

    if-eqz v0, :cond_1

    .line 366
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->showInputFile:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->filenameTv:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const-string v2, ""

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;->onGetFolder(Ljava/lang/String;)V

    .line 367
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->dismiss()V

    .line 370
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->b2:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 371
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->cancel()V

    .line 373
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->createfolder:I

    if-ne p1, v0, :cond_4

    .line 374
    new-instance p1, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 375
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 376
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->new_folder:I

    .line 377
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 378
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 379
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 395
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_4
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 72
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 73
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->initView()V

    .line 74
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f666666    # 0.9f

    .line 75
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 76
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 77
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->title:Ljava/lang/String;

    .line 79
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 80
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 83
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/tools/C;->headerSubColor()I

    move-result v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 84
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->base:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefOptions;->getHeaderScrollEvent()Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->createAdapter(Ljava/lang/String;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 350
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    const-string p2, "/"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 351
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getUpFolder(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 352
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->createAdapter(Ljava/lang/String;)V

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 356
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefOptions;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public setBackupFileOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 114
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->backupFileOnly:Z

    return-object p0
.end method

.method public setBooksOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 99
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->booksOnly:Z

    return-object p0
.end method

.method public setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->filter:Ljava/lang/String;

    return-object p0
.end method

.method public setFontsOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 109
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->fontsOnly:Z

    return-object p0
.end method

.method public setImagesOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 104
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->imagesOnly:Z

    return-object p0
.end method

.method public setInputFile(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 94
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->inputFilename:Ljava/lang/String;

    const/4 p1, 0x1

    .line 95
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setShowInputFile(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    return-object p1
.end method

.method public setShowInputFile(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 89
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->showInputFile:Z

    return-object p0
.end method

.method public setSoundFileOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;
    .locals 0

    .line 124
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->soundFileOnly:Z

    const/4 p1, 0x1

    .line 125
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setShowInputFile(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    return-object p1
.end method

.method public show()V
    .locals 1

    const/4 v0, 0x1

    .line 65
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 67
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->show()V

    return-void
.end method
