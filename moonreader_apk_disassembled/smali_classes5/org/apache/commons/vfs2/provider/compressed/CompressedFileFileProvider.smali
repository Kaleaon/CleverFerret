.class public abstract Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;
.source "CompressedFileFileProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractLayeredFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract createFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method protected doCreateFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 58
    new-instance v0, Lorg/apache/commons/vfs2/provider/LayeredFileName;

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    const-string v2, "/"

    sget-object v3, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {v0, p1, v1, v2, v3}, Lorg/apache/commons/vfs2/provider/LayeredFileName;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    .line 59
    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileProvider;->createFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    return-object p1
.end method

.method public abstract getCapabilities()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end method
