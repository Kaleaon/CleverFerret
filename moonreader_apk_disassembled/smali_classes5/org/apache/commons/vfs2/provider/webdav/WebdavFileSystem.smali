.class public Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;
.super Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;
.source "WebdavFileSystem.java"


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/httpclient/HttpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/httpclient/HttpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method


# virtual methods
.method protected addCapabilities(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation

    .line 55
    sget-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 67
    new-instance v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-direct {v0, p1, p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;)V

    return-object v0
.end method

.method protected getClient()Lorg/apache/commons/httpclient/HttpClient;
    .locals 1

    .line 45
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v0

    return-object v0
.end method

.method public getURLStreamHandler()Ljava/net/URLStreamHandler;
    .locals 3

    .line 76
    new-instance v0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;-><init>(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0
.end method
