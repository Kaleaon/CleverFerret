.class public Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;
.super Lorg/apache/commons/vfs2/cache/AbstractFilesCache;
.source "SoftRefFilesCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;
    }
.end annotation


# static fields
.field private static final TIMEOUT:I = 0x3e8

.field private static final log:Lorg/apache/commons/logging/Log;


# instance fields
.field private final fileSystemCache:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Lorg/apache/commons/vfs2/FileSystem;",
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Ljava/lang/ref/Reference<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final refQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation
.end field

.field private final refReverseMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/ref/Reference<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;",
            "Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;",
            ">;"
        }
    .end annotation
.end field

.field private volatile softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    const-class v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 99
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    .line 50
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    .line 51
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    .line 55
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/lang/ref/ReferenceQueue;
    .locals 0

    .line 44
    iget-object p0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/util/concurrent/locks/Lock;
    .locals 0

    .line 44
    iget-object p0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/util/Map;
    .locals 0

    .line 44
    iget-object p0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$300(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)Z
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->removeFile(Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->close(Lorg/apache/commons/vfs2/FileSystem;)V

    return-void
.end method

.method static synthetic access$500(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Lorg/apache/commons/logging/Log;
    .locals 0

    .line 44
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 44
    sget-object v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method private close(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 3

    .line 239
    sget-object v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 240
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "close fs: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 243
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result p1

    const/4 v0, 0x1

    if-ge p1, v0, :cond_1

    .line 245
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->endThread()V

    :cond_1
    return-void
.end method

.method private endThread()V
    .locals 3

    .line 117
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    monitor-enter v0

    .line 118
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    const/4 v2, 0x0

    .line 119
    iput-object v2, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    .line 121
    invoke-static {v1, v2}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->access$802(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;Z)Z

    .line 122
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->interrupt()V

    .line 124
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getSafeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;
    .locals 0

    .line 151
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getFriendlyURI()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getSafeName(Lorg/apache/commons/vfs2/FileObject;)Ljava/lang/String;
    .locals 0

    .line 155
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getSafeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private removeFile(Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)Z
    .locals 3

    .line 277
    sget-object v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 278
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "removeFile: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->getFileName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getSafeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 281
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 283
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 285
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->getFileName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 287
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    :cond_1
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    if-ge p1, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 292
    :goto_0
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method private startThread()V
    .locals 3

    .line 104
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    if-eqz v0, :cond_0

    return-void

    .line 108
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    monitor-enter v0

    .line 109
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    if-nez v1, :cond_1

    .line 110
    new-instance v1, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;-><init>(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$1;)V

    iput-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    .line 111
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->softRefReleaseThread:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->start()V

    .line 113
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public clear(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 4

    .line 212
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 214
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 216
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 217
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 218
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;

    .line 219
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 220
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 221
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->getFileName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 225
    :cond_1
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_2

    .line 226
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->close(Lorg/apache/commons/vfs2/FileSystem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    :cond_2
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public close()V
    .locals 2

    .line 255
    invoke-super {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;->close()V

    .line 257
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->endThread()V

    .line 259
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 261
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 263
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method protected createReference(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/ref/ReferenceQueue;)Ljava/lang/ref/Reference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileObject;",
            "Ljava/lang/ref/ReferenceQueue<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;)",
            "Ljava/lang/ref/Reference<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .line 186
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    return-object v0
.end method

.method public getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2

    .line 191
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 193
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 195
    :try_start_0
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 206
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 p1, 0x0

    return-object p1

    .line 200
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/FileObject;

    if-nez v0, :cond_1

    .line 202
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 206
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

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
            "Ljava/lang/ref/Reference<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;>;"
        }
    .end annotation

    .line 297
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 298
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->startThread()V

    .line 304
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    return-object v0

    .line 308
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 309
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->fileSystemCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v0
.end method

.method public putFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 5

    .line 129
    sget-object v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "putFile: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getSafeName(Lorg/apache/commons/vfs2/FileObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 133
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 135
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->createReference(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/ref/ReferenceQueue;)Ljava/lang/ref/Reference;

    move-result-object v1

    .line 136
    new-instance v2, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v3

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;-><init>(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V

    .line 138
    iget-object v3, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 140
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/Reference;

    if-eqz p1, :cond_1

    .line 142
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public putFileIfAbsent(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 5

    .line 160
    sget-object v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 161
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "putFile: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getSafeName(Lorg/apache/commons/vfs2/FileObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 164
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->getOrCreateFilesystemCache(Lorg/apache/commons/vfs2/FileSystem;)Ljava/util/Map;

    move-result-object v0

    .line 166
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->createReference(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/ref/ReferenceQueue;)Ljava/lang/ref/Reference;

    move-result-object v1

    .line 167
    new-instance v2, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v3

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;-><init>(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V

    .line 169
    iget-object v3, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 171
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/Reference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 181
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 p1, 0x0

    return p1

    .line 174
    :cond_1
    :try_start_1
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/Reference;

    if-eqz p1, :cond_2

    .line 176
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    :cond_2
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->refReverseMap:Ljava/util/Map;

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 271
    new-instance v0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;-><init>(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->removeFile(Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 272
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->close(Lorg/apache/commons/vfs2/FileSystem;)V

    :cond_0
    return-void
.end method
