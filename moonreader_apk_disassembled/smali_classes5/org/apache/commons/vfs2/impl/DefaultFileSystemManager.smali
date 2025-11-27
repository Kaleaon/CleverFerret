.class public Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;
.super Ljava/lang/Object;
.source "DefaultFileSystemManager.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSystemManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;
    }
.end annotation


# instance fields
.field private baseFile:Lorg/apache/commons/vfs2/FileObject;

.field private final components:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;

.field private defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

.field private fileCacheStrategy:Lorg/apache/commons/vfs2/CacheStrategy;

.field private fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

.field private fileObjectDecorator:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private fileObjectDecoratorConst:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field private fileReplicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

.field private filesCache:Lorg/apache/commons/vfs2/FilesCache;

.field private init:Z

.field private localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

.field private log:Lorg/apache/commons/logging/Log;

.field private final operationProviders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/apache/commons/vfs2/operations/FileOperationProvider;",
            ">;>;"
        }
    .end annotation
.end field

.field private final providers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/commons/vfs2/provider/FileProvider;",
            ">;"
        }
    .end annotation
.end field

.field private tempFileStore:Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

.field private final typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

.field private vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    .line 77
    new-instance v0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;

    invoke-direct {v0, p0}, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;-><init>(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->context:Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    .line 87
    new-instance v0, Lorg/apache/commons/vfs2/impl/FileTypeMap;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/impl/FileTypeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

    .line 136
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)Ljava/util/Map;
    .locals 0

    .line 63
    iget-object p0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;
    .locals 0

    .line 63
    iget-object p0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->context:Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;

    return-object p0
.end method

