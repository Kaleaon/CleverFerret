.class public Lorg/apache/commons/vfs2/FileTypeSelector;
.super Ljava/lang/Object;
.source "FileTypeSelector.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSelector;


# instance fields
.field private final type:Lorg/apache/commons/vfs2/FileType;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/apache/commons/vfs2/FileTypeSelector;->type:Lorg/apache/commons/vfs2/FileType;

    return-void
.end method


# virtual methods
.method public includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 44
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSelectInfo;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/FileTypeSelector;->type:Lorg/apache/commons/vfs2/FileType;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
