.class public interface abstract Lorg/apache/commons/vfs2/provider/LocalFileProvider;
.super Ljava/lang/Object;
.source "LocalFileProvider.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/FileProvider;


# virtual methods
.method public abstract findLocalFile(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract findLocalFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract isAbsoluteLocalName(Ljava/lang/String;)Z
.end method
