.class public Lorg/apache/commons/vfs2/FileFilterSelector;
.super Lorg/apache/commons/vfs2/FileDepthSelector;
.source "FileFilterSelector.java"


# instance fields
.field private final fileFilter:Lorg/apache/commons/vfs2/FileFilter;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileFilterSelector;-><init>(Lorg/apache/commons/vfs2/FileFilter;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/FileFilter;)V
    .locals 1

    const/4 v0, 0x1

    .line 37
    invoke-direct {p0, v0, v0}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>(II)V

    .line 38
    iput-object p1, p0, Lorg/apache/commons/vfs2/FileFilterSelector;->fileFilter:Lorg/apache/commons/vfs2/FileFilter;

    return-void
.end method


# virtual methods
.method public accept(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1

    .line 63
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileFilterSelector;->fileFilter:Lorg/apache/commons/vfs2/FileFilter;

    if-eqz v0, :cond_0

    .line 64
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileFilter;->accept(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result p1

    return p1

    .line 67
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "vfs.selectors/filefilter.missing.error"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1

    .line 49
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/FileDepthSelector;->includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 53
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/FileFilterSelector;->accept(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result p1

    return p1
.end method
