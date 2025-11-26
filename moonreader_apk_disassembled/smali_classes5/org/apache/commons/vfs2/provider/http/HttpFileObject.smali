.class public Lorg/apache/commons/vfs2/provider/http/HttpFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "HttpFileObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FS:",
        "Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;",
        ">",
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "TFS;>;"
    }
.end annotation


# instance fields
.field private final followRedirect:Z

.field private method:Lorg/apache/commons/httpclient/methods/HeadMethod;

.field private final urlCharset:Ljava/lang/String;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/provider/AbstractFileName;",
            "TFS;)V"
        }
    .end annotation

    .line 78
    invoke-static {}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;)V

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/provider/AbstractFileName;",
            "TFS;",
            "Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;",
            ")V"
        }
    .end annotation

    .line 83
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 84
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object p1

    .line 85
    invoke-virtual {p3, p1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getUrlCharset(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->urlCharset:Ljava/lang/String;

    .line 86
    invoke-virtual {p3, p1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getUserAgent(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->userAgent:Ljava/lang/String;

    .line 87
    invoke-virtual {p3, p1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getFollowRedirect(Lorg/apache/commons/vfs2/FileSystemOptions;)Z

    move-result p1

    iput-boolean p1, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->followRedirect:Z

    return-void
.end method


# virtual methods
.method protected doDetach()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    return-void
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 103
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    const-string v1, "content-length"

    invoke-virtual {v0, v1}, Lorg/apache/commons/httpclient/methods/HeadMethod;->getResponseHeader(Ljava/lang/String;)Lorg/apache/commons/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 108
    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 121
    new-instance v0, Lorg/apache/commons/httpclient/methods/GetMethod;

    invoke-direct {v0}, Lorg/apache/commons/httpclient/methods/GetMethod;-><init>()V

    .line 122
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 123
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/httpclient/HttpClient;->executeMethod(Lorg/apache/commons/httpclient/HttpMethod;)I

    move-result v1

    const/16 v2, 0x194

    if-eq v1, v2, :cond_1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    .line 131
    new-instance v1, Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;-><init>(Lorg/apache/commons/httpclient/methods/GetMethod;)V

    return-object v1

    .line 128
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    const/4 v2, 0x1

    aput-object v1, v3, v2

    const-string v1, "vfs.provider.http/get.error"

    invoke-direct {v0, v1, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    .line 125
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/FileNotFoundException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileNotFoundException;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    const-string v1, "last-modified"

    invoke-virtual {v0, v1}, Lorg/apache/commons/httpclient/methods/HeadMethod;->getResponseHeader(Ljava/lang/String;)Lorg/apache/commons/httpclient/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0}, Lorg/apache/commons/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/httpclient/util/DateUtil;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0

    .line 143
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.http/last-modified.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 150
    new-instance v0, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/vfs2/provider/http/HttpRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/provider/http/HttpFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    return-object v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 160
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getHeadMethod()Lorg/apache/commons/httpclient/methods/HeadMethod;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/httpclient/methods/HeadMethod;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_3

    const/16 v1, 0x195

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const/16 v1, 0x194

    if-eq v0, v1, :cond_2

    const/16 v1, 0x19a

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 167
    :cond_1
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    const/4 v2, 0x1

    aput-object v0, v3, v2

    const-string v0, "vfs.provider.http/head.error"

    invoke-direct {v1, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 165
    :cond_2
    :goto_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 163
    :cond_3
    :goto_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 181
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Not implemented."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected encodePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/httpclient/URIException;
        }
    .end annotation

    .line 185
    invoke-static {p1}, Lorg/apache/commons/httpclient/util/URIUtil;->encodePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;
    .locals 1

    .line 190
    new-instance v0, Lorg/apache/commons/vfs2/provider/http/HttpFileContentInfoFactory;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileContentInfoFactory;-><init>()V

    return-object v0
.end method

.method protected getFollowRedirect()Z
    .locals 1

    .line 194
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->followRedirect:Z

    return v0
.end method

.method getHeadMethod()Lorg/apache/commons/httpclient/methods/HeadMethod;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    if-eqz v0, :cond_0

    return-object v0

    .line 205
    :cond_0
    new-instance v0, Lorg/apache/commons/httpclient/methods/HeadMethod;

    invoke-direct {v0}, Lorg/apache/commons/httpclient/methods/HeadMethod;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    .line 206
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 207
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v0

    .line 208
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    invoke-virtual {v0, v1}, Lorg/apache/commons/httpclient/HttpClient;->executeMethod(Lorg/apache/commons/httpclient/HttpMethod;)I

    .line 209
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    invoke-virtual {v0}, Lorg/apache/commons/httpclient/methods/HeadMethod;->releaseConnection()V

    .line 210
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->method:Lorg/apache/commons/httpclient/methods/HeadMethod;

    return-object v0
.end method

.method protected getUrlCharset()Ljava/lang/String;
    .locals 1

    .line 214
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->urlCharset:Ljava/lang/String;

    return-object v0
.end method

.method protected getUserAgent()Ljava/lang/String;
    .locals 1

    .line 198
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->userAgent:Ljava/lang/String;

    return-object v0
.end method

.method protected setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;,
            Lorg/apache/commons/httpclient/URIException;
        }
    .end annotation

    .line 226
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getUrlCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathQueryEncoded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 227
    invoke-interface {p1, v0}, Lorg/apache/commons/httpclient/HttpMethod;->setPath(Ljava/lang/String;)V

    .line 228
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getFollowRedirect()Z

    move-result v0

    invoke-interface {p1, v0}, Lorg/apache/commons/httpclient/HttpMethod;->setFollowRedirects(Z)V

    .line 229
    const-string v0, "User-Agent"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getUserAgent()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/httpclient/HttpMethod;->setRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
