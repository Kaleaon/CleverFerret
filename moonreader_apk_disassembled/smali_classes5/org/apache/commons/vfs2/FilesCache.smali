.class public interface abstract Lorg/apache/commons/vfs2/FilesCache;
.super Ljava/lang/Object;
.source "FilesCache.java"


# virtual methods
.method public abstract clear(Lorg/apache/commons/vfs2/FileSystem;)V
.end method

.method public abstract close()V
.end method

.method public abstract getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
.end method

.method public abstract putFile(Lorg/apache/commons/vfs2/FileObject;)V
.end method

.method public abstract putFileIfAbsent(Lorg/apache/commons/vfs2/FileObject;)Z
.end method

.method public abstract removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
.end method
