.class public abstract Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;
.super Lorg/apache/commons/vfs2/provider/AbstractRandomAccessContent;
.source "AbstractRandomAccessStreamContent.java"


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    return-void
.end method


# virtual methods
.method protected abstract getDataInputStream()Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 107
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    return-object v0
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readBoolean()Z

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

    .line 37
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readByte()B

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

    .line 42
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readChar()C

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

    .line 47
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readDouble()D

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

    .line 52
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readFloat()F

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

    .line 92
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/DataInputStream;->readFully([B)V

    return-void
.end method

.method public readFully([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->readFully([BII)V

    return-void
.end method

.method public readInt()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    return v0
.end method

.method public readLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readLong()J

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

    .line 77
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readShort()S

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

    .line 102
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

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

    .line 62
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

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

    .line 67
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    return v0
.end method

.method public setLength(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public skipBytes(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessStreamContent;->getDataInputStream()Ljava/io/DataInputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result p1

    return p1
.end method
