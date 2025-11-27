.class Lcom/flyersoft/components/cloud/Dropbox$15;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V
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

    .line 507
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 14

    .line 510
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_2

    .line 511
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 512
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 513
    check-cast p1, Ljava/util/List;

    .line 514
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/dropbox/core/v2/files/Metadata;

    .line 515
    instance-of v4, v3, Lcom/dropbox/core/v2/files/DeletedMetadata;

    if-nez v4, :cond_0

    .line 516
    instance-of v4, v3, Lcom/dropbox/core/v2/files/FileMetadata;

    if-eqz v4, :cond_0

    .line 517
    move-object v4, v3

    check-cast v4, Lcom/dropbox/core/v2/files/FileMetadata;

    .line 518
    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v5

    cmp-long v7, v5, v1

    if-lez v7, :cond_0

    .line 519
    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/Metadata;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/Metadata;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/Metadata;->getPathLower()Ljava/lang/String;

    move-result-object v8

    .line 520
    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/FileMetadata;->getServerModified()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v12

    const/4 v9, -0x1

    invoke-direct/range {v6 .. v13}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 519
    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 523
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 527
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->val$con:Landroid/content/Context;

    iget-object v4, v0, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/flyersoft/components/cloud/Dropbox;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 529
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_9

    .line 530
    check-cast p1, Ljava/util/List;

    .line 532
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 533
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setPathText()V

    .line 535
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    .line 536
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/files/Metadata;

    .line 537
    instance-of v3, v0, Lcom/dropbox/core/v2/files/DeletedMetadata;

    if-nez v3, :cond_3

    .line 538
    sget-boolean v3, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v3, :cond_4

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/Metadata;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 539
    :cond_4
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v4, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/Metadata;->getName()Ljava/lang/String;

    move-result-object v5

    .line 540
    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/Metadata;->getPathLower()Ljava/lang/String;

    move-result-object v6

    .line 541
    instance-of v7, v0, Lcom/dropbox/core/v2/files/FolderMetadata;

    if-eqz v7, :cond_5

    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_2

    :cond_5
    const/4 v7, -0x1

    .line 542
    :goto_2
    instance-of v8, v0, Lcom/dropbox/core/v2/files/FileMetadata;

    if-eqz v8, :cond_6

    move-object v9, v0

    check-cast v9, Lcom/dropbox/core/v2/files/FileMetadata;

    invoke-virtual {v9}, Lcom/dropbox/core/v2/files/FileMetadata;->getServerModified()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    goto :goto_3

    :cond_6
    move-wide v9, v1

    :goto_3
    if-eqz v8, :cond_7

    .line 543
    check-cast v0, Lcom/dropbox/core/v2/files/FileMetadata;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v11

    move-wide v8, v9

    move-wide v10, v11

    goto :goto_4

    :cond_7
    move-wide v8, v9

    move-wide v10, v1

    :goto_4
    invoke-direct/range {v4 .. v11}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 539
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_8
    const/4 p1, 0x2

    .line 546
    sput p1, Lcom/flyersoft/tools/A;->files_type:I

    .line 547
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 548
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 549
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$15;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLvSetSelection(Ljava/lang/String;)Z

    :cond_9
    return-void
.end method
