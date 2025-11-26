.class public Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;
.super Ljava/lang/Object;
.source "FTPClientWrapper.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/ftp/FtpClient;


# static fields
.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field protected final fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

.field private ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

.field private final root:Lorg/apache/commons/vfs2/provider/GenericFileName;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->root:Lorg/apache/commons/vfs2/provider/GenericFileName;

    .line 50
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    .line 51
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    return-void
.end method

.method private createClient()Lorg/apache/commons/net/ftp/FTPClient;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 63
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getRoot()Lorg/apache/commons/vfs2/provider/GenericFileName;

    move-result-object v0

    const/4 v1, 0x0

    .line 67
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    sget-object v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    invoke-static {v2, v3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object v1

    .line 69
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->createClient(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/UserAuthenticationData;)Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    invoke-static {v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    throw v0
.end method

.method private getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 86
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    if-nez v0, :cond_0

    .line 87
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->createClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    .line 90
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    return-object v0
.end method

.method private listFilesInDirectory(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v0

    .line 133
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result v1

    invoke-static {v1}, Lorg/apache/commons/net/ftp/FTPReply;->isPositiveCompletion(I)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 142
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPClient;->printWorkingDirectory()Ljava/lang/String;

    move-result-object v1

    .line 143
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    :cond_1
    move-object v0, v1

    .line 148
    :cond_2
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles()[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v1

    if-eqz p1, :cond_4

    .line 150
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    .line 151
    :cond_3
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.ftp.wrapper/change-work-directory-back.error"

    invoke-direct {p1, v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    :cond_4
    :goto_0
    return-object v1
.end method


# virtual methods
.method public abort()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 258
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 261
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    return v0
.end method

.method public appendFileStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 233
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->appendFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 235
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 236
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->appendFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method

.method public completePendingCommand()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    if-eqz v0, :cond_0

    .line 200
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->completePendingCommand()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected createClient(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/UserAuthenticationData;)Lorg/apache/commons/net/ftp/FTPClient;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 77
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getHostName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPort()I

    move-result v1

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 79
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v3

    .line 78
    invoke-static {p2, v2, v3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v2

    sget-object v3, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 81
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPassword()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v4

    .line 80
    invoke-static {p2, v3, v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v3

    .line 82
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v5

    .line 77
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory;->createConnection(Ljava/lang/String;I[C[CLjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object p1

    return-object p1
.end method

.method public deleteFile(Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->deleteFile(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 172
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 173
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->deleteFile(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public disconnect()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    const-string v0, "I/O exception while trying to disconnect, probably it\'s a closed connection, ignoring."

    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->quit()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 106
    :try_start_1
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    :goto_0
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 108
    :try_start_2
    sget-object v3, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->LOG:Lorg/apache/commons/logging/Log;

    invoke-interface {v3, v0, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 110
    :goto_1
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    throw v0

    :catchall_1
    move-exception v2

    goto :goto_4

    :catch_1
    move-exception v2

    .line 103
    :try_start_3
    sget-object v3, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->LOG:Lorg/apache/commons/logging/Log;

    const-string v4, "I/O exception while trying to quit, probably it\'s a timed out connection, ignoring."

    invoke-interface {v3, v4, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 106
    :try_start_4
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v2

    .line 108
    :try_start_5
    sget-object v3, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->LOG:Lorg/apache/commons/logging/Log;

    invoke-interface {v3, v0, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_0

    :goto_2
    return-void

    .line 110
    :goto_3
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    throw v0

    .line 106
    :goto_4
    :try_start_6
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 110
    :goto_5
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    goto :goto_6

    :catchall_3
    move-exception v0

    goto :goto_7

    :catch_3
    move-exception v3

    .line 108
    :try_start_7
    sget-object v4, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->LOG:Lorg/apache/commons/logging/Log;

    invoke-interface {v4, v0, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_5

    .line 110
    :goto_6
    throw v2

    :goto_7
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    throw v0
.end method

.method public getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;
    .locals 1

    .line 59
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-object v0
.end method

.method public getReplyString()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 268
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Lorg/apache/commons/vfs2/provider/GenericFileName;
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->root:Lorg/apache/commons/vfs2/provider/GenericFileName;

    return-object v0
.end method

.method public isConnected()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->listFilesInDirectory(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 122
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 123
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->listFilesInDirectory(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object p1

    return-object p1
.end method

.method public makeDirectory(Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->makeDirectory(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 192
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 193
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->makeDirectory(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public removeDirectory(Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->removeDirectory(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 162
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 163
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->removeDirectory(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public rename(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/net/ftp/FTPClient;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 182
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 183
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/net/ftp/FTPClient;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 211
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 212
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method public retrieveFileStream(Ljava/lang/String;J)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 219
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    .line 220
    invoke-virtual {v0, p2, p3}, Lorg/apache/commons/net/ftp/FTPClient;->setRestartOffset(J)V

    .line 221
    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 223
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 224
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    .line 225
    invoke-virtual {v0, p2, p3}, Lorg/apache/commons/net/ftp/FTPClient;->setRestartOffset(J)V

    .line 226
    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method public storeFileStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->storeFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 245
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->disconnect()V

    .line 246
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;->getFtpClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->storeFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method
