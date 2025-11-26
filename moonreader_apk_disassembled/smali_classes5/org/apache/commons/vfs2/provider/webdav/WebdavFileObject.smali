.class public Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;
.super Lorg/apache/commons/vfs2/provider/http/HttpFileObject;
.source "WebdavFileObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/http/HttpFileObject<",
        "Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;",
        ">;"
    }
.end annotation


# static fields
.field public static final RESPONSE_CHARSET:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;


# instance fields
.field private final builder:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

.field private final fileSystem:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 213
    const-string v0, "response-charset"

    invoke-static {v0}, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->create(Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->RESPONSE_CHARSET:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;)V
    .locals 1

    .line 221
    invoke-static {}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;)V

    .line 222
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->fileSystem:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;

    .line 223
    invoke-static {}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->builder:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 80
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;)Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;
    .locals 0

    .line 80
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->builder:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    return-object p0
.end method

.method private execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 461
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->fileSystem:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;->getClient()Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/httpclient/HttpClient;->executeMethod(Lorg/apache/commons/httpclient/HttpMethod;)I

    move-result v0

    const/16 v1, 0x194

    if-eq v0, v1, :cond_1

    const/16 v1, 0x19a

    if-eq v0, v1, :cond_1

    .line 465
    invoke-interface {p1}, Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;->checkSuccess()V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/apache/jackrabbit/webdav/DavException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    .line 474
    invoke-interface {p1}, Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;->releaseConnection()V

    :cond_0
    return-void

    .line 463
    :cond_1
    :try_start_1
    new-instance v0, Lorg/apache/commons/vfs2/FileNotFoundException;

    invoke-interface {p1}, Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;->getURI()Lorg/apache/commons/httpclient/URI;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileNotFoundException;-><init>(Ljava/lang/Object;)V

    throw v0
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/jackrabbit/webdav/DavException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 471
    :try_start_2
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/webdav/ExceptionConverter;->generate(Lorg/apache/jackrabbit/webdav/DavException;)Lorg/apache/commons/vfs2/FileSystemException;

    move-result-object v0

    throw v0

    :catch_1
    move-exception v0

    .line 469
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_2
    move-exception v0

    .line 467
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    if-eqz p1, :cond_2

    .line 474
    invoke-interface {p1}, Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;->releaseConnection()V

    :cond_2
    throw v0
.end method

.method private hrefString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;
    .locals 10

    .line 541
    new-instance v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPort()I

    move-result v3

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getDefaultPort()I

    move-result v4

    .line 542
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v8

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v9

    const-string v1, "http"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v9}, Lorg/apache/commons/vfs2/provider/URLFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V

    .line 544
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getUrlCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getURIEncoded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 546
    :catch_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getURI()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private isCurrentFile(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/URLFileName;)Z
    .locals 3

    .line 551
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->hrefString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v0

    .line 552
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 553
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 555
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private isDirectory(Lorg/apache/commons/vfs2/provider/URLFileName;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 560
    :try_start_0
    const-string v0, "resourcetype"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 562
    invoke-interface {v0}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Node;

    if-eqz v0, :cond_0

    .line 563
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "collection"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1

    .line 567
    :catch_0
    new-instance v0, Lorg/apache/commons/vfs2/FileNotFolderException;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private resourceName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 578
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 579
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 581
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 582
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method private toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 605
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;Z)Ljava/lang/String;
    .locals 10

    if-eqz p2, :cond_0

    .line 619
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getUserName()Ljava/lang/String;

    move-result-object p2

    .line 620
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPassword()Ljava/lang/String;

    move-result-object v0

    move-object v5, p2

    move-object v6, v0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    move-object v5, p2

    move-object v6, v5

    .line 622
    :goto_0
    new-instance v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPort()I

    move-result v3

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getDefaultPort()I

    move-result v4

    .line 623
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v8

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v9

    const-string v1, "http"

    invoke-direct/range {v0 .. v9}, Lorg/apache/commons/vfs2/provider/URLFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V

    .line 625
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getUrlCharset()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lorg/apache/commons/vfs2/provider/URLFileName;->getURIEncoded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 627
    :catch_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getURI()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected configureMethod(Lorg/apache/commons/httpclient/HttpMethodBase;)V
    .locals 2

    .line 227
    invoke-virtual {p1}, Lorg/apache/commons/httpclient/HttpMethodBase;->getParams()Lorg/apache/commons/httpclient/params/HttpMethodParams;

    move-result-object p1

    const-string v0, "http.method.retry-handler"

    invoke-static {}, Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;->getInstance()Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/apache/commons/httpclient/params/HttpMethodParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected doCreateFolder()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 235
    new-instance v0, Lorg/apache/jackrabbit/webdav/client/methods/MkColMethod;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/jackrabbit/webdav/client/methods/MkColMethod;-><init>(Ljava/lang/String;)V

    .line 236
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 238
    :try_start_0
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 240
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.webdav/create-collection.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected doDelete()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 249
    new-instance v0, Lorg/apache/jackrabbit/webdav/client/methods/DeleteMethod;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/jackrabbit/webdav/client/methods/DeleteMethod;-><init>(Ljava/lang/String;)V

    .line 250
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 251
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    return-void
.end method

