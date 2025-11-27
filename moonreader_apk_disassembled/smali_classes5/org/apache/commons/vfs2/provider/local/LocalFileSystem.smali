.class public Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "LocalFileSystem.java"


# instance fields
.field private final rootFile:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, v0, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 41
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;->rootFile:Ljava/lang/String;

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

    .line 58
    sget-object v0, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 50
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/LocalFile;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;->rootFile:Ljava/lang/String;

    invoke-direct {v0, p0, v1, p1}, Lorg/apache/commons/vfs2/provider/local/LocalFile;-><init>(Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;Ljava/lang/String;Lorg/apache/commons/vfs2/provider/AbstractFileName;)V

    return-object v0
.end method

.method protected doReplicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/local/LocalFile;

    .line 67
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->getLocalFile()Ljava/io/File;

    move-result-object p1

    .line 68
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 70
    new-instance v0, Ljava/io/FilePermission;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "read"

    invoke-direct {v0, v1, v2}, Ljava/io/FilePermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    invoke-virtual {p2, v0}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    :cond_0
    return-object p1
.end method
