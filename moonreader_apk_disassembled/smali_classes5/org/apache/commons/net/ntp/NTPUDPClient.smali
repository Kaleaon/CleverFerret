.class public final Lorg/apache/commons/net/ntp/NTPUDPClient;
.super Lorg/apache/commons/net/DatagramSocketClient;
.source "NTPUDPClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0x7b


# instance fields
.field private version:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Lorg/apache/commons/net/DatagramSocketClient;-><init>()V

    const/4 v0, 0x3

    .line 45
    iput v0, p0, Lorg/apache/commons/net/ntp/NTPUDPClient;->version:I

    return-void
.end method


# virtual methods
.method public getTime(Ljava/net/InetAddress;)Lorg/apache/commons/net/ntp/TimeInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x7b

    .line 110
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/ntp/NTPUDPClient;->getTime(Ljava/net/InetAddress;I)Lorg/apache/commons/net/ntp/TimeInfo;

    move-result-object p1

    return-object p1
.end method

.method public getTime(Ljava/net/InetAddress;I)Lorg/apache/commons/net/ntp/TimeInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NTPUDPClient;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NTPUDPClient;->open()V

    .line 67
    :cond_0
    new-instance v0, Lorg/apache/commons/net/ntp/NtpV3Impl;

    invoke-direct {v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;-><init>()V

    const/4 v1, 0x3

    .line 68
    invoke-interface {v0, v1}, Lorg/apache/commons/net/ntp/NtpV3Packet;->setMode(I)V

    .line 69
    iget v1, p0, Lorg/apache/commons/net/ntp/NTPUDPClient;->version:I

    invoke-interface {v0, v1}, Lorg/apache/commons/net/ntp/NtpV3Packet;->setVersion(I)V

    .line 70
    invoke-interface {v0}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object v1

    .line 71
    invoke-virtual {v1, p1}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 72
    invoke-virtual {v1, p2}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 74
    new-instance p1, Lorg/apache/commons/net/ntp/NtpV3Impl;

    invoke-direct {p1}, Lorg/apache/commons/net/ntp/NtpV3Impl;-><init>()V

    .line 75
    invoke-interface {p1}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object p2

    .line 83
    invoke-static {}, Lorg/apache/commons/net/ntp/TimeStamp;->getCurrentTime()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v2

    .line 87
    invoke-interface {v0, v2}, Lorg/apache/commons/net/ntp/NtpV3Packet;->setTransmitTime(Lorg/apache/commons/net/ntp/TimeStamp;)V

    .line 89
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NTPUDPClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 90
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NTPUDPClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p2}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 94
    new-instance p2, Lorg/apache/commons/net/ntp/TimeInfo;

    const/4 v2, 0x0

    invoke-direct {p2, p1, v0, v1, v2}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JZ)V

    return-object p2
.end method

.method public getVersion()I
    .locals 1

    .line 122
    iget v0, p0, Lorg/apache/commons/net/ntp/NTPUDPClient;->version:I

    return v0
.end method

.method public setVersion(I)V
    .locals 0

    .line 133
    iput p1, p0, Lorg/apache/commons/net/ntp/NTPUDPClient;->version:I

    return-void
.end method
