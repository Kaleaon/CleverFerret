.class public final Lcom/github/junrar/io/RandomAccessStream;
.super Ljava/io/InputStream;
.source "RandomAccessStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# static fields
.field private static final BLOCK_MASK:I = 0x1ff

.field private static final BLOCK_SHIFT:I = 0x9

.field private static final BLOCK_SIZE:I = 0x200


# instance fields
.field private data:Ljava/util/Vector;

.field private foundEOS:Z

.field private length:I

.field private pointer:J

.field private ras:Ljava/io/RandomAccessFile;

.field private src:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 39
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const-wide/16 v0, 0x0

    .line 40
    iput-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->data:Ljava/util/Vector;

    const/4 v0, 0x0

    .line 42
    iput v0, p0, Lcom/github/junrar/io/RandomAccessStream;->length:I

    .line 43
    iput-boolean v0, p0, Lcom/github/junrar/io/RandomAccessStream;->foundEOS:Z

    .line 44
    iput-object p1, p0, Lcom/github/junrar/io/RandomAccessStream;->src:Ljava/io/InputStream;

    return-void
.end method

.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    return-void
.end method

.method private readUntil(J)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    iget v0, p0, Lcom/github/junrar/io/RandomAccessStream;->length:I

    int-to-long v1, v0

    cmp-long v3, p1, v1

    if-gez v3, :cond_0

    return-wide p1

    .line 135
    :cond_0
    iget-boolean v1, p0, Lcom/github/junrar/io/RandomAccessStream;->foundEOS:Z

    if-eqz v1, :cond_1

    int-to-long p1, v0

    return-wide p1

    :cond_1
    const/16 v1, 0x9

    shr-long/2addr p1, v1

    long-to-int p2, p1

    shr-int/lit8 p1, v0, 0x9

    :goto_0
    if-gt p1, p2, :cond_4

    const/16 v0, 0x200

    .line 141
    new-array v1, v0, [B

    .line 142
    iget-object v2, p0, Lcom/github/junrar/io/RandomAccessStream;->data:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    const/4 v2, 0x0

    :goto_1
    if-lez v0, :cond_3

    .line 146
    iget-object v3, p0, Lcom/github/junrar/io/RandomAccessStream;->src:Ljava/io/InputStream;

    invoke-virtual {v3, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    const/4 p1, 0x1

    .line 148
    iput-boolean p1, p0, Lcom/github/junrar/io/RandomAccessStream;->foundEOS:Z

    .line 149
    iget p1, p0, Lcom/github/junrar/io/RandomAccessStream;->length:I

    :goto_2
    int-to-long p1, p1

    return-wide p1

    :cond_2
    add-int/2addr v2, v3

    sub-int/2addr v0, v3

    .line 153
    iget v4, p0, Lcom/github/junrar/io/RandomAccessStream;->length:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/github/junrar/io/RandomAccessStream;->length:I

    goto :goto_1

    :cond_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 158
    :cond_4
    iget p1, p0, Lcom/github/junrar/io/RandomAccessStream;->length:I

    goto :goto_2
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-void

    .line 224
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->data:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 225
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->src:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-void
.end method

.method public getFilePointer()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    :goto_0
    long-to-int v1, v0

    return v1

    .line 61
    :cond_0
    iget-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    goto :goto_0
.end method

.method public getLongFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    return-wide v0

    .line 69
    :cond_0
    iget-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    return-wide v0
.end method

.method public read()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    return v0

    .line 77
    :cond_0
    iget-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    .line 78
    invoke-direct {p0, v0, v1}, Lcom/github/junrar/io/RandomAccessStream;->readUntil(J)J

    move-result-wide v4

    cmp-long v6, v4, v0

    if-ltz v6, :cond_1

    .line 80
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->data:Ljava/util/Vector;

    iget-wide v4, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    const/16 v1, 0x9

    shr-long/2addr v4, v1

    long-to-int v1, v4

    .line 81
    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    .line 82
    iget-wide v4, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    const-wide/16 v1, 0x1ff

    and-long/2addr v1, v4

    long-to-int v2, v1

    aget-byte v0, v0, v2

    and-int/lit16 v0, v0, 0xff

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public read([BII)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 93
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p1

    return p1

    :cond_0
    if-ltz p2, :cond_3

    if-ltz p3, :cond_3

    add-int v0, p2, p3

    .line 95
    array-length v1, p1

    if-gt v0, v1, :cond_3

    if-nez p3, :cond_1

    const/4 p1, 0x0

    return p1

    .line 101
    :cond_1
    iget-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    invoke-direct {p0, v0, v1}, Lcom/github/junrar/io/RandomAccessStream;->readUntil(J)J

    move-result-wide v0

    .line 102
    iget-wide v2, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_2

    const/4 p1, -0x1

    return p1

    .line 105
    :cond_2
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->data:Ljava/util/Vector;

    const/16 v1, 0x9

    shr-long v1, v2, v1

    long-to-int v2, v1

    .line 106
    invoke-virtual {v0, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    .line 107
    iget-wide v1, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    const-wide/16 v3, 0x1ff

    and-long/2addr v1, v3

    long-to-int v2, v1

    rsub-int v1, v2, 0x200

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 108
    iget-wide v1, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    and-long/2addr v1, v3

    long-to-int v2, v1

    invoke-static {v0, v2, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    iget-wide p1, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    int-to-long v0, p3

    add-long/2addr p1, v0

    iput-wide p1, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    return p3

    .line 96
    :cond_3
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

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

    .line 217
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

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

    .line 116
    array-length v0, p1

    invoke-virtual {p0, p1, v0}, Lcom/github/junrar/io/RandomAccessStream;->readFully([BI)V

    return-void
.end method

.method public readFully([BI)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :cond_0
    sub-int v1, p2, v0

    .line 122
    invoke-virtual {p0, p1, v0, v1}, Lcom/github/junrar/io/RandomAccessStream;->read([BII)I

    move-result v1

    if-gez v1, :cond_1

    goto :goto_0

    :cond_1
    add-int/2addr v0, v1

    if-lt v0, p2, :cond_0

    :goto_0
    return-void
.end method

.method public readInt()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v0

    .line 188
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v1

    .line 189
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v2

    .line 190
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v3

    or-int v4, v0, v1

    or-int/2addr v4, v2

    or-int/2addr v4, v3

    if-ltz v4, :cond_0

    shl-int/lit8 v0, v0, 0x18

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    shl-int/lit8 v1, v2, 0x8

    add-int/2addr v0, v1

    add-int/2addr v0, v3

    return v0

    .line 192
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readLong()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->readInt()I

    move-result v0

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->readInt()I

    move-result v2

    int-to-long v2, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public readShort()S
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v0

    .line 208
    invoke-virtual {p0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v1

    or-int v2, v0, v1

    if-ltz v2, :cond_0

    shl-int/lit8 v0, v0, 0x8

    add-int/2addr v0, v1

    int-to-short v0, v0

    return v0

    .line 210
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public seek(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 175
    iget-object p1, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz p1, :cond_0

    .line 176
    invoke-virtual {p1, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    return-void

    :cond_0
    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-gez p1, :cond_1

    .line 180
    iput-wide v2, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    return-void

    .line 182
    :cond_1
    iput-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    return-void
.end method

.method public seek(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    iget-object v0, p0, Lcom/github/junrar/io/RandomAccessStream;->ras:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    return-void

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    .line 167
    iput-wide v0, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    return-void

    .line 169
    :cond_1
    iput-wide p1, p0, Lcom/github/junrar/io/RandomAccessStream;->pointer:J

    return-void
.end method
