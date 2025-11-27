.class public final Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;
.super Ljava/lang/Object;
.source "SftpClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$JSchLogger;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/apache/commons/logging/Log;

.field private static final SSH_DIR_NAME:Ljava/lang/String; = ".ssh"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    const-class v0, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->LOG:Lorg/apache/commons/logging/Log;

    .line 46
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$JSchLogger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$JSchLogger;-><init>(Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$1;)V

    invoke-static {v0}, Lcom/jcraft/jsch/JSch;->setLogger(Lcom/jcraft/jsch/Logger;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 40
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->LOG:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method private static addIdentities(Lcom/jcraft/jsch/JSch;Ljava/io/File;[Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 156
    array-length p1, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    aget-object v1, p2, v0

    .line 157
    invoke-static {p0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->addIndentity(Lcom/jcraft/jsch/JSch;Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 161
    :cond_0
    new-instance p2, Ljava/io/File;

    const-string v0, "id_rsa"

    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 162
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p2}, Ljava/io/File;->canRead()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 163
    new-instance p1, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;-><init>(Ljava/io/File;)V

    invoke-static {p0, p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->addIndentity(Lcom/jcraft/jsch/JSch;Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;)V

    :cond_1
    return-void
.end method

.method private static addIndentity(Lcom/jcraft/jsch/JSch;Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 170
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->getPrivateKey()Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->getPrivateKey()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 171
    :goto_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->getPublicKey()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->getPublicKey()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 172
    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->getPassPhrase()[B

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;Ljava/lang/String;[B)V
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 174
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.sftp/load-private-key.error"

    invoke-direct {v0, v1, p1, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static createConnection(Ljava/lang/String;I[C[CLorg/apache/commons/vfs2/FileSystemOptions;)Lcom/jcraft/jsch/Session;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 65
    new-instance v0, Lcom/jcraft/jsch/JSch;

    invoke-direct {v0}, Lcom/jcraft/jsch/JSch;-><init>()V

    .line 70
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    move-result-object v1

    .line 71
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getKnownHosts(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/io/File;

    move-result-object v2

    .line 72
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getIdentityInfo(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;

    move-result-object v3

    .line 73
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getIdentityRepositoryFactory(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/sftp/IdentityRepositoryFactory;

    move-result-object v4

    .line 75
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->findSshDir()Ljava/io/File;

    move-result-object v5

    .line 77
    invoke-static {v0, v5, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->setKnownHosts(Lcom/jcraft/jsch/JSch;Ljava/io/File;Ljava/io/File;)V

    if-eqz v4, :cond_0

    .line 80
    invoke-interface {v4, v0}, Lorg/apache/commons/vfs2/provider/sftp/IdentityRepositoryFactory;->create(Lcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/JSch;->setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V

    .line 83
    :cond_0
    invoke-static {v0, v5, v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->addIdentities(Lcom/jcraft/jsch/JSch;Ljava/io/File;[Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;)V

    const/4 v2, 0x1

    .line 87
    :try_start_0
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0, v3, p0, p1}, Lcom/jcraft/jsch/JSch;->getSession(Ljava/lang/String;Ljava/lang/String;I)Lcom/jcraft/jsch/Session;

    move-result-object p1

    if-eqz p3, :cond_1

    .line 89
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, p3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Session;->setPassword(Ljava/lang/String;)V

    .line 92
    :cond_1
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 94
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Session;->setTimeout(I)V

    .line 97
    :cond_2
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getUserInfo(Lorg/apache/commons/vfs2/FileSystemOptions;)Lcom/jcraft/jsch/UserInfo;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 99
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Session;->setUserInfo(Lcom/jcraft/jsch/UserInfo;)V

    .line 102
    :cond_3
    new-instance p2, Ljava/util/Properties;

    invoke-direct {p2}, Ljava/util/Properties;-><init>()V

    .line 105
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getStrictHostKeyChecking(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_4

    .line 107
    const-string v0, "StrictHostKeyChecking"

    invoke-virtual {p2, v0, p3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    :cond_4
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getPreferredAuthentications(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_5

    .line 112
    const-string v0, "PreferredAuthentications"

    invoke-virtual {p2, v0, p3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    :cond_5
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getCompression(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_6

    .line 118
    const-string v0, "compression.s2c"

    invoke-virtual {p2, v0, p3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    const-string v0, "compression.c2s"

    invoke-virtual {p2, v0, p3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    :cond_6
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyHost(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_a

    .line 124
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyPort(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result v0

    .line 125
    invoke-virtual {v1, p4}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyType(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    move-result-object v3

    .line 127
    sget-object v4, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_HTTP:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    invoke-virtual {v4, v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 128
    invoke-static {p3, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->createProxyHTTP(Ljava/lang/String;I)Lcom/jcraft/jsch/ProxyHTTP;

    move-result-object p3

    goto :goto_0

    .line 129
    :cond_7
    sget-object v4, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_SOCKS5:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    invoke-virtual {v4, v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 130
    invoke-static {p3, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->createProxySOCKS5(Ljava/lang/String;I)Lcom/jcraft/jsch/ProxySOCKS5;

    move-result-object p3

    goto :goto_0

    .line 131
    :cond_8
    sget-object v4, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->PROXY_STREAM:Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    invoke-virtual {v4, v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 132
    invoke-static {p3, v0, p4, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->createStreamProxy(Ljava/lang/String;ILorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;)Lcom/jcraft/jsch/Proxy;

    move-result-object p3

    goto :goto_0

    :cond_9
    const/4 p3, 0x0

    :goto_0
    if-eqz p3, :cond_a

    .line 136
    invoke-virtual {p1, p3}, Lcom/jcraft/jsch/Session;->setProxy(Lcom/jcraft/jsch/Proxy;)V

    .line 141
    :cond_a
    invoke-virtual {p2}, Ljava/util/Properties;->size()I

    move-result p3

    if-lez p3, :cond_b

    .line 142
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/util/Properties;)V

    .line 144
    :cond_b
    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->setDaemonThread(Z)V

    .line 145
    invoke-virtual {p1}, Lcom/jcraft/jsch/Session;->connect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 147
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    new-array p3, v2, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p0, p3, p4

    const-string p0, "vfs.provider.sftp/connect.error"

    invoke-direct {p2, p0, p1, p3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw p2
.end method

.method private static createProxyHTTP(Ljava/lang/String;I)Lcom/jcraft/jsch/ProxyHTTP;
    .locals 1

    if-nez p1, :cond_0

    .line 221
    new-instance p1, Lcom/jcraft/jsch/ProxyHTTP;

    invoke-direct {p1, p0}, Lcom/jcraft/jsch/ProxyHTTP;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_0
    new-instance v0, Lcom/jcraft/jsch/ProxyHTTP;

    invoke-direct {v0, p0, p1}, Lcom/jcraft/jsch/ProxyHTTP;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method private static createProxySOCKS5(Ljava/lang/String;I)Lcom/jcraft/jsch/ProxySOCKS5;
    .locals 1

    if-nez p1, :cond_0

    .line 217
    new-instance p1, Lcom/jcraft/jsch/ProxySOCKS5;

    invoke-direct {p1, p0}, Lcom/jcraft/jsch/ProxySOCKS5;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_0
    new-instance v0, Lcom/jcraft/jsch/ProxySOCKS5;

    invoke-direct {v0, p0, p1}, Lcom/jcraft/jsch/ProxySOCKS5;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method private static createStreamProxy(Ljava/lang/String;ILorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;)Lcom/jcraft/jsch/Proxy;
    .locals 7

    .line 205
    invoke-virtual {p3, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyUser(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v2

    .line 206
    invoke-virtual {p3, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyPassword(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v5

    .line 207
    invoke-virtual {p3, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyOptions(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v6

    .line 209
    invoke-virtual {p3, p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getProxyCommand(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v1

    .line 212
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;

    move-object v3, p0

    move v4, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0
.end method

.method private static findSshDir()Ljava/io/File;
    .locals 4

    .line 242
    const-string v0, "vfs.sftp.sshdir"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 244
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 245
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object v1

    .line 250
    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v1, "user.home"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".ssh"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    .line 255
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WINDOWS:Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Os;->isFamily(Lorg/apache/commons/vfs2/util/OsFamily;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 257
    const-string v0, "user.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 258
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "C:\\cygwin\\home\\"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\\.ssh"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v1

    .line 263
    :cond_2
    new-instance v0, Ljava/io/File;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static setKnownHosts(Lcom/jcraft/jsch/JSch;Ljava/io/File;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 182
    :try_start_0
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/JSch;->setKnownHosts(Ljava/lang/String;)V

    return-void

    .line 185
    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v1, "known_hosts"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_1

    .line 186
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 187
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/JSch;->setKnownHosts(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p0

    move-object p2, v0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 191
    :goto_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider.sftp/known-hosts.error"

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, v0, p2, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p1
.end method
