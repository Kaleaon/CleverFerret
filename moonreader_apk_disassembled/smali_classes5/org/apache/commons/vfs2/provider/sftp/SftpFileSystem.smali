.class public Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "SftpFileSystem.java"


# static fields
.field private static final EXEC_BUFFER_SIZE:I = 0x80

.field private static final LAST_MOD_TIME_ACCURACY:J = 0x3e8L

.field private static final SLEEP_MILLIS:I = 0x64


# instance fields
.field private groupsIds:[I

.field private idleChannel:Lcom/jcraft/jsch/ChannelSftp;

.field private session:Lcom/jcraft/jsch/Session;

.field private uid:I


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lcom/jcraft/jsch/Session;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 67
    invoke-direct {p0, p1, v0, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    const/4 p1, -0x1

    .line 58
    iput p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->uid:I

    .line 68
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    return-void
.end method

.method private ensureSession()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 138
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->doCloseCommunicationLink()V

    const/4 v0, 0x0

    .line 144
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    .line 146
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    sget-object v3, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    invoke-static {v2, v3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object v0

    .line 149
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPort()I

    move-result v3

    sget-object v4, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 151
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v5

    .line 150
    invoke-static {v0, v4, v5}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v4

    sget-object v5, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 153
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v1

    .line 152
    invoke-static {v0, v5, v1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v1

    .line 154
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v5

    .line 149
    invoke-static {v2, v3, v4, v1, v5}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->createConnection(Ljava/lang/String;I[C[CLorg/apache/commons/vfs2/FileSystemOptions;)Lcom/jcraft/jsch/Session;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    invoke-static {v0}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    .line 160
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    return-void

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    .line 156
    :try_start_1
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v3, "vfs.provider.sftp/connect.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 158
    :goto_1
    invoke-static {v0}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V

    throw v1
.end method

.method private executeCommand(Ljava/lang/String;Ljava/lang/StringBuilder;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->ensureSession()V

    .line 268
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    const-string v1, "exec"

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/ChannelExec;

    .line 270
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/ChannelExec;->setCommand(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 271
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/ChannelExec;->setInputStream(Ljava/io/InputStream;)V

    .line 272
    new-instance p1, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 273
    :try_start_0
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/jcraft/jsch/ChannelExec;->setErrStream(Ljava/io/OutputStream;Z)V

    .line 274
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->connect()V

    const/16 v1, 0x80

    .line 277
    new-array v2, v1, [C

    :goto_0
    const/4 v3, 0x0

    .line 279
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/InputStreamReader;->read([CII)I

    move-result v4

    if-ltz v4, :cond_0

    .line 280
    invoke-virtual {p2, v2, v3, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 282
    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStreamReader;->close()V

    .line 285
    :goto_1
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->isClosed()Z

    move-result p1

    if-nez p1, :cond_1

    const-wide/16 p1, 0x64

    .line 287
    :try_start_1
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    nop

    goto :goto_1

    .line 292
    :cond_1
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->disconnect()V

    .line 293
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->getExitStatus()I

    move-result p1

    return p1

    :catchall_0
    move-exception p2

    .line 272
    :try_start_2
    throw p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    .line 282
    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStreamReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception p1

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v0
.end method


# virtual methods
.method protected addCapabilities(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation

    .line 185
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 193
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    invoke-direct {v0, p1, p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;)V

    return-object v0
.end method

.method protected doCloseCommunicationLink()V
    .locals 2

    .line 73
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->idleChannel:Lcom/jcraft/jsch/ChannelSftp;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    .line 75
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->idleChannel:Lcom/jcraft/jsch/ChannelSftp;

    .line 78
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    if-eqz v0, :cond_1

    .line 79
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->disconnect()V

    .line 80
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    :cond_1
    return-void
.end method

.method protected getChannel()Lcom/jcraft/jsch/ChannelSftp;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->ensureSession()V

    .line 96
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->idleChannel:Lcom/jcraft/jsch/ChannelSftp;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 98
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->idleChannel:Lcom/jcraft/jsch/ChannelSftp;

    goto :goto_0

    .line 100
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->session:Lcom/jcraft/jsch/Session;

    const-string v1, "sftp"

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/ChannelSftp;

    .line 101
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp;->connect()V

    .line 102
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    move-result-object v1

    .line 103
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getUserDirIsRoot(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;

    move-result-object v1

    .line 104
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_1

    .line 105
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_2

    if-nez v1, :cond_2

    .line 107
    :cond_1
    :try_start_1
    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    :catch_0
    move-exception v0

    .line 109
    :try_start_2
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v3, "vfs.provider.sftp/change-work-directory.error"

    invoke-direct {v1, v3, v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    .line 115
    :cond_2
    :goto_0
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;

    move-result-object v1

    .line 116
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;->getFileNameEncoding(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v1
    :try_end_2
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_2 .. :try_end_2} :catch_2

    if-eqz v1, :cond_3

    .line 120
    :try_start_3
    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->setFilenameEncoding(Ljava/lang/String;)V
    :try_end_3
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_3 .. :try_end_3} :catch_2

    return-object v0

    .line 122
    :catch_1
    :try_start_4
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.sftp/filename-encoding.error"

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
    :try_end_4
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_4 .. :try_end_4} :catch_2

    :cond_3
    return-object v0

    :catch_2
    move-exception v0

    .line 127
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.sftp/connect.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getGroupsIds()[I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->groupsIds:[I

    if-nez v0, :cond_2

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    const-string v1, "id -G"

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->executeCommand(Ljava/lang/String;Ljava/lang/StringBuilder;)I

    move-result v1

    if-nez v1, :cond_1

    .line 223
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 225
    array-length v1, v0

    new-array v1, v1, [I

    const/4 v2, 0x0

    .line 226
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 227
    aget-object v3, v0, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 230
    :cond_0
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->groupsIds:[I

    goto :goto_1

    .line 219
    :cond_1
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Could not get the groups id of the current user (error code: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 232
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->groupsIds:[I

    return-object v0
.end method

.method public getLastModTimeAccuracy()D
    .locals 2

    const-wide v0, 0x408f400000000000L    # 1000.0

    return-wide v0
.end method

.method public getUId()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    iget v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->uid:I

    if-gez v0, :cond_1

    .line 245
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    const-string v1, "id -u"

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->executeCommand(Ljava/lang/String;Ljava/lang/StringBuilder;)I

    move-result v1

    if-nez v1, :cond_0

    .line 251
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->uid:I

    goto :goto_0

    .line 248
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Could not get the user id of the current user (error code: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 253
    :cond_1
    :goto_0
    iget v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->uid:I

    return v0
.end method

.method protected putChannel(Lcom/jcraft/jsch/ChannelSftp;)V
    .locals 1

    .line 170
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->idleChannel:Lcom/jcraft/jsch/ChannelSftp;

    if-nez v0, :cond_1

    .line 172
    invoke-virtual {p1}, Lcom/jcraft/jsch/ChannelSftp;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/jcraft/jsch/ChannelSftp;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 173
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->idleChannel:Lcom/jcraft/jsch/ChannelSftp;

    :cond_0
    return-void

    .line 176
    :cond_1
    invoke-virtual {p1}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    return-void
.end method
