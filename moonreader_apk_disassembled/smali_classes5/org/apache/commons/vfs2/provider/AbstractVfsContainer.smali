.class public abstract Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;
.super Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;
.source "AbstractVfsContainer.java"


# instance fields
.field private final components:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method protected addComponent(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    monitor-enter v0

    .line 43
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 45
    instance-of v1, p1, Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v1, :cond_0

    .line 46
    move-object v1, p1

    check-cast v1, Lorg/apache/commons/vfs2/provider/VfsComponent;

    .line 47
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/vfs2/provider/VfsComponent;->setLogger(Lorg/apache/commons/logging/Log;)V

    .line 48
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/vfs2/provider/VfsComponent;->setContext(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V

    .line 49
    invoke-interface {v1}, Lorg/apache/commons/vfs2/provider/VfsComponent;->init()V

    .line 53
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    :cond_1
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
    .locals 5

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    monitor-enter v0

    .line 77
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 78
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 79
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    array-length v0, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, v1, v2

    .line 83
    instance-of v4, v3, Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v4, :cond_0

    .line 84
    check-cast v3, Lorg/apache/commons/vfs2/provider/VfsComponent;

    .line 85
    invoke-interface {v3}, Lorg/apache/commons/vfs2/provider/VfsComponent;->close()V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 79
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected removeComponent(Ljava/lang/Object;)V
    .locals 2

    .line 64
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    monitor-enter v0

    .line 66
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;->components:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 67
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
