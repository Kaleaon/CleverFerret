.class public abstract Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;
.source "AbstractFileSystem.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSystem;


# static fields
.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field private cacheKey:Lorg/apache/commons/vfs2/provider/FileSystemKey;

.field private final caps:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end field

.field private final fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

.field private final listenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Ljava/util/ArrayList<",
            "Lorg/apache/commons/vfs2/FileListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private final openStreams:Ljava/util/concurrent/atomic/AtomicInteger;

.field private parentLayer:Lorg/apache/commons/vfs2/FileObject;

.field private final rootName:Lorg/apache/commons/vfs2/FileName;

.field private final rootURI:Ljava/lang/String;

.field private final useCount:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    const-class v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 3

    .line 96
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->caps:Ljava/util/Collection;

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    .line 86
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->useCount:Ljava/util/concurrent/atomic/AtomicLong;

    .line 93
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->openStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 97
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->parentLayer:Lorg/apache/commons/vfs2/FileObject;

    .line 98
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    .line 99
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    .line 100
    invoke-static {}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;

    move-result-object p2

    .line 101
    invoke-virtual {p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getRootURI(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_0

    .line 103
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object p2

    .line 105
    :cond_0
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootURI:Ljava/lang/String;

    return-void
.end method

.method private fireEvent(Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;)V
    .locals 8

    .line 535
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 537
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    monitor-enter v1

    .line 538
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    .line 540
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/commons/vfs2/FileListener;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/apache/commons/vfs2/FileListener;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 542
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 545
    array-length v1, v2

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_1

    aget-object v4, v2, v3

    .line 547
    :try_start_1
    invoke-virtual {p1, v4}, Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;->notify(Lorg/apache/commons/vfs2/FileListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v4

    .line 549
    const-string v5, "vfs.provider/notify-listener.warn"

    invoke-static {v5, v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 551
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v6

    sget-object v7, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    invoke-static {v6, v7, v5, v4}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 542
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method private getCache()Lorg/apache/commons/vfs2/FilesCache;
    .locals 2

    .line 193
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileSystemManager;->getFilesCache()Lorg/apache/commons/vfs2/FilesCache;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 195
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "vfs.provider/files-cache-missing.error"

    invoke-static {v1}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private declared-synchronized resolveFile(Lorg/apache/commons/vfs2/FileName;Z)Lorg/apache/commons/vfs2/FileObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    monitor-enter p0

    .line 305
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p2, :cond_0

    .line 313
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 320
    :try_start_1
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 325
    :try_start_2
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->decorateFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-eqz p2, :cond_1

    .line 329
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_1

    :catch_0
    move-exception p2

    .line 322
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/resolve-file.error"

    invoke-direct {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0

    .line 336
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSystemManager;->getCacheStrategy()Lorg/apache/commons/vfs2/CacheStrategy;

    move-result-object p1

    sget-object p2, Lorg/apache/commons/vfs2/CacheStrategy;->ON_RESOLVE:Lorg/apache/commons/vfs2/CacheStrategy;

    invoke-virtual {p1, p2}, Lorg/apache/commons/vfs2/CacheStrategy;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 337
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->refresh()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 339
    :cond_2
    monitor-exit p0

    return-object v0

    .line 306
    :cond_3
    :try_start_3
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/mismatched-fs-for-name.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    .line 307
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 p1, 0x1

    aput-object v1, v3, p1

    const/4 p1, 0x2

    aput-object v2, v3, p1

    invoke-direct {p2, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p2

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method


# virtual methods
.method protected abstract addCapabilities(Ljava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation
.end method

.method public addJunction(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 438
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider/junctions-not-supported.error"

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    invoke-direct {p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method public addListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V
    .locals 3

    .line 460
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    monitor-enter v0

    .line 461
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_0

    .line 463
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 464
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    :cond_0
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public close()V
    .locals 1

    .line 123
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->closeCommunicationLink()V

    const/4 v0, 0x0

    .line 125
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->parentLayer:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method

.method public closeCommunicationLink()V
    .locals 1

    .line 132
    monitor-enter p0

    .line 133
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->doCloseCommunicationLink()V

    .line 134
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected abstract createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected decorateFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 343
    const-string v0, "vfs.impl/invalid-decorator.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileSystemManager;->getCacheStrategy()Lorg/apache/commons/vfs2/CacheStrategy;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/CacheStrategy;->ON_CALL:Lorg/apache/commons/vfs2/CacheStrategy;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/CacheStrategy;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 344
    new-instance v1, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;

    invoke-direct {v1, p1}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    move-object p1, v1

    .line 347
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileObjectDecoratorConst()Ljava/lang/reflect/Constructor;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 349
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileObjectDecoratorConst()Ljava/lang/reflect/Constructor;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 350
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/FileObject;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 358
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    .line 359
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileObjectDecorator()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception p1

    .line 355
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    .line 356
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileObjectDecorator()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    :catch_2
    move-exception p1

    .line 352
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    .line 353
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileObjectDecorator()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    :cond_1
    return-object p1
.end method

.method protected doCloseCommunicationLink()V
    .locals 0

    return-void
.end method

.method protected doReplicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 426
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getReplicator()Lorg/apache/commons/vfs2/provider/FileReplicator;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/FileReplicator;->replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method fileObjectDestroyed(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 562
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->useCount:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    return-void
.end method

.method fileObjectHanded(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 558
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->useCount:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    return-void
.end method

.method public fireFileChanged(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 515
    new-instance v0, Lorg/apache/commons/vfs2/events/ChangedEvent;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/events/ChangedEvent;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireEvent(Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;)V

    return-void
.end method

.method public fireFileCreated(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 495
    new-instance v0, Lorg/apache/commons/vfs2/events/CreateEvent;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/events/CreateEvent;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireEvent(Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;)V

    return-void
.end method

.method public fireFileDeleted(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 504
    new-instance v0, Lorg/apache/commons/vfs2/events/DeleteEvent;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/events/DeleteEvent;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireEvent(Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;)V

    return-void
.end method

.method freeResources()V
    .locals 0

    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 240
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/get-attribute-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method getCacheKey()Lorg/apache/commons/vfs2/provider/FileSystemKey;
    .locals 1

    .line 570
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->cacheKey:Lorg/apache/commons/vfs2/provider/FileSystemKey;

    return-object v0
.end method

.method protected getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 208
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getCache()Lorg/apache/commons/vfs2/FilesCache;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/apache/commons/vfs2/FilesCache;->getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;
    .locals 1

    .line 404
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    return-object v0
.end method

.method public getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;
    .locals 1

    .line 394
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-object v0
.end method

.method public getLastModTimeAccuracy()D
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getParentLayer()Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 263
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->parentLayer:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getRoot()Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 274
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    return-object v0
.end method

.method public getRootName()Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 168
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    return-object v0
.end method

.method public getRootURI()Ljava/lang/String;
    .locals 1

    .line 179
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootURI:Ljava/lang/String;

    return-object v0
.end method

.method public hasCapability(Lorg/apache/commons/vfs2/Capability;)Z
    .locals 1

    .line 228
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->caps:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public init()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->caps:Ljava/util/Collection;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->addCapabilities(Ljava/util/Collection;)V

    return-void
.end method

.method public isOpen()Z
    .locals 1

    .line 595
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->openStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReleaseable()Z
    .locals 5

    .line 524
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->useCount:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected notifyAllStreamsClosed()V
    .locals 0

    return-void
.end method

.method protected putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 188
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getCache()Lorg/apache/commons/vfs2/FilesCache;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FilesCache;->putFile(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method protected removeFileFromCache(Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 217
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getCache()Lorg/apache/commons/vfs2/FilesCache;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/apache/commons/vfs2/FilesCache;->removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V

    return-void
.end method

.method public removeJunction(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 449
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/junctions-not-supported.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method public removeListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V
    .locals 3

    .line 478
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    monitor-enter v0

    .line 479
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 481
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 482
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 483
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->listenerMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 376
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->doReplicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p2

    .line 383
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/replicate-file.error"

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-direct {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0

    .line 377
    :cond_0
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/replicate-missing-file.error"

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method

.method public resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 287
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->rootName:Lorg/apache/commons/vfs2/FileName;

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 288
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 300
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;Z)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 252
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider/set-attribute-not-supported.error"

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setCacheKey(Lorg/apache/commons/vfs2/provider/FileSystemKey;)V
    .locals 0

    .line 566
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->cacheKey:Lorg/apache/commons/vfs2/provider/FileSystemKey;

    return-void
.end method

.method streamClosed()V
    .locals 1

    .line 578
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->openStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 579
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->notifyAllStreamsClosed()V

    :cond_0
    return-void
.end method

.method streamOpened()V
    .locals 1

    .line 574
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->openStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    return-void
.end method
