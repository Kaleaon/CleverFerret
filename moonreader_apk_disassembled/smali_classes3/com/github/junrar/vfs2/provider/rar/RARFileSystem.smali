.class public Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "RARFileSystem.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSystem;


# instance fields
.field private archive:Lcom/github/junrar/Archive;

.field private final files:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/github/junrar/rarfile/FileHeader;",
            ">;"
        }
    .end annotation
.end field

.field private final parentLayer:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 49
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->files:Ljava/util/Map;

    .line 57
    iput-object p2, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->parentLayer:Lorg/apache/commons/vfs2/FileObject;

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

    .line 139
    sget-object v0, Lcom/github/junrar/vfs2/provider/rar/RARFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 148
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    iget-object v2, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->archive:Lcom/github/junrar/Archive;

    invoke-direct {v0, p1, v2, v1, p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;)V

    return-object v0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->files:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 152
    new-instance v0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    iget-object v1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->archive:Lcom/github/junrar/Archive;

    iget-object v2, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->files:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/junrar/rarfile/FileHeader;

    invoke-direct {v0, p1, v1, v2, p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;)V

    return-object v0

    :cond_1
    return-object v1
.end method

.method protected createRARFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/rarfile/FileHeader;)Lcom/github/junrar/vfs2/provider/rar/RARFileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 120
    new-instance v0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    iget-object v1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->archive:Lcom/github/junrar/Archive;

    invoke-direct {v0, p1, v1, p2, p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;)V

    return-object v0
.end method

.method protected doCloseCommunicationLink()V
    .locals 2

    .line 126
    :try_start_0
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v0}, Lcom/github/junrar/Archive;->close()V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 130
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 128
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public init()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 62
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->init()V

    .line 66
    :try_start_0
    new-instance v0, Lcom/github/junrar/Archive;

    new-instance v1, Lcom/github/junrar/vfs2/provider/rar/VFSVolumeManager;

    iget-object v2, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->parentLayer:Lorg/apache/commons/vfs2/FileObject;

    invoke-direct {v1, v2}, Lcom/github/junrar/vfs2/provider/rar/VFSVolumeManager;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    invoke-direct {v0, v1}, Lcom/github/junrar/Archive;-><init>(Lcom/github/junrar/VolumeManager;)V

    iput-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->archive:Lcom/github/junrar/Archive;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 70
    iget-object v1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v1}, Lcom/github/junrar/Archive;->getFileHeaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/junrar/rarfile/FileHeader;

    .line 71
    invoke-virtual {p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v3

    .line 73
    invoke-virtual {p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    .line 74
    invoke-virtual {v2}, Lcom/github/junrar/rarfile/FileHeader;->getFileNameString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 72
    invoke-interface {v3, v4, v5}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 78
    invoke-virtual {v2}, Lcom/github/junrar/rarfile/FileHeader;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0, v3}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 79
    invoke-virtual {p0, v3}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    check-cast v3, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    .line 80
    invoke-virtual {v3, v2}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->setHeader(Lcom/github/junrar/rarfile/FileHeader;)V

    goto :goto_0

    .line 84
    :cond_1
    invoke-virtual {p0, v3, v2}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->createRARFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/rarfile/FileHeader;)Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    move-result-object v2

    .line 85
    invoke-virtual {p0, v2}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 86
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    invoke-virtual {v2, v0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->holdObject(Ljava/lang/Object;)V

    .line 92
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    :goto_1
    if-eqz v3, :cond_0

    .line 95
    invoke-virtual {p0, v3}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    check-cast v4, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    if-nez v4, :cond_2

    const/4 v4, 0x0

    .line 97
    invoke-virtual {p0, v3, v4}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->createRARFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/rarfile/FileHeader;)Lcom/github/junrar/vfs2/provider/rar/RARFileObject;

    move-result-object v4

    .line 98
    invoke-virtual {p0, v4}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 99
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    invoke-virtual {v4, v0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->holdObject(Ljava/lang/Object;)V

    .line 104
    :cond_2
    invoke-virtual {v2}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->attachChild(Lorg/apache/commons/vfs2/FileName;)V

    .line 93
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lorg/apache/commons/vfs2/provider/AbstractFileName;
    :try_end_0
    .catch Lcom/github/junrar/exception/RarException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v4

    goto :goto_1

    :cond_3
    return-void

    :catch_0
    move-exception v0

    .line 111
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 109
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected notifyAllStreamsClosed()V
    .locals 0

    .line 163
    invoke-virtual {p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;->closeCommunicationLink()V

    return-void
.end method
