.class public Lorg/apache/tools/zip/ZipOutputStream;
.super Ljava/io/FilterOutputStream;
.source "ZipOutputStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# static fields
.field protected static final CFH_SIG:Lorg/apache/tools/zip/ZipLong;

.field protected static final DD_SIG:Lorg/apache/tools/zip/ZipLong;

.field public static final DEFLATED:I = 0x8

.field private static final DOS_TIME_MIN:Lorg/apache/tools/zip/ZipLong;

.field protected static final EOCD_SIG:Lorg/apache/tools/zip/ZipLong;

.field protected static final LFH_SIG:Lorg/apache/tools/zip/ZipLong;

.field private static final LZERO:[B

.field public static final STORED:I

.field private static final ZERO:[B


# instance fields
.field protected buf:[B

.field private cdLength:Lorg/apache/tools/zip/ZipLong;

.field private cdOffset:Lorg/apache/tools/zip/ZipLong;

.field private comment:Ljava/lang/String;

.field private crc:Ljava/util/zip/CRC32;

.field private dataStart:J

.field protected def:Ljava/util/zip/Deflater;

.field private encoding:Ljava/lang/String;

.field private entries:Ljava/util/Vector;

.field private entry:Lorg/apache/tools/zip/ZipEntry;

.field private hasCompressionLevelChanged:Z

.field private level:I

.field private localDataStart:J

.field private method:I

.field private offsets:Ljava/util/Hashtable;

.field private raf:Ljava/io/RandomAccessFile;

.field private written:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x2

    .line 187
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    const/4 v0, 0x4

    .line 194
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->LZERO:[B

    .line 559
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    const-wide/32 v1, 0x4034b50

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->LFH_SIG:Lorg/apache/tools/zip/ZipLong;

    .line 565
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    const-wide/32 v1, 0x8074b50

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DD_SIG:Lorg/apache/tools/zip/ZipLong;

    .line 571
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    const-wide/32 v1, 0x2014b50    # 1.6619997E-316

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->CFH_SIG:Lorg/apache/tools/zip/ZipLong;

    .line 577
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    const-wide/32 v1, 0x6054b50

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->EOCD_SIG:Lorg/apache/tools/zip/ZipLong;

    .line 801
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    const-wide/16 v1, 0x2100

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DOS_TIME_MIN:Lorg/apache/tools/zip/ZipLong;

    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data

    nop

    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 275
    invoke-direct {p0, v0}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 108
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    const/4 v1, -0x1

    .line 115
    iput v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    const/4 v2, 0x0

    .line 123
    iput-boolean v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    const/16 v2, 0x8

    .line 130
    iput v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    .line 137
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    .line 144
    new-instance v2, Ljava/util/zip/CRC32;

    invoke-direct {v2}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    const-wide/16 v2, 0x0

    .line 151
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 158
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    .line 166
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    .line 173
    new-instance v4, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v4, v2, v3}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:Lorg/apache/tools/zip/ZipLong;

    .line 180
    new-instance v4, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v4, v2, v3}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:Lorg/apache/tools/zip/ZipLong;

    .line 201
    new-instance v4, Ljava/util/Hashtable;

    invoke-direct {v4}, Ljava/util/Hashtable;-><init>()V

    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Hashtable;

    .line 212
    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    .line 224
    new-instance v4, Ljava/util/zip/Deflater;

    const/4 v5, 0x1

    invoke-direct {v4, v1, v5}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    const/16 v1, 0x200

    .line 236
    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    .line 243
    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 278
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v4, "rw"

    invoke-direct {v1, p1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 279
    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->setLength(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    nop

    .line 281
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_0

    .line 283
    :try_start_1
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 287
    :catch_1
    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 289
    :cond_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 3

    .line 265
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 108
    const-string p1, ""

    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    const/4 p1, -0x1

    .line 115
    iput p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    const/4 v0, 0x0

    .line 123
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    const/16 v0, 0x8

    .line 130
    iput v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    .line 137
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    .line 144
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    const-wide/16 v0, 0x0

    .line 151
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 158
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    .line 166
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    .line 173
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v2, v0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:Lorg/apache/tools/zip/ZipLong;

    .line 180
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v2, v0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:Lorg/apache/tools/zip/ZipLong;

    .line 201
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Hashtable;

    const/4 v0, 0x0

    .line 212
    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    .line 224
    new-instance v1, Ljava/util/zip/Deflater;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    const/16 p1, 0x200

    .line 236
    new-array p1, p1, [B

    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    .line 243
    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    return-void
.end method

.method protected static toDosTime(Ljava/util/Date;)Lorg/apache/tools/zip/ZipLong;
    .locals 7

    .line 811
    invoke-virtual {p0}, Ljava/util/Date;->getYear()I

    move-result v0

    add-int/lit16 v1, v0, 0x76c

    .line 812
    invoke-virtual {p0}, Ljava/util/Date;->getMonth()I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    const/16 v4, 0x7bc

    if-ge v1, v4, :cond_0

    .line 814
    sget-object p0, Lorg/apache/tools/zip/ZipOutputStream;->DOS_TIME_MIN:Lorg/apache/tools/zip/ZipLong;

    return-object p0

    :cond_0
    add-int/lit8 v0, v0, -0x50

    shl-int/lit8 v0, v0, 0x19

    shl-int/lit8 v1, v2, 0x15

    or-int/2addr v0, v1

    .line 816
    invoke-virtual {p0}, Ljava/util/Date;->getDate()I

    move-result v1

    const/16 v2, 0x10

    shl-int/2addr v1, v2

    or-int/2addr v0, v1

    invoke-virtual {p0}, Ljava/util/Date;->getHours()I

    move-result v1

    shl-int/lit8 v1, v1, 0xb

    or-int/2addr v0, v1

    invoke-virtual {p0}, Ljava/util/Date;->getMinutes()I

    move-result v1

    shl-int/lit8 v1, v1, 0x5

    or-int/2addr v0, v1

    invoke-virtual {p0}, Ljava/util/Date;->getSeconds()I

    move-result p0

    shr-int/2addr p0, v3

    or-int/2addr p0, v0

    int-to-long v0, p0

    const-wide/16 v4, 0xff

    and-long/2addr v4, v0

    long-to-int p0, v4

    int-to-byte p0, p0

    const-wide/32 v4, 0xff00

    and-long/2addr v4, v0

    const/16 v6, 0x8

    shr-long/2addr v4, v6

    long-to-int v5, v4

    int-to-byte v4, v5

    const-wide/32 v5, 0xff0000

    and-long/2addr v5, v0

    shr-long/2addr v5, v2

    long-to-int v2, v5

    int-to-byte v2, v2

    const-wide v5, 0xff000000L

    and-long/2addr v0, v5

    const/16 v5, 0x18

    shr-long/2addr v0, v5

    long-to-int v1, v0

    int-to-byte v0, v1

    const/4 v1, 0x4

    .line 827
    new-array v1, v1, [B

    const/4 v5, 0x0

    aput-byte p0, v1, v5

    aput-byte v4, v1, v3

    const/4 p0, 0x2

    aput-byte v2, v1, p0

    const/4 p0, 0x3

    aput-byte v0, v1, p0

    .line 828
    new-instance p0, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {p0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>([B)V

    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 528
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->finish()V

    .line 530
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 531
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 533
    :cond_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 534
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_1
    return-void
.end method

.method public closeEntry()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 355
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    if-nez v0, :cond_0

    return-void

    .line 359
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    .line 360
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->reset()V

    .line 362
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_2

    .line 363
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v2}, Ljava/util/zip/Deflater;->finish()V

    .line 364
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v2}, Ljava/util/zip/Deflater;->finished()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 368
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3}, Ljava/util/zip/Deflater;->getTotalIn()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 369
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3}, Ljava/util/zip/Deflater;->getTotalOut()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/zip/ZipEntry;->setComprSize(J)V

    .line 370
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2, v0, v1}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 372
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    .line 374
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    goto/16 :goto_1

    .line 365
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflate()V

    goto :goto_0

    .line 375
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v2, :cond_5

    .line 376
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v2

    const-string v4, " instead of "

    const-string v5, ": "

    cmp-long v6, v2, v0

    if-nez v6, :cond_4

    .line 384
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    sub-long/2addr v2, v6

    cmp-long v6, v0, v2

    if-nez v6, :cond_3

    goto/16 :goto_1

    .line 385
    :cond_3
    new-instance v0, Ljava/util/zip/ZipException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "bad size for entry "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    sub-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 377
    :cond_4
    new-instance v2, Ljava/util/zip/ZipException;

    new-instance v3, Ljava/lang/StringBuffer;

    const-string v6, "bad CRC checksum for entry "

    invoke-direct {v3, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 392
    :cond_5
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    sub-long/2addr v2, v4

    .line 394
    iget-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v4, v2, v3}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 395
    iget-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v4, v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setComprSize(J)V

    .line 396
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v2, v0, v1}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 401
    :goto_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_6

    .line 402
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    .line 404
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    iget-wide v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    invoke-virtual {v2, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 405
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 406
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 407
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 408
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 411
    :cond_6
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeDataDescriptor(Lorg/apache/tools/zip/ZipEntry;)V

    const/4 v0, 0x0

    .line 412
    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    return-void
.end method

.method protected final deflate()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 585
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    array-length v2, v1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v0

    if-lez v0, :cond_0

    .line 587
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    invoke-virtual {p0, v1, v3, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    :cond_0
    return-void
.end method

.method public finish()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 338
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->closeEntry()V

    .line 339
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    iget-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:Lorg/apache/tools/zip/ZipLong;

    const/4 v0, 0x0

    .line 340
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 343
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    iget-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:Lorg/apache/tools/zip/ZipLong;

    .line 344
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->writeCentralDirectoryEnd()V

    .line 345
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 346
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    return-void

    .line 341
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeCentralFileHeader(Lorg/apache/tools/zip/ZipEntry;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 546
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 547
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    :cond_0
    return-void
.end method

.method protected getBytes(Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 838
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 839
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    return-object p1

    .line 842
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 844
    new-instance v0, Ljava/util/zip/ZipException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 328
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public isSeekable()Z
    .locals 1

    .line 304
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public putNextEntry(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 421
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->closeEntry()V

    .line 423
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    .line 424
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 426
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 427
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    invoke-virtual {p1, v0}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 430
    :cond_0
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-nez p1, :cond_1

    .line 431
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 435
    :cond_1
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez p1, :cond_4

    .line 436
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_3

    .line 441
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_2

    .line 445
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setComprSize(J)V

    goto :goto_0

    .line 442
    :cond_2
    new-instance p1, Ljava/util/zip/ZipException;

    const-string v0, "crc checksum is required for STORED method when not writing to a file"

    invoke-direct {p1, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 437
    :cond_3
    new-instance p1, Ljava/util/zip/ZipException;

    const-string v0, "uncompressed size is required for STORED method when not writing to a file"

    invoke-direct {p1, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 448
    :cond_4
    :goto_0
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result p1

    const/16 v0, 0x8

    if-ne p1, v0, :cond_5

    iget-boolean p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    if-eqz p1, :cond_5

    .line 449
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    iget v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    invoke-virtual {p1, v0}, Ljava/util/zip/Deflater;->setLevel(I)V

    const/4 p1, 0x0

    .line 450
    iput-boolean p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    .line 452
    :cond_5
    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeLocalFileHeader(Lorg/apache/tools/zip/ZipEntry;)V

    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0

    .line 461
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0

    .line 317
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    return-void
.end method

.method public setLevel(I)V
    .locals 1

    .line 472
    iget v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    .line 473
    iput p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    return-void
.end method

.method public setMethod(I)V
    .locals 0

    .line 484
    iput p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    return-void
.end method

.method public write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v0, 0x1

    .line 516
    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte p1, v1, v2

    .line 517
    invoke-virtual {p0, v1, v2, v0}, Lorg/apache/tools/zip/ZipOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 491
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    if-lez p3, :cond_2

    .line 493
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    move-result v0

    if-nez v0, :cond_2

    .line 494
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 495
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 496
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflate()V

    goto :goto_0

    .line 501
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 502
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 504
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    return-void
.end method

.method protected writeCentralDirectoryEnd()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 775
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->EOCD_SIG:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 778
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 779
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 782
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    .line 783
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 784
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 787
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 788
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 791
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 792
    new-instance v1, Lorg/apache/tools/zip/ZipShort;

    array-length v2, v0

    invoke-direct {v1, v2}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 793
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    return-void
.end method

.method protected writeCentralFileHeader(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 683
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->CFH_SIG:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 684
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 687
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getPlatform()I

    move-result v1

    const/16 v4, 0x8

    shl-int/2addr v1, v4

    const/16 v5, 0x14

    or-int/2addr v1, v5

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 688
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v6, 0x2

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 692
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v0

    if-ne v0, v4, :cond_0

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_0

    .line 695
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v0, v5}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 698
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v0, v4}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    goto :goto_0

    .line 700
    :cond_0
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 701
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 703
    :goto_0
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 706
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 707
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 710
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Lorg/apache/tools/zip/ZipOutputStream;->toDosTime(Ljava/util/Date;)Lorg/apache/tools/zip/ZipLong;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 711
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 716
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 717
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 718
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 719
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v4, 0xc

    add-long/2addr v0, v4

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 722
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 723
    new-instance v1, Lorg/apache/tools/zip/ZipShort;

    array-length v4, v0

    invoke-direct {v1, v4}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 724
    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 727
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCentralDirectoryExtra()[B

    move-result-object v1

    .line 728
    new-instance v4, Lorg/apache/tools/zip/ZipShort;

    array-length v5, v1

    invoke-direct {v4, v5}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 729
    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 732
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 734
    const-string v4, ""

    .line 736
    :cond_1
    invoke-virtual {p0, v4}, Lorg/apache/tools/zip/ZipOutputStream;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 737
    new-instance v5, Lorg/apache/tools/zip/ZipShort;

    array-length v8, v4

    invoke-direct {v5, v8}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 738
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v8, v6

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 741
    sget-object v5, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v5}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 742
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v8, v6

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 745
    new-instance v5, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getInternalAttributes()I

    move-result v8

    invoke-direct {v5, v8}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 746
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v8, v6

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 749
    new-instance v5, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 750
    iget-wide v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v5, v2

    iput-wide v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 753
    iget-object v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Hashtable;

    invoke-virtual {v5, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 754
    iget-wide v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v5, v2

    iput-wide v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 757
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 758
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length p1, v0

    int-to-long v5, p1

    add-long/2addr v2, v5

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 761
    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 762
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length p1, v1

    int-to-long v0, p1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 765
    invoke-virtual {p0, v4}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 766
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length p1, v4

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    return-void
.end method

.method protected writeDataDescriptor(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 667
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result p1

    const/16 v0, 0x8

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 670
    :cond_0
    sget-object p1, Lorg/apache/tools/zip/ZipOutputStream;->DD_SIG:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 671
    new-instance p1, Lorg/apache/tools/zip/ZipLong;

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v0

    invoke-direct {p1, v0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 672
    new-instance p1, Lorg/apache/tools/zip/ZipLong;

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v0

    invoke-direct {p1, v0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 673
    new-instance p1, Lorg/apache/tools/zip/ZipLong;

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v0

    invoke-direct {p1, v0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 674
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    :cond_1
    :goto_0
    return-void
.end method

.method protected writeLocalFileHeader(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 597
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Hashtable;

    new-instance v1, Lorg/apache/tools/zip/ZipLong;

    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->LFH_SIG:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 600
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 604
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_0

    .line 607
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v4, 0x14

    invoke-direct {v0, v4}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 610
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    goto :goto_0

    .line 612
    :cond_0
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v4, 0xa

    invoke-direct {v0, v4}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 613
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 615
    :goto_0
    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 618
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v4

    invoke-direct {v0, v4}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 619
    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v6, 0x2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 622
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Lorg/apache/tools/zip/ZipOutputStream;->toDosTime(Ljava/util/Date;)Lorg/apache/tools/zip/ZipLong;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 623
    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 628
    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    .line 629
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v0

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_1

    goto :goto_1

    .line 634
    :cond_1
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 635
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 636
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    goto :goto_2

    .line 630
    :cond_2
    :goto_1
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->LZERO:[B

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 631
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 632
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 638
    :goto_2
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v2, 0xc

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 641
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 642
    new-instance v1, Lorg/apache/tools/zip/ZipShort;

    array-length v2, v0

    invoke-direct {v1, v2}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 643
    iget-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v1, v6

    iput-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 646
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getLocalFileDataExtra()[B

    move-result-object p1

    .line 647
    new-instance v1, Lorg/apache/tools/zip/ZipShort;

    array-length v2, p1

    invoke-direct {v1, v2}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 648
    iget-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    add-long/2addr v1, v6

    iput-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 651
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 652
    iget-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length v0, v0

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 655
    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 656
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length p1, p1

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 658
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    return-void
.end method

.method protected final writeOut([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 855
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    return-void
.end method

.method protected final writeOut([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 865
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 866
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    return-void

    .line 868
    :cond_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    return-void
.end method
