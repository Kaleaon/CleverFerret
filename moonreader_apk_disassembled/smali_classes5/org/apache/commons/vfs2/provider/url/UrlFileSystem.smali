.class public Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "UrlFileSystem.java"


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method


# virtual methods
.method protected addCapabilities(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation

    .line 49
    sget-object v0, Lorg/apache/commons/vfs2/provider/url/UrlFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 41
    new-instance v0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;-><init>(Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;Lorg/apache/commons/vfs2/provider/AbstractFileName;)V

    return-object v0
.end method
