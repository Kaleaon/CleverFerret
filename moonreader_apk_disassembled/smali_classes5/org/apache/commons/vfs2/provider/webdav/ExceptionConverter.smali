.class public final Lorg/apache/commons/vfs2/provider/webdav/ExceptionConverter;
.super Ljava/lang/Object;
.source "ExceptionConverter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generate(Lorg/apache/jackrabbit/webdav/DavException;)Lorg/apache/commons/vfs2/FileSystemException;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 39
    invoke-static {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/ExceptionConverter;->generate(Lorg/apache/jackrabbit/webdav/DavException;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)Lorg/apache/commons/vfs2/FileSystemException;

    move-result-object p0

    return-object p0
.end method

.method public static generate(Lorg/apache/jackrabbit/webdav/DavException;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)Lorg/apache/commons/vfs2/FileSystemException;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 44
    const-string p1, "class"

    const-string v0, "message"

    const-string v1, "exception"

    invoke-virtual {p0}, Lorg/apache/jackrabbit/webdav/DavException;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 45
    invoke-virtual {p0}, Lorg/apache/jackrabbit/webdav/DavException;->hasErrorCondition()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 47
    :try_start_0
    sget-object v3, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->BUILDER_FACTORY:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/jackrabbit/webdav/DavException;->toXml(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 48
    const-string v3, "error"

    sget-object v4, Lorg/apache/jackrabbit/webdav/DavConstants;->NAMESPACE:Lorg/apache/jackrabbit/webdav/xml/Namespace;

    invoke-static {p0, v3, v4}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->matches(Lorg/w3c/dom/Node;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x0

    .line 49
    invoke-static {p0, v1, v3}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->hasChildElement(Lorg/w3c/dom/Node;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 50
    invoke-static {p0, v1, v3}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->getChildElement(Lorg/w3c/dom/Node;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 51
    invoke-static {p0, v0, v3}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->hasChildElement(Lorg/w3c/dom/Node;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    invoke-static {p0, v0, v3}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->getChildText(Lorg/w3c/dom/Element;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Ljava/lang/String;

    move-result-object v2

    .line 54
    :cond_0
    invoke-static {p0, p1, v3}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->hasChildElement(Lorg/w3c/dom/Node;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 55
    invoke-static {p0, p1, v3}, Lorg/apache/jackrabbit/webdav/xml/DomUtil;->getChildText(Lorg/w3c/dom/Element;Ljava/lang/String;Lorg/apache/jackrabbit/webdav/xml/Namespace;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const/4 p1, 0x1

    .line 56
    new-array v0, p1, [Ljava/lang/Class;

    const-class v1, Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 58
    new-array p1, p1, [Ljava/lang/Object;

    aput-object v2, p1, v3

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 59
    instance-of p1, p0, Lorg/apache/commons/vfs2/FileSystemException;

    if-eqz p1, :cond_1

    .line 60
    check-cast p0, Lorg/apache/commons/vfs2/FileSystemException;

    return-object p0

    .line 61
    :cond_1
    instance-of p1, p0, Ljava/lang/Exception;

    if-eqz p1, :cond_2

    .line 62
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    check-cast p0, Ljava/lang/Exception;

    invoke-direct {p1, v2, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p0

    .line 69
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p1, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 73
    :cond_2
    new-instance p0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    return-object p0
.end method
