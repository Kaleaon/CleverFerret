.class public interface abstract Lorg/apache/commons/vfs2/provider/FileNameParser;
.super Ljava/lang/Object;
.source "FileNameParser.java"


# virtual methods
.method public abstract encodeCharacter(C)Z
.end method

.method public abstract parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
