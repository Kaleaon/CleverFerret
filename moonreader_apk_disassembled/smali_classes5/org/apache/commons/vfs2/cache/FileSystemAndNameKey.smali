.class Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;
.super Ljava/lang/Object;
.source "FileSystemAndNameKey.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;",
        ">;"
    }
.end annotation


# instance fields
.field private final fileName:Lorg/apache/commons/vfs2/FileName;

.field private final fileSystem:Lorg/apache/commons/vfs2/FileSystem;

.field private final fileSystemId:I


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/FileSystem;Lorg/apache/commons/vfs2/FileName;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileSystem:Lorg/apache/commons/vfs2/FileSystem;

    .line 39
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    iput p1, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileSystemId:I

    .line 41
    iput-object p2, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileName:Lorg/apache/commons/vfs2/FileName;

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 27
    check-cast p1, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->compareTo(Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)I
    .locals 2

    .line 46
    iget v0, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileSystemId:I

    iget v1, p1, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileSystemId:I

    if-ge v0, v1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    if-le v0, v1, :cond_1

    const/4 p1, 0x1

    return p1

    .line 53
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileName:Lorg/apache/commons/vfs2/FileName;

    iget-object p1, p1, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileName:Lorg/apache/commons/vfs2/FileName;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileName;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method getFileName()Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 61
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileName:Lorg/apache/commons/vfs2/FileName;

    return-object v0
.end method

.method getFileSystem()Lorg/apache/commons/vfs2/FileSystem;
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->fileSystem:Lorg/apache/commons/vfs2/FileSystem;

    return-object v0
.end method
