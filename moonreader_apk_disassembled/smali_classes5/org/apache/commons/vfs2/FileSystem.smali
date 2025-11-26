.class public interface abstract Lorg/apache/commons/vfs2/FileSystem;
.super Ljava/lang/Object;
.source "FileSystem.java"


# virtual methods
.method public abstract addJunction(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract addListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V
.end method

.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;
.end method

.method public abstract getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;
.end method

.method public abstract getLastModTimeAccuracy()D
.end method

.method public abstract getParentLayer()Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getRoot()Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getRootName()Lorg/apache/commons/vfs2/FileName;
.end method

.method public abstract getRootURI()Ljava/lang/String;
.end method

.method public abstract hasCapability(Lorg/apache/commons/vfs2/Capability;)Z
.end method

.method public abstract removeJunction(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract removeListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V
.end method

.method public abstract replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
