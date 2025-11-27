.class Lcom/flyersoft/components/cloud/Gdrive$15;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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

    .line 1018
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1022
    const-string v0, "Shared with me"

    .line 0
    const-string v1, "\'"

    const-string v2, "dir:"

    .line 1022
    :try_start_0
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->val$path:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 1023
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/flyersoft/components/cloud/Gdrive;->hasSharedWithMe:Z

    .line 1024
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1028
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v5, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1029
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/flyersoft/components/cloud/Gdrive;->createGdriveFolder(Ljava/lang/String;)Z

    .line 1030
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1033
    :goto_0
    const-string v5, "/"

    if-nez v3, :cond_5

    :try_start_1
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v6, v0}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_1

    .line 1045
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-eqz v0, :cond_3

    .line 1046
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 1047
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->isNetworkConnecting()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1048
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object v5, v0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 1049
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 1051
    :cond_4
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 1034
    :cond_5
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Object;

    aput-object v2, v7, v4

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1035
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-string v7, "sharedWithMe and trashed=false"

    if-eqz v3, :cond_6

    move-object v0, v7

    goto :goto_2

    .line 1036
    :cond_6
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' in parents and trashed=false"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1035
    :goto_2
    invoke-static {v2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 1037
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_9

    .line 1039
    :cond_7
    :try_start_3
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-static {v2, v7}, Lcom/flyersoft/components/cloud/Gdrive;->getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_8

    const/4 v4, 0x1

    :cond_8
    iput-boolean v4, v1, Lcom/flyersoft/components/cloud/Gdrive;->hasSharedWithMe:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v1

    .line 1041
    :try_start_4
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_9
    :goto_3
    if-nez v0, :cond_a

    .line 1044
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    :cond_a
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    .line 1053
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1054
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$15;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 1055
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :goto_4
    return-void
.end method
