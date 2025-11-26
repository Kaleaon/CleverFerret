.class public Lorg/apache/commons/vfs2/cache/DefaultFilesCache;
.super Lorg/apache/commons/vfs2/cache/AbstractFilesCache;
.source "DefaultFilesCache.java"


# instance fields
.field private final filesystemCache:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Lorg/apache/commons/vfs2/FileSystem;",
            "Ljava/util/concurrent/ConcurrentMap<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method


# virtual methods
.method public clear(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 1

    .line 74
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_0

    .line 76
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    :cond_0
    return-void
.end method

.method public close()V
    .locals 1

    .line 93
    invoke-super {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;->close()V

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    return-void
.end method

.method public getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 62
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 68
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/FileObject;

    return-object p1
.end method

.method protected getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/concurrent/ConcurrentMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ")",
            "Ljava/util/concurrent/ConcurrentMap<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentMap;

    :goto_0
    if-nez v0, :cond_0

    .line 84
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    const/high16 v2, 0x3f400000    # 0.75f

    const/16 v3, 0x8

    const/16 v4, 0xc8

    invoke-direct {v1, v4, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    invoke-interface {v0, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentMap;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public putFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2

    .line 49
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/concurrent/ConcurrentMap;

    move-result-object v0

    .line 50
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public putFileIfAbsent(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 2

    .line 55
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/concurrent/ConcurrentMap;

    move-result-object v0

    .line 56
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 101
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/DefaultFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_0

    .line 103
    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
