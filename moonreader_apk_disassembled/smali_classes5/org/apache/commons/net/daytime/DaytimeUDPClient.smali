.class public final Lorg/apache/commons/net/daytime/DaytimeUDPClient;
.super Lorg/apache/commons/net/DatagramSocketClient;
.source "DaytimeUDPClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0xd


# instance fields
.field private final dummyData:[B

.field private final timeData:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lorg/apache/commons/net/DatagramSocketClient;-><init>()V

    const/4 v0, 0x1

    .line 46
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->dummyData:[B

    const/16 v0, 0x100

    .line 48
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->timeData:[B

    return-void
.end method


# virtual methods
.method public getTime(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xd

    .line 81
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->getTime(Ljava/net/InetAddress;I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTime(Ljava/net/InetAddress;I)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->dummyData:[B

    array-length v2, v1

    invoke-direct {v0, v1, v2, p1, p2}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 66
    new-instance p1, Ljava/net/DatagramPacket;

    iget-object p2, p0, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->timeData:[B

    array-length v1, p2

    invoke-direct {p1, p2, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 68
    iget-object p2, p0, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {p2, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 69
    iget-object p2, p0, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {p2, p1}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 71
    new-instance p2, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getLength()I

    move-result p1

    invoke-virtual {p0}, Lorg/apache/commons/net/daytime/DaytimeUDPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p2, v0, v2, p1, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object p2
.end method
