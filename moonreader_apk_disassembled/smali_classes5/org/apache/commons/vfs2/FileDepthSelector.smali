.class public Lorg/apache/commons/vfs2/FileDepthSelector;
.super Ljava/lang/Object;
.source "FileDepthSelector.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSelector;


# instance fields
.field private final maxDepth:I

.field private final minDepth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, v0, v0}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>(II)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 51
    invoke-direct {p0, p1, p1}, Lorg/apache/commons/vfs2/FileDepthSelector;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Lorg/apache/commons/vfs2/FileDepthSelector;->minDepth:I

    .line 41
    iput p2, p0, Lorg/apache/commons/vfs2/FileDepthSelector;->maxDepth:I

    return-void
.end method


# virtual methods
.method public includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1

    .line 71
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSelectInfo;->getDepth()I

    move-result p1

    .line 72
    iget v0, p0, Lorg/apache/commons/vfs2/FileDepthSelector;->minDepth:I

    if-gt v0, p1, :cond_0

    iget v0, p0, Lorg/apache/commons/vfs2/FileDepthSelector;->maxDepth:I

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1

    .line 83
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSelectInfo;->getDepth()I

    move-result p1

    iget v0, p0, Lorg/apache/commons/vfs2/FileDepthSelector;->maxDepth:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
