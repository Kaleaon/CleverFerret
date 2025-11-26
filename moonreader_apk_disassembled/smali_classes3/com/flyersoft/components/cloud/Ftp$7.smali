.class Lcom/flyersoft/components/cloud/Ftp$7;
.super Ljava/lang/Thread;
.source "Ftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$is:Ljava/io/InputStream;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Ljava/io/InputStream;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;)V
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

    .line 432
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$is:Ljava/io/InputStream;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const-string v0, ">>upload:"

    const/4 v1, 0x0

    .line 436
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 437
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 438
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mcreateFtpClient(Lcom/flyersoft/components/cloud/Ftp;)V

    .line 439
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Ftp;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    .line 440
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 443
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/net/ftp/FTPClient;->storeFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_2

    const/16 v2, 0x1000

    .line 445
    new-array v2, v2, [B

    .line 447
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$is:Ljava/io/InputStream;

    invoke-virtual {v3, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 448
    invoke-virtual {v0, v2, v1, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 450
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v2, :cond_1

    const/4 v3, 0x0

    .line 451
    invoke-interface {v2, v3}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 454
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$is:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 456
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 458
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->completePendingCommand()Z

    goto :goto_2

    .line 459
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v0, :cond_3

    .line 460
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    .line 462
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/Ftp;->disconnect()V

    .line 463
    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 464
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v1, :cond_3

    .line 465
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V

    .line 467
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$7;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
