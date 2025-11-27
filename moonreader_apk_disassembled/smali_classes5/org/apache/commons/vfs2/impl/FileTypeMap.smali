.class Lorg/apache/commons/vfs2/impl/FileTypeMap;
.super Ljava/lang/Object;
.source "FileTypeMap.java"


# instance fields
.field private final extensionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mimeTypeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->mimeTypeMap:Ljava/util/Map;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->extensionMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addExtension(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->extensionMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public addMimeType(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 37
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->mimeTypeMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public clear()V
    .locals 1

    .line 74
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->mimeTypeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 75
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->extensionMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public getScheme(Lorg/apache/commons/vfs2/FileObject;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 56
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    .line 57
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getContentInfo()Lorg/apache/commons/vfs2/FileContentInfo;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContentInfo;->getContentType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 59
    iget-object p1, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->mimeTypeMap:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 63
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->isFile()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 66
    :cond_1
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getExtension()Ljava/lang/String;

    move-result-object p1

    .line 67
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/FileTypeMap;->extensionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method
