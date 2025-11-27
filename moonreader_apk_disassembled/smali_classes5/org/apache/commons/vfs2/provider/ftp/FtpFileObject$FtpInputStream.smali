.class Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;
.super Lorg/apache/commons/vfs2/util/MonitorInputStream;
.source "FtpFileObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FtpInputStream"
.end annotation


# instance fields
.field private final client:Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Ljava/io/InputStream;)V
    .locals 0

    .line 568
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    .line 569
    invoke-direct {p0, p3}, Lorg/apache/commons/vfs2/util/MonitorInputStream;-><init>(Ljava/io/InputStream;)V

    .line 570
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->client:Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    return-void
.end method


# virtual methods
.method abort()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 574
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->client:Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->abort()Z

    .line 575
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->close()V

    return-void
.end method

.method protected onClose()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 585
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->client:Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->completePendingCommand()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 587
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->access$000(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->client:Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    if-eqz v0, :cond_0

    return-void

    .line 591
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    const-string v2, "vfs.provider.ftp/finish-get.error"

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    :catchall_0
    move-exception v0

    .line 587
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->access$000(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->client:Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    throw v0
.end method
