.class public final Lorg/apache/commons/net/chargen/CharGenUDPClient;
.super Lorg/apache/commons/net/DatagramSocketClient;
.source "CharGenUDPClient.java"


# static fields
.field public static final CHARGEN_PORT:I = 0x13

.field public static final DEFAULT_PORT:I = 0x13

.field public static final NETSTAT_PORT:I = 0xf

.field public static final QUOTE_OF_DAY_PORT:I = 0x11

.field public static final SYSTAT_PORT:I = 0xb


# instance fields
.field private final receiveData:[B

.field private final receivePacket:Ljava/net/DatagramPacket;

.field private final sendPacket:Ljava/net/DatagramPacket;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 76
    invoke-direct {p0}, Lorg/apache/commons/net/DatagramSocketClient;-><init>()V

    const/16 v0, 0x200

    .line 78
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->receiveData:[B

    .line 79
    new-instance v1, Ljava/net/DatagramPacket;

    array-length v2, v0

    invoke-direct {v1, v0, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v1, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->receivePacket:Ljava/net/DatagramPacket;

    .line 80
    new-instance v0, Ljava/net/DatagramPacket;

    sget-object v1, Lorg/apache/commons/net/util/NetConstants;->EMPTY_BTYE_ARRAY:[B

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    return-void
.end method


# virtual methods
.method public receive()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->_socket_:Ljava/net/DatagramSocket;

    iget-object v1, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->receivePacket:Ljava/net/DatagramPacket;

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 124
    iget-object v0, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->receivePacket:Ljava/net/DatagramPacket;

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getLength()I

    move-result v0

    new-array v1, v0, [B

    .line 125
    iget-object v2, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->receiveData:[B

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public send(Ljava/net/InetAddress;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x13

    .line 106
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/chargen/CharGenUDPClient;->send(Ljava/net/InetAddress;I)V

    return-void
.end method

.method public send(Ljava/net/InetAddress;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 96
    iget-object p1, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 97
    iget-object p1, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->_socket_:Ljava/net/DatagramSocket;

    iget-object p2, p0, Lorg/apache/commons/net/chargen/CharGenUDPClient;->sendPacket:Ljava/net/DatagramPacket;

    invoke-virtual {p1, p2}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    return-void
.end method
