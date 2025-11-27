.class public Lorg/apache/commons/vfs2/cache/NullFilesCache;
.super Lorg/apache/commons/vfs2/cache/AbstractFilesCache;
.source "NullFilesCache.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/AbstractFilesCache;-><init>()V

    return-void
.end method


# virtual methods
.method public clear(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 0

    return-void
.end method

.method public getFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public putFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    return-void
.end method

.method public putFileIfAbsent(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public removeFile(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
    .locals 0

    return-void
.end method
