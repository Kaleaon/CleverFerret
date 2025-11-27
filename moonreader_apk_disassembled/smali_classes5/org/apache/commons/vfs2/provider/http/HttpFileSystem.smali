.class public Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "HttpFileSystem.java"


# instance fields
.field private final client:Lorg/apache/commons/httpclient/HttpClient;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/httpclient/HttpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, v0, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 40
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->client:Lorg/apache/commons/httpclient/HttpClient;

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

    .line 48
    sget-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public closeCommunicationLink()V
    .locals 2

    .line 58
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/httpclient/HttpClient;->getHttpConnectionManager()Lorg/apache/commons/httpclient/HttpConnectionManager;

    move-result-object v0

    .line 60
    instance-of v1, v0, Lorg/apache/commons/httpclient/MultiThreadedHttpConnectionManager;

    if-eqz v1, :cond_0

    .line 61
    check-cast v0, Lorg/apache/commons/httpclient/MultiThreadedHttpConnectionManager;

    invoke-virtual {v0}, Lorg/apache/commons/httpclient/MultiThreadedHttpConnectionManager;->shutdown()V

    :cond_0
    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 71
    new-instance v0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    invoke-direct {v0, p1, p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;)V

    return-object v0
.end method

.method protected getClient()Lorg/apache/commons/httpclient/HttpClient;
    .locals 1

    .line 52
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;->client:Lorg/apache/commons/httpclient/HttpClient;

    return-object v0
.end method
