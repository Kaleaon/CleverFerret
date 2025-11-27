.class public Lorg/apache/commons/vfs2/FileNotFolderException;
.super Lorg/apache/commons/vfs2/FileSystemException;
.source "FileNotFolderException.java"


# static fields
.field private static final serialVersionUID:J = 0x132b858L


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1

    .line 31
    const-string v0, "vfs.provider/list-children-not-folder.error"

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1

    .line 35
    const-string v0, "vfs.provider/list-children-not-folder.error"

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method
