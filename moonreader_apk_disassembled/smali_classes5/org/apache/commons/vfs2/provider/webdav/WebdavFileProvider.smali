.class public Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;
.super Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;
.source "WebdavFileProvider.java"


# static fields
.field public static final AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected static final capabilities:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x2

    .line 49
    new-array v1, v0, [Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    sput-object v1, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/16 v1, 0xc

    .line 53
    new-array v1, v1, [Lorg/apache/commons/vfs2/Capability;

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->CREATE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DELETE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RENAME:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x5

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x6

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x7

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0x8

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0x9

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0xa

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0xb

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DIRECTORY_READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    .line 54
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;-><init>()V

    .line 62
    invoke-static {}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method


# virtual methods
.method protected doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 79
    check-cast p1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    if-nez p2, :cond_0

    .line 80
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-direct {p2}, Lorg/apache/commons/vfs2/FileSystemOptions;-><init>()V

    :cond_0
    move-object v6, p2

    const/4 p2, 0x0

    .line 85
    :try_start_0
    sget-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    invoke-static {v6, v0}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object p2

    .line 87
    invoke-static {}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object v0

    const-string v1, "http"

    .line 88
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPort()I

    move-result v3

    sget-object v4, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 90
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v5

    .line 89
    invoke-static {p2, v4, v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 92
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPassword()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v7

    .line 91
    invoke-static {p2, v5, v7}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object v5

    .line 87
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/vfs2/provider/http/HttpClientFactory;->createConnection(Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/httpclient/HttpClient;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    .line 98
    new-instance p2, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;

    invoke-direct {p2, p1, v0, v6}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/httpclient/HttpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object p2

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 95
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    throw p1
.end method

.method public getCapabilities()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .line 108
    sget-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 103
    invoke-static {}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
