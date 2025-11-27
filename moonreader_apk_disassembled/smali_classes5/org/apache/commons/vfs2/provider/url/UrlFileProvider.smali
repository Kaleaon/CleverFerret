.class public Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.source "UrlFileProvider.java"


# static fields
.field protected static final capabilities:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x3

    .line 39
    new-array v0, v0, [Lorg/apache/commons/vfs2/Capability;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    .line 40
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 39
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;-><init>()V

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    monitor-enter p0

    .line 60
    :try_start_0
    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 62
    new-instance v0, Ljava/net/URL;

    const-string v1, "/"

    invoke-direct {v0, p1, v1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 64
    invoke-virtual {p0, v1, p3}, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->findFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v2

    if-nez v2, :cond_0

    .line 66
    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    .line 67
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v2

    invoke-interface {v2, v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->parseURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 70
    new-instance v2, Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;

    invoke-direct {v2, v0, p3}, Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 71
    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->addFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystem;)V

    .line 73
    :cond_0
    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 75
    :try_start_1
    new-instance p3, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider.url/badly-formed-uri.error"

    invoke-direct {p3, v0, p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p3

    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getCapabilities()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .line 86
    sget-object v0, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 81
    invoke-static {}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
