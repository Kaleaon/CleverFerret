.class public abstract Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;
.source "AbstractFileProvider.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/FileProvider;


# static fields
.field private static final EMPTY_ABSTRACTFILESYSTEMS:[Lorg/apache/commons/vfs2/provider/AbstractFileSystem;


# instance fields
.field private final fileSystems:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/provider/FileSystemKey;",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation
.end field

.field private parser:Lorg/apache/commons/vfs2/provider/FileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 34
    new-array v0, v0, [Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    sput-object v0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->EMPTY_ABSTRACTFILESYSTEMS:[Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;-><init>()V

    .line 41
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    .line 46
    invoke-static {}, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->parser:Lorg/apache/commons/vfs2/provider/FileNameParser;

    return-void
.end method


# virtual methods
.method protected addFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "*>;",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 96
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->addComponent(Ljava/lang/Object;)V

    .line 98
    new-instance v0, Lorg/apache/commons/vfs2/provider/FileSystemKey;

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/apache/commons/vfs2/provider/FileSystemKey;-><init>(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 99
    move-object p1, p2

    check-cast p1, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->setCacheKey(Lorg/apache/commons/vfs2/provider/FileSystemKey;)V

    .line 101
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    monitor-enter p1

    .line 102
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public close()V
    .locals 2

    .line 62
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    monitor-enter v0

    .line 63
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 64
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->close()V

    return-void

    :catchall_0
    move-exception v1

    .line 64
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 3

    .line 155
    check-cast p1, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    .line 157
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getCacheKey()Lorg/apache/commons/vfs2/provider/FileSystemKey;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    monitor-enter v1

    .line 160
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 164
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->removeComponent(Ljava/lang/Object;)V

    .line 165
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->close()V

    return-void
.end method

.method public createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 82
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.provider/not-layered-fs.error"

    invoke-direct {p2, p3, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method

.method protected findFileSystem(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "*>;",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            ")",
            "Lorg/apache/commons/vfs2/FileSystem;"
        }
    .end annotation

    .line 114
    new-instance v0, Lorg/apache/commons/vfs2/provider/FileSystemKey;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/FileSystemKey;-><init>(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 116
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    monitor-enter p1

    .line 117
    :try_start_0
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/commons/vfs2/FileSystem;

    monitor-exit p1

    return-object p2

    :catchall_0
    move-exception p2

    .line 118
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public freeUnusedResources()V
    .locals 5

    .line 136
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    monitor-enter v0

    .line 138
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->fileSystems:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->EMPTY_ABSTRACTFILESYSTEMS:[Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    .line 139
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    array-length v0, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, v1, v2

    .line 143
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->isReleaseable()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 144
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->closeCommunicationLink()V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 139
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getFileNameParser()Lorg/apache/commons/vfs2/provider/FileNameParser;
    .locals 1

    .line 50
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->parser:Lorg/apache/commons/vfs2/provider/FileNameParser;

    return-object v0
.end method

.method public parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 178
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->getFileNameParser()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->getFileNameParser()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/provider/FileNameParser;->parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 182
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider/filename-parser-missing.error"

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->parser:Lorg/apache/commons/vfs2/provider/FileNameParser;

    return-void
.end method
