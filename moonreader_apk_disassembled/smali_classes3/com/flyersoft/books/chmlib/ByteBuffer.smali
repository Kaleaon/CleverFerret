.class public abstract Lcom/flyersoft/books/chmlib/ByteBuffer;
.super Ljava/lang/Object;
.source "ByteBuffer.java"


# instance fields
.field private size:J

.field private startOffset:J

.field private tempBuffer:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x800

    .line 10
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    return-void
.end method


# virtual methods
.method public checkAvailableSize(I)V
    .locals 4

    int-to-long v0, p1

    .line 55
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getRemainSize()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-gtz p1, :cond_0

    return-void

    .line 56
    :cond_0
    new-instance p1, Lcom/flyersoft/books/chmlib/ChmParseException;

    const-string v0, "EOF exception"

    invoke-direct {p1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public close()V
    .locals 0

    return-void
.end method

.method public copyTo(Ljava/io/OutputStream;)I
    .locals 4

    .line 142
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getRemainSize()J

    move-result-wide v0

    long-to-int v1, v0

    .line 145
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([B)I

    move-result v0

    if-lez v0, :cond_0

    .line 146
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v0}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    return v1

    :catch_0
    move-exception p1

    .line 150
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public abstract getAbsoluteOffset()J
.end method

.method public abstract getFullSize()J
.end method

.method public getOffset()J
    .locals 4

    .line 47
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->startOffset:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getRemainSize()J
    .locals 4

    .line 51
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->size:J

    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getOffset()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getSize()J
    .locals 2

    .line 49
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->size:J

    return-wide v0
.end method

.method public getStartOffset()J
    .locals 2

    .line 50
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->startOffset:J

    return-wide v0
.end method

.method public getString()Ljava/lang/String;
    .locals 2

    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 157
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    invoke-virtual {p0, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([B)I

    move-result v1

    if-lez v1, :cond_0

    .line 158
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 161
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 163
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasMore()Z
    .locals 5

    .line 52
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getRemainSize()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public abstract readByte()B
.end method

.method public readBytes([B)I
    .locals 2

    const/4 v0, 0x0

    .line 27
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([BII)I

    move-result p1

    return p1
.end method

.method public abstract readBytes([BII)I
.end method

.method public readBytes(I)[B
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 23
    new-array v0, p1, [B

    const/4 v1, 0x0

    .line 24
    invoke-virtual {p0, v0, v1, p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([BII)I

    return-object v0
.end method

.method public readDWORD()I
    .locals 3

    .line 110
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-virtual {p0, v0, v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([BII)I

    const/4 v0, 0x3

    :goto_0
    if-ltz v0, :cond_0

    shl-int/lit8 v1, v1, 0x8

    .line 113
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    aget-byte v2, v2, v0

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public readENCINT()I
    .locals 3

    const/4 v0, 0x0

    :cond_0
    shl-int/lit8 v0, v0, 0x7

    .line 133
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v1

    and-int/lit8 v2, v1, 0x7f

    add-int/2addr v0, v2

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_0

    return v0
.end method

.method public readQWORD()J
    .locals 6

    .line 120
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-virtual {p0, v0, v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([BII)I

    const-wide/16 v0, 0x0

    const/4 v3, 0x7

    :goto_0
    if-ltz v3, :cond_0

    shl-long/2addr v0, v2

    .line 123
    iget-object v4, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    aget-byte v4, v4, v3

    and-int/lit16 v4, v4, 0xff

    int-to-long v4, v4

    add-long/2addr v0, v4

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method public readString(I)Ljava/lang/String;
    .locals 4

    .line 64
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([BII)I

    .line 67
    :try_start_0
    new-instance v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const-string v3, "UTF-8"

    invoke-direct {v0, v2, v1, p1, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 69
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v0
.end method

.method public readStringNT()Ljava/lang/String;
    .locals 5

    .line 89
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readUntil([BI)I

    move-result v0

    .line 91
    :try_start_0
    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v1, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 93
    new-instance v1, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public readUntil([BI)I
    .locals 2

    const/4 v0, 0x0

    .line 75
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 76
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v1

    if-ne v1, p2, :cond_0

    goto :goto_1

    :cond_0
    int-to-byte v1, v1

    .line 79
    aput-byte v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method

.method public readWORD()I
    .locals 3

    .line 100
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([BII)I

    const/4 v0, 0x1

    :goto_0
    if-ltz v0, :cond_0

    shl-int/lit8 v1, v1, 0x8

    .line 103
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->tempBuffer:[B

    aget-byte v2, v2, v0

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public resetSize()V
    .locals 4

    .line 32
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->startOffset:J

    .line 33
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getFullSize()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->startOffset:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->size:J

    return-void
.end method

.method public resetSize(J)V
    .locals 2

    .line 37
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->startOffset:J

    .line 38
    iput-wide p1, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->size:J

    return-void
.end method

.method public resetSize(JJ)V
    .locals 0

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seekAbsolute(J)V

    .line 44
    invoke-virtual {p0, p3, p4}, Lcom/flyersoft/books/chmlib/ByteBuffer;->resetSize(J)V

    return-void
.end method

.method public seek(J)V
    .locals 2

    .line 48
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBuffer;->startOffset:J

    add-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seekAbsolute(J)V

    return-void
.end method

.method public abstract seekAbsolute(J)V
.end method

.method public skip(I)V
    .locals 4

    .line 28
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getOffset()J

    move-result-wide v0

    int-to-long v2, p1

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seek(J)V

    return-void
.end method
