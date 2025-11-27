.class Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;
.super Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;
.source "FtpRandomAccessContent.java"


# instance fields
.field private dis:Ljava/io/DataInputStream;

.field private final fileObject:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

.field protected filePointer:J

.field private mis:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
    .locals 0

    .line 38
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;-><init>(Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    .line 40
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;->abort()V

    .line 117
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    const/4 v1, 0x0

    .line 118
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    .line 119
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    .line 120
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    :cond_0
    return-void
.end method

.method protected getDataInputStream()Ljava/io/DataInputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    return-object v0

    .line 73
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    iget-wide v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->filePointer:J

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getInputStream(J)Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    .line 74
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent$1;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent$1;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    return-object v0
.end method

.method public getFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->filePointer:J

    return-wide v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public seek(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->filePointer:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-void

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    .line 59
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_1

    .line 60
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->close()V

    .line 63
    :cond_1
    iput-wide p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;->filePointer:J

    return-void

    .line 57
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/random-access-invalid-position.error"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method