.method protected doGetAttributes()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 259
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 261
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    .line 262
    new-instance v2, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v2}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v1, v4, v2, v3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;ILorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object v2

    .line 265
    invoke-virtual {v2}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->iterator()Lorg/apache/jackrabbit/webdav/property/DavPropertyIterator;

    move-result-object v2

    .line 266
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 267
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/jackrabbit/webdav/property/DavProperty;

    .line 268
    invoke-interface {v3}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getName()Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 270
    :cond_0
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getPropertyNames(Lorg/apache/commons/vfs2/provider/URLFileName;)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object v2

    .line 272
    invoke-virtual {v2}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->iterator()Lorg/apache/jackrabbit/webdav/property/DavPropertyIterator;

    move-result-object v2

    .line 273
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 274
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/jackrabbit/webdav/property/DavProperty;

    .line 275
    invoke-interface {v3}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getName()Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 276
    invoke-interface {v3}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getName()Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 278
    invoke-interface {v3}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getName()Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object v4

    .line 279
    invoke-interface {v3}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v4, :cond_1

    if-eqz v3, :cond_1

    .line 281
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_2
    return-object v0

    :catch_0
    move-exception v0

    .line 288
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.webdav/get-attributes.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 297
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    const-string v1, "getcontentlength"

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 299
    invoke-interface {v0}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 300
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 311
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    const-string v1, "getlastmodified"

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 313
    invoke-interface {v0}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 314
    invoke-static {v0}, Lorg/apache/commons/httpclient/util/DateUtil;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 321
    new-instance p1, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;

    invoke-direct {p1, p0, p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject$WebdavOutputStream;-><init>(Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;)V

    return-object p1
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 331
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->isDirectory(Lorg/apache/commons/vfs2/provider/URLFileName;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileNotFolderException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/apache/commons/vfs2/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 335
    :catch_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 333
    :catch_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    return v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected doListChildrenResolved()[Lorg/apache/commons/vfs2/FileObject;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 370
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    .line 371
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->isDirectory(Lorg/apache/commons/vfs2/provider/URLFileName;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 372
    new-instance v2, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v2}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    .line 373
    const-string v3, "displayname"

    invoke-static {v3}, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->create(Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;->add(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    .line 375
    new-instance v3, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {v3, v4, v2, v5}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;-><init>(Ljava/lang/String;Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;I)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileNotFolderException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lorg/apache/jackrabbit/webdav/DavException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 377
    :try_start_1
    invoke-direct {p0, v3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    .line 378
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 379
    invoke-virtual {v3}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->succeeded()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 380
    invoke-virtual {v3}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->getResponseBodyAsMultiStatus()Lorg/apache/jackrabbit/webdav/MultiStatus;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/jackrabbit/webdav/MultiStatus;->getResponses()[Lorg/apache/jackrabbit/webdav/MultiStatusResponse;

    move-result-object v2

    .line 382
    array-length v4, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_2

    aget-object v6, v2, v5

    .line 383
    invoke-virtual {v6}, Lorg/apache/jackrabbit/webdav/MultiStatusResponse;->getHref()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->isCurrentFile(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/URLFileName;)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_1

    .line 386
    :cond_0
    invoke-virtual {v6}, Lorg/apache/jackrabbit/webdav/MultiStatusResponse;->getHref()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->resourceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 387
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 389
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v8

    .line 390
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v9

    sget-object v10, Lorg/apache/commons/vfs2/NameScope;->CHILD:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v8, v9, v6, v10}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v6

    .line 389
    invoke-interface {v7, v6}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v6

    .line 388
    invoke-static {v6}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    .line 391
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 395
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/FileObject;
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileNotFolderException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/apache/jackrabbit/webdav/DavException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 406
    invoke-virtual {v3}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->releaseConnection()V

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    goto :goto_4

    .line 397
    :cond_3
    :try_start_2
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFolderException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;)V

    throw v1
    :try_end_2
    .catch Lorg/apache/commons/vfs2/FileNotFolderException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Lorg/apache/jackrabbit/webdav/DavException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    goto :goto_5

    :catch_3
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    .line 403
    :goto_2
    :try_start_3
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_4
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    .line 401
    :goto_3
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {v0}, Lorg/apache/jackrabbit/webdav/DavException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_5
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    .line 399
    :goto_4
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    :goto_5
    if-eqz v3, :cond_4

    .line 406
    invoke-virtual {v3}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->releaseConnection()V

    :cond_4
    throw v0
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 416
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->encodePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 417
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/URLFileName;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;Z)Ljava/lang/String;

    move-result-object p1

    .line 418
    new-instance v2, Lorg/apache/jackrabbit/webdav/client/methods/MoveMethod;

    invoke-direct {v2, v0, p1, v1}, Lorg/apache/jackrabbit/webdav/client/methods/MoveMethod;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 419
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 420
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    return-void
.end method

.method protected doSetAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "Property \'"

    .line 429
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/URLFileName;

    .line 430
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v1

    .line 431
    new-instance v2, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    invoke-direct {v2}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;-><init>()V

    .line 432
    new-instance v3, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v3}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    .line 433
    new-instance v4, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;

    sget-object v5, Lorg/apache/jackrabbit/webdav/xml/Namespace;->EMPTY_NAMESPACE:Lorg/apache/jackrabbit/webdav/xml/Namespace;

    invoke-direct {v4, p1, p2, v5}, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;-><init>(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/jackrabbit/webdav/xml/Namespace;)V

    if-eqz p2, :cond_0

    .line 435
    invoke-virtual {v2, v4}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->add(Lorg/apache/jackrabbit/webdav/property/DavProperty;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    goto :goto_0

    .line 437
    :cond_0
    invoke-interface {v4}, Lorg/apache/jackrabbit/webdav/property/DavProperty;->getName()Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object p2

    invoke-virtual {v3, p2}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;->add(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    .line 440
    :goto_0
    new-instance p2, Lorg/apache/jackrabbit/webdav/client/methods/PropPatchMethod;

    invoke-direct {p2, v1, v2, v3}, Lorg/apache/jackrabbit/webdav/client/methods/PropPatchMethod;-><init>(Ljava/lang/String;Lorg/apache/jackrabbit/webdav/property/DavPropertySet;Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;)V

    .line 441
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 442
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    .line 443
    invoke-virtual {p2}, Lorg/apache/jackrabbit/webdav/client/methods/PropPatchMethod;->succeeded()Z

    move-result p2

    if-eqz p2, :cond_1

    return-void

    .line 444
    :cond_1
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' could not be set."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p2

    .line 449
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    aput-object p1, v2, v1

    const-string p1, "vfs.provider.webdav/set-attributes"

    invoke-direct {v0, p1, p2, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v0

    :catch_1
    move-exception p1

    .line 447
    throw p1
.end method

.method protected getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;
    .locals 1

    .line 481
    new-instance v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileContentInfoFactory;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileContentInfoFactory;-><init>()V

    return-object v0
.end method

.method getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 485
    new-instance v0, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v0}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v2, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;ILorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object p1

    return-object p1
.end method

.method getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;ILorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 496
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->toUrlString(Lorg/apache/commons/vfs2/provider/URLFileName;)Ljava/lang/String;

    move-result-object v1

    .line 497
    new-instance v2, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;

    invoke-direct {v2, v1, p2, p3, v0}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;-><init>(Ljava/lang/String;ILorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;I)V

    .line 498
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V

    .line 499
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->execute(Lorg/apache/jackrabbit/webdav/client/methods/DavMethod;)V

    .line 500
    invoke-virtual {v2}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->succeeded()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 501
    invoke-virtual {v2}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->getResponseBodyAsMultiStatus()Lorg/apache/jackrabbit/webdav/MultiStatus;

    move-result-object v1

    .line 502
    invoke-virtual {v1}, Lorg/apache/jackrabbit/webdav/MultiStatus;->getResponses()[Lorg/apache/jackrabbit/webdav/MultiStatusResponse;

    move-result-object v1

    aget-object v1, v1, v0

    const/16 v3, 0xc8

    .line 503
    invoke-virtual {v1, v3}, Lorg/apache/jackrabbit/webdav/MultiStatusResponse;->getProperties(I)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object v1

    if-eqz p4, :cond_0

    .line 505
    new-instance v3, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;

    sget-object v4, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->RESPONSE_CHARSET:Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    invoke-virtual {v2}, Lorg/apache/jackrabbit/webdav/client/methods/PropFindMethod;->getResponseCharSet()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v2}, Lorg/apache/jackrabbit/webdav/property/DefaultDavProperty;-><init>(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;Ljava/lang/Object;)V

    .line 506
    invoke-virtual {v1, v3}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->add(Lorg/apache/jackrabbit/webdav/property/DavProperty;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    :cond_0
    return-object v1

    .line 510
    :cond_1
    new-instance v1, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    invoke-direct {v1}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;-><init>()V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    .line 514
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 515
    invoke-virtual {p3}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;->getContent()Ljava/util/Collection;

    move-result-object p3

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v3, v4, v0

    const/4 v0, 0x1

    aput-object p1, v4, v0

    const/4 p1, 0x2

    aput-object p2, v4, p1

    const/4 p1, 0x3

    aput-object p3, v4, p1

    const/4 p1, 0x4

    aput-object p4, v4, p1

    const-string p1, "vfs.provider.webdav/get-property.error"

    invoke-direct {v2, p1, v1, v4}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v2

    :catch_1
    move-exception p1

    .line 512
    throw p1
.end method

.method getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 490
    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;ILorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object p1

    return-object p1
.end method

.method getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavProperty;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 527
    invoke-static {p2}, Lorg/apache/jackrabbit/webdav/property/DavPropertyName;->create(Ljava/lang/String;)Lorg/apache/jackrabbit/webdav/property/DavPropertyName;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object p1

    return-object p1
.end method

.method getProperty(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 520
    new-instance v0, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v0}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    .line 521
    invoke-virtual {v0, p2}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;->add(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Z

    const/4 v1, 0x0

    .line 522
    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object p1

    .line 523
    invoke-virtual {p1, p2}, Lorg/apache/jackrabbit/webdav/property/DavPropertySet;->get(Lorg/apache/jackrabbit/webdav/property/DavPropertyName;)Lorg/apache/jackrabbit/webdav/property/DavProperty;

    move-result-object p1

    return-object p1
.end method

.method getPropertyNames(Lorg/apache/commons/vfs2/provider/URLFileName;)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 531
    new-instance v0, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;

    invoke-direct {v0}, Lorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v2, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getProperties(Lorg/apache/commons/vfs2/provider/URLFileName;ILorg/apache/jackrabbit/webdav/property/DavPropertyNameSet;Z)Lorg/apache/jackrabbit/webdav/property/DavPropertySet;

    move-result-object p1

    return-object p1
.end method

.method protected setupMethod(Lorg/apache/commons/httpclient/HttpMethod;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;,
            Lorg/apache/commons/httpclient/URIException;
        }
    .end annotation

    .line 594
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getUrlCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathQueryEncoded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 595
    invoke-interface {p1, v0}, Lorg/apache/commons/httpclient/HttpMethod;->setPath(Ljava/lang/String;)V

    .line 596
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileObject;->getFollowRedirect()Z

    move-result v0

    invoke-interface {p1, v0}, Lorg/apache/commons/httpclient/HttpMethod;->setFollowRedirects(Z)V

    .line 597
    const-string v0, "User-Agent"

    const-string v1, "Jakarta-Commons-VFS"

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/httpclient/HttpMethod;->setRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    const-string v0, "Cache-control"

    const-string v1, "no-cache"

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/httpclient/HttpMethod;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    const-string v0, "Cache-store"

    const-string v2, "no-store"

    invoke-interface {p1, v0, v2}, Lorg/apache/commons/httpclient/HttpMethod;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 600
    const-string v0, "Pragma"

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/httpclient/HttpMethod;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 601
    const-string v0, "Expires"

    const-string v1, "0"

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/httpclient/HttpMethod;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
