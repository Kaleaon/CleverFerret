.class public final Lorg/apache/commons/vfs2/provider/DefaultURLConnection;
.super Ljava/net/URLConnection;
.source "DefaultURLConnection.java"


# instance fields
.field private final content:Lorg/apache/commons/vfs2/FileContent;


# direct methods
.method public constructor <init>(Ljava/net/URL;Lorg/apache/commons/vfs2/FileContent;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Ljava/net/URLConnection;-><init>(Ljava/net/URL;)V

    .line 36
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    return-void
.end method


# virtual methods
.method public connect()V
    .locals 1

    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->connected:Z

    return-void
.end method

.method public getContentEncoding()Ljava/lang/String;
    .locals 2

    .line 84
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getContentInfo()Lorg/apache/commons/vfs2/FileContentInfo;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContentInfo;->getContentEncoding()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 86
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileSystemException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getContentLength()I
    .locals 2

    .line 66
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    long-to-int v1, v0

    return v1

    :catch_0
    const/4 v0, -0x1

    return v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 2

    .line 75
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getContentInfo()Lorg/apache/commons/vfs2/FileContentInfo;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContentInfo;->getContentType()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 77
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileSystemException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .line 57
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
