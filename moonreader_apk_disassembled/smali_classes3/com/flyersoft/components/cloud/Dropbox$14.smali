.class Lcom/flyersoft/components/cloud/Dropbox$14;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


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
        "Lio/reactivex/rxjava3/core/ObservableOnSubscribe<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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

    .line 460
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 463
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->val$path:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/components/cloud/Dropbox;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 464
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, ""

    if-eqz v0, :cond_0

    move-object v0, v2

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 465
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "dir:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 467
    :try_start_0
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v3}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v3

    invoke-virtual {v3}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object v3

    .line 468
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lcom/flyersoft/components/cloud/Dropbox;->getDropboxResultFiles(Lcom/dropbox/core/v2/DbxClientV2;Lcom/dropbox/core/v2/files/ListFolderResult;)Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_1

    .line 469
    new-instance v3, Ljava/lang/Throwable;

    invoke-direct {v3}, Ljava/lang/Throwable;-><init>()V

    :cond_1
    invoke-interface {p1, v3}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v3

    .line 472
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 473
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-eqz v4, :cond_2

    .line 474
    invoke-interface {p1, v3}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void

    .line 477
    :cond_2
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-boolean v4, v4, Lcom/flyersoft/components/cloud/Dropbox;->mCanceled:Z

    if-eqz v4, :cond_3

    .line 478
    invoke-interface {p1, v3}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void

    .line 481
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v4, v3}, Lcom/flyersoft/components/cloud/Dropbox;->isFolderNotExistError(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 483
    :try_start_1
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v4

    invoke-virtual {v4}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolderV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/CreateFolderResult;

    .line 484
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v4

    invoke-virtual {v4}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object v4

    .line 485
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v5}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v6

    invoke-virtual {v5, v6, v4}, Lcom/flyersoft/components/cloud/Dropbox;->getDropboxResultFiles(Lcom/dropbox/core/v2/DbxClientV2;Lcom/dropbox/core/v2/files/ListFolderResult;)Ljava/util/List;

    move-result-object v4

    if-nez v4, :cond_4

    .line 486
    new-instance v4, Ljava/lang/Throwable;

    invoke-direct {v4}, Ljava/lang/Throwable;-><init>()V

    :cond_4
    invoke-interface {p1, v4}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v4

    .line 489
    invoke-static {v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 491
    :cond_5
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    .line 492
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_7

    invoke-static {}, Lcom/flyersoft/tools/A;->isNetworkConnecting()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 494
    :try_start_2
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object v1, v0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 495
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object v0

    .line 496
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$14;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/components/cloud/Dropbox;->getDropboxResultFiles(Lcom/dropbox/core/v2/DbxClientV2;Lcom/dropbox/core/v2/files/ListFolderResult;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_6

    .line 497
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    :cond_6
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :goto_1
    return-void

    :catchall_2
    move-exception v0

    .line 500
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 503
    :cond_7
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
