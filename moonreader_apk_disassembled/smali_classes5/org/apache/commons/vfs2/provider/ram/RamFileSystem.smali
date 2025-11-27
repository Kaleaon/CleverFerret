.class public Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "RamFileSystem.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final BUFFER_SIZE:I = 0x200

.field private static final serialVersionUID:J = 0x132b858L


# instance fields
.field private final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/provider/ram/RamFileData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 3

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 62
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    invoke-static {p2}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    .line 64
    new-instance v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;-><init>(Lorg/apache/commons/vfs2/FileName;)V

    .line 65
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setType(Lorg/apache/commons/vfs2/FileType;)V

    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setLastModified(J)V

    .line 67
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected addCapabilities(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation

    .line 87
    sget-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public attach(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V
    .locals 2

    .line 189
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    if-nez v0, :cond_0

    .line 194
    new-instance v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;-><init>(Lorg/apache/commons/vfs2/FileName;)V

    .line 196
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->setData(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)V

    return-void

    .line 190
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Null argument"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public close()V
    .locals 1

    .line 275
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 276
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->close()V

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 77
    new-instance v0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    invoke-direct {v0, p1, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;)V

    return-object v0
.end method

.method delete(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 125
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    .line 133
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->removeChild(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)V

    .line 134
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->close()V

    .line 136
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->clear()V

    .line 137
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->close()V

    return-void

    .line 126
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "unable to delete root"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public importTree(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 206
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 207
    invoke-virtual {p0, p1, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->toRamFileObject(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method listChildren(Lorg/apache/commons/vfs2/FileName;)[Ljava/lang/String;
    .locals 4

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    if-eqz p1, :cond_2

    .line 96
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 99
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getChildren()Ljava/util/Collection;

    move-result-object p1

    .line 102
    monitor-enter p1

    .line 103
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 106
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    .line 107
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 108
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    .line 109
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 112
    :cond_1
    monitor-exit p1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method rename(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 175
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getContent()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setContent([B)V

    .line 181
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getLastModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setLastModified(J)V

    .line 182
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setType(Lorg/apache/commons/vfs2/FileType;)V

    .line 184
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->save(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    .line 185
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->delete(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-void

    .line 176
    :cond_0
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "File does not exist: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method save(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 149
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 154
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getDepth()I

    move-result v0

    if-lez v0, :cond_0

    .line 155
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    .line 157
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->hasChildren(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    .line 159
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->addChild(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)V

    .line 160
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->close()V

    .line 164
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->updateLastModified()V

    .line 166
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->close()V

    return-void

    .line 150
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "The data has no name. "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method size()J
    .locals 6

    .line 260
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    monitor-enter v0

    .line 261
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-wide/16 v2, 0x0

    .line 262
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 263
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    .line 264
    invoke-virtual {v4}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    goto :goto_0

    .line 266
    :cond_0
    monitor-exit v0

    return-wide v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method toRamFileObject(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 219
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    .line 220
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 222
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->createFolder()V

    .line 224
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 225
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    .line 226
    invoke-virtual {p0, v2, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->toRamFileObject(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 228
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->isFile()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 231
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 233
    :try_start_1
    new-instance p2, Ljava/io/BufferedOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    const/16 v1, 0x200

    invoke-direct {p2, v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 235
    :goto_1
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 236
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    goto :goto_1

    .line 238
    :cond_1
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 241
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    :cond_2
    return-void

    :catchall_0
    move-exception p2

    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 244
    :catch_1
    :try_start_4
    throw p2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    move-exception p1

    .line 248
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 251
    :cond_3
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "File is not a folder nor a file "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
