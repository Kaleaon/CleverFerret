.class public Lorg/apache/commons/net/tftp/TFTP;
.super Lorg/apache/commons/net/DatagramSocketClient;
.source "TFTP.java"


# static fields
.field public static final ASCII_MODE:I = 0x0

.field public static final BINARY_MODE:I = 0x1

.field public static final DEFAULT_PORT:I = 0x45

.field public static final DEFAULT_TIMEOUT:I = 0x1388

.field public static final IMAGE_MODE:I = 0x1

.field public static final NETASCII_MODE:I = 0x0

.field public static final OCTET_MODE:I = 0x1

.field static final PACKET_SIZE:I = 0x204


# instance fields
.field private receiveBuffer:[B

.field private receiveDatagram:Ljava/net/DatagramPacket;

.field sendBuffer:[B

.field private sendDatagram:Ljava/net/DatagramPacket;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 128
    invoke-direct {p0}, Lorg/apache/commons/net/DatagramSocketClient;-><init>()V

    const/16 v0, 0x1388

    .line 129
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/tftp/TFTP;->setDefaultTimeout(I)V

    const/4 v0, 0x0

    .line 130
    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveBuffer:[B

    .line 131
    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    return-void
.end method

.method public static final getModeName(I)Ljava/lang/String;
    .locals 1

    .line 120
    sget-object v0, Lorg/apache/commons/net/tftp/TFTPRequestPacket;->modeStrings:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method


# virtual methods
.method public final beginBufferedOps()V
    .locals 4

    const/16 v0, 0x204

    .line 240
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveBuffer:[B

    .line 241
    new-instance v1, Ljava/net/DatagramPacket;

    iget-object v2, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveBuffer:[B

    array-length v3, v2

    invoke-direct {v1, v2, v3}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    .line 243
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->sendBuffer:[B

    .line 244
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->sendBuffer:[B

    array-length v2, v1

    invoke-direct {v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->sendDatagram:Ljava/net/DatagramPacket;

    return-void
.end method

.method public final bufferedReceive()Lorg/apache/commons/net/tftp/TFTPPacket;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/InterruptedIOException;,
            Ljava/net/SocketException;,
            Lorg/apache/commons/net/tftp/TFTPPacketException;
        }
    .end annotation

    .line 196
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveBuffer:[B

    invoke-virtual {v0, v1}, Ljava/net/DatagramPacket;->setData([B)V

    .line 197
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveBuffer:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/net/DatagramPacket;->setLength(I)V

    .line 198
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->_socket_:Ljava/net/DatagramSocket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 200
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    invoke-static {v0}, Lorg/apache/commons/net/tftp/TFTPPacket;->newTFTPPacket(Ljava/net/DatagramPacket;)Lorg/apache/commons/net/tftp/TFTPPacket;

    move-result-object v0

    .line 201
    const-string v1, "<"

    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/net/tftp/TFTP;->trace(Ljava/lang/String;Lorg/apache/commons/net/tftp/TFTPPacket;)V

    return-object v0
.end method

.method public final bufferedSend(Lorg/apache/commons/net/tftp/TFTPPacket;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    const-string v0, ">"

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/tftp/TFTP;->trace(Ljava/lang/String;Lorg/apache/commons/net/tftp/TFTPPacket;)V

    .line 226
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->_socket_:Ljava/net/DatagramSocket;

    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->sendDatagram:Ljava/net/DatagramPacket;

    iget-object v2, p0, Lorg/apache/commons/net/tftp/TFTP;->sendBuffer:[B

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/net/tftp/TFTPPacket;->newDatagram(Ljava/net/DatagramPacket;[B)Ljava/net/DatagramPacket;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    return-void
.end method

.method public final discardPackets()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/net/DatagramPacket;

    const/16 v1, 0x204

    new-array v2, v1, [B

    invoke-direct {v0, v2, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 148
    invoke-virtual {p0}, Lorg/apache/commons/net/tftp/TFTP;->getSoTimeout()I

    move-result v1

    const/4 v2, 0x1

    .line 149
    invoke-virtual {p0, v2}, Lorg/apache/commons/net/tftp/TFTP;->setSoTimeout(I)V

    .line 154
    :goto_0
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/net/tftp/TFTP;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v2, v0}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 162
    :catch_0
    invoke-virtual {p0, v1}, Lorg/apache/commons/net/tftp/TFTP;->setSoTimeout(I)V

    return-void
.end method

.method public final endBufferedOps()V
    .locals 1

    const/4 v0, 0x0

    .line 253
    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveBuffer:[B

    .line 254
    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->receiveDatagram:Ljava/net/DatagramPacket;

    .line 255
    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->sendBuffer:[B

    .line 256
    iput-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->sendDatagram:Ljava/net/DatagramPacket;

    return-void
.end method

.method public final receive()Lorg/apache/commons/net/tftp/TFTPPacket;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/InterruptedIOException;,
            Ljava/net/SocketException;,
            Lorg/apache/commons/net/tftp/TFTPPacketException;
        }
    .end annotation

    .line 293
    new-instance v0, Ljava/net/DatagramPacket;

    const/16 v1, 0x204

    new-array v2, v1, [B

    invoke-direct {v0, v2, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 295
    iget-object v1, p0, Lorg/apache/commons/net/tftp/TFTP;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v1, v0}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 297
    invoke-static {v0}, Lorg/apache/commons/net/tftp/TFTPPacket;->newTFTPPacket(Ljava/net/DatagramPacket;)Lorg/apache/commons/net/tftp/TFTPPacket;

    move-result-object v0

    .line 298
    const-string v1, "<"

    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/net/tftp/TFTP;->trace(Ljava/lang/String;Lorg/apache/commons/net/tftp/TFTPPacket;)V

    return-object v0
.end method

.method public final send(Lorg/apache/commons/net/tftp/TFTPPacket;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 268
    const-string v0, ">"

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/tftp/TFTP;->trace(Ljava/lang/String;Lorg/apache/commons/net/tftp/TFTPPacket;)V

    .line 269
    iget-object v0, p0, Lorg/apache/commons/net/tftp/TFTP;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {p1}, Lorg/apache/commons/net/tftp/TFTPPacket;->newDatagram()Ljava/net/DatagramPacket;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    return-void
.end method

.method protected trace(Ljava/lang/String;Lorg/apache/commons/net/tftp/TFTPPacket;)V
    .locals 0

    return-void
.end method
