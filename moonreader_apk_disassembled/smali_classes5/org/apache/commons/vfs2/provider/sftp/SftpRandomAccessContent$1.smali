.class Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;
.super Ljava/io/FilterInputStream;
.source "SftpRandomAccessContent.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->getDataInputStream()Ljava/io/DataInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;Ljava/io/InputStream;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;

    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->close()V

    return-void
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 81
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;

    iget-wide v2, v1, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, v1, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    :cond_0
    return v0
.end method

.method public read([B)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    invoke-super {p0, p1}, Ljava/io/FilterInputStream;->read([B)I

    move-result p1

    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;

    iget-wide v1, v0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    int-to-long v3, p1

    add-long/2addr v1, v3

    iput-wide v1, v0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    :cond_0
    return p1
.end method

.method public read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterInputStream;->read([BII)I

    move-result p1

    const/4 p2, -0x1

    if-le p1, p2, :cond_0

    .line 99
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;

    iget-wide v0, p2, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p2, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;->filePointer:J

    :cond_0
    return p1
.end method
