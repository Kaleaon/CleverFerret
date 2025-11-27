.class public Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.source "SftpFileProvider.java"


# static fields
.field public static final ATTR_USER_INFO:Ljava/lang/String; = "UI"

.field public static final AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

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

    .line 44
    new-array v1, v0, [Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/16 v1, 0xb

    .line 48
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

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0xa

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    .line 49
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 48
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;-><init>()V

    .line 60
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method


# virtual methods
.method protected doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 72
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/vfs2/provider/GenericFileName;

    const/4 v1, 0x0

    .line 77
    :try_start_0
    sget-object v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    invoke-static {p2, v2}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object v1

    .line 79
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPort()I

    move-result v3

    sget-object v4, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 81
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v5

    .line 80
    invoke-static {v1, v4, v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v4

    sget-object v5, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 83
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v6

    .line 82
    invoke-static {v1, v5, v6}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v5

    .line 79
    invoke-static {v2, v3, v4, v5, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->createConnection(Ljava/lang/String;I[C[CLorg/apache/commons/vfs2/FileSystemOptions;)Lcom/jcraft/jsch/Session;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    invoke-static {v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    .line 91
    new-instance v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-direct {v1, v0, p1, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lcom/jcraft/jsch/Session;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p2

    .line 86
    :try_start_1
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.sftp/connect.error"

    invoke-direct {v0, v2, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    :goto_0
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

    .line 119
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 114
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    return-void
.end method
