.class public Lorg/apache/tools/zip/ZipFile;
.super Ljava/lang/Object;
.source "ZipFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/zip/ZipFile$BoundedInputStream;
    }
.end annotation


# static fields
.field private static final CFD_LOCATOR_OFFSET:I = 0x10

.field private static final CFH_LEN:I = 0x2a

.field private static final LFH_OFFSET_FOR_FILENAME_LENGTH:J = 0x1aL

.field private static final MIN_EOCD_SIZE:I = 0x16


# instance fields
.field private archive:Ljava/io/RandomAccessFile;

.field private dataOffsets:Ljava/util/Hashtable;

.field private encoding:Ljava/lang/String;

.field private entries:Ljava/util/Hashtable;

.field private nameMap:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 140
    invoke-direct {p0, p1, v0}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Hashtable;

    .line 110
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Hashtable;

    .line 115
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipFile;->dataOffsets:Ljava/util/Hashtable;

    .line 178
    iput-object p2, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    .line 179
    new-instance p2, Ljava/io/RandomAccessFile;

    const-string v0, "r"

    invoke-direct {p2, p1, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    .line 180
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipFile;->populateFromCentralDirectory()V

    .line 181
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipFile;->resolveLocalFileHeaderData()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;
    .locals 0

    .line 99
    iget-object p0, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    return-object p0
.end method

.method protected static fromDosTime(Lorg/apache/tools/zip/ZipLong;)Ljava/util/Date;
    .locals 7

    .line 459
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v0

    .line 460
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p0

    const/16 v2, 0x19

    shr-long v2, v0, v2

    const-wide/16 v4, 0x7f

    and-long/2addr v2, v4

    long-to-int v3, v2

    add-int/lit16 v3, v3, 0x7bc

    const/4 v2, 0x1

    .line 461
    invoke-virtual {p0, v2, v3}, Ljava/util/Calendar;->set(II)V

    const/16 v3, 0x15

    shr-long v3, v0, v3

    const-wide/16 v5, 0xf

    and-long/2addr v3, v5

    long-to-int v4, v3

    sub-int/2addr v4, v2

    const/4 v3, 0x2

    .line 462
    invoke-virtual {p0, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/16 v3, 0x10

    shr-long v3, v0, v3

    long-to-int v4, v3

    and-int/lit8 v3, v4, 0x1f

    const/4 v4, 0x5

    .line 463
    invoke-virtual {p0, v4, v3}, Ljava/util/Calendar;->set(II)V

    const/16 v3, 0xb

    shr-long v5, v0, v3

    long-to-int v6, v5

    and-int/lit8 v5, v6, 0x1f

    .line 464
    invoke-virtual {p0, v3, v5}, Ljava/util/Calendar;->set(II)V

    shr-long v3, v0, v4

    long-to-int v4, v3

    and-int/lit8 v3, v4, 0x3f

    const/16 v4, 0xc

    .line 465
    invoke-virtual {p0, v4, v3}, Ljava/util/Calendar;->set(II)V

    shl-long/2addr v0, v2

    long-to-int v1, v0

    and-int/lit8 v0, v1, 0x3e

    const/16 v1, 0xd

    .line 466
    invoke-virtual {p0, v1, v0}, Ljava/util/Calendar;->set(II)V

    .line 467
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method private populateFromCentralDirectory()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 274
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipFile;->positionAtCentralDirectory()V

    const/16 v0, 0x2a

    .line 276
    new-array v0, v0, [B

    const/4 v1, 0x4

    .line 278
    new-array v1, v1, [B

    .line 279
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 280
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v2, v1}, Lorg/apache/tools/zip/ZipLong;-><init>([B)V

    .line 281
    :goto_0
    sget-object v3, Lorg/apache/tools/zip/ZipOutputStream;->CFH_SIG:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    .line 282
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 284
    new-instance v2, Lorg/apache/tools/zip/ZipEntry;

    invoke-direct {v2}, Lorg/apache/tools/zip/ZipEntry;-><init>()V

    .line 286
    new-instance v3, Lorg/apache/tools/zip/ZipShort;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    .line 288
    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v3

    const/16 v4, 0x8

    shr-int/2addr v3, v4

    and-int/lit8 v3, v3, 0xf

    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setPlatform(I)V

    .line 292
    new-instance v3, Lorg/apache/tools/zip/ZipShort;

    const/4 v5, 0x6

    invoke-direct {v3, v0, v5}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 295
    new-instance v3, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-static {v3}, Lorg/apache/tools/zip/ZipFile;->fromDosTime(Lorg/apache/tools/zip/ZipLong;)Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 298
    new-instance v3, Lorg/apache/tools/zip/ZipLong;

    const/16 v4, 0xc

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 301
    new-instance v3, Lorg/apache/tools/zip/ZipLong;

    const/16 v4, 0x10

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 304
    new-instance v3, Lorg/apache/tools/zip/ZipLong;

    const/16 v4, 0x14

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 307
    new-instance v3, Lorg/apache/tools/zip/ZipShort;

    const/16 v4, 0x18

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v3

    .line 310
    new-instance v4, Lorg/apache/tools/zip/ZipShort;

    const/16 v5, 0x1a

    invoke-direct {v4, v0, v5}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v4

    .line 313
    new-instance v5, Lorg/apache/tools/zip/ZipShort;

    const/16 v6, 0x1c

    invoke-direct {v5, v0, v6}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v5

    .line 318
    new-instance v6, Lorg/apache/tools/zip/ZipShort;

    const/16 v7, 0x20

    invoke-direct {v6, v0, v7}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v6

    invoke-virtual {v2, v6}, Lorg/apache/tools/zip/ZipEntry;->setInternalAttributes(I)V

    .line 321
    new-instance v6, Lorg/apache/tools/zip/ZipLong;

    const/16 v7, 0x22

    invoke-direct {v6, v0, v7}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 325
    iget-object v6, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Hashtable;

    new-instance v7, Ljava/lang/Long;

    new-instance v8, Lorg/apache/tools/zip/ZipLong;

    const/16 v9, 0x26

    invoke-direct {v8, v0, v9}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v6, v2, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    new-array v3, v3, [B

    .line 328
    iget-object v6, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 329
    invoke-virtual {p0, v3}, Lorg/apache/tools/zip/ZipFile;->getString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setName(Ljava/lang/String;)V

    .line 331
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Hashtable;

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3, v4}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    .line 335
    new-array v3, v5, [B

    .line 336
    iget-object v4, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v4, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 337
    invoke-virtual {p0, v3}, Lorg/apache/tools/zip/ZipFile;->getString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 339
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 340
    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v2, v1}, Lorg/apache/tools/zip/ZipLong;-><init>([B)V

    goto/16 :goto_0
.end method

.method private positionAtCentralDirectory()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 377
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x16

    sub-long/2addr v0, v2

    .line 378
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 379
    sget-object v2, Lorg/apache/tools/zip/ZipOutputStream;->EOCD_SIG:Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v2

    .line 380
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->read()I

    move-result v3

    :goto_0
    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    const/4 v4, 0x0

    .line 383
    aget-byte v4, v2, v4

    if-ne v3, v4, :cond_0

    .line 384
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->read()I

    move-result v3

    const/4 v4, 0x1

    .line 385
    aget-byte v4, v2, v4

    if-ne v3, v4, :cond_0

    .line 386
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->read()I

    move-result v3

    const/4 v4, 0x2

    .line 387
    aget-byte v4, v2, v4

    if-ne v3, v4, :cond_0

    .line 388
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->read()I

    move-result v3

    const/4 v4, 0x3

    .line 389
    aget-byte v4, v2, v4

    if-ne v3, v4, :cond_0

    .line 402
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v3, 0x10

    add-long/2addr v0, v3

    invoke-virtual {v2, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v0, 0x4

    .line 403
    new-array v0, v0, [B

    .line 404
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 405
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    new-instance v2, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v2, v0}, Lorg/apache/tools/zip/ZipLong;-><init>([B)V

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    return-void

    .line 396
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v4, 0x1

    sub-long/2addr v0, v4

    invoke-virtual {v3, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 397
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->read()I

    move-result v3

    goto :goto_0

    .line 400
    :cond_1
    new-instance v0, Ljava/util/zip/ZipException;

    const-string v1, "archive is not a ZIP archive"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private resolveLocalFileHeaderData()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 432
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v0

    .line 433
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 434
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/zip/ZipEntry;

    .line 435
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Hashtable;

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 436
    iget-object v4, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v5, 0x1a

    add-long/2addr v5, v2

    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v4, 0x2

    .line 437
    new-array v4, v4, [B

    .line 438
    iget-object v5, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v5, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 439
    new-instance v5, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v5, v4}, Lorg/apache/tools/zip/ZipShort;-><init>([B)V

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v5

    .line 440
    iget-object v6, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 441
    new-instance v6, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v6, v4}, Lorg/apache/tools/zip/ZipShort;-><init>([B)V

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v4

    .line 442
    iget-object v6, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v5}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    .line 443
    new-array v6, v4, [B

    .line 444
    iget-object v7, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v7, v6}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 445
    invoke-virtual {v1, v6}, Lorg/apache/tools/zip/ZipEntry;->setExtra([B)V

    .line 446
    iget-object v6, p0, Lorg/apache/tools/zip/ZipFile;->dataOffsets:Ljava/util/Hashtable;

    new-instance v7, Ljava/lang/Long;

    const-wide/16 v8, 0x1e

    add-long/2addr v2, v8

    int-to-long v8, v5

    add-long/2addr v2, v8

    int-to-long v4, v4

    add-long/2addr v2, v4

    invoke-direct {v7, v2, v3}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v6, v1, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 198
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-void
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 190
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getEntries()Ljava/util/Enumeration;
    .locals 1

    .line 207
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;
    .locals 1

    .line 218
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/tools/zip/ZipEntry;

    return-object p1
.end method

.method public getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 228
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->dataOffsets:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    move-object v1, v0

    .line 232
    new-instance v0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;-><init>(Lorg/apache/tools/zip/ZipFile;JJ)V

    .line 234
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v1

    if-eqz v1, :cond_2

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    .line 238
    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummy()V

    .line 239
    new-instance p1, Ljava/util/zip/InflaterInputStream;

    new-instance v1, Ljava/util/zip/Inflater;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/zip/Inflater;-><init>(Z)V

    invoke-direct {p1, v0, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    return-object p1

    .line 241
    :cond_1
    new-instance v0, Ljava/util/zip/ZipException;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Found unsupported compression method "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    return-object v0
.end method

.method protected getString([B)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 479
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 480
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    return-object v0

    .line 483
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 485
    new-instance v0, Ljava/util/zip/ZipException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