.method private closeComponent(Ljava/lang/Object;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 441
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 442
    instance-of v0, p1, Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 443
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/vfs2/provider/VfsComponent;

    .line 444
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponent;->close()V

    .line 446
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method private getLocalFileProvider()Lorg/apache/commons/vfs2/provider/LocalFileProvider;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 967
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    if-eqz v0, :cond_0

    return-object v0

    .line 968
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/no-local-file-provider.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setupComponent(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 424
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 425
    instance-of v0, p1, Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 426
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/vfs2/provider/VfsComponent;

    .line 427
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/provider/VfsComponent;->setLogger(Lorg/apache/commons/logging/Log;)V

    .line 428
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->context:Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/provider/VfsComponent;->setContext(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V

    .line 429
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponent;->init()V

    .line 431
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method


# virtual methods
.method public _closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 2

    .line 1008
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v0, :cond_0

    .line 1010
    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V

    return-void

    .line 1011
    :cond_0
    instance-of v0, p1, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;

    if-eqz v0, :cond_1

    .line 1013
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V

    :cond_1
    return-void
.end method

.method public addExtensionMap(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 225
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/impl/FileTypeMap;->addExtension(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addMimeTypeMap(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 235
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/impl/FileTypeMap;->addMimeType(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addOperationProvider(Ljava/lang/String;Lorg/apache/commons/vfs2/operations/FileOperationProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1093
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->addOperationProvider([Ljava/lang/String;Lorg/apache/commons/vfs2/operations/FileOperationProvider;)V

    return-void
.end method

.method public addOperationProvider([Ljava/lang/String;Lorg/apache/commons/vfs2/operations/FileOperationProvider;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1106
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    .line 1107
    iget-object v3, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1108
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1109
    iget-object v4, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1114
    invoke-interface {v3, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1118
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    .line 1120
    invoke-interface {v3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1115
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.operation/operation-provider-already-added.error"

    invoke-direct {p1, p2, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    :cond_2
    return-void
.end method

.method public addProvider(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/FileProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 173
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->addProvider([Ljava/lang/String;Lorg/apache/commons/vfs2/provider/FileProvider;)V

    return-void
.end method

.method public addProvider([Ljava/lang/String;Lorg/apache/commons/vfs2/provider/FileProvider;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 188
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 189
    iget-object v4, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 190
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.impl/multiple-providers-for-scheme.error"

    invoke-direct {p1, p2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 195
    :cond_1
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    .line 198
    array-length v0, p1

    :goto_1
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    .line 199
    iget-object v3, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v3, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 202
    :cond_2
    instance-of p1, p2, Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    if-nez p1, :cond_3

    .line 203
    check-cast p2, Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    iput-object p2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    :cond_3
    return-void
.end method

.method public canCreateFileSystem(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 930
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/FileTypeMap;->getScheme(Lorg/apache/commons/vfs2/FileObject;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public close()V
    .locals 3

    .line 517
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    if-nez v0, :cond_0

    return-void

    .line 526
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/FileProvider;

    .line 527
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    goto :goto_0

    .line 530
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 533
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    .line 534
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileReplicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    .line 535
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->tempFileStore:Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    .line 536
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    .line 537
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    .line 540
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 541
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/operations/FileOperationProvider;

    .line 542
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->closeComponent(Ljava/lang/Object;)V

    goto :goto_1

    .line 546
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 549
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/FileTypeMap;->clear()V

    .line 552
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 553
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DefaultFilesystemManager.close: not all components are closed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 555
    :cond_4
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->components:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    .line 558
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    .line 561
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

    .line 562
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->baseFile:Lorg/apache/commons/vfs2/FileObject;

    .line 563
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileObjectDecorator:Ljava/lang/Class;

    .line 564
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileObjectDecoratorConst:Ljava/lang/reflect/Constructor;

    .line 565
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    .line 566
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileReplicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

    .line 567
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->tempFileStore:Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

    .line 569
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    .line 570
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileCacheStrategy:Lorg/apache/commons/vfs2/CacheStrategy;

    .line 571
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    const/4 v0, 0x0

    .line 573
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    return-void
.end method

.method public closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 1

    .line 993
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getFilesCache()Lorg/apache/commons/vfs2/FilesCache;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FilesCache;->clear(Lorg/apache/commons/vfs2/FileSystem;)V

    .line 996
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->_closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V

    return-void
.end method

.method public createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 897
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v0, :cond_0

    .line 901
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v1

    invoke-interface {v0, p1, p2, v1}, Lorg/apache/commons/vfs2/provider/FileProvider;->createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 899
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const-string p1, "vfs.impl/unknown-provider.error"

    invoke-direct {v0, p1, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0
.end method

.method public createFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 913
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->typeMap:Lorg/apache/commons/vfs2/impl/FileTypeMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/FileTypeMap;->getScheme(Lorg/apache/commons/vfs2/FileObject;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 918
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 915
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/no-provider-for-file.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public createVirtualFileSystem(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 954
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->createFileSystem(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public createVirtualFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 942
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->createFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public freeUnusedResources()V
    .locals 2

    .line 580
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 585
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/FileProvider;

    .line 586
    check-cast v1, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;

    .line 587
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;->freeUnusedResources()V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public getBaseFile()Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 620
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->baseFile:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getCacheStrategy()Lorg/apache/commons/vfs2/CacheStrategy;
    .locals 1

    .line 303
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileCacheStrategy:Lorg/apache/commons/vfs2/CacheStrategy;

    return-object v0
.end method

.method public getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;
    .locals 1

    .line 359
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    return-object v0
.end method

.method public getFileObjectDecorator()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 313
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileObjectDecorator:Ljava/lang/Class;

    return-object v0
.end method

.method public getFileObjectDecoratorConst()Ljava/lang/reflect/Constructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 323
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileObjectDecoratorConst:Ljava/lang/reflect/Constructor;

    return-object v0
.end method

.method public getFileSystemConfigBuilder(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1071
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v0, :cond_0

    .line 1076
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/FileProvider;->getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    move-result-object p1

    return-object p1

    .line 1073
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/unknown-scheme.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public getFilesCache()Lorg/apache/commons/vfs2/FilesCache;
    .locals 1

    .line 257
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    return-object v0
.end method

.method protected getLogger()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 159
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method public getOperationProviders(Ljava/lang/String;)[Lorg/apache/commons/vfs2/operations/FileOperationProvider;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1135
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->operationProviders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_1

    .line 1136
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1139
    new-array v0, v0, [Lorg/apache/commons/vfs2/operations/FileOperationProvider;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/commons/vfs2/operations/FileOperationProvider;

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getProviderCapabilities(Ljava/lang/String;)Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1054
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v0, :cond_0

    .line 1059
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/FileProvider;->getCapabilities()Ljava/util/Collection;

    move-result-object p1

    return-object p1

    .line 1056
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/unknown-scheme.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public getReplicator()Lorg/apache/commons/vfs2/provider/FileReplicator;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 457
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileReplicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

    if-eqz v0, :cond_0

    return-object v0

    .line 458
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/no-replicator.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSchemes()[Ljava/lang/String;
    .locals 2

    .line 1040
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 1041
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v0
.end method

.method public getTemporaryFileStore()Lorg/apache/commons/vfs2/provider/TemporaryFileStore;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 470
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->tempFileStore:Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

    if-eqz v0, :cond_0

    return-object v0

    .line 471
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/no-temp-file-store.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getURLStreamHandlerFactory()Ljava/net/URLStreamHandlerFactory;
    .locals 1

    .line 980
    new-instance v0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;

    invoke-direct {v0, p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;-><init>(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)V

    return-object v0
.end method

.method public hasProvider(Ljava/lang/String;)Z
    .locals 1

    .line 215
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

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

    .line 489
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    if-nez v0, :cond_0

    .line 490
    new-instance v0, Lorg/apache/commons/vfs2/impl/FileContentInfoFilenameFactory;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/impl/FileContentInfoFilenameFactory;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    .line 493
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    if-nez v0, :cond_1

    .line 495
    new-instance v0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    .line 497
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileCacheStrategy:Lorg/apache/commons/vfs2/CacheStrategy;

    if-nez v0, :cond_2

    .line 498
    sget-object v0, Lorg/apache/commons/vfs2/CacheStrategy;->ON_RESOLVE:Lorg/apache/commons/vfs2/CacheStrategy;

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileCacheStrategy:Lorg/apache/commons/vfs2/CacheStrategy;

    .line 500
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    .line 502
    new-instance v0, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->vfsProvider:Lorg/apache/commons/vfs2/impl/VirtualFileProvider;

    .line 503
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    const/4 v0, 0x1

    .line 505
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    return-void
.end method

.method public resolveFile(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 663
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getLocalFileProvider()Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->findLocalFile(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 664
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 632
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getBaseFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 648
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getBaseFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/net/URI;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1153
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->baseFile:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/net/URL;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1167
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Ljava/net/URI;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1169
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 677
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 692
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 693
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 699
    :cond_0
    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/UriParser;->checkUriEncoding(Ljava/lang/String;)V

    if-eqz p2, :cond_6

    .line 706
    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 709
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v1, :cond_1

    .line 711
    invoke-interface {v1, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/FileProvider;->findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 717
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    if-eqz v1, :cond_2

    invoke-interface {v1, p2}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->isAbsoluteLocalName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 718
    iget-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    invoke-interface {p1, p2}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->findLocalFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    :cond_2
    if-eqz v0, :cond_4

    .line 723
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v1, :cond_3

    .line 726
    invoke-interface {v1, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/FileProvider;->findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 724
    :cond_3
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const/4 p3, 0x2

    new-array p3, p3, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object v0, p3, v1

    const/4 v0, 0x1

    aput-object p2, p3, v0

    const-string p2, "vfs.impl/unknown-scheme.error"

    invoke-direct {p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p1

    :cond_4
    if-eqz p1, :cond_5

    .line 734
    invoke-interface {p1, p2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 731
    :cond_5
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.impl/find-rel-file.error"

    invoke-direct {p1, p3, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 702
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 749
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->FILE_SYSTEM:Lorg/apache/commons/vfs2/NameScope;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1
.end method

.method public resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p1, :cond_8

    .line 768
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 769
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 774
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 777
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 778
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 781
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x2f

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    if-nez v1, :cond_3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    if-eq v2, v3, :cond_3

    .line 783
    :cond_1
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v2

    if-nez v2, :cond_2

    .line 785
    invoke-virtual {v0, v4, v3}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 787
    :cond_2
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v4, v2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 791
    :cond_3
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;

    move-result-object v2

    .line 794
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 795
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->checkName(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Z

    move-result p3

    if-eqz p3, :cond_7

    if-eqz v1, :cond_4

    move-object p2, v0

    goto :goto_0

    .line 803
    :cond_4
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 804
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 806
    :goto_0
    iget-object p3, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz p3, :cond_5

    .line 814
    invoke-interface {p3, p1, p2}, Lorg/apache/commons/vfs2/provider/FileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    :cond_5
    if-eqz v1, :cond_6

    .line 818
    iget-object p3, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz p3, :cond_6

    .line 819
    invoke-interface {p3, p1, p2}, Lorg/apache/commons/vfs2/provider/FileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 824
    :cond_6
    check-cast p1, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {p1, v0, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 796
    :cond_7
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.provider/invalid-descendent-name.error"

    invoke-direct {p1, p3, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 765
    :cond_8
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "Invalid base filename."

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public resolveURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 836
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->checkUriEncoding(Ljava/lang/String;)V

    if-eqz p1, :cond_5

    .line 843
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 846
    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->providers:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v2, :cond_0

    .line 848
    invoke-interface {v2, v1, p1}, Lorg/apache/commons/vfs2/provider/FileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 855
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    if-eqz v2, :cond_1

    invoke-interface {v2, p1}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->isAbsoluteLocalName(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 856
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->localFileProvider:Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    :cond_1
    if-eqz v0, :cond_3

    .line 861
    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz v2, :cond_2

    .line 864
    invoke-interface {v2, v1, p1}, Lorg/apache/commons/vfs2/provider/FileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 862
    :cond_2
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object p1, v2, v0

    const-string p1, "vfs.impl/unknown-scheme.error"

    invoke-direct {v1, p1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 868
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->baseFile:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_4

    .line 872
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/NameScope;->FILE_SYSTEM:Lorg/apache/commons/vfs2/NameScope;

    invoke-virtual {p0, v0, p1, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 869
    :cond_4
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/find-rel-file.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 839
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public setBaseFile(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 609
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getLocalFileProvider()Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->findLocalFile(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->baseFile:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method

.method public setBaseFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 599
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->baseFile:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method

.method public setCacheStrategy(Lorg/apache/commons/vfs2/CacheStrategy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 289
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    if-nez v0, :cond_0

    .line 293
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileCacheStrategy:Lorg/apache/commons/vfs2/CacheStrategy;

    return-void

    .line 290
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.impl/already-inited.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDefaultProvider(Lorg/apache/commons/vfs2/provider/FileProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 246
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    .line 247
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->defaultProvider:Lorg/apache/commons/vfs2/provider/FileProvider;

    return-void
.end method

.method public setFileContentInfoFactory(Lorg/apache/commons/vfs2/FileContentInfoFactory;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 372
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    if-nez v0, :cond_0

    .line 376
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    return-void

    .line 373
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.impl/already-inited.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFileObjectDecorator(Ljava/lang/Class;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 336
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    if-nez v0, :cond_1

    .line 339
    const-class v0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    const-string v1, "vfs.impl/invalid-decorator.error"

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 344
    :try_start_0
    new-array v0, v0, [Ljava/lang/Class;

    const-class v2, Lorg/apache/commons/vfs2/FileObject;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileObjectDecoratorConst:Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileObjectDecorator:Ljava/lang/Class;

    return-void

    :catch_0
    move-exception v0

    .line 346
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, v1, p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2

    .line 340
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 337
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.impl/already-inited.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFilesCache(Lorg/apache/commons/vfs2/FilesCache;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 271
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init:Z

    if-nez v0, :cond_0

    .line 275
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->filesCache:Lorg/apache/commons/vfs2/FilesCache;

    return-void

    .line 272
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.impl/already-inited.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLogger(Lorg/apache/commons/logging/Log;)V
    .locals 0

    .line 414
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public setReplicator(Lorg/apache/commons/vfs2/provider/FileReplicator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 388
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    .line 389
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->fileReplicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

    return-void
.end method

.method public setTemporaryFileStore(Lorg/apache/commons/vfs2/provider/TemporaryFileStore;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 401
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->setupComponent(Ljava/lang/Object;)V

    .line 402
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->tempFileStore:Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

    return-void
.end method

.method public toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 884
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getLocalFileProvider()Lorg/apache/commons/vfs2/provider/LocalFileProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/LocalFileProvider;->findLocalFile(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method
