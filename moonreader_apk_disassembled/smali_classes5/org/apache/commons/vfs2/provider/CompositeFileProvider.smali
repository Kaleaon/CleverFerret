.class public abstract Lorg/apache/commons/vfs2/provider/CompositeFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.source "CompositeFileProvider.java"


# static fields
.field private static final INITIAL_BUFSZ:I = 0x50


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    const/16 v0, 0x50

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 54
    invoke-static {p2, p1}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 56
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/CompositeFileProvider;->getSchemes()[Ljava/lang/String;

    move-result-object p2

    .line 57
    array-length v0, p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    aget-object v3, p2, v2

    .line 58
    const-string v4, ":"

    invoke-virtual {p1, v1, v4}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {p1, v1, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/CompositeFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, p3}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getSchemes()[Ljava/lang/String;
.end method
