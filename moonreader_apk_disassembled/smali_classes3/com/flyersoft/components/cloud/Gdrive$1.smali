.class Lcom/flyersoft/components/cloud/Gdrive$1;
.super Ljava/lang/Thread;
.source "Gdrive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V
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

    .line 142
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 147
    :try_start_0
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 148
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 149
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 150
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v4

    :cond_0
    if-nez v4, :cond_1

    .line 153
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v4, :cond_4

    .line 154
    invoke-interface {v4, v3, v3, v0, v1}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V

    return-void

    .line 158
    :cond_1
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v5, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v5}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/google/api/services/drive/Drive$Files;->get(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Get;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/api/services/drive/Drive$Files$Get;->executeMediaAsInputStream()Ljava/io/InputStream;

    move-result-object v4

    const/16 v5, 0x2000

    .line 159
    new-array v5, v5, [B

    .line 161
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 162
    :goto_0
    invoke-virtual {v4, v5}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_2

    .line 163
    invoke-virtual {v6, v5, v2, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 165
    :cond_2
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 166
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ">>downloaded:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 167
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v4, :cond_4

    .line 168
    invoke-interface {v4, v6, v3, v0, v1}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v4

    .line 170
    invoke-static {v4, v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 171
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v2, :cond_3

    .line 172
    invoke-static {v4}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v0, v1}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V

    .line 173
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$1;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Gdrive;->clearIds()V

    :cond_4
    return-void
.end method
