.class public final Lorg/apache/commons/net/tftp/TFTPErrorPacket;
.super Lorg/apache/commons/net/tftp/TFTPPacket;
.source "TFTPErrorPacket.java"


# static fields
.field public static final ACCESS_VIOLATION:I = 0x2

.field public static final FILE_EXISTS:I = 0x6

.field public static final FILE_NOT_FOUND:I = 0x1

.field public static final ILLEGAL_OPERATION:I = 0x4

.field public static final NO_SUCH_USER:I = 0x7

.field public static final OUT_OF_SPACE:I = 0x3

.field public static final UNDEFINED:I = 0x0

.field public static final UNKNOWN_TID:I = 0x5


# instance fields
.field private final error:I

.field private final message:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/net/DatagramPacket;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/tftp/TFTPPacketException;
        }
    .end annotation

    .line 107
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getPort()I

    move-result v1

    const/4 v2, 0x5

    invoke-direct {p0, v2, v0, v1}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 113
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v0

    .line 114
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getLength()I

    move-result p1

    .line 116
    invoke-virtual {p0}, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->getType()I

    move-result v1

    const/4 v3, 0x1

    aget-byte v3, v0, v3

    if-ne v1, v3, :cond_2

    const/4 v1, 0x2

    .line 120
    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    const/4 v3, 0x3

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v1, v3

    iput v1, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->error:I

    if-lt p1, v2, :cond_1

    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x4

    :goto_0
    if-ge v2, p1, :cond_0

    .line 129
    aget-byte v3, v0, v2

    if-eqz v3, :cond_0

    int-to-char v3, v3

    .line 131
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 135
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    return-void

    .line 123
    :cond_1
    new-instance p1, Lorg/apache/commons/net/tftp/TFTPPacketException;

    const-string v0, "Bad error packet. No message."

    invoke-direct {p1, v0}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 117
    :cond_2
    new-instance p1, Lorg/apache/commons/net/tftp/TFTPPacketException;

    const-string v0, "TFTP operator code does not match type."

    invoke-direct {p1, v0}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/net/InetAddress;IILjava/lang/String;)V
    .locals 1

    const/4 v0, 0x5

    .line 90
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 92
    iput p3, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->error:I

    .line 93
    iput-object p4, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getError()I
    .locals 1

    .line 215
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->error:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 226
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    return-object v0
.end method

.method public newDatagram()Ljava/net/DatagramPacket;
    .locals 7

    .line 192
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v1, v0, 0x5

    .line 194
    new-array v2, v1, [B

    const/4 v3, 0x0

    .line 195
    aput-byte v3, v2, v3

    .line 196
    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->type:I

    int-to-byte v4, v4

    const/4 v5, 0x1

    aput-byte v4, v2, v5

    .line 197
    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->error:I

    const v5, 0xffff

    and-int/2addr v5, v4

    shr-int/lit8 v5, v5, 0x8

    int-to-byte v5, v5

    const/4 v6, 0x2

    aput-byte v5, v2, v6

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    const/4 v5, 0x3

    .line 198
    aput-byte v4, v2, v5

    .line 200
    iget-object v4, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x4

    invoke-static {v4, v3, v2, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v0, v5

    .line 202
    aput-byte v3, v2, v0

    .line 204
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v3, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->address:Ljava/net/InetAddress;

    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->port:I

    invoke-direct {v0, v2, v1, v3, v4}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    return-object v0
.end method

.method newDatagram(Ljava/net/DatagramPacket;[B)Ljava/net/DatagramPacket;
    .locals 5

    .line 154
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 156
    aput-byte v1, p2, v1

    .line 157
    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->type:I

    int-to-byte v2, v2

    const/4 v3, 0x1

    aput-byte v2, p2, v3

    .line 158
    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->error:I

    const v3, 0xffff

    and-int/2addr v3, v2

    shr-int/lit8 v3, v3, 0x8

    int-to-byte v3, v3

    const/4 v4, 0x2

    aput-byte v3, p2, v4

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    const/4 v3, 0x3

    .line 159
    aput-byte v2, p2, v3

    .line 161
    iget-object v2, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v2, v1, p2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v0, v3

    .line 163
    aput-byte v1, p2, v0

    .line 165
    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->address:Ljava/net/InetAddress;

    invoke-virtual {p1, v1}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 166
    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->port:I

    invoke-virtual {p1, v1}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 167
    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setData([B)V

    .line 168
    invoke-virtual {p1, v0}, Ljava/net/DatagramPacket;->setLength(I)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lorg/apache/commons/net/tftp/TFTPPacket;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ERR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->error:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTPErrorPacket;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
