.class Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;
.super Lorg/apache/commons/collections4/map/LRUMap;
.source "LRUFilesCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/cache/LRUFilesCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyLRUMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/collections4/map/LRUMap<",
        "Lorg/apache/commons/vfs2/FileName;",
        "Lorg/apache/commons/vfs2/FileObject;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x132b858L


# instance fields
.field private final filesystem:Lorg/apache/commons/vfs2/FileSystem;

.field final synthetic this$0:Lorg/apache/commons/vfs2/cache/LRUFilesCache;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/cache/LRUFilesCache;Lorg/apache/commons/vfs2/FileSystem;I)V
    .locals 0

    .line 71
    iput-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->this$0:Lorg/apache/commons/vfs2/cache/LRUFilesCache;

    const/4 p1, 0x1

    .line 72
    invoke-direct {p0, p3, p1}, Lorg/apache/commons/collections4/map/LRUMap;-><init>(IZ)V

    .line 73
    iput-object p2, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->filesystem:Lorg/apache/commons/vfs2/FileSystem;

    return-void
.end method


# virtual methods
.method protected removeLRU(Lorg/apache/commons/collections4/map/AbstractLinkedMap$LinkEntry;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/collections4/map/AbstractLinkedMap$LinkEntry<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;)Z"
        }
    .end annotation

    .line 78
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->this$0:Lorg/apache/commons/vfs2/cache/LRUFilesCache;

    monitor-enter v0

    .line 79
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/commons/collections4/map/AbstractLinkedMap$LinkEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/FileObject;

    .line 83
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->isAttached()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_3

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->isContentOpen()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 92
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/commons/collections4/map/LRUMap;->removeLRU(Lorg/apache/commons/collections4/map/AbstractLinkedMap$LinkEntry;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_2

    .line 95
    :try_start_1
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->close()V
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 97
    :try_start_2
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->this$0:Lorg/apache/commons/vfs2/cache/LRUFilesCache;

    invoke-static {v1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->access$000(Lorg/apache/commons/vfs2/cache/LRUFilesCache;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-static {}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object v2

    const-string v3, "vfs.impl/LRUFilesCache-remove-ex.warn"

    invoke-static {v3}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, p1}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 100
    :goto_0
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->this$0:Lorg/apache/commons/vfs2/cache/LRUFilesCache;

    invoke-static {p1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->access$200(Lorg/apache/commons/vfs2/cache/LRUFilesCache;)Ljava/util/concurrent/ConcurrentMap;

    move-result-object p1

    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->filesystem:Lorg/apache/commons/vfs2/FileSystem;

    invoke-interface {p1, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 101
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    const/4 v1, 0x1

    if-ge p1, v1, :cond_1

    .line 102
    iget-object p1, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->this$0:Lorg/apache/commons/vfs2/cache/LRUFilesCache;

    invoke-static {p1}, Lorg/apache/commons/vfs2/cache/LRUFilesCache;->access$200(Lorg/apache/commons/vfs2/cache/LRUFilesCache;)Ljava/util/concurrent/ConcurrentMap;

    move-result-object p1

    iget-object v2, p0, Lorg/apache/commons/vfs2/cache/LRUFilesCache$MyLRUMap;->filesystem:Lorg/apache/commons/vfs2/FileSystem;

    invoke-interface {p1, v2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :cond_1
    monitor-exit v0

    return v1

    .line 108
    :cond_2
    monitor-exit v0

    return v3

    .line 88
    :cond_3
    :goto_1
    monitor-exit v0

    return v3

    :catchall_0
    move-exception p1

    .line 109
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
