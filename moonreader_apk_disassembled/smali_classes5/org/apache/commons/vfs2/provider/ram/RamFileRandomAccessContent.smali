.class public Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;
.super Ljava/lang/Object;
.source "RamFileRandomAccessContent.java"

# interfaces
.implements Lorg/apache/commons/vfs2/RandomAccessContent;


# instance fields
.field private buf:[B

.field private final buffer1:[B

.field private final buffer2:[B

.field private final buffer4:[B

.field private final buffer8:[B

.field private final file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

.field protected filePointer:I

.field private final rafis:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    .line 36
    iput p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    const/16 p2, 0x8

    .line 46
    new-array p2, p2, [B

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer8:[B

    const/4 p2, 0x4

    .line 51
    new-array p2, p2, [B

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer4:[B

    const/4 p2, 0x2

    .line 56
    new-array p2, p2, [B

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    const/4 p2, 0x1

    .line 61
    new-array p2, p2, [B

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer1:[B

    .line 76
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object p2

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getContent()[B

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    .line 77
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    .line 79
    new-instance p1, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;

    invoke-direct {p1, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;-><init>(Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;)V

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->rafis:Ljava/io/InputStream;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;)I
    .locals 0

    .line 32
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->getLeftBytes()I

    move-result p0

    return p0
.end method

.method private getLeftBytes()I
    .locals 2

    .line 327
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    array-length v0, v0

    iget v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public static toBytes(J[B)[B
    .locals 2

    long-to-int v0, p0

    int-to-byte v0, v0

    const/4 v1, 0x7

    .line 396
    aput-byte v0, p2, v1

    const/16 v0, 0x8

    ushr-long v0, p0, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x6

    .line 398
    aput-byte v0, p2, v1

    const/16 v0, 0x10

    ushr-long v0, p0, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x5

    .line 400
    aput-byte v0, p2, v1

    const/16 v0, 0x18

    ushr-long v0, p0, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x4

    .line 402
    aput-byte v0, p2, v1

    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x3

    .line 404
    aput-byte v0, p2, v1

    const/16 v0, 0x28

    ushr-long v0, p0, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x2

    .line 406
    aput-byte v0, p2, v1

    const/16 v0, 0x30

    ushr-long v0, p0, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x1

    .line 408
    aput-byte v0, p2, v1

    const/16 v0, 0x38

    ushr-long/2addr p0, v0

    long-to-int p1, p0

    int-to-byte p0, p1

    const/4 p1, 0x0

    .line 410
    aput-byte p0, p2, p1

    return-object p2
.end method

.method public static toLong([B)J
    .locals 7

    const/4 v0, 0x7

    .line 383
    aget-byte v0, p0, v0

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    const/4 v4, 0x6

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    add-long/2addr v0, v4

    const/4 v4, 0x5

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    add-long/2addr v0, v4

    const/4 v4, 0x4

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    add-long/2addr v0, v4

    const/4 v4, 0x3

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    add-long/2addr v0, v4

    const/4 v4, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    add-long/2addr v0, v4

    const/4 v4, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    add-long/2addr v0, v4

    const/4 v4, 0x0

    aget-byte p0, p0, v4

    int-to-long v4, p0

    and-long/2addr v2, v4

    const/16 p0, 0x38

    shl-long/2addr v2, p0

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static toShort([B)S
    .locals 0

    .line 421
    invoke-static {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->toUnsignedShort([B)I

    move-result p0

    int-to-short p0, p0

    return p0
.end method

.method public static toUnsignedShort([B)I
    .locals 2

    const/4 v0, 0x1

    .line 431
    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x0

    aget-byte p0, p0, v1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x8

    add-int/2addr v0, p0

    return v0
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public getFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    iget v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 574
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->rafis:Ljava/io/InputStream;

    return-object v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 270
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public readByte()B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public readChar()C
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v0

    .line 183
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v1

    shl-int/lit8 v0, v0, 0x8

    add-int/2addr v0, v1

    int-to-char v0, v0

    return v0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readLong()J

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

    .line 204
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 302
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readFully([BII)V

    return-void
.end method

.method public readFully([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p3, :cond_1

    .line 316
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->getLeftBytes()I

    move-result v0

    if-gt p3, v0, :cond_0

    .line 321
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    iget v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 323
    iget p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    add-int/2addr p1, p3

    iput p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    return-void

    .line 317
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Read length ("

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ") is higher than buffer left bytes ("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->getLeftBytes()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ") "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 313
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    const-string p2, "Length is lower than 0"

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public readInt()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 214
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readUnsignedByte()I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 569
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "deprecated"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer8:[B

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readFully([B)V

    .line 249
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer8:[B

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->toLong([B)J

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

    .line 259
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readFully([B)V

    .line 260
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->toShort([B)S

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

    .line 337
    invoke-static {p0}, Ljava/io/DataInputStream;->readUTF(Ljava/io/DataInput;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 224
    iget v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    array-length v2, v1

    if-ge v0, v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    .line 225
    iput v2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    return v0

    .line 227
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readUnsignedShort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readFully([B)V

    .line 238
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->toUnsignedShort([B)I

    move-result v0

    return v0
.end method

.method public seek(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    long-to-int p2, p1

    .line 142
    iput p2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    return-void

    .line 140
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Attempt to position before the start of the file"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLength(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 579
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->resize(J)V

    .line 580
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getContent()[B

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    return-void
.end method

.method public skipBytes(I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_1

    .line 284
    iget v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    add-int/2addr v0, p1

    int-to-long v0, v0

    .line 286
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    array-length v2, v2

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 290
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->seek(J)V

    return p1

    .line 287
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    const-string v0, "Tyring to skip too much bytes"

    invoke-direct {p1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 281
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    const-string v0, "The skip number can\'t be negative"

    invoke-direct {p1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 441
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer1:[B

    const/4 v1, 0x0

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    .line 442
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method

.method public write([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 363
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 347
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->getLeftBytes()I

    move-result v0

    if-ge v0, p3, :cond_0

    .line 348
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    array-length v0, v0

    add-int/2addr v0, p3

    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->getLeftBytes()I

    move-result v1

    sub-int/2addr v0, v1

    .line 349
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->resize(J)V

    .line 350
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getContent()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    .line 352
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buf:[B

    iget v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 353
    iget p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    add-int/2addr p1, p3

    iput p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->filePointer:I

    return-void
.end method

.method public writeBoolean(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 452
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write(I)V

    return-void
.end method

.method public writeByte(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 373
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write(I)V

    return-void
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 462
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method

.method public writeChar(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 472
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    ushr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v1, 0x1

    .line 473
    aput-byte p1, v0, v1

    .line 474
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method

.method public writeChars(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 484
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 486
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->writeChar(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public writeDouble(D)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 497
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->writeLong(J)V

    return-void
.end method

.method public writeFloat(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 507
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->writeInt(I)V

    return-void
.end method

.method public writeInt(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 517
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer4:[B

    ushr-int/lit8 v1, p1, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    ushr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x1

    .line 518
    aput-byte v1, v0, v2

    ushr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x2

    .line 519
    aput-byte v1, v0, v2

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v1, 0x3

    .line 520
    aput-byte p1, v0, v1

    .line 521
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method

.method public writeLong(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 531
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer8:[B

    invoke-static {p1, p2, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->toBytes(J[B)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method

.method public writeShort(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 541
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->buffer2:[B

    ushr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v1, 0x1

    .line 542
    aput-byte p1, v0, v1

    .line 543
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method

.method public writeUTF(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 553
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 554
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 555
    invoke-virtual {v1, p1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 556
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 557
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 558
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 559
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->write([B)V

    return-void
.end method
