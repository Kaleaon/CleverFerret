.class Lcom/flyersoft/components/cloud/WebDav$20;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V
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

    .line 640
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$20;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 11

    .line 643
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-eqz v0, :cond_3

    .line 644
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 645
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 646
    check-cast p1, Ljava/util/List;

    .line 647
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    .line 648
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    .line 649
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/tools/T$FileItem;

    .line 650
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v5

    .line 651
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getLastModified()J

    move-result-wide v7

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v9

    const/4 v6, -0x1

    invoke-direct/range {v3 .. v10}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 649
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 652
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 654
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 658
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->val$con:Landroid/content/Context;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/cloud/WebDav;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 660
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_8

    .line 661
    check-cast p1, Ljava/util/List;

    .line 663
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    const-string v1, "https:/dav"

    const-string v2, "https://dav"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 664
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 665
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 667
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 669
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 670
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setPathText()V

    .line 672
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    .line 673
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    .line 674
    sget-boolean v1, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v1, :cond_5

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_2

    .line 676
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    .line 677
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v4

    .line 678
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_6

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_3

    :cond_6
    const/4 v5, -0x1

    .line 679
    :goto_3
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getLastModified()J

    move-result-wide v6

    .line 680
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v8

    invoke-direct/range {v2 .. v9}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 676
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_7
    const/4 p1, 0x6

    .line 683
    sput p1, Lcom/flyersoft/tools/A;->files_type:I

    .line 684
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 685
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 686
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$20;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->webDavBookPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLvSetSelection(Ljava/lang/String;)Z

    :cond_8
    return-void
.end method
