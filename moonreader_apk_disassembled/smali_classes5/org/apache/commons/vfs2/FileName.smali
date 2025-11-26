.class public interface abstract Lorg/apache/commons/vfs2/FileName;
.super Ljava/lang/Object;
.source "FileName.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/FileName;",
        ">;"
    }
.end annotation


# static fields
.field public static final ROOT_PATH:Ljava/lang/String; = "/"

.field public static final SEPARATOR:Ljava/lang/String; = "/"

.field public static final SEPARATOR_CHAR:C = '/'


# virtual methods
.method public abstract getBaseName()Ljava/lang/String;
.end method

.method public abstract getDepth()I
.end method

.method public abstract getExtension()Ljava/lang/String;
.end method

.method public abstract getFriendlyURI()Ljava/lang/String;
.end method

.method public abstract getParent()Lorg/apache/commons/vfs2/FileName;
.end method

.method public abstract getPath()Ljava/lang/String;
.end method

.method public abstract getPathDecoded()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getRoot()Lorg/apache/commons/vfs2/FileName;
.end method

.method public abstract getRootURI()Ljava/lang/String;
.end method

.method public abstract getScheme()Ljava/lang/String;
.end method

.method public abstract getType()Lorg/apache/commons/vfs2/FileType;
.end method

.method public abstract getURI()Ljava/lang/String;
.end method

.method public abstract isAncestor(Lorg/apache/commons/vfs2/FileName;)Z
.end method

.method public abstract isDescendent(Lorg/apache/commons/vfs2/FileName;)Z
.end method

.method public abstract isDescendent(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/NameScope;)Z
.end method

.method public abstract isFile()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
