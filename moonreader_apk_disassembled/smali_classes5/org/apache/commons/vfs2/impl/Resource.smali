.class Lorg/apache/commons/vfs2/impl/Resource;
.super Ljava/lang/Object;
.source "Resource.java"


# instance fields
.field private final packageFolder:Lorg/apache/commons/vfs2/FileObject;

.field private final packageName:Ljava/lang/String;

.field private final resource:Lorg/apache/commons/vfs2/FileObject;

.field private final root:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p2, p0, Lorg/apache/commons/vfs2/impl/Resource;->root:Lorg/apache/commons/vfs2/FileObject;

    .line 46
    iput-object p3, p0, Lorg/apache/commons/vfs2/impl/Resource;->resource:Lorg/apache/commons/vfs2/FileObject;

    .line 47
    invoke-interface {p3}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/impl/Resource;->packageFolder:Lorg/apache/commons/vfs2/FileObject;

    const/16 p2, 0x2f

    .line 48
    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p3

    const/4 v0, -0x1

    if-ne p3, v0, :cond_0

    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/Resource;->packageName:Ljava/lang/String;

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p1, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const/16 p3, 0x2e

    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/Resource;->packageName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBytes()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->resource:Lorg/apache/commons/vfs2/FileObject;

    invoke-static {v0}, Lorg/apache/commons/vfs2/FileUtil;->getContent(Lorg/apache/commons/vfs2/FileObject;)[B

    move-result-object v0

    return-object v0
.end method

.method public getCodeSourceURL()Ljava/net/URL;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->root:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public getFileObject()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 88
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->resource:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getPackageAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->packageFolder:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileContent;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getPackageFolder()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->packageFolder:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getURL()Ljava/net/URL;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/Resource;->resource:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
