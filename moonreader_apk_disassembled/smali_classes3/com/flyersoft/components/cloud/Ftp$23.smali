.class Lcom/flyersoft/components/cloud/Ftp$23;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$forUploadBookFile:Z

.field final synthetic val$fromPath:Ljava/lang/String;

.field final synthetic val$ignoreExists:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V
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

    .line 1182
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$fromPath:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$ignoreExists:Z

    iput-boolean p5, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$forUploadBookFile:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1185
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 1186
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v0, p1}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1188
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Ftp;->mCanceled:Z

    if-nez v0, :cond_4

    .line 1190
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$files:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    .line 1191
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1192
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$fromPath:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1195
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1196
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Ftp;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    .line 1197
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1200
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v4, v0}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mgetFtpFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, v4, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    .line 1201
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ">>*check if upload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cloud size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v6, v6, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v3

    aput-object v5, v6, v1

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1202
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v4, v4, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-lez v8, :cond_2

    .line 1203
    iget-boolean v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$ignoreExists:Z

    if-eqz v4, :cond_1

    :goto_1
    const/4 v2, 0x0

    goto :goto_2

    .line 1205
    :cond_1
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v4, v4, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6

    cmp-long v8, v4, v6

    if-nez v8, :cond_2

    goto :goto_1

    :cond_2
    :goto_2
    if-eqz v2, :cond_0

    .line 1211
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

    .line 1212
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 1213
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 1216
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v5, v0}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lorg/apache/commons/net/ftp/FTPClient;->storeFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v4, 0x1000

    .line 1218
    new-array v4, v4, [B

    .line 1220
    :goto_3
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_3

    .line 1221
    invoke-virtual {v0, v4, v3, v5}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    .line 1225
    :cond_3
    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1226
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    :catch_0
    move-exception v0

    .line 1228
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1230
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->completePendingCommand()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 1234
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1235
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    .line 1238
    :cond_4
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Ftp$23;->val$forUploadBookFile:Z

    if-nez v0, :cond_5

    .line 1239
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1240
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$23;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
