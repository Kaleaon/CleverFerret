.class public Lorg/apache/commons/vfs2/provider/webdav/WebdavFileContentInfoFactory;
.super Ljava/lang/Object;
.source "WebdavFileContentInfoFactory.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileContentInfoFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/commons/vfs2/FileContent;)Lorg/apache/commons/vfs2/FileContentInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 39
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    .line 44
    new-instance v0, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v0}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    .line 45
    sget-object v1, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->GETCONTENTTYPE:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v0, v1}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;->add(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    .line 46
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object p1

    .line 48
    sget-object v0, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->GETCONTENTTYPE:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {p1, v0}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->get(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 50
    invoke-interface {v0}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 52
    :goto_0
    sget-object v2, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->RESPONSE_CHARSET:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {p1, v2}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->get(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 54
    invoke-interface {p1}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    .line 57
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method
