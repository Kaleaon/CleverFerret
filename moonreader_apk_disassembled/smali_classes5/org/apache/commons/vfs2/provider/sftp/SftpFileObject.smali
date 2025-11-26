.class public Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "SftpFileObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;,
        Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpInputStream;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;",
        ">;"
    }
.end annotation


# static fields
.field private static final MOD_TIME_FACTOR:J = 0x3e8L


# instance fields
.field private attrs:Lcom/jcraft/jsch/SftpATTRS;

.field private inRefresh:Z

.field private final relPath:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 59
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 60
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    invoke-interface {p2, p1}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p0

    return-object p0
.end method

.method private flushStat()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .line 201
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 203
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 205
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    throw v1
.end method

.method private setStat(Lcom/jcraft/jsch/SftpATTRS;)V
    .locals 0

    .line 161
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    return-void
.end method

.method private statSelf()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 129
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->setStat(Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    const/4 v2, 0x0

    .line 133
    :try_start_1
    iget v1, v1, Lcom/jcraft/jsch/SftpException;->id:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_0

    .line 134
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    .line 135
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 136
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->setStat(Lcom/jcraft/jsch/SftpATTRS;)V

    goto :goto_0

    .line 139
    :cond_0
    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 150
    :catch_1
    :try_start_2
    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 153
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void

    :goto_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    throw v1
.end method


# virtual methods
.method protected doCreateFolder()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 169
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 171
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->mkdir(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    throw v1
.end method

.method protected doDelete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 214
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 216
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 217
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->rm(Ljava/lang/String;)V

    goto :goto_0

    .line 219
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->rmdir(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    throw v1
.end method

.method protected doDetach()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 66
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    return-void
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 414
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 417
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v0

    return-wide v0

    .line 415
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.sftp/unknown-size.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 448
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    monitor-enter v0

    .line 449
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 466
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 470
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 479
    :try_start_2
    new-instance v3, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpInputStream;

    invoke-direct {v3, p0, v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpInputStream;-><init>(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;Lcom/jcraft/jsch/ChannelSftp;Ljava/io/InputStream;)V

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object v3

    .line 467
    :cond_0
    :try_start_3
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/read-not-file.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1
    :try_end_3
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catch_0
    move-exception v1

    .line 472
    :try_start_4
    iget v2, v1, Lcom/jcraft/jsch/SftpException;->id:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 473
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFoundException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/vfs2/FileNotFoundException;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 476
    :cond_1
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catchall_0
    move-exception v1

    .line 484
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1
.end method

.method protected doGetLastModifiedTime()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getMTime()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long v0, v0, v2

    return-wide v0

    .line 180
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.sftp/unknown-modtime.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 498
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object p1

    .line 499
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpOutputStream;-><init>(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;Lcom/jcraft/jsch/ChannelSftp;Ljava/io/OutputStream;)V

    return-object v0
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 422
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    return-object v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    if-nez v0, :cond_0

    .line 97
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->statSelf()V

    .line 100
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    if-nez v0, :cond_1

    .line 101
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 104
    :cond_1
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_3

    .line 107
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 108
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 110
    :cond_2
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 105
    :cond_3
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.sftp/unknown-permissions.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doIsExecutable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    .line 303
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->isExecutable()Z

    move-result v0

    return v0
.end method

.method protected doIsReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    .line 265
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->isReadable()Z

    move-result v0

    return v0
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    .line 284
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->isWritable()Z

    move-result v0

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
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 326
    const-string v0, "."

    const-string v1, "vfs.provider.sftp/change-work-directory-back.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->isFile()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    return-object v3

    .line 331
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    .line 335
    :try_start_0
    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v1
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v3, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    goto/16 :goto_4

    .line 339
    :catch_0
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 340
    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp;->pwd()Ljava/lang/String;

    move-result-object v4

    .line 341
    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_1
    move-object v4, v3

    .line 350
    :goto_0
    :try_start_2
    invoke-virtual {v2, v0}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v5
    :try_end_2
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 355
    :try_start_3
    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    if-eqz v6, :cond_4

    .line 356
    invoke-virtual {v2, v4}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V
    :try_end_3
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 359
    :catch_1
    :try_start_4
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, v1, v4, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_1
    move-exception v0

    .line 355
    :try_start_5
    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    if-eqz v5, :cond_2

    .line 356
    invoke-virtual {v2, v4}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V
    :try_end_5
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 359
    :cond_2
    :try_start_6
    throw v0

    :catch_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, v1, v4, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catch_3
    move-exception v5

    .line 355
    :try_start_7
    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    if-eqz v6, :cond_3

    .line 356
    invoke-virtual {v2, v4}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V
    :try_end_7
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :cond_3
    move-object v9, v5

    move-object v5, v3

    move-object v3, v9

    :cond_4
    :goto_1
    if-nez v3, :cond_a

    .line 368
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    move-object v1, v5

    :goto_2
    if-eqz v1, :cond_9

    .line 375
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 377
    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 378
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    .line 380
    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v4

    .line 381
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2f

    if-eq v5, v6, :cond_6

    .line 382
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 385
    :cond_6
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    const-string v5, ".."

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    const-string v5, "./"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    const-string v5, "../"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_3

    .line 389
    :cond_7
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v6

    .line 390
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v7

    invoke-static {v4}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v8, Lorg/apache/commons/vfs2/NameScope;->CHILD:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v6, v7, v4, v8}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    .line 389
    invoke-interface {v5, v4}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    .line 392
    invoke-static {v4}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    invoke-direct {v5, v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->setStat(Lcom/jcraft/jsch/SftpATTRS;)V

    .line 394
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 397
    :cond_8
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/FileObject;

    return-object v0

    .line 371
    :cond_9
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.sftp/list-children.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 365
    :cond_a
    :try_start_8
    throw v3

    .line 359
    :catch_4
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, v1, v4, v5}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 368
    :goto_4
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    throw v0

    :catch_5
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0, v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-object v3
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 231
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 233
    :try_start_0
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;

    .line 234
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->relPath:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/jcraft/jsch/ChannelSftp;->rename(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 236
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    throw p1
.end method

.method protected doSetExecutable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 308
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;

    move-result-object v0

    .line 309
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/util/PosixPermissions;->makeExecutable(ZZ)I

    move-result p1

    .line 310
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->getPermissions()I

    move-result p2

    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    return v0

    .line 314
    :cond_0
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {p2, p1}, Lcom/jcraft/jsch/SftpATTRS;->setPERMISSIONS(I)V

    .line 315
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->flushStat()V

    return v0
.end method

.method protected doSetLastModifiedTime(J)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-wide/16 v0, 0x3e8

    .line 194
    div-long/2addr p1, v0

    long-to-int p2, p1

    .line 195
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {p1}, Lcom/jcraft/jsch/SftpATTRS;->getATime()I

    move-result v0

    invoke-virtual {p1, v0, p2}, Lcom/jcraft/jsch/SftpATTRS;->setACMODTIME(II)V

    .line 196
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->flushStat()V

    const/4 p1, 0x1

    return p1
.end method

.method protected doSetReadable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 270
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;

    move-result-object v0

    .line 271
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/util/PosixPermissions;->makeReadable(ZZ)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 272
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->getPermissions()I

    move-result p2

    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    return v0

    .line 276
    :cond_0
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {p2, p1}, Lcom/jcraft/jsch/SftpATTRS;->setPERMISSIONS(I)V

    .line 277
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->flushStat()V

    return v0
.end method

.method protected doSetWritable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 289
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;

    move-result-object v0

    .line 290
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/util/PosixPermissions;->makeWritable(ZZ)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 291
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->getPermissions()I

    move-result p2

    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    return v0

    .line 295
    :cond_0
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {p2, p1}, Lcom/jcraft/jsch/SftpATTRS;->setPERMISSIONS(I)V

    .line 296
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->flushStat()V

    return v0
.end method

.method getInputStream(J)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 430
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    .line 434
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getPathDecoded()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object p1

    .line 435
    new-instance p2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpInputStream;

    invoke-direct {p2, p0, v0, p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject$SftpInputStream;-><init>(Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;Lcom/jcraft/jsch/ChannelSftp;Ljava/io/InputStream;)V
    :try_end_0
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p1

    .line 437
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p2

    check-cast p2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->putChannel(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 438
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method protected getPermissions(Z)Lorg/apache/commons/vfs2/util/PosixPermissions;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 249
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->statSelf()V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 252
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getGroupsIds()[I

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget v5, v2, v4

    .line 253
    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {v6}, Lcom/jcraft/jsch/SftpATTRS;->getGId()I

    move-result v6

    if-ne v5, v6, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eqz p1, :cond_2

    .line 259
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {p1}, Lcom/jcraft/jsch/SftpATTRS;->getUId()I

    move-result p1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;

    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystem;->getUId()I

    move-result v3

    if-ne p1, v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 260
    :goto_2
    new-instance p1, Lorg/apache/commons/vfs2/util/PosixPermissions;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpATTRS;->getPermissions()I

    move-result v1

    invoke-direct {p1, v1, v0, v2}, Lorg/apache/commons/vfs2/util/PosixPermissions;-><init>(IZZ)V

    return-object p1
.end method

.method protected onChange()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 118
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->statSelf()V

    return-void
.end method

.method public refresh()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 75
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->inRefresh:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 77
    :try_start_0
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->inRefresh:Z

    .line 78
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->refresh()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    .line 80
    :try_start_1
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->attrs:Lcom/jcraft/jsch/SftpATTRS;

    .line 81
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->getType()Lorg/apache/commons/vfs2/FileType;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->inRefresh:Z

    return-void

    :catch_0
    move-exception v0

    .line 83
    :try_start_2
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v0

    .line 86
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileObject;->inRefresh:Z

    throw v0

    :cond_0
    return-void
.end method
