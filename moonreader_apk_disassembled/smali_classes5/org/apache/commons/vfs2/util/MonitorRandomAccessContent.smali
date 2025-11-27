.class public Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;
.super Ljava/lang/Object;
.source "MonitorRandomAccessContent.java"

# interfaces
.implements Lorg/apache/commons/vfs2/RandomAccessContent;


# instance fields
.field private final content:Lorg/apache/commons/vfs2/RandomAccessContent;

.field private finished:Z


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->finished:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 58
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :catch_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->onClose()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v0, 0x0

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_0
    const/4 v1, 0x1

    .line 71
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->finished:Z

    if-nez v0, :cond_1

    :goto_1
    return-void

    .line 74
    :cond_1
    throw v0
.end method

.method public getFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->getFilePointer()J

    move-result-wide v0

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 245
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method protected onClose()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readBoolean()Z

    move-result v0

    return v0
.end method

.method public readByte()B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readByte()B

    move-result v0

    return v0
.end method

.method public readChar()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readChar()C

    move-result v0

    return v0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readFloat()F

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->readFully([B)V

    return-void
.end method

.method public readFully([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/RandomAccessContent;->readFully([BII)V

    return-void
.end method

.method public readInt()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readInt()I

    move-result v0

    return v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readLine()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readShort()S

    move-result v0

    return v0
.end method

.method public readUTF()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 240
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readUTF()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readUnsignedByte()I

    move-result v0

    return v0
.end method

.method public readUnsignedShort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readUnsignedShort()I

    move-result v0

    return v0
.end method

.method public seek(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/RandomAccessContent;->seek(J)V

    return-void
.end method

.method public setLength(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/RandomAccessContent;->setLength(J)V

    return-void
.end method

.method public skipBytes(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->skipBytes(I)I

    move-result p1

    return p1
.end method

.method public write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->write(I)V

    return-void
.end method

.method public write([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->write([B)V

    return-void
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/RandomAccessContent;->write([BII)V

    return-void
.end method

.method public writeBoolean(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeBoolean(Z)V

    return-void
.end method

.method public writeByte(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeByte(I)V

    return-void
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeBytes(Ljava/lang/String;)V

    return-void
.end method

.method public writeChar(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeChar(I)V

    return-void
.end method

.method public writeChars(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeChars(Ljava/lang/String;)V

    return-void
.end method

.method public writeDouble(D)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeDouble(D)V

    return-void
.end method

.method public writeFloat(F)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeFloat(F)V

    return-void
.end method

.method public writeInt(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeInt(I)V

    return-void
.end method

.method public writeLong(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeLong(J)V

    return-void
.end method

.method public writeShort(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeShort(I)V

    return-void
.end method

.method public writeUTF(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/MonitorRandomAccessContent;->content:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/RandomAccessContent;->writeUTF(Ljava/lang/String;)V

    return-void
.end method
