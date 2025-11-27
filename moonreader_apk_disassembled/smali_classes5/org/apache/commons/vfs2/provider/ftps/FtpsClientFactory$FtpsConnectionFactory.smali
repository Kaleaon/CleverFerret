.class final Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;
.super Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;
.source "FtpsClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FtpsConnectionFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory<",
        "Lorg/apache/commons/net/ftp/FTPSClient;",
        "Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;)V
    .locals 0

    .line 63
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$1;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;-><init>(Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createClient(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 59
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->createClient(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPSClient;

    move-result-object p1

    return-object p1
.end method

.method protected createClient(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPSClient;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getFtpsMode(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->IMPLICIT:Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    if-ne v0, v1, :cond_0

    .line 70
    new-instance v0, Lorg/apache/commons/net/ftp/FTPSClient;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>(Z)V

    goto :goto_0

    .line 72
    :cond_0
    new-instance v0, Lorg/apache/commons/net/ftp/FTPSClient;

    invoke-direct {v0}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>()V

    .line 75
    :goto_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    invoke-virtual {v1, p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getTrustManager(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljavax/net/ssl/TrustManager;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 77
    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->setTrustManager(Ljavax/net/ssl/TrustManager;)V

    .line 80
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    invoke-virtual {v1, p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getKeyManager(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljavax/net/ssl/KeyManager;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 82
    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;->setKeyManager(Ljavax/net/ssl/KeyManager;)V

    :cond_2
    return-object v0
.end method

.method protected bridge synthetic setupOpenConnection(Lorg/apache/commons/net/ftp/FTPClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    check-cast p1, Lorg/apache/commons/net/ftp/FTPSClient;

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->setupOpenConnection(Lorg/apache/commons/net/ftp/FTPSClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method

.method protected setupOpenConnection(Lorg/apache/commons/net/ftp/FTPSClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    invoke-virtual {v0, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getDataChannelProtectionLevel(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    move-result-object p2

    if-eqz p2, :cond_0

    const-wide/16 v0, 0x0

    .line 94
    :try_start_0
    invoke-virtual {p1, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->execPBSZ(J)V

    .line 95
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->execPROT(Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 97
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const-string p2, "vfs.provider.ftps/data-channel.level"

    invoke-direct {v0, p2, p1, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v0

    :cond_0
    return-void
.end method
