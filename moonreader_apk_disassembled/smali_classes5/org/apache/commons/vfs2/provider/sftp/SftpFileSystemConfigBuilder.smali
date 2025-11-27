.class public final Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "SftpFileSystemConfigBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;
    }
.end annotation


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

.field private static final COMPRESSION:Ljava/lang/String;

.field private static final ENCODING:Ljava/lang/String;

.field private static final HOST_KEY_CHECK_ASK:Ljava/lang/String; = "ask"

.field private static final HOST_KEY_CHECK_NO:Ljava/lang/String; = "no"

.field private static final HOST_KEY_CHECK_YES:Ljava/lang/String; = "yes"

.field private static final IDENTITIES:Ljava/lang/String;

.field private static final IDENTITY_REPOSITORY_FACTORY:Ljava/lang/String;

.field private static final KNOWN_HOSTS:Ljava/lang/String;

.field private static final PREFERRED_AUTHENTICATIONS:Ljava/lang/String;

.field private static final PROXY_COMMAND:Ljava/lang/String;

.field private static final PROXY_HOST:Ljava/lang/String;

.field public static final PROXY_HTTP:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

.field private static final PROXY_OPTIONS:Ljava/lang/String;

.field private static final PROXY_PASSWORD:Ljava/lang/String;

.field private static final PROXY_PORT:Ljava/lang/String;

.field public static final PROXY_SOCKS5:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

.field public static final PROXY_STREAM:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

.field private static final PROXY_TYPE:Ljava/lang/String;

.field private static final PROXY_USER:Ljava/lang/String;

.field private static final STRICT_HOST_KEY_CHECKING:Ljava/lang/String;

.field private static final TIMEOUT:Ljava/lang/String;

.field private static final USER_DIR_IS_ROOT:Ljava/lang/String;

