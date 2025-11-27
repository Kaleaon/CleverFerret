.class public Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.source "HttpFileProvider.java"


# static fields
.field public static final AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

.field static final capabilities:Ljava/util/Collection;
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

    .line 40
    new-array v1, v0, [Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    sput-object v1, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v1, 0x7

    .line 43
    new-array v1, v1, [Lorg/apache/commons/vfs2/Capability;

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x5

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x6

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DIRECTORY_READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    .line 44
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;-><init>()V

    .line 53
    invoke-static {}, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

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

    .line 63
    check-cast p1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    const/4 v1, 0x0

    .line 68
    :try_start_0
    sget-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    invoke-static {p2, v0}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object v1

    .line 70
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getHostName()Ljava/lang/String;

    move-result-object v3

    .line 71
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPort()I

    move-result v4

    sget-object v0, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 73
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v5

    .line 72
    invoke-static {v1, v0, v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object v5

    sget-object v0, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 75
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v6

    .line 74
    invoke-static {v1, v0, v6}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object v6

    move-object v7, p2

    .line 70
    invoke-static/range {v2 .. v7}, Lorg/apache/commons/vfs2/provider/http/HttpClientFactory;->createConnection(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/httpclient/HttpClient;

    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    invoke-static {v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    .line 81
    new-instance v0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

    invoke-direct {v0, p1, p2, v7}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/httpclient/HttpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 78
    invoke-static {v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

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

    .line 91
    sget-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 86
    invoke-static {}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
