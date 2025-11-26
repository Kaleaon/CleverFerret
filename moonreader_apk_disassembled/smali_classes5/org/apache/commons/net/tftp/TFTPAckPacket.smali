.class public final Lorg/apache/commons/net/tftp/TFTPAckPacket;
.super Lorg/apache/commons/net/tftp/TFTPPacket;
.source "TFTPAckPacket.java"


# instance fields
.field blockNumber:I


# direct methods
.method constructor <init>(Ljava/net/DatagramPacket;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/tftp/TFTPPacketException;
        }
    .end annotation

    .line 74
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 75
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v1

    const/4 v2, 0x4

    .line 74
    invoke-direct {p0, v2, v0, v1}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 78
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object p1

    .line 80
    invoke-virtual {p0}, Lorg/apache/commons/net/tftp/TFTPAckPacket;->getType()I

    move-result v0

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    .line 84
    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x3

    aget-byte p1, p1, v1

    and-int/lit16 p1, p1, 0xff

    or-int/2addr p1, v0

    iput p1, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    return-void

    .line 81
    :cond_0
    new-instance p1, Lorg/apache/commons/net/tftp/TFTPPacketException;

    const-string v0, "TFTP operator code does not match type."

    invoke-direct {p1, v0}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/net/InetAddress;II)V
    .locals 1

    const/4 v0, 0x4

    .line 59
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 60
    iput p3, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    return-void
.end method


# virtual methods
.method public getBlockNumber()I
    .locals 1

    .line 148
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    return v0
.end method

.method public newDatagram()Ljava/net/DatagramPacket;
    .locals 6

    .line 133
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->type:I

    int-to-byte v0, v0

    .line 134
    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    const v2, 0xffff

    and-int/2addr v2, v1

    shr-int/lit8 v2, v2, 0x8

    int-to-byte v2, v2

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x4

    .line 135
    new-array v4, v3, [B

    const/4 v5, 0x0

    aput-byte v5, v4, v5

    const/4 v5, 0x1

    aput-byte v0, v4, v5

    const/4 v0, 0x2

    aput-byte v2, v4, v0

    const/4 v0, 0x3

    aput-byte v1, v4, v0

    .line 137
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->address:Ljava/net/InetAddress;

    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->port:I

    invoke-direct {v0, v4, v3, v1, v2}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    return-object v0
.end method

.method newDatagram(Ljava/net/DatagramPacket;[B)Ljava/net/DatagramPacket;
    .locals 3

    const/4 v0, 0x0

    .line 101
    aput-byte v0, p2, v0

    .line 102
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->type:I

    int-to-byte v0, v0

    const/4 v1, 0x1

    aput-byte v0, p2, v1

    .line 103
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    const v1, 0xffff

    and-int/2addr v1, v0

    shr-int/lit8 v1, v1, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, p2, v2

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    const/4 v1, 0x3

    .line 104
    aput-byte v0, p2, v1

    .line 106
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->address:Ljava/net/InetAddress;

    invoke-virtual {p1, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 107
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->port:I

    invoke-virtual {p1, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 108
    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setData([B)V

    const/4 p2, 0x4

    .line 109
    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setLength(I)V

    return-object p1
.end method

.method public setBlockNumber(I)V
    .locals 0

    .line 159
    iput p1, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lorg/apache/commons/net/tftp/TFTPPacket;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ACK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPAckPacket;->blockNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
