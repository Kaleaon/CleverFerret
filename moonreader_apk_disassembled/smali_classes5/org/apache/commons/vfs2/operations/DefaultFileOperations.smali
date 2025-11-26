.class public Lorg/apache/commons/vfs2/operations/DefaultFileOperations;
.super Ljava/lang/Object;
.source "DefaultFileOperations.java"

# interfaces
.implements Lorg/apache/commons/vfs2/operations/FileOperations;


# instance fields
.field private final fileObject:Lorg/apache/commons/vfs2/FileObject;

.field private final fsmanager:Lorg/apache/commons/vfs2/FileSystemManager;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    .line 46
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fsmanager:Lorg/apache/commons/vfs2/FileSystemManager;

    return-void
.end method


# virtual methods
.method public getOperation(Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;)",
            "Lorg/apache/commons/vfs2/operations/FileOperation;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    .line 84
    iget-object v1, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fsmanager:Lorg/apache/commons/vfs2/FileSystemManager;

    invoke-interface {v1, v0}, Lorg/apache/commons/vfs2/FileSystemManager;->getOperationProviders(Ljava/lang/String;)[Lorg/apache/commons/vfs2/operations/FileOperationProvider;

    move-result-object v0

    .line 86
    const-string v1, "vfs.operation/operation-not-supported.error"

    if-eqz v0, :cond_3

    .line 92
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v3, v0, v4

    .line 93
    iget-object v5, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v3, v5, p1}, Lorg/apache/commons/vfs2/operations/FileOperationProvider;->getOperation(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;

    move-result-object v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-eqz v3, :cond_2

    return-object v3

    .line 101
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 87
    :cond_3
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public getOperations()[Ljava/lang/Class;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    .line 57
    iget-object v1, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fsmanager:Lorg/apache/commons/vfs2/FileSystemManager;

    invoke-interface {v1, v0}, Lorg/apache/commons/vfs2/FileSystemManager;->getOperationProviders(Ljava/lang/String;)[Lorg/apache/commons/vfs2/operations/FileOperationProvider;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 63
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 65
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v0, v4

    .line 66
    iget-object v6, p0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->fileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v5, v1, v6}, Lorg/apache/commons/vfs2/operations/FileOperationProvider;->collectOperations(Ljava/util/Collection;Lorg/apache/commons/vfs2/FileObject;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 70
    :cond_1
    new-array v0, v3, [Ljava/lang/Class;

    .line 71
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    check-cast v0, [Ljava/lang/Class;

    return-object v0
.end method

.method public hasOperation(Ljava/lang/Class;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 115
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;->getOperations()[Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 120
    :cond_0
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 121
    invoke-virtual {p1, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method
