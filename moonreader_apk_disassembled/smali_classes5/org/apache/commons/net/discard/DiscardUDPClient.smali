.class public Lorg/apache/commons/net/discard/DiscardUDPClient;
.super Lorg/apache/commons/net/DatagramSocketClient;
.source "DiscardUDPClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0x9


# instance fields
.field private final sendPacket:Ljava/net/DatagramPacket;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 48
    invoke-direct {p0}, Lorg/apache/commons/net/DatagramSocketClient;-><init>()V

    .line 49
    new-instance v0, Ljava/net/DatagramPacket;

    sget-object v1, Lorg/apache/commons/net/util/NetConstants;->EMPTY_BTYE_ARRAY:[B

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    return-void
.end method


# virtual methods
.method public send([BILjava/net/InetAddress;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x9

    .line 87
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/net/discard/DiscardUDPClient;->send([BILjava/net/InetAddress;I)V

    return-void
.end method

.method public send([BILjava/net/InetAddress;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramPacket;->setData([B)V

    .line 68
    iget-object p1, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setLength(I)V

    .line 69
    iget-object p1, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {p1, p3}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 70
    iget-object p1, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {p1, p4}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 71
    iget-object p1, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->_socket_:Ljava/net/DatagramSocket;

    iget-object p2, p0, Lorg/apache/commons/net/discard/DiscardUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {p1, p2}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    return-void
.end method

.method public send([BLjava/net/InetAddress;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    array-length v0, p1

    const/16 v1, 0x9

    invoke-virtual {p0, p1, v0, p2, v1}, Lorg/apache/commons/net/discard/DiscardUDPClient;->send([BILjava/net/InetAddress;I)V

    return-void
.end method
