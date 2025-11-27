.class Lcom/flyersoft/components/cloud/Dropbox$18;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
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

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$forUploadBookFile:Z

.field final synthetic val$fromPath:Ljava/lang/String;

.field final synthetic val$ignoreExists:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 721
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$fromPath:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$ignoreExists:Z

    iput-boolean p5, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$forUploadBookFile:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 724
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mCanceled:Z

    if-nez v0, :cond_3

    .line 726
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$files:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    .line 727
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 728
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 730
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$fromPath:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 731
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_2

    .line 734
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ">>*check if upload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v1, [Ljava/lang/Object;

    aput-object v4, v5, v3

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 735
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v4

    invoke-virtual {v4}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getMetadata(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object v4

    check-cast v4, Lcom/dropbox/core/v2/files/FileMetadata;

    .line 736
    iget-boolean v5, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$ignoreExists:Z

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_1

    :goto_1
    const/4 v2, 0x0

    goto :goto_2

    .line 738
    :cond_1
    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/FileMetadata;->getSize()J

    move-result-wide v4

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long v8, v4, v6

    if-nez v8, :cond_2

    goto :goto_1

    :catchall_0
    nop

    :cond_2
    :goto_2
    if-eqz v2, :cond_0

    .line 744
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ">>*confirm upload: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v4, v1, [Ljava/lang/Object;

    aput-object v2, v4, v3

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 745
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v2

    .line 746
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 747
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v5}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v5

    invoke-virtual {v5}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadBuilder;

    move-result-object v0

    sget-object v5, Lcom/dropbox/core/v2/files/WriteMode;->OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode;

    invoke-virtual {v0, v5}, Lcom/dropbox/core/v2/files/UploadBuilder;->withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/UploadBuilder;

    move-result-object v0

    new-instance v5, Lcom/flyersoft/components/cloud/Dropbox$18$1;

    invoke-direct {v5, p0, p1, v2, v3}, Lcom/flyersoft/components/cloud/Dropbox$18$1;-><init>(Lcom/flyersoft/components/cloud/Dropbox$18;Lio/reactivex/rxjava3/core/ObservableEmitter;J)V

    invoke-virtual {v0, v4, v5}, Lcom/dropbox/core/v2/files/UploadBuilder;->uploadAndFinish(Ljava/io/InputStream;Lcom/dropbox/core/util/IOUtil$ProgressListener;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    .line 757
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 758
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    .line 761
    :cond_3
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$forUploadBookFile:Z

    if-nez v0, :cond_4

    .line 762
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_4
    return-void
.end method
