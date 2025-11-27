.class public abstract Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.source "AbstractLayeredFileProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;-><init>()V

    .line 31
    invoke-static {}, Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    monitor-enter p0

    .line 75
    :try_start_0
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 76
    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->findFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    if-nez v1, :cond_0

    .line 79
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->doCreateFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    .line 80
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->addFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystem;)V

    .line 82
    :cond_0
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileSystem;->getRoot()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected abstract doCreateFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 47
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    check-cast p2, Lorg/apache/commons/vfs2/provider/LayeredFileName;

    .line 52
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getOuterName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 53
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v1

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, p1, v0, p3}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 56
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p3}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;->createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 59
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method
