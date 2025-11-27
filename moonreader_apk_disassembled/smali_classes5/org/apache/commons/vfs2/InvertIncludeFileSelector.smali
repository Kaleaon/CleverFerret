.class public Lorg/apache/commons/vfs2/InvertIncludeFileSelector;
.super Ljava/lang/Object;
.source "InvertIncludeFileSelector.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSelector;


# instance fields
.field private final delegateFileSelector:Lorg/apache/commons/vfs2/FileSelector;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileSelector;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v0, "delegateFileSelector"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/FileSelector;

    iput-object p1, p0, Lorg/apache/commons/vfs2/InvertIncludeFileSelector;->delegateFileSelector:Lorg/apache/commons/vfs2/FileSelector;

    return-void
.end method


# virtual methods
.method public includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lorg/apache/commons/vfs2/InvertIncludeFileSelector;->delegateFileSelector:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileSelector;->includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lorg/apache/commons/vfs2/InvertIncludeFileSelector;->delegateFileSelector:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileSelector;->traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result p1

    return p1
.end method
