.class Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;
.super Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;
.source "HttpRandomAccessContent.java"


# instance fields
.field private dis:Ljava/io/DataInputStream;

.field private final fileObject:Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

.field protected filePointer:J

.field private final fileSystem:Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

.field private mis:Lorg/apache/commons/vfs2/util/MonitorInputStream;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/http/HttpFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
    .locals 2

    .line 43
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;-><init>(Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    const-wide/16 v0, 0x0

    .line 34
    iput-wide v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    const/4 p2, 0x0

    .line 39
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    .line 40
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/util/MonitorInputStream;

    .line 45
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    .line 46
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileSystem:Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

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

    .line 129
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    const/4 v0, 0x0

    .line 131
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    .line 132
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/util/MonitorInputStream;

    :cond_0
    return-void
.end method

.method protected getDataInputStream()Ljava/io/DataInputStream;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    return-object v0

    .line 77
    :cond_0
    new-instance v0, Lorg/apache/commons/httpclient/methods/GetMethod;

    invoke-direct {v0}, Lorg/apache/commons/httpclient/methods/GetMethod;-><init>()V

    .line 78
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "bytes="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Range"

    invoke-virtual {v0, v2, v1}, Lorg/apache/commons/httpclient/methods/GetMethod;->setRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileSystem:Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/httpclient/HttpClient;->executeMethod(Lorg/apache/commons/httpclient/HttpMethod;)I

    move-result v1

    const/16 v2, 0xce

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x3

    .line 81
    const-string v7, "vfs.provider.http/get-range.error"

    const/16 v8, 0xc8

    if-eq v1, v2, :cond_2

    if-ne v1, v8, :cond_1

    goto :goto_0

    .line 82
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    iget-wide v8, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    .line 83
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v2, v6, v5

    aput-object v8, v6, v4

    aput-object v1, v6, v3

    invoke-direct {v0, v7, v6}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    .line 86
    :cond_2
    :goto_0
    new-instance v2, Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;

    invoke-direct {v2, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;-><init>(Lorg/apache/commons/httpclient/methods/GetMethod;)V

    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/util/MonitorInputStream;

    if-ne v1, v8, :cond_4

    .line 89
    iget-wide v8, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    invoke-virtual {v2, v8, v9}, Lorg/apache/commons/vfs2/util/MonitorInputStream;->skip(J)J

    move-result-wide v8

    .line 90
    iget-wide v10, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    cmp-long v0, v8, v10

    if-nez v0, :cond_3

    goto :goto_1

    .line 91
    :cond_3
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    iget-wide v8, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    .line 92
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v2, v6, v5

    aput-object v8, v6, v4

    aput-object v1, v6, v3

    invoke-direct {v0, v7, v6}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    .line 95
    :cond_4
    :goto_1
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent$1;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->mis:Lorg/apache/commons/vfs2/util/MonitorInputStream;

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent$1;-><init>(Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    return-object v0
.end method

.method public getFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    return-wide v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->fileObject:Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

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

    .line 56
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-void

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    .line 64
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->dis:Ljava/io/DataInputStream;

    if-eqz v0, :cond_1

    .line 65
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->close()V

    .line 68
    :cond_1
    iput-wide p1, p0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;->filePointer:J

    return-void

    .line 62
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/random-access-invalid-position.error"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method
