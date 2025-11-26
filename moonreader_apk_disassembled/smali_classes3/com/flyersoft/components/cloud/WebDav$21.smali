.class Lcom/flyersoft/components/cloud/WebDav$21;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$openAfterDownload:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;Landroid/content/Context;Z)V
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

    .line 711
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$con:Landroid/content/Context;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$openAfterDownload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 714
    const-string v0, "/"

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-lez v1, :cond_a

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-boolean v1, v1, Lcom/flyersoft/components/cloud/WebDav;->mCanceled:Z

    if-nez v1, :cond_a

    .line 716
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$files:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    .line 717
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 718
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 720
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ">>*download 1: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 721
    new-instance v1, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-direct {v1, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    .line 722
    invoke-virtual {v1, v4}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists(Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 723
    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v5

    iput-wide v5, v3, Lcom/flyersoft/components/cloud/WebDav;->mFileLen:J

    .line 724
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 725
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v7, v6, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 726
    iget-object v6, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-static {v6, v5}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_1

    .line 727
    iget-object v7, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    sget-object v8, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 728
    iget-object v6, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_1
    if-nez v6, :cond_2

    .line 729
    iget-object v7, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    sget-object v8, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 730
    iget-object v6, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_2
    if-nez v6, :cond_3

    .line 731
    iget-object v7, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    sget-object v8, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 732
    iget-object v6, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    sget-object v9, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-static {v8, v9}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 734
    :cond_3
    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    sget-object v7, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 735
    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$con:Landroid/content/Context;

    const-string v7, "webdav_cache"

    invoke-virtual {v3, v7, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    iget-object v7, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_4
    if-nez v6, :cond_8

    .line 738
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ">>*download 2: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v6, v6, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "to: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v3, v7, v4

    aput-object v6, v7, v2

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 739
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".mr"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 740
    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 742
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    if-nez v6, :cond_5

    .line 744
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, v1, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->err:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    goto :goto_2

    .line 748
    :cond_5
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v7

    .line 749
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v8

    const/16 v1, 0x2000

    .line 750
    new-array v1, v1, [B

    const-wide/16 v10, 0x0

    .line 752
    :cond_6
    :goto_1
    invoke-virtual {v6, v1}, Ljava/io/InputStream;->read([B)I

    move-result v12

    const/4 v13, -0x1

    if-eq v12, v13, :cond_7

    .line 753
    invoke-virtual {v7, v1, v4, v12}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v12, v12

    add-long/2addr v10, v12

    .line 756
    iget-object v12, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-boolean v12, v12, Lcom/flyersoft/components/cloud/WebDav;->mCanceled:Z

    if-nez v12, :cond_6

    .line 757
    new-instance v12, Lcom/flyersoft/components/cloud/Cloud$Progress;

    invoke-direct {v12, v10, v11, v8, v9}, Lcom/flyersoft/components/cloud/Cloud$Progress;-><init>(JJ)V

    invoke-interface {p1, v12}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 759
    :cond_7
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 761
    invoke-static {v5}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 762
    invoke-static {v3, v5, v2}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto/16 :goto_0

    .line 763
    :cond_8
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 764
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget v1, v1, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

    if-ne v1, v2, :cond_9

    iget-boolean v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->val$openAfterDownload:Z

    if-eqz v1, :cond_9

    .line 765
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    goto/16 :goto_0

    .line 767
    :cond_9
    invoke-static {v6, v5, v2}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 771
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 772
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$21;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    .line 775
    :cond_a
    :goto_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
