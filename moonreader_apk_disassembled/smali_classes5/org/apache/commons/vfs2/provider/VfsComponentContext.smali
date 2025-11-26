.class public interface abstract Lorg/apache/commons/vfs2/provider/VfsComponentContext;
.super Ljava/lang/Object;
.source "VfsComponentContext.java"


# virtual methods
.method public abstract getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;
.end method

.method public abstract getReplicator()Lorg/apache/commons/vfs2/provider/FileReplicator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getTemporaryFileStore()Lorg/apache/commons/vfs2/provider/TemporaryFileStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract parseURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
