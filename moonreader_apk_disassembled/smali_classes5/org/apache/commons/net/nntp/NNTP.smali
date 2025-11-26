.class public Lorg/apache/commons/net/nntp/NNTP;
.super Lorg/apache/commons/net/SocketClient;
.source "NNTP.java"


# static fields
.field private static final DEFAULT_ENCODING:Ljava/nio/charset/Charset;

.field public static final DEFAULT_PORT:I = 0x77


# instance fields
.field protected _commandSupport_:Lorg/apache/commons/net/ProtocolCommandSupport;

.field _isAllowedToPost:Z

.field protected _reader_:Ljava/io/BufferedReader;

.field protected _writer_:Ljava/io/BufferedWriter;

.field private replyCode:I

.field private replyString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 90
    sget-object v0, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    sput-object v0, Lorg/apache/commons/net/nntp/NNTP;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 122
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    const/16 v0, 0x77

    .line 123
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->setDefaultPort(I)V

    const/4 v0, 0x0

    .line 124
    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    .line 125
    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_reader_:Ljava/io/BufferedReader;

    .line 126
    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_writer_:Ljava/io/BufferedWriter;

    const/4 v0, 0x0

    .line 127
    iput-boolean v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_isAllowedToPost:Z

    .line 128
    new-instance v0, Lorg/apache/commons/net/ProtocolCommandSupport;

    invoke-direct {v0, p0}, Lorg/apache/commons/net/ProtocolCommandSupport;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_commandSupport_:Lorg/apache/commons/net/ProtocolCommandSupport;

    return-void
.end method


# virtual methods
.method protected _connectAction_()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    invoke-super {p0}, Lorg/apache/commons/net/SocketClient;->_connectAction_()V

    .line 141
    new-instance v0, Lorg/apache/commons/net/io/CRLFLineReader;

    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v2, p0, Lorg/apache/commons/net/nntp/NNTP;->_input_:Ljava/io/InputStream;

    sget-object v3, Lorg/apache/commons/net/nntp/NNTP;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/CRLFLineReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_reader_:Ljava/io/BufferedReader;

    .line 144
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lorg/apache/commons/net/nntp/NNTP;->_output_:Ljava/io/OutputStream;

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_writer_:Ljava/io/BufferedWriter;

    .line 147
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTP;->getReply()I

    .line 149
    iget v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyCode:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_isAllowedToPost:Z

    return-void
.end method

.method public article()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 434
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public article(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    int-to-long v0, p1

    .line 993
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTP;->article(J)I

    move-result p1

    return p1
.end method

.method public article(J)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 416
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public article(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 396
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public authinfoPass(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 910
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PASS "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xf

    .line 911
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public authinfoUser(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 888
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "USER "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xf

    .line 889
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public body()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 494
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public body(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    int-to-long v0, p1

    .line 1005
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTP;->body(J)I

    move-result p1

    return p1
.end method

.method public body(J)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 476
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public body(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 456
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public disconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    invoke-super {p0}, Lorg/apache/commons/net/SocketClient;->disconnect()V

    const/4 v0, 0x0

    .line 164
    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_reader_:Ljava/io/BufferedReader;

    .line 165
    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_writer_:Ljava/io/BufferedWriter;

    .line 166
    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    const/4 v0, 0x0

    .line 167
    iput-boolean v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_isAllowedToPost:Z

    return-void
.end method

.method protected getCommandSupport()Lorg/apache/commons/net/ProtocolCommandSupport;
    .locals 1

    .line 1037
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_commandSupport_:Lorg/apache/commons/net/ProtocolCommandSupport;

    return-object v0
.end method

.method public getReply()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 333
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_reader_:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 342
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_1

    .line 349
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyCode:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTP;->fireReplyReceived(ILjava/lang/String;)V

    .line 359
    iget v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyCode:I

    const/16 v1, 0x190

    if-eq v0, v1, :cond_0

    return v0

    .line 360
    :cond_0
    new-instance v0, Lorg/apache/commons/net/nntp/NNTPConnectionClosedException;

    const-string v1, "NNTP response 400 received.  Server closed connection."

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/NNTPConnectionClosedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 353
    :catch_0
    new-instance v0, Lorg/apache/commons/net/MalformedServerReplyException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not parse response code.\nServer Reply: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/net/MalformedServerReplyException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 343
    :cond_1
    new-instance v0, Lorg/apache/commons/net/MalformedServerReplyException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Truncated server reply: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/net/MalformedServerReplyException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_2
    new-instance v0, Lorg/apache/commons/net/nntp/NNTPConnectionClosedException;

    const-string v1, "Connection closed without indication."

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/NNTPConnectionClosedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getReplyCode()I
    .locals 1

    .line 311
    iget v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyCode:I

    return v0
.end method

.method public getReplyString()Ljava/lang/String;
    .locals 1

    .line 375
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NNTP;->replyString:Ljava/lang/String;

    return-object v0
.end method

.method public group(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 634
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public head()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 554
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public head(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    int-to-long v0, p1

    .line 1017
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTP;->head(J)I

    move-result p1

    return p1
.end method

.method public head(J)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 536
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public head(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 516
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public help()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x4

    .line 653
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public ihave(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 674
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public isAllowedToPost()Z
    .locals 1

    .line 180
    iget-boolean v0, p0, Lorg/apache/commons/net/nntp/NNTP;->_isAllowedToPost:Z

    return v0
.end method

.method public last()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x6

    .line 693
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public list()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x7

    .line 713
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public listActive(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 977
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ACTIVE "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 978
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p1, 0x7

    .line 979
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public newgroups(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 760
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 762
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x20

    .line 763
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 764
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_0

    .line 768
    const-string p1, " GMT"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    if-eqz p4, :cond_1

    .line 774
    const-string p1, " <"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 775
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x3e

    .line 776
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    const/16 p1, 0x8

    .line 779
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public newnews(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 808
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 810
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x20

    .line 811
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 812
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 813
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 814
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_0

    .line 818
    const-string p1, " GMT"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    if-eqz p5, :cond_1

    .line 824
    const-string p1, " <"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 825
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x3e

    .line 826
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    const/16 p1, 0x9

    .line 829
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public next()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xa

    .line 733
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public post()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xb

    .line 849
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public quit()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xc

    .line 869
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public sendCommand(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 297
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public sendCommand(ILjava/lang/String;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    invoke-static {p1}, Lorg/apache/commons/net/nntp/NNTPCommand;->getCommand(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public sendCommand(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 272
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public sendCommand(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    const/16 v1, 0x20

    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    :cond_0
    const-string p2, "\r\n"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    iget-object p2, p0, Lorg/apache/commons/net/nntp/NNTP;->_writer_:Ljava/io/BufferedWriter;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 217
    iget-object p2, p0, Lorg/apache/commons/net/nntp/NNTP;->_writer_:Ljava/io/BufferedWriter;

    invoke-virtual {p2}, Ljava/io/BufferedWriter;->flush()V

    .line 219
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTP;->fireCommandSent(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTP;->getReply()I

    move-result p1

    return p1
.end method

.method public stat()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    .line 614
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(I)I

    move-result v0

    return v0
.end method

.method public stat(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    int-to-long v0, p1

    .line 1029
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTP;->stat(J)I

    move-result p1

    return p1
.end method

.method public stat(J)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    .line 596
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public stat(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    .line 576
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public xhdr(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 961
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 962
    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 963
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x11

    .line 964
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public xover(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x10

    .line 935
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTP;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method
