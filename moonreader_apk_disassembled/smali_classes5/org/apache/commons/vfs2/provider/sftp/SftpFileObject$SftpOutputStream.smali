.class Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;
.super Lorg/apache/commons/vfs2/util/MonitorOutputStream;
.source "SftpFileObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SftpOutputStream"
.end annotation


# instance fields
.field private final channel:Lcom/jcraft/jsch/ChannelSftp;

.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;Lcom/jcraft/jsch/ChannelSftp;Ljava/io/OutputStream;)V
    .locals 0

    .line 528
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    .line 529
    invoke-direct {p0, p3}, Lorg/apache/commons/vfs2/util/MonitorOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 530
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;->channel:Lcom/jcraft/jsch/ChannelSftp;

    return-void
.end method


# virtual methods
.method protected onClose()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 538
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->access$100(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;->channel:Lcom/jcraft/jsch/ChannelSftp;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void
.end method
