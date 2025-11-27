.class public final Lorg/apache/commons/vfs2/util/FileObjectUtils;
.super Ljava/lang/Object;
.source "FileObjectUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    move-object v0, p0

    .line 40
    :goto_0
    instance-of v1, v0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;

    if-eqz v1, :cond_0

    .line 41
    check-cast v0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getDecoratedFileObject()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    goto :goto_0

    .line 43
    :cond_0
    instance-of v1, v0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    if-eqz v1, :cond_1

    .line 44
    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    return-object v0

    :cond_1
    if-nez v0, :cond_2

    const/4 p0, 0x0

    return-object p0

    .line 50
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    if-nez p0, :cond_3

    const-string p0, "null"

    goto :goto_1

    .line 51
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    :goto_1
    const-string v1, "vfs.util/find-abstract-file-object.error"

    invoke-direct {v0, v1, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public static isInstanceOf(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileObject;",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 65
    :goto_0
    instance-of v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 66
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    .line 70
    :cond_0
    check-cast p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getDecoratedFileObject()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p0

    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v1

    :cond_2
    const/4 p0, 0x0

    return p0
.end method
