.class Lcom/flyersoft/components/cloud/Dropbox$13;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/functions/Consumer<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 410
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 14

    .line 413
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$con:Landroid/content/Context;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/cloud/Dropbox;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 414
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_7

    .line 415
    check-cast p1, Lcom/dropbox/core/v2/files/SearchResult;

    .line 416
    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/SearchResult;->getMatches()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 417
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$con:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 419
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    .line 420
    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/SearchResult;->getMatches()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/files/SearchMatch;

    .line 421
    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/SearchMatch;->getMetadata()Lcom/dropbox/core/v2/files/Metadata;

    move-result-object v1

    .line 422
    instance-of v2, v1, Lcom/dropbox/core/v2/files/DeletedMetadata;

    if-nez v2, :cond_1

    .line 423
    sget-boolean v2, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v2, :cond_2

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/Metadata;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 424
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v3, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/Metadata;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/Metadata;->getPathLower()Ljava/lang/String;

    move-result-object v5

    .line 425
    instance-of v6, v1, Lcom/dropbox/core/v2/files/FolderMetadata;

    if-eqz v6, :cond_3

    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_1

    :cond_3
    const/4 v6, -0x1

    .line 426
    :goto_1
    instance-of v7, v1, Lcom/dropbox/core/v2/files/FileMetadata;

    const-wide/16 v8, 0x0

    if-eqz v7, :cond_4

    move-object v10, v1

    check-cast v10, Lcom/dropbox/core/v2/files/FileMetadata;

    invoke-virtual {v10}, Lcom/dropbox/core/v2/files/FileMetadata;->getServerModified()Ljava/util/Date;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    goto :goto_2

    :cond_4
    move-wide v10, v8

    :goto_2
    if-eqz v7, :cond_5

    .line 427
    check-cast v1, Lcom/dropbox/core/v2/files/FileMetadata;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v8

    :cond_5
    move-wide v12, v10

    move-wide v9, v8

    move-wide v7, v12

    invoke-direct/range {v3 .. v10}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 424
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_6
    const/4 v0, 0x3

    .line 430
    sput v0, Lcom/flyersoft/tools/A;->files_type:I

    .line 431
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v2, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 432
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 433
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\" "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$13;->val$con:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/SearchResult;->getMatches()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setFileSearchResult(Ljava/lang/String;)V

    :cond_7
    return-void
.end method
