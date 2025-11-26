.class Lcom/flyersoft/components/cloud/Dropbox$16;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/core/ObservableOnSubscribe<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$openAfterDownload:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;Landroid/content/Context;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 579
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$con:Landroid/content/Context;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$openAfterDownload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 582
    const-string v0, ".mr"

    const-string v1, "/"

    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-lez v2, :cond_a

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-boolean v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mCanceled:Z

    if-nez v2, :cond_a

    .line 584
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$files:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    .line 585
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 586
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 588
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v2

    invoke-virtual {v2}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v2

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getMetadata(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object v2

    .line 589
    instance-of v4, v2, Lcom/dropbox/core/v2/files/FileMetadata;

    if-nez v4, :cond_1

    goto :goto_0

    .line 592
    :cond_1
    check-cast v2, Lcom/dropbox/core/v2/files/FileMetadata;

    .line 593
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ">>*download 1: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v6, v6, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v6, v3, [Ljava/lang/Object;

    aput-object v4, v6, v5

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 595
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v6

    iput-wide v6, v4, Lcom/flyersoft/components/cloud/Dropbox;->mFileLen:J

    .line 596
    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/FileMetadata;->getName()Ljava/lang/String;

    move-result-object v4

    .line 597
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v8, v7, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 598
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-static {v7, v6}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_2

    .line 599
    iget-object v8, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 600
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_2
    if-nez v7, :cond_3

    .line 601
    iget-object v8, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 602
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_3
    if-nez v7, :cond_4

    .line 603
    iget-object v8, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 604
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    sget-object v10, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 606
    :cond_4
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    sget-object v8, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 607
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$con:Landroid/content/Context;

    const-string v8, "dropbox_cache"

    invoke-virtual {v4, v8, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iget-object v8, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_5
    if-nez v7, :cond_7

    .line 610
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ">>*download 2: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v7, v3, [Ljava/lang/Object;

    aput-object v4, v7, v5

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 611
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 612
    invoke-static {v4}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 613
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 615
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v7}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v7

    invoke-virtual {v7}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v7

    iget-object v8, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/FileMetadata;->getRev()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v8, v2}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->download(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;

    move-result-object v2

    new-instance v7, Lcom/flyersoft/components/cloud/Dropbox$16$1;

    invoke-direct {v7, p0, p1, v5, v6}, Lcom/flyersoft/components/cloud/Dropbox$16$1;-><init>(Lcom/flyersoft/components/cloud/Dropbox$16;Lio/reactivex/rxjava3/core/ObservableEmitter;Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V

    invoke-virtual {v2, v5, v7}, Lcom/dropbox/core/DbxDownloader;->download(Ljava/io/OutputStream;Lcom/dropbox/core/util/IOUtil$ProgressListener;)Ljava/lang/Object;

    .line 627
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 628
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object v2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/flyersoft/tools/T;->appendInputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    .line 629
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 631
    :cond_6
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 632
    invoke-static {v6}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 633
    invoke-static {v4, v6, v3}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto/16 :goto_0

    .line 636
    :cond_7
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 637
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    if-ne v2, v3, :cond_8

    iget-boolean v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->val$openAfterDownload:Z

    if-eqz v2, :cond_8

    .line 638
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    goto/16 :goto_0

    .line 640
    :cond_8
    invoke-static {v7, v6, v3}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 644
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/cloud/Dropbox;->isFolderNotExistError(Ljava/lang/Throwable;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 645
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 646
    :cond_9
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    .line 649
    :cond_a
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
