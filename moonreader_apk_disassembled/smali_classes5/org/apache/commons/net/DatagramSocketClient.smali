.class public abstract Lorg/apache/commons/net/DatagramSocketClient;
.super Ljava/lang/Object;
.source "DatagramSocketClient.java"


# static fields
.field private static final DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;


# instance fields
.field protected _isOpen_:Z

.field protected _socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

.field protected _socket_:Ljava/net/DatagramSocket;

.field protected _timeout_:I

.field private charset:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    new-instance v0, Lorg/apache/commons/net/DefaultDatagramSocketFactory;

    invoke-direct {v0}, Lorg/apache/commons/net/DefaultDatagramSocketFactory;-><init>()V

    sput-object v0, Lorg/apache/commons/net/DatagramSocketClient;->DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    const/4 v0, 0x0

    .line 85
    iput v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    .line 86
    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 87
    sget-object v0, Lorg/apache/commons/net/DatagramSocketClient;->DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 161
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_0

    .line 162
    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    :cond_0
    const/4 v0, 0x0

    .line 164
    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    const/4 v0, 0x0

    .line 165
    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return-void
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .line 303
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getCharsetName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 293
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultTimeout()I
    .locals 1

    .line 206
    iget v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .line 262
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .line 249
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getSoTimeout()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 235
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getSoTimeout()I

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .locals 1

    .line 176
    iget-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return v0
.end method

.method public open()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket()Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 105
    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    const/4 v0, 0x1

    .line 106
    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return-void
.end method

.method public open(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0, p1}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket(I)Ljava/net/DatagramSocket;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 125
    iget v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {p1, v0}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    const/4 p1, 0x1

    .line 126
    iput-boolean p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return-void
.end method

.method public open(ILjava/net/InetAddress;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 147
    iget p2, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {p1, p2}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    const/4 p1, 0x1

    .line 148
    iput-boolean p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return-void
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .locals 0

    .line 313
    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    return-void
.end method

.method public setDatagramSocketFactory(Lorg/apache/commons/net/DatagramSocketFactory;)V
    .locals 0

    if-nez p1, :cond_0

    .line 278
    sget-object p1, Lorg/apache/commons/net/DatagramSocketClient;->DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    return-void

    .line 280
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    return-void
.end method

.method public setDefaultTimeout(I)V
    .locals 0

    .line 193
    iput p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    return-void
.end method

.method public setSoTimeout(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 221
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    return-void
.end method
