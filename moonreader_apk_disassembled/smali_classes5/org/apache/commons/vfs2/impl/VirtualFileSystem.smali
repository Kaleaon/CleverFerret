.class public Lorg/apache/commons/vfs2/impl/VirtualFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "VirtualFileSystem.java"


# instance fields
.field private final junctions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 40
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    return-void
.end method

.method private getJunctionForFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileName;
    .locals 3

    .line 160
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    .line 166
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/FileName;

    .line 167
    invoke-interface {v1, p1}, Lorg/apache/commons/vfs2/FileName;->isDescendent(Lorg/apache/commons/vfs2/FileName;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_2
    const/4 p1, 0x0

    return-object p1
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

    .line 52
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 53
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->CREATE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 54
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->DELETE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 55
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 56
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->JUNCTIONS:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 57
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 58
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 59
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FOLDER:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 60
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 61
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 62
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->SIGNING:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 63
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 64
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addJunction(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 100
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getJunctionForFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    if-nez v0, :cond_3

    .line 106
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;

    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v0, p2}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->setFile(Lorg/apache/commons/vfs2/FileObject;)V

    .line 117
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    check-cast p2, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    const/4 v0, 0x0

    move-object v1, p1

    :goto_0
    if-nez v0, :cond_2

    if-eqz p2, :cond_2

    .line 120
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/DelegateFileObject;

    if-nez v2, :cond_1

    .line 122
    new-instance v2, Lorg/apache/commons/vfs2/provider/DelegateFileObject;

    const/4 v3, 0x0

    invoke-direct {v2, p2, p0, v3}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;Lorg/apache/commons/vfs2/FileObject;)V

    .line 123
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_1

    .line 125
    :cond_1
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->exists()Z

    move-result v0

    .line 129
    :goto_1
    sget-object v3, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {v2, v1, v3}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->attachChild(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V

    .line 119
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/AbstractFileName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v1

    move-object v1, p2

    move-object p2, v4

    goto :goto_0

    :cond_2
    return-void

    :catch_0
    move-exception p2

    .line 134
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/create-junction.error"

    invoke-direct {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0

    .line 101
    :cond_3
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.impl/nested-junction.error"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method

.method public close()V
    .locals 1

    .line 178
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->close()V

    .line 179
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 73
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getJunctionForFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 77
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/FileObject;

    .line 78
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object v0

    .line 79
    sget-object v2, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v1, v0, v2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 85
    :goto_0
    new-instance v1, Lorg/apache/commons/vfs2/provider/DelegateFileObject;

    invoke-direct {v1, p1, p0, v0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;Lorg/apache/commons/vfs2/FileObject;)V

    return-object v1
.end method

.method public removeJunction(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 146
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 147
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->junctions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
