.class public Lorg/apache/commons/vfs2/FileTypeHasNoContentException;
.super Lorg/apache/commons/vfs2/FileSystemException;
.source "FileTypeHasNoContentException.java"


# static fields
.field private static final serialVersionUID:J = 0x132b858L


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1

    .line 32
    const-string v0, "vfs.provider/read-not-file.error"

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1

    .line 36
    const-string v0, "vfs.provider/read-not-file.error"

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method
