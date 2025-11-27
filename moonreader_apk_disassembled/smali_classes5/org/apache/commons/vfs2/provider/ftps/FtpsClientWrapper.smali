.class Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;
.super Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;
.source "FtpsClientWrapper.java"


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method


# virtual methods
.method protected createClient(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/UserAuthenticationData;)Lorg/apache/commons/net/ftp/FTPClient;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 44
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getHostName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPort()I

    move-result v1

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 46
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v3

    .line 45
    invoke-static {p2, v2, v3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v2

    sget-object v3, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 48
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPassword()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v4

    .line 47
    invoke-static {p2, v3, v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v3

    .line 49
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v5

    .line 44
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory;->createConnection(Ljava/lang/String;I[C[CLjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPSClient;

    move-result-object p1

    return-object p1
.end method
