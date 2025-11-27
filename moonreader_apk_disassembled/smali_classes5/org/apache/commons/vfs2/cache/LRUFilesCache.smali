.class public Lorg/apache/commons/vfs2/cache/LRUFilesCache;
.super Lorg/apache/commons/vfs2/cache/AbstractFilesCache;
.source "LRUFilesCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;
    }
.end annotation


# static fields
.field private static final DEFAULT_LRU_SIZE:I = 0x64

.field private static final log:Lorg/apache/commons/logging/Log;


# instance fields
.field private final filesystemCache:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Lorg/apache/commons/vfs2/FileSystem;",
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;>;"
        }
    .end annotation
.end field

.field private final lruSize:I

.field private final readLock:Ljava/util/concurrent/locks/Lock;

.field private final rwLock:Ljava/util/concurrent/locks/ReadWriteLock;

.field private final writeLock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    const-class v0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x64

    .line 117
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 125
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;-><init>()V

    .line 50
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    .line 55
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->rwLock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 56
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->readLock:Ljava/util/concurrent/locks/Lock;

    .line 57
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 126
    iput p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->lruSize:I

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/cache/LRUFilesCache;)Lorg/apache/commons/logging/Log;
    .locals 0

    .line 42
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 42
    sget-object v0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/cache/LRUFilesCache;)Ljava/util/concurrent/ConcurrentMap;
    .locals 0

    .line 42
    iget-object p0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    return-object p0
.end method


# virtual methods
.method public clear(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 2

    .line 174
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 176
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 178
    :try_start_0
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 180
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public close()V
    .locals 1

    .line 197
    invoke-super {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;->close()V

    .line 198
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    return-void
.end method

.method public getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 162
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object p1

    .line 164
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->readLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 166
    :try_start_0
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/FileObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    iget-object p2, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->readLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->readLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method protected getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ")",
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .line 187
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;

    iget v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->lruSize:I

    invoke-direct {v0, p0, p1, v1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;-><init>(Lorg/apache/commons/vfs2/cache/LRUFilesCache;Lorg/apache/commons/vfs2/FileSystem;I)V

    .line 190
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public putFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2

    .line 131
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 133
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 135
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public putFileIfAbsent(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 3

    .line 143
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 145
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 147
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    .line 149
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 156
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 p1, 0x0

    return p1

    .line 153
    :cond_0
    :try_start_1
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 156
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
    .locals 2

    .line 203
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 205
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 207
    :try_start_0
    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result p2

    const/4 v0, 0x1

    if-ge p2, v0, :cond_0

    .line 210
    iget-object p2, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->filesystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p2, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 213
    :cond_0
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public touchFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 220
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method
