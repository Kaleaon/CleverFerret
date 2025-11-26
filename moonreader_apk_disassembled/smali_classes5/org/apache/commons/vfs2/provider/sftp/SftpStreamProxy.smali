.class public Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;
.super Ljava/lang/Object;
.source "SftpStreamProxy.java"

# interfaces
.implements Lcom/jcraft/jsch/Proxy;


# static fields
.field public static final BASH_TCP_COMMAND:Ljava/lang/String; = "/bin/bash -c \'exec 3<>/dev/tcp/%s/%d; cat <&3 & cat >&3; kill $!"

.field public static final NETCAT_COMMAND:Ljava/lang/String; = "nc -q 0 %s %d"


# instance fields
.field private channel:Lcom/jcraft/jsch/ChannelExec;

.field private final commandFormat:Ljava/lang/String;

.field private final proxyHost:Ljava/lang/String;

.field private final proxyOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

.field private final proxyPassword:Ljava/lang/String;

.field private final proxyPort:I

.field private final proxyUser:Ljava/lang/String;

.field private session:Lcom/jcraft/jsch/Session;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyHost:Ljava/lang/String;

    .line 114
    iput p4, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyPort:I

    .line 115
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyUser:Ljava/lang/String;

    .line 116
    iput-object p5, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyPassword:Ljava/lang/String;

    .line 117
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->commandFormat:Ljava/lang/String;

    .line 118
    iput-object p6, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 123
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->channel:Lcom/jcraft/jsch/ChannelExec;

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->disconnect()V

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->session:Lcom/jcraft/jsch/Session;

    if-eqz v0, :cond_1

    .line 127
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->disconnect()V

    :cond_1
    return-void
.end method

.method public connect(Lcom/jcraft/jsch/SocketFactory;Ljava/lang/String;II)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 134
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyHost:Ljava/lang/String;

    iget v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyPort:I

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyUser:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyPassword:Ljava/lang/String;

    .line 135
    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->proxyOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    .line 134
    invoke-static {p1, v0, v1, v2, v3}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->createConnection(Ljava/lang/String;I[C[CLorg/apache/commons/vfs2/FileSystemOptions;)Lcom/jcraft/jsch/Session;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->session:Lcom/jcraft/jsch/Session;

    .line 136
    const-string v0, "exec"

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Session;->openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object p1

    check-cast p1, Lcom/jcraft/jsch/ChannelExec;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->channel:Lcom/jcraft/jsch/ChannelExec;

    .line 137
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->commandFormat:Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/ChannelExec;->setCommand(Ljava/lang/String;)V

    .line 138
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {p1, p4}, Lcom/jcraft/jsch/ChannelExec;->connect(I)V

    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 3

    .line 144
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 146
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "IOException getting the SSH proxy input stream"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 3

    .line 153
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpStreamProxy;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 155
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "IOException getting the SSH proxy output stream"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getSocket()Ljava/net/Socket;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
