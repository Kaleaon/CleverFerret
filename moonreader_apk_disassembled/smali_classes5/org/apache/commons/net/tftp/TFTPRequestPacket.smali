.class public abstract Lorg/apache/commons/net/tftp/TFTPRequestPacket;
.super Lorg/apache/commons/net/tftp/TFTPPacket;
.source "TFTPRequestPacket.java"


# static fields
.field private static final modeBytes:[[B

.field static final modeStrings:[Ljava/lang/String;


# instance fields
.field private final fileName:Ljava/lang/String;

.field private final mode:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 56
    const-string v0, "netascii"

    const-string v1, "octet"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeStrings:[Ljava/lang/String;

    const/16 v0, 0x9

    .line 63
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    const/4 v1, 0x6

    new-array v1, v1, [B

    fill-array-data v1, :array_1

    const/4 v2, 0x2

    new-array v2, v2, [[B

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    sput-object v2, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeBytes:[[B

    return-void

    nop

    :array_0
    .array-data 1
        0x6et
        0x65t
        0x74t
        0x61t
        0x73t
        0x63t
        0x69t
        0x69t
        0x0t
    .end array-data

    nop

    :array_1
    .array-data 1
        0x6ft
        0x63t
        0x74t
        0x65t
        0x74t
        0x0t
    .end array-data
.end method

.method constructor <init>(ILjava/net/DatagramPacket;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/tftp/TFTPPacketException;
        }
    .end annotation

    .line 110
    invoke-virtual {p2}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p2}, Ljava/net/DatagramPacket;->getPort()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 112
    invoke-virtual {p2}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object p1

    .line 114
    invoke-virtual {p0}, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->getType()I

    move-result v0

    const/4 v1, 0x1

    aget-byte v2, p1, v1

    if-ne v0, v2, :cond_6

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    invoke-virtual {p2}, Ljava/net/DatagramPacket;->getLength()I

    move-result p2

    const/4 v2, 0x2

    :goto_0
    if-ge v2, p2, :cond_0

    .line 123
    aget-byte v3, p1, v2

    if-eqz v3, :cond_0

    int-to-char v3, v3

    .line 125
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 129
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    if-ge v2, p2, :cond_5

    const/4 v3, 0x0

    .line 135
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    add-int/2addr v2, v1

    :goto_1
    if-ge v2, p2, :cond_1

    .line 137
    aget-byte v1, p1, v2

    if-eqz v1, :cond_1

    int-to-char v1, v1

    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 143
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 144
    sget-object p2, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeStrings:[Ljava/lang/String;

    array-length p2, p2

    const/4 v0, 0x0

    :goto_2
    if-ge v0, p2, :cond_3

    .line 149
    sget-object v1, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeStrings:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v3, v0

    goto :goto_3

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 156
    :cond_3
    :goto_3
    iput v3, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    if-ge v0, p2, :cond_4

    return-void

    .line 160
    :cond_4
    new-instance p2, Lorg/apache/commons/net/tftp/TFTPPacketException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized TFTP transfer mode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 132
    :cond_5
    new-instance p1, Lorg/apache/commons/net/tftp/TFTPPacketException;

    const-string p2, "Bad file name and mode format."

    invoke-direct {p1, p2}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 115
    :cond_6
    new-instance p1, Lorg/apache/commons/net/tftp/TFTPPacketException;

    const-string p2, "TFTP operator code does not match type."

    invoke-direct {p1, p2}, Lorg/apache/commons/net/tftp/TFTPPacketException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method constructor <init>(Ljava/net/InetAddress;IILjava/lang/String;I)V
    .locals 0

    .line 90
    invoke-direct {p0, p3, p1, p2}, Lorg/apache/commons/net/tftp/TFTPPacket;-><init>(ILjava/net/InetAddress;I)V

    .line 92
    iput-object p4, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    .line 93
    iput p5, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    return-void
.end method


# virtual methods
.method public final getFilename()Ljava/lang/String;
    .locals 1

    .line 252
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public final getMode()I
    .locals 1

    .line 242
    iget v0, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    return v0
.end method

.method public final newDatagram()Ljava/net/DatagramPacket;
    .locals 8

    .line 221
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 222
    sget-object v1, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeBytes:[[B

    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    aget-object v2, v1, v2

    array-length v2, v2

    add-int v3, v0, v2

    add-int/lit8 v3, v3, 0x4

    .line 224
    new-array v4, v3, [B

    const/4 v5, 0x0

    .line 225
    aput-byte v5, v4, v5

    .line 226
    iget v6, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->type:I

    int-to-byte v6, v6

    const/4 v7, 0x1

    aput-byte v6, v4, v7

    .line 227
    iget-object v6, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    const/4 v7, 0x2

    invoke-static {v6, v5, v4, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v6, v0, 0x2

    .line 228
    aput-byte v5, v4, v6

    .line 229
    iget v6, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    aget-object v1, v1, v6

    add-int/lit8 v0, v0, 0x3

    invoke-static {v1, v5, v4, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->address:Ljava/net/InetAddress;

    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->port:I

    invoke-direct {v0, v4, v3, v1, v2}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    return-object v0
.end method

.method final newDatagram(Ljava/net/DatagramPacket;[B)Ljava/net/DatagramPacket;
    .locals 6

    .line 185
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 186
    sget-object v1, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeBytes:[[B

    iget v2, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    aget-object v2, v1, v2

    array-length v2, v2

    const/4 v3, 0x0

    .line 188
    aput-byte v3, p2, v3

    .line 189
    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->type:I

    int-to-byte v4, v4

    const/4 v5, 0x1

    aput-byte v4, p2, v5

    .line 190
    iget-object v4, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->fileName:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v4, v3, p2, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v4, v0, 0x2

    .line 191
    aput-byte v3, p2, v4

    .line 192
    iget v4, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->mode:I

    aget-object v1, v1, v4

    add-int/lit8 v4, v0, 0x3

    invoke-static {v1, v3, p2, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->address:Ljava/net/InetAddress;

    invoke-virtual {p1, v1}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 196
    iget v1, p0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->port:I

    invoke-virtual {p1, v1}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 197
    invoke-virtual {p1, p2}, Ljava/net/DatagramPacket;->setData([B)V

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x3

    .line 198
    invoke-virtual {p1, v0}, Ljava/net/DatagramPacket;->setLength(I)V

    return-object p1
.end method