.field private static final _PREFIX:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 82
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    const-string v1, "http"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$1;)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_HTTP:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    .line 85
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    const-string v1, "socks"

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$1;)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_SOCKS5:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    .line 98
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    const-string v1, "stream"

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$1;)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_STREAM:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    .line 100
    const-class v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->_PREFIX:Ljava/lang/String;

    .line 101
    new-instance v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    invoke-direct {v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;-><init>()V

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "COMPRESSION"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->COMPRESSION:Ljava/lang/String;

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".IDENTITIES"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITIES:Ljava/lang/String;

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "IDENTITY_REPOSITORY_FACTORY"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITY_REPOSITORY_FACTORY:Ljava/lang/String;

    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".KNOWN_HOSTS"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->KNOWN_HOSTS:Ljava/lang/String;

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PREFERRED_AUTHENTICATIONS"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PREFERRED_AUTHENTICATIONS:Ljava/lang/String;

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_HOST"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_HOST:Ljava/lang/String;

    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_USER"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_USER:Ljava/lang/String;

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_OPTIONS"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_OPTIONS:Ljava/lang/String;

    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_TYPE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_TYPE:Ljava/lang/String;

    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_PORT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_PORT:Ljava/lang/String;

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_PASSWORD"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_PASSWORD:Ljava/lang/String;

    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY_COMMAND"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_COMMAND:Ljava/lang/String;

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".STRICT_HOST_KEY_CHECKING"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->STRICT_HOST_KEY_CHECKING:Ljava/lang/String;

    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".TIMEOUT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->TIMEOUT:Ljava/lang/String;

    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".USER_DIR_IS_ROOT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->USER_DIR_IS_ROOT:Ljava/lang/String;

    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".ENCODING"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->ENCODING:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 125
    const-string v0, "sftp."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;
    .locals 1

    .line 134
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method public getCompression(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 143
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->COMPRESSION:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getConfigClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation

    .line 148
    const-class v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    return-object v0
.end method

.method public getFileNameEncoding(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 158
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->ENCODING:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getIdentities(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/io/File;
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 173
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getIdentityInfo(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 175
    array-length v0, p1

    new-array v1, v0, [Ljava/io/File;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 177
    aget-object v3, p1, v2

    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->getPrivateKey()Ljava/io/File;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getIdentityInfo(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;
    .locals 1

    .line 192
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITIES:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    check-cast p1, [Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    return-object p1
.end method

.method public getIdentityRepositoryFactory(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/sftp/IdentityRepositoryFactory;
    .locals 1

    .line 202
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITY_REPOSITORY_FACTORY:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/IdentityRepositoryFactory;

    return-object p1
.end method

.method public getKnownHosts(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/io/File;
    .locals 1

    .line 211
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->KNOWN_HOSTS:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/File;

    return-object p1
.end method

.method public getPreferredAuthentications(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 222
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PREFERRED_AUTHENTICATIONS:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProxyCommand(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 2

    .line 236
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_COMMAND:Ljava/lang/String;

    const-string v1, "nc -q 0 %s %d"

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProxyHost(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 248
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_HOST:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProxyOptions(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystemOptions;
    .locals 1

    .line 261
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_OPTIONS:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/FileSystemOptions;

    return-object p1
.end method

.method public getProxyPassword(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 274
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_PASSWORD:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProxyPort(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    .line 286
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_PORT:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getProxyType(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;
    .locals 1

    .line 296
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_TYPE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    return-object p1
.end method

.method public getProxyUser(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 308
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_USER:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getStrictHostKeyChecking(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 2

    .line 317
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->STRICT_HOST_KEY_CHECKING:Ljava/lang/String;

    const-string v1, "no"

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;
    .locals 1

    .line 326
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getUserDirIsRoot(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;
    .locals 2

    .line 339
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->USER_DIR_IS_ROOT:Ljava/lang/String;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public getUserInfo(Lorg/apache/commons/vfs2/FileSystemOptions;)Lcom/jcraft/jsch/UserInfo;
    .locals 1

    .line 348
    const-class v0, Lcom/jcraft/jsch/UserInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/jcraft/jsch/UserInfo;

    return-object p1
.end method

.method public setCompression(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 363
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->COMPRESSION:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setFileNameEncoding(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 373
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->ENCODING:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public varargs setIdentities(Lorg/apache/commons/vfs2/FileSystemOptions;[Ljava/io/File;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-eqz p2, :cond_0

    .line 390
    array-length v0, p2

    new-array v0, v0, [Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    const/4 v1, 0x0

    .line 391
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 392
    new-instance v2, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    aget-object v3, p2, v1

    invoke-direct {v2, v3}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;-><init>(Ljava/io/File;)V

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 395
    :cond_1
    sget-object p2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITIES:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public varargs setIdentityInfo(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 408
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITIES:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setIdentityRepositoryFactory(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/sftp/IdentityRepositoryFactory;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 423
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->IDENTITY_REPOSITORY_FACTORY:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setKnownHosts(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 436
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->KNOWN_HOSTS:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setPreferredAuthentications(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 447
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PREFERRED_AUTHENTICATIONS:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyCommand(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 459
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_COMMAND:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyHost(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 472
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_HOST:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyOptions(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    .line 484
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_OPTIONS:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyPassword(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 496
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_PASSWORD:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyPort(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 1

    .line 509
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_PORT:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyType(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;)V
    .locals 1

    .line 526
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_TYPE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyUser(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 538
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_USER:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setStrictHostKeyChecking(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p2, :cond_1

    .line 556
    const-string v0, "ask"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "no"

    .line 557
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "yes"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 561
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->STRICT_HOST_KEY_CHECKING:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 558
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider.sftp/StrictHostKeyChecking-arg.error"

    invoke-direct {p1, v0, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method public setTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/Integer;)V
    .locals 1

    .line 571
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setUserDirIsRoot(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 581
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->USER_DIR_IS_ROOT:Ljava/lang/String;

    if-eqz p2, :cond_0

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setUserInfo(Lorg/apache/commons/vfs2/FileSystemOptions;Lcom/jcraft/jsch/UserInfo;)V
    .locals 1

    .line 591
    const-class v0, Lcom/jcraft/jsch/UserInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
