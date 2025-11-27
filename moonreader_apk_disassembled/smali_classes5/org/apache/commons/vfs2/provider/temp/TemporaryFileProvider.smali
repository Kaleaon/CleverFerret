.class public Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.source "TemporaryFileProvider.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileProvider;",
        "Ljava/lang/Comparable<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private rootFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->rootFile:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 1

    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    if-ge v0, p1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    if-le v0, p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public declared-synchronized findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const-string p1, ":/"

    monitor-enter p0

    .line 83
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-static {p2, v0}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p2

    .line 85
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 86
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;

    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    invoke-virtual {p0, p0, p3}, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->findFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    if-nez v1, :cond_1

    .line 93
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->rootFile:Ljava/io/File;

    if-nez v1, :cond_0

    .line 94
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getTemporaryFileStore()Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

    move-result-object v1

    const-string v2, "tempfs"

    invoke-interface {v1, v2}, Lorg/apache/commons/vfs2/provider/TemporaryFileStore;->allocateFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->rootFile:Ljava/io/File;

    .line 96
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->parseURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 99
    new-instance v1, Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;

    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->rootFile:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 100
    invoke-virtual {p0, p0, v1}, Lorg/apache/commons/vfs2/provider/temp/TemporaryFileProvider;->addFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystem;)V

    .line 104
    :cond_1
    invoke-interface {v1, v0}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

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

    .line 109
    sget-object v0, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method
