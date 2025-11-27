.class public abstract Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.source "AbstractOriginatingFileProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method protected findFile(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 69
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    const-string v1, "/"

    invoke-interface {v0, p1, v1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 71
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->getFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p2

    .line 75
    invoke-interface {p2, p1}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 49
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    invoke-virtual {p0, p1, p3}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->findFile(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 51
    :goto_1
    new-instance p3, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/invalid-absolute-uri.error"

    invoke-direct {p3, v0, p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p3
.end method

.method protected declared-synchronized getFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    monitor-enter p0

    .line 89
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->findFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    if-nez v0, :cond_0

    .line 92
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    .line 93
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;->addFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
