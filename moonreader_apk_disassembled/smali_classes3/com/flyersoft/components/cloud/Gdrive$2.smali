.class Lcom/flyersoft/components/cloud/Gdrive$2;
.super Ljava/lang/Thread;
.source "Gdrive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$is:Ljava/io/InputStream;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

.field final synthetic val$textOrFilename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Ljava/io/InputStream;Ljava/lang/String;)V
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

    .line 184
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$is:Ljava/io/InputStream;

    iput-object p5, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$textOrFilename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    const-string v0, ">upload:"

    .line 188
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 189
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 191
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v0

    :cond_0
    if-nez v0, :cond_1

    .line 195
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/flyersoft/components/cloud/Gdrive;->createGdriveFolder(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 196
    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "***CAN NOT CREATE FOLDER***"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 197
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v0, :cond_6

    .line 198
    const-string v1, "Failed to access cloud folder"

    invoke-interface {v0, v1}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    return-void

    .line 203
    :cond_1
    const-string v2, "id,name,size,createdTime,modifiedTime,starred,mimeType"

    const-string v4, "*/*"

    const/4 v5, 0x0

    if-eqz v0, :cond_2

    .line 205
    :try_start_1
    new-instance v6, Lcom/google/api/client/http/InputStreamContent;

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$is:Ljava/io/InputStream;

    invoke-direct {v6, v4, v7}, Lcom/google/api/client/http/InputStreamContent;-><init>(Ljava/lang/String;Ljava/io/InputStream;)V

    .line 206
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v7}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v7

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/google/api/services/drive/model/File;

    invoke-direct {v9}, Lcom/google/api/services/drive/model/File;-><init>()V

    invoke-virtual {v7, v8, v9, v6}, Lcom/google/api/services/drive/Drive$Files;->update(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Lcom/google/api/client/http/AbstractInputStreamContent;)Lcom/google/api/services/drive/Drive$Files$Update;

    move-result-object v6

    .line 207
    invoke-virtual {v6, v2}, Lcom/google/api/services/drive/Drive$Files$Update;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Update;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/api/services/drive/Drive$Files$Update;->execute()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/api/services/drive/model/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v6

    .line 210
    :try_start_2
    new-array v1, v1, [Ljava/lang/Object;

    const-string v7, "--------faild to update gdrive file content ---------"

    aput-object v7, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 211
    invoke-static {v6}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    move-object v6, v5

    :goto_0
    if-nez v6, :cond_5

    .line 217
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$is:Ljava/io/InputStream;

    if-eqz v0, :cond_4

    .line 219
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$textOrFilename:Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$textOrFilename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 220
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$textOrFilename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_1

    .line 222
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$textOrFilename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 223
    :goto_1
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v3}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;

    .line 225
    :cond_4
    new-instance v0, Lcom/google/api/client/http/InputStreamContent;

    invoke-direct {v0, v4, v1}, Lcom/google/api/client/http/InputStreamContent;-><init>(Ljava/lang/String;Ljava/io/InputStream;)V

    .line 226
    new-instance v1, Lcom/google/api/services/drive/model/File;

    invoke-direct {v1}, Lcom/google/api/services/drive/model/File;-><init>()V

    .line 227
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 228
    invoke-virtual {v1, v4}, Lcom/google/api/services/drive/model/File;->setMimeType(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 229
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v3

    .line 230
    invoke-virtual {v3}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    .line 231
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v3}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v3

    invoke-virtual {v3, v1, v0}, Lcom/google/api/services/drive/Drive$Files;->create(Lcom/google/api/services/drive/model/File;Lcom/google/api/client/http/AbstractInputStreamContent;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v0

    .line 232
    invoke-virtual {v0, v2}, Lcom/google/api/services/drive/Drive$Files$Create;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Create;->execute()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/google/api/services/drive/model/File;

    .line 237
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V

    .line 238
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v0, :cond_6

    .line 239
    invoke-interface {v0, v5}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    .line 241
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 242
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Gdrive;->clearIds()V

    .line 243
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v1, :cond_6

    .line 244
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V

    :cond_6
    :goto_2
    return-void
.end method
