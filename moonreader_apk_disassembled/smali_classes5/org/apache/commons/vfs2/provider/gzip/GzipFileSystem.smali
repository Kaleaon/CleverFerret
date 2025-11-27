.class public Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;
.super Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;
.source "GzipFileSystem.java"


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

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

    .line 45
    sget-object v0, Lorg/apache/commons/vfs2/provider/gzip/GzipFileProvider;->capabilities:Ljava/util/Collection;

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

    .line 40
    new-instance v0, Lorg/apache/commons/vfs2/provider/gzip/GzipFileObject;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;->getParentLayer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    invoke-direct {v0, p1, v1, p0}, Lorg/apache/commons/vfs2/provider/gzip/GzipFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;)V

    return-object v0
.end method
