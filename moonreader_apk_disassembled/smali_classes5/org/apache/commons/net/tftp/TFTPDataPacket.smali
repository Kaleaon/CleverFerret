.class public final Lorg/apache/commons/net/tftp/TFTPDataPacket;
.super Lorg/apache/commons/net/tftp/TFTPPacket;
.source "TFTPDataPacket.java"


# static fields
.field public static final MAX_DATA_LENGTH:I = 0x200

.field public static final MIN_DATA_LENGTH:I


# instance fields
.field blockNumber:I

.field private data:[B

.field private length:I

.field private offset:I


# direct methods
.method constructor <init>(Ljava/net/DatagramPacket;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/tftp/TFTPPacketException;
        }
    .end annotation

    .line 113
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v1

    const/4 v2, 0x3

    invoke-direct {p0, v2, v0, v1}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 115
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    const/4 v0, 0x4

    .line 116
    iput v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->offset:I

    .line 118
    invoke-virtual {p0}, Lorg/apache/commons/net/tftp/TFTPDataPacket;->getType()I

    move-result v1

    iget-object v3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    const/4 v4, 0x1

    aget-byte v4, v3, v4

    if-ne v1, v4, :cond_1

    const/4 v1, 0x2

    .line 122
    aget-byte v1, v3, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    aget-byte v2, v3, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    iput v1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    .line 124
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getLength()I

    move-result p1

    sub-int/2addr p1, v0

    iput p1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    const/16 v0, 0x200

    if-le p1, v0, :cond_0

    .line 127
    iput v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    :cond_0
    return-void

    .line 119
    :cond_1
    new-instance p1, Lorg/apache/commons/net/tftp/TFTPPacketException;

    const-string v0, "TFTP operator code does not match type."

    invoke-direct {p1, v0}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/net/InetAddress;II[B)V
    .locals 7

    const/4 v5, 0x0

    .line 98
    array-length v6, p4

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/net/tftp/TFTPDataPacket;-><init>(Ljava/net/InetAddress;II[BII)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;II[BII)V
    .locals 1

    const/4 v0, 0x3

    .line 82
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 84
    iput p3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    .line 85
    iput-object p4, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    .line 86
    iput p5, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->offset:I

    const/16 p1, 0x200

    if-le p6, p1, :cond_0

    .line 89
    iput p1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    return-void

    .line 91
    :cond_0
    iput p6, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    return-void
.end method


# virtual methods
.method public getBlockNumber()I
    .locals 1

    .line 198
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    return v0
.end method

.method public getData()[B
    .locals 1

    .line 258
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    return-object v0
.end method

.method public getDataLength()I
    .locals 1

    .line 236
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    return v0
.end method

.method public getDataOffset()I
    .locals 1

    .line 248
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->offset:I

    return v0
.end method

.method public newDatagram()Ljava/net/DatagramPacket;
    .locals 5

    .line 180
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    const/4 v1, 0x4

    add-int/2addr v0, v1

    new-array v0, v0, [B

    const/4 v2, 0x0

    .line 181
    aput-byte v2, v0, v2

    .line 182
    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->type:I

    int-to-byte v2, v2

    const/4 v3, 0x1

    aput-byte v2, v0, v3

    .line 183
    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    const v3, 0xffff

    and-int/2addr v3, v2

    shr-int/lit8 v3, v3, 0x8

    int-to-byte v3, v3

    const/4 v4, 0x2

    aput-byte v3, v0, v4

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    const/4 v3, 0x3

    .line 184
    aput-byte v2, v0, v3

    .line 186
    iget-object v2, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    iget v3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->offset:I

    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    invoke-static {v2, v3, v0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    new-instance v2, Ljava/net/DatagramPacket;

    iget v3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    add-int/2addr v3, v1

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->address:Ljava/net/InetAddress;

    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->port:I

    invoke-direct {v2, v0, v3, v1, v4}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    return-object v2
.end method

.method newDatagram(Ljava/net/DatagramPacket;[B)Ljava/net/DatagramPacket;
    .locals 4

    const/4 v0, 0x0

    .line 145
    aput-byte v0, p2, v0

    .line 146
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->type:I

    int-to-byte v0, v0

    const/4 v1, 0x1

    aput-byte v0, p2, v1

    .line 147
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    const v1, 0xffff

    and-int/2addr v1, v0

    shr-int/lit8 v1, v1, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, p2, v2

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    const/4 v1, 0x3

    .line 148
    aput-byte v0, p2, v1

    .line 151
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    const/4 v1, 0x4

    if-eq p2, v0, :cond_0

    .line 152
    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->offset:I

    iget v3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    invoke-static {v0, v2, p2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->address:Ljava/net/InetAddress;

    invoke-virtual {p1, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 156
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->port:I

    invoke-virtual {p1, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 157
    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setData([B)V

    .line 158
    iget p2, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    add-int/2addr p2, v1

    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setLength(I)V

    return-object p1
.end method

.method public setBlockNumber(I)V
    .locals 0

    .line 206
    iput p1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    return-void
.end method

.method public setData([BII)V
    .locals 0

    .line 218
    iput-object p1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->data:[B

    .line 219
    iput p2, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->offset:I

    .line 220
    iput p3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    const/16 p1, 0x200

    if-le p3, p1, :cond_0

    .line 223
    iput p1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    return-void

    .line 225
    :cond_0
    iput p3, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lorg/apache/commons/net/tftp/TFTPPacket;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " DATA "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->blockNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPDataPacket;->length:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
