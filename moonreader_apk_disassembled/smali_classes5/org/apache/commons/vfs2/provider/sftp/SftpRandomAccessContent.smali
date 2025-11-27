.class Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;
.super Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;
.source "SftpRandomAccessContent.java"


# instance fields
.field private dis:Ljava/io/DataInputStream;

.field private final fileObject:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

.field protected filePointer:J

.field private mis:Ljava/io/InputStream;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
    .locals 2

    .line 40
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;-><init>(Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    const-wide/16 v0, 0x0

    .line 33
    iput-wide v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    const/4 p2, 0x0

    .line 36
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    .line 37
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->mis:Ljava/io/InputStream;

    .line 42
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

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

    .line 115
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->mis:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 120
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    const/4 v1, 0x0

    .line 121
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    .line 122
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    .line 123
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->mis:Ljava/io/InputStream;

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

    .line 70
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    return-object v0

    .line 75
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    iget-wide v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getInputStream(J)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->mis:Ljava/io/InputStream;

    .line 76
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->mis:Ljava/io/InputStream;

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;-><init>(Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    return-object v0
.end method

.method public getFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    return-wide v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

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

    .line 53
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-void

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    .line 61
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_1

    .line 62
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->close()V

    .line 65
    :cond_1
    iput-wide p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    return-void

    .line 59
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/random-access-invalid-position.error"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method
