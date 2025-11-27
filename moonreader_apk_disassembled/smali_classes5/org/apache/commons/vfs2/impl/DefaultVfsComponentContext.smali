.class final Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;
.super Ljava/lang/Object;
.source "DefaultVfsComponentContext.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/VfsComponentContext;


# instance fields
.field private final manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    return-void
.end method


# virtual methods
.method public getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;
    .locals 1

    .line 94
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    return-object v0
.end method

.method public getReplicator()Lorg/apache/commons/vfs2/provider/FileReplicator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getReplicator()Lorg/apache/commons/vfs2/provider/FileReplicator;

    move-result-object v0

    return-object v0
.end method

.method public getTemporaryFileStore()Lorg/apache/commons/vfs2/provider/TemporaryFileStore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->getTemporaryFileStore()Lorg/apache/commons/vfs2/provider/TemporaryFileStore;

    move-result-object v0

    return-object v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

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

    .line 55
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;->manager:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method
