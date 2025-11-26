.class Lcom/flyersoft/components/cloud/Ftp$6;
.super Ljava/lang/Thread;
.source "Ftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V
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

    .line 349
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$6;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    move-object/from16 v1, p0

    const-string v0, ">>download:"

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    .line 353
    :try_start_0
    iget-object v6, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v6}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 354
    iget-object v6, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v6}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mcreateFtpClient(Lcom/flyersoft/components/cloud/Ftp;)V

    .line 356
    iget-object v6, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v7, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mgetFtpFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)J

    move-result-wide v6

    .line 357
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x2

    new-array v10, v9, [Ljava/lang/Object;

    aput-object v0, v10, v5

    const/4 v0, 0x1

    aput-object v8, v10, v0

    invoke-static {v10}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 360
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v8}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 386
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v10, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v11, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v10, v11}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    .line 387
    invoke-static {v8}, Lcom/flyersoft/tools/T;->inputStream2OutputStream(Ljava/io/InputStream;)Ljava/io/ByteArrayOutputStream;

    move-result-object v10

    const/4 v11, 0x0

    :goto_0
    const/4 v12, 0x3

    if-eqz v10, :cond_3

    cmp-long v13, v6, v3

    if-lez v13, :cond_3

    .line 389
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v13

    int-to-long v13, v13

    cmp-long v15, v13, v6

    if-eqz v15, :cond_3

    add-int/lit8 v13, v11, 0x1

    if-ge v11, v9, :cond_3

    .line 390
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v8}, Lorg/apache/commons/net/ftp/FTPClient;->completePendingCommand()Z

    const-wide/16 v10, 0x64

    .line 393
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    .line 394
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v8}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 395
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v10, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v11, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v10, v11}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    .line 396
    invoke-static {v8}, Lcom/flyersoft/tools/T;->inputStream2OutputStream(Ljava/io/InputStream;)Ljava/io/ByteArrayOutputStream;

    move-result-object v10

    .line 397
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "#try again "

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, ", second os size:"

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v10, :cond_0

    const/4 v14, -0x1

    goto :goto_1

    :cond_0
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v14

    :goto_1
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    if-nez v10, :cond_2

    :cond_1
    const/4 v14, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v14

    int-to-long v14, v14

    cmp-long v16, v14, v6

    if-nez v16, :cond_1

    const/4 v14, 0x1

    :goto_2
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iget-object v15, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v15}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    new-array v12, v12, [Ljava/lang/Object;

    aput-object v11, v12, v5

    aput-object v14, v12, v0

    aput-object v15, v12, v9

    invoke-static {v12}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    move v11, v13

    goto/16 :goto_0

    :cond_3
    if-eqz v10, :cond_4

    cmp-long v11, v6, v3

    if-lez v11, :cond_4

    .line 401
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v11

    int-to-long v13, v11

    cmp-long v11, v13, v6

    if-eqz v11, :cond_4

    .line 402
    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "should be "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v14, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v14}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const-string v16, "####FTP Download Failed, size different"

    aput-object v16, v15, v5

    aput-object v11, v15, v0

    aput-object v13, v15, v9

    aput-object v14, v15, v12

    invoke-static {v15}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 404
    :cond_4
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v0, :cond_5

    .line 405
    invoke-interface {v0, v10, v2, v6, v7}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    if-eqz v8, :cond_6

    .line 409
    :try_start_1
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 411
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 414
    :goto_3
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->completePendingCommand()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception v0

    .line 417
    iget-object v6, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v6}, Lcom/flyersoft/components/cloud/Ftp;->disconnect()V

    .line 418
    invoke-static {v0, v5}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 419
    iget-object v5, v1, Lcom/flyersoft/components/cloud/Ftp$6;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v5, :cond_6

    .line 420
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v2, v0, v3, v4}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V

    .line 422
    :cond_6
    :goto_4
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Ftp$6;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
