.class public Lorg/apache/commons/vfs2/impl/VirtualFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;
.source "VirtualFileProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsContainer;-><init>()V

    return-void
.end method


# virtual methods
.method closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 0

    .line 70
    check-cast p1, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    .line 72
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->removeComponent(Ljava/lang/Object;)V

    .line 73
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->close()V

    return-void
.end method

.method public createFileSystem(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 56
    new-instance v0, Lorg/apache/commons/vfs2/impl/VirtualFileName;

    const-string v1, "/"

    sget-object v2, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {v0, p1, v1, v2}, Lorg/apache/commons/vfs2/impl/VirtualFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    .line 57
    new-instance p1, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 58
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->addComponent(Ljava/lang/Object;)V

    .line 59
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getRoot()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public createFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    .line 41
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    const-string v2, "/"

    invoke-interface {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 42
    new-instance v1, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 43
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/impl/VirtualFileProvider;->addComponent(Ljava/lang/Object;)V

    .line 44
    invoke-virtual {v1, v2, p1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->addJunction(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)V

    .line 45
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/impl/VirtualFileSystem;->getRoot()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method
