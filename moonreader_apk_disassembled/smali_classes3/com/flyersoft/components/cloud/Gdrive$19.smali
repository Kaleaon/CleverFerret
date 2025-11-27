.class Lcom/flyersoft/components/cloud/Gdrive$19;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
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

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$forUploadBookFile:Z

.field final synthetic val$fromPath:Ljava/lang/String;

.field final synthetic val$ignoreExists:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V
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

    .line 1266
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$fromPath:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$ignoreExists:Z

    iput-boolean p5, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$forUploadBookFile:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1269
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->mCanceled:Z

    if-nez v0, :cond_6

    .line 1271
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$files:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    .line 1272
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1273
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1275
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v2, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$fromPath:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1277
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1278
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1279
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1281
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->createGdriveFolder(Ljava/lang/String;)Z

    move-result v5

    :cond_1
    if-nez v5, :cond_2

    const/4 v6, 0x0

    goto :goto_1

    .line 1283
    :cond_2
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v6, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v6

    .line 1284
    :goto_1
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v7, v6}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1285
    iget-boolean v7, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$ignoreExists:Z

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v7, v6}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    if-lez v11, :cond_3

    :goto_2
    const/4 v5, 0x0

    goto :goto_3

    .line 1287
    :cond_3
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v7, v6}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v7

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v9

    cmp-long v11, v7, v9

    if-nez v11, :cond_4

    goto :goto_2

    :cond_4
    :goto_3
    if-eqz v5, :cond_0

    .line 1292
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ">>*confirm upload: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v7, v1, [Ljava/lang/Object;

    aput-object v5, v7, v3

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1293
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getMIMEType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1294
    new-instance v5, Lcom/google/api/client/http/FileContent;

    invoke-direct {v5, v3, v2}, Lcom/google/api/client/http/FileContent;-><init>(Ljava/lang/String;Ljava/io/File;)V

    if-nez v6, :cond_5

    .line 1296
    new-instance v6, Lcom/google/api/services/drive/model/File;

    invoke-direct {v6}, Lcom/google/api/services/drive/model/File;-><init>()V

    .line 1297
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 1298
    invoke-virtual {v6, v3}, Lcom/google/api/services/drive/model/File;->setMimeType(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 1299
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 1301
    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    .line 1304
    :cond_5
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v2}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v2

    invoke-virtual {v2, v6, v5}, Lcom/google/api/services/drive/Drive$Files;->create(Lcom/google/api/services/drive/model/File;Lcom/google/api/client/http/AbstractInputStreamContent;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v2

    .line 1305
    invoke-virtual {v2}, Lcom/google/api/services/drive/Drive$Files$Create;->execute()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/api/services/drive/model/File;

    if-eqz v2, :cond_0

    .line 1307
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v3, v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 1310
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1311
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 1314
    :cond_6
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Gdrive$19;->val$forUploadBookFile:Z

    if-nez v0, :cond_7

    .line 1315
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_7
    return-void
.end method
