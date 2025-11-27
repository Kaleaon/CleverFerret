.class public Lcom/github/junrar/Archive;
.super Ljava/lang/Object;
.source "Archive.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/Iterable;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Closeable;",
        "Ljava/lang/Iterable<",
        "Lcom/github/junrar/rarfile/FileHeader;",
        ">;",
        "Ljava/lang/AutoCloseable;"
    }
.end annotation


# static fields
.field private static MAX_HEADER_SIZE:I

.field private static final logger:Lorg/apache/commons/logging/Log;


# instance fields
.field private currentHeaderIndex:I

.field private final dataIO:Lcom/github/junrar/unpack/ComprDataIO;

.field private final headers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/junrar/rarfile/BaseBlock;",
            ">;"
        }
    .end annotation
.end field

.field private markHead:Lcom/github/junrar/rarfile/MarkHeader;

.field private newMhd:Lcom/github/junrar/rarfile/MainHeader;

.field private nextFileHeader:Lcom/github/junrar/rarfile/FileHeader;

.field private rof:Lcom/github/junrar/io/IReadOnlyAccess;

.field private totalPackedRead:J

.field private totalPackedSize:J

.field private unpack:Lcom/github/junrar/unpack/Unpack;

.field private final unrarCallback:Lcom/github/junrar/UnrarCallback;

.field private volume:Lcom/github/junrar/Volume;

.field private volumeManager:Lcom/github/junrar/VolumeManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    const-class v0, Lcom/github/junrar/Archive;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/Archive;->logger:Lorg/apache/commons/logging/Log;

    const/high16 v0, 0x1400000

    .line 70
    sput v0, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/VolumeManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 100
    invoke-direct {p0, p1, v0}, Lcom/github/junrar/Archive;-><init>(Lcom/github/junrar/VolumeManager;Lcom/github/junrar/UnrarCallback;)V

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/VolumeManager;Lcom/github/junrar/UnrarCallback;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    const-string v0, "Failed to close the archive after an internal error!"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    const/4 v1, 0x0

    .line 80
    iput-object v1, p0, Lcom/github/junrar/Archive;->markHead:Lcom/github/junrar/rarfile/MarkHeader;

    .line 82
    iput-object v1, p0, Lcom/github/junrar/Archive;->newMhd:Lcom/github/junrar/rarfile/MainHeader;

    const-wide/16 v2, 0x0

    .line 89
    iput-wide v2, p0, Lcom/github/junrar/Archive;->totalPackedSize:J

    .line 92
    iput-wide v2, p0, Lcom/github/junrar/Archive;->totalPackedRead:J

    .line 120
    iput-object p1, p0, Lcom/github/junrar/Archive;->volumeManager:Lcom/github/junrar/VolumeManager;

    .line 121
    iput-object p2, p0, Lcom/github/junrar/Archive;->unrarCallback:Lcom/github/junrar/UnrarCallback;

    .line 124
    :try_start_0
    invoke-interface {p1, p0, v1}, Lcom/github/junrar/VolumeManager;->nextArchive(Lcom/github/junrar/Archive;Lcom/github/junrar/Volume;)Lcom/github/junrar/Volume;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/github/junrar/Archive;->setVolume(Lcom/github/junrar/Volume;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/github/junrar/exception/RarException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    new-instance p1, Lcom/github/junrar/unpack/ComprDataIO;

    invoke-direct {p1, p0}, Lcom/github/junrar/unpack/ComprDataIO;-><init>(Lcom/github/junrar/Archive;)V

    iput-object p1, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    return-void

    :catch_0
    move-exception p1

    .line 134
    :try_start_1
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 136
    :catch_1
    sget-object p2, Lcom/github/junrar/Archive;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {p2, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 138
    :goto_0
    throw p1

    :catch_2
    move-exception p1

    .line 127
    :try_start_2
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_1

    .line 129
    :catch_3
    sget-object p2, Lcom/github/junrar/Archive;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {p2, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 131
    :goto_1
    throw p1
.end method

.method public constructor <init>(Ljava/io/File;Lcom/github/junrar/UnrarCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 147
    new-instance v0, Lcom/github/junrar/impl/FileVolumeManager;

    invoke-direct {v0, p1}, Lcom/github/junrar/impl/FileVolumeManager;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0, p2}, Lcom/github/junrar/Archive;-><init>(Lcom/github/junrar/VolumeManager;Lcom/github/junrar/UnrarCallback;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    new-instance v0, Lcom/github/junrar/impl/InputStreamVolumeManager;

    invoke-direct {v0, p1}, Lcom/github/junrar/impl/InputStreamVolumeManager;-><init>(Ljava/io/InputStream;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lcom/github/junrar/Archive;-><init>(Lcom/github/junrar/VolumeManager;Lcom/github/junrar/UnrarCallback;)V

    return-void
.end method

.method static synthetic access$000(Lcom/github/junrar/Archive;)Lcom/github/junrar/rarfile/FileHeader;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/github/junrar/Archive;->nextFileHeader:Lcom/github/junrar/rarfile/FileHeader;

    return-object p0
.end method

.method static synthetic access$002(Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;)Lcom/github/junrar/rarfile/FileHeader;
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/github/junrar/Archive;->nextFileHeader:Lcom/github/junrar/rarfile/FileHeader;

    return-object p1
.end method

.method private doExtractFile(Lcom/github/junrar/rarfile/FileHeader;Ljava/io/OutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 555
    iget-object v0, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    invoke-virtual {v0, p2}, Lcom/github/junrar/unpack/ComprDataIO;->init(Ljava/io/OutputStream;)V

    .line 556
    iget-object p2, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    invoke-virtual {p2, p1}, Lcom/github/junrar/unpack/ComprDataIO;->init(Lcom/github/junrar/rarfile/FileHeader;)V

    .line 557
    iget-object p2, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    invoke-virtual {p0}, Lcom/github/junrar/Archive;->isOldFormat()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    invoke-virtual {p2, v0, v1}, Lcom/github/junrar/unpack/ComprDataIO;->setUnpFileCRC(J)V

    .line 558
    iget-object p2, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    if-nez p2, :cond_1

    .line 559
    new-instance p2, Lcom/github/junrar/unpack/Unpack;

    iget-object v0, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    invoke-direct {p2, v0}, Lcom/github/junrar/unpack/Unpack;-><init>(Lcom/github/junrar/unpack/ComprDataIO;)V

    iput-object p2, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    .line 561
    :cond_1
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->isSolid()Z

    move-result p2

    if-nez p2, :cond_2

    .line 562
    iget-object p2, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/github/junrar/unpack/Unpack;->init([B)V

    .line 564
    :cond_2
    iget-object p2, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->getFullUnpackSize()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/github/junrar/unpack/Unpack;->setDestSize(J)V

    .line 566
    :try_start_0
    iget-object p2, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->getUnpVersion()B

    move-result v0

    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->isSolid()Z

    move-result p1

    invoke-virtual {p2, v0, p1}, Lcom/github/junrar/unpack/Unpack;->doUnpack(IZ)V

    .line 568
    iget-object p1, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ComprDataIO;->getSubHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object p1

    .line 569
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->isSplitAfter()Z

    move-result p2

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    invoke-virtual {p2}, Lcom/github/junrar/unpack/ComprDataIO;->getPackedCRC()J

    move-result-wide v0

    :goto_1
    not-long v0, v0

    goto :goto_2

    :cond_3
    iget-object p2, p0, Lcom/github/junrar/Archive;->dataIO:Lcom/github/junrar/unpack/ComprDataIO;

    .line 570
    invoke-virtual {p2}, Lcom/github/junrar/unpack/ComprDataIO;->getUnpFileCRC()J

    move-result-wide v0

    goto :goto_1

    .line 571
    :goto_2
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->getFileCRC()I

    move-result p1

    int-to-long p1, p1

    cmp-long v2, v0, p1

    if-nez v2, :cond_4

    return-void

    .line 573
    :cond_4
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->crcError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 582
    iget-object p2, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    invoke-virtual {p2}, Lcom/github/junrar/unpack/Unpack;->cleanUp()V

    .line 583
    instance-of p2, p1, Lcom/github/junrar/exception/RarException;

    if-eqz p2, :cond_5

    .line 585
    check-cast p1, Lcom/github/junrar/exception/RarException;

    throw p1

    .line 587
    :cond_5
    new-instance p2, Lcom/github/junrar/exception/RarException;

    invoke-direct {p2, p1}, Lcom/github/junrar/exception/RarException;-><init>(Ljava/lang/Exception;)V

    throw p2
.end method

.method private readHeaders(J)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 262
    iput-object v0, p0, Lcom/github/junrar/Archive;->markHead:Lcom/github/junrar/rarfile/MarkHeader;

    .line 263
    iput-object v0, p0, Lcom/github/junrar/Archive;->newMhd:Lcom/github/junrar/rarfile/MainHeader;

    .line 264
    iget-object v1, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/4 v1, 0x0

    .line 265
    iput v1, p0, Lcom/github/junrar/Archive;->currentHeaderIndex:I

    .line 269
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    :goto_0
    const-wide/16 v3, 0x7

    .line 273
    sget v5, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v3, v4, v5}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 275
    iget-object v4, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v4}, Lcom/github/junrar/io/IReadOnlyAccess;->getPosition()J

    move-result-wide v4

    cmp-long v6, v4, p1

    if-ltz v6, :cond_0

    goto :goto_1

    .line 283
    :cond_0
    iget-object v6, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    const/4 v7, 0x7

    invoke-interface {v6, v3, v7}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    move-result v6

    if-nez v6, :cond_1

    :goto_1
    return-void

    .line 287
    :cond_1
    new-instance v6, Lcom/github/junrar/rarfile/BaseBlock;

    invoke-direct {v6, v3}, Lcom/github/junrar/rarfile/BaseBlock;-><init>([B)V

    .line 289
    invoke-virtual {v6, v4, v5}, Lcom/github/junrar/rarfile/BaseBlock;->setPositionInFile(J)V

    .line 291
    sget-object v3, Lcom/github/junrar/Archive$2;->$SwitchMap$com$github$junrar$rarfile$UnrarHeadertype:[I

    invoke-virtual {v6}, Lcom/github/junrar/rarfile/BaseBlock;->getHeaderType()Lcom/github/junrar/rarfile/UnrarHeadertype;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/junrar/rarfile/UnrarHeadertype;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/16 v4, 0x8

    const/4 v5, 0x4

    const/4 v8, 0x6

    packed-switch v3, :pswitch_data_0

    const-wide/16 v9, 0x4

    .line 383
    sget v3, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v9, v10, v3}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 384
    iget-object v7, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v7, v3, v5}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 385
    new-instance v7, Lcom/github/junrar/rarfile/BlockHeader;

    invoke-direct {v7, v6, v3}, Lcom/github/junrar/rarfile/BlockHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    .line 388
    sget-object v3, Lcom/github/junrar/Archive$2;->$SwitchMap$com$github$junrar$rarfile$UnrarHeadertype:[I

    invoke-virtual {v7}, Lcom/github/junrar/rarfile/BlockHeader;->getHeaderType()Lcom/github/junrar/rarfile/UnrarHeadertype;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/junrar/rarfile/UnrarHeadertype;->ordinal()I

    move-result v6

    aget v3, v3, v6

    goto/16 :goto_4

    .line 361
    :pswitch_0
    invoke-virtual {v6}, Lcom/github/junrar/rarfile/BaseBlock;->hasArchiveDataCRC()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v1, 0x4

    .line 364
    :cond_2
    invoke-virtual {v6}, Lcom/github/junrar/rarfile/BaseBlock;->hasVolumeNumber()Z

    move-result p1

    if-eqz p1, :cond_3

    add-int/lit8 v1, v1, 0x2

    :cond_3
    if-lez v1, :cond_4

    int-to-long p1, v1

    .line 369
    sget v0, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {p1, p2, v0}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object p1

    .line 370
    iget-object p2, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {p2, p1, v1}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 371
    new-instance p2, Lcom/github/junrar/rarfile/EndArcHeader;

    invoke-direct {p2, v6, p1}, Lcom/github/junrar/rarfile/EndArcHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    goto :goto_2

    .line 376
    :cond_4
    new-instance p2, Lcom/github/junrar/rarfile/EndArcHeader;

    invoke-direct {p2, v6, v0}, Lcom/github/junrar/rarfile/EndArcHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    .line 378
    :goto_2
    iget-object p1, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_1
    int-to-long v3, v8

    .line 343
    sget v5, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v3, v4, v5}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 344
    iget-object v4, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v4, v3, v8}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 345
    new-instance v4, Lcom/github/junrar/rarfile/CommentHeader;

    invoke-direct {v4, v6, v3}, Lcom/github/junrar/rarfile/CommentHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    .line 346
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    invoke-virtual {v4}, Lcom/github/junrar/rarfile/CommentHeader;->getPositionInFile()J

    move-result-wide v5

    .line 350
    invoke-virtual {v4}, Lcom/github/junrar/rarfile/CommentHeader;->getHeaderSize()S

    move-result v3

    int-to-long v3, v3

    add-long/2addr v5, v3

    .line 351
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 354
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 355
    iget-object v3, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v3, v5, v6}, Lcom/github/junrar/io/IReadOnlyAccess;->setPosition(J)V

    goto/16 :goto_0

    .line 352
    :cond_5
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    :pswitch_2
    int-to-long v3, v7

    .line 334
    sget v5, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v3, v4, v5}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 335
    iget-object v4, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v4, v3, v7}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 336
    new-instance v4, Lcom/github/junrar/rarfile/AVHeader;

    invoke-direct {v4, v6, v3}, Lcom/github/junrar/rarfile/AVHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    .line 337
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_3
    int-to-long v7, v4

    .line 324
    sget v3, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v7, v8, v3}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 325
    iget-object v5, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v5, v3, v4}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 326
    new-instance v4, Lcom/github/junrar/rarfile/SignHeader;

    invoke-direct {v4, v6, v3}, Lcom/github/junrar/rarfile/SignHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    .line 327
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 308
    :pswitch_4
    invoke-virtual {v6}, Lcom/github/junrar/rarfile/BaseBlock;->hasEncryptVersion()Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_3

    :cond_6
    const/4 v7, 0x6

    :goto_3
    int-to-long v3, v7

    .line 310
    sget v5, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v3, v4, v5}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 311
    iget-object v4, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v4, v3, v7}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 312
    new-instance v4, Lcom/github/junrar/rarfile/MainHeader;

    invoke-direct {v4, v6, v3}, Lcom/github/junrar/rarfile/MainHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V

    .line 313
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    iput-object v4, p0, Lcom/github/junrar/Archive;->newMhd:Lcom/github/junrar/rarfile/MainHeader;

    .line 315
    invoke-virtual {v4}, Lcom/github/junrar/rarfile/MainHeader;->isEncrypted()Z

    move-result v3

    if-nez v3, :cond_7

    goto/16 :goto_0

    .line 316
    :cond_7
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->rarEncryptedException:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    .line 294
    :pswitch_5
    new-instance v3, Lcom/github/junrar/rarfile/MarkHeader;

    invoke-direct {v3, v6}, Lcom/github/junrar/rarfile/MarkHeader;-><init>(Lcom/github/junrar/rarfile/BaseBlock;)V

    iput-object v3, p0, Lcom/github/junrar/Archive;->markHead:Lcom/github/junrar/rarfile/MarkHeader;

    .line 295
    invoke-virtual {v3}, Lcom/github/junrar/rarfile/MarkHeader;->isSignature()Z

    move-result v3

    if-nez v3, :cond_9

    .line 296
    iget-object p1, p0, Lcom/github/junrar/Archive;->markHead:Lcom/github/junrar/rarfile/MarkHeader;

    invoke-virtual {p1}, Lcom/github/junrar/rarfile/MarkHeader;->getVersion()Lcom/github/junrar/rarfile/RARVersion;

    move-result-object p1

    sget-object p2, Lcom/github/junrar/rarfile/RARVersion;->V5:Lcom/github/junrar/rarfile/RARVersion;

    if-ne p1, p2, :cond_8

    .line 297
    sget-object p1, Lcom/github/junrar/Archive;->logger:Lorg/apache/commons/logging/Log;

    const-string p2, "Support for rar version 5 is not yet implemented!"

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 298
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->unsupportedRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    .line 300
    :cond_8
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    .line 303
    :cond_9
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    iget-object v4, p0, Lcom/github/junrar/Archive;->markHead:Lcom/github/junrar/rarfile/MarkHeader;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :goto_4
    const/4 v6, 0x1

    if-eq v3, v6, :cond_10

    const/4 v9, 0x2

    if-eq v3, v9, :cond_10

    const/4 v9, 0x3

    if-eq v3, v9, :cond_e

    if-ne v3, v5, :cond_d

    const-wide/16 v10, 0x3

    .line 426
    sget v3, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v10, v11, v3}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 427
    iget-object v5, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v5, v3, v9}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 429
    new-instance v5, Lcom/github/junrar/rarfile/SubBlockHeader;

    invoke-direct {v5, v7, v3}, Lcom/github/junrar/rarfile/SubBlockHeader;-><init>(Lcom/github/junrar/rarfile/BlockHeader;[B)V

    .line 431
    invoke-virtual {v5}, Lcom/github/junrar/rarfile/SubBlockHeader;->print()V

    .line 432
    sget-object v3, Lcom/github/junrar/Archive$2;->$SwitchMap$com$github$junrar$rarfile$SubBlockHeaderType:[I

    invoke-virtual {v5}, Lcom/github/junrar/rarfile/SubBlockHeader;->getSubType()Lcom/github/junrar/rarfile/SubBlockHeaderType;

    move-result-object v7

    invoke-virtual {v7}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->ordinal()I

    move-result v7

    aget v3, v3, v7

    if-eq v3, v6, :cond_c

    if-eq v3, v9, :cond_b

    if-eq v3, v8, :cond_a

    goto/16 :goto_0

    .line 462
    :cond_a
    invoke-virtual {v5}, Lcom/github/junrar/rarfile/SubBlockHeader;->getHeaderSize()S

    move-result v3

    add-int/lit8 v3, v3, -0xe

    int-to-long v6, v3

    .line 466
    sget v4, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v6, v7, v4}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v4

    .line 467
    iget-object v6, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v6, v4, v3}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 468
    new-instance v3, Lcom/github/junrar/rarfile/UnixOwnersHeader;

    invoke-direct {v3, v5, v4}, Lcom/github/junrar/rarfile/UnixOwnersHeader;-><init>(Lcom/github/junrar/rarfile/SubBlockHeader;[B)V

    .line 470
    invoke-virtual {v3}, Lcom/github/junrar/rarfile/UnixOwnersHeader;->print()V

    .line 471
    iget-object v4, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_b
    const-wide/16 v3, 0xa

    .line 448
    sget v6, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v3, v4, v6}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 449
    iget-object v4, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    const/16 v6, 0xa

    invoke-interface {v4, v3, v6}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 450
    new-instance v4, Lcom/github/junrar/rarfile/EAHeader;

    invoke-direct {v4, v5, v3}, Lcom/github/junrar/rarfile/EAHeader;-><init>(Lcom/github/junrar/rarfile/SubBlockHeader;[B)V

    .line 452
    invoke-virtual {v4}, Lcom/github/junrar/rarfile/EAHeader;->print()V

    .line 453
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_c
    const-wide/16 v6, 0x8

    .line 434
    sget v3, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v6, v7, v3}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v3

    .line 435
    iget-object v6, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v6, v3, v4}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 437
    new-instance v4, Lcom/github/junrar/rarfile/MacInfoHeader;

    invoke-direct {v4, v5, v3}, Lcom/github/junrar/rarfile/MacInfoHeader;-><init>(Lcom/github/junrar/rarfile/SubBlockHeader;[B)V

    .line 439
    invoke-virtual {v4}, Lcom/github/junrar/rarfile/MacInfoHeader;->print()V

    .line 440
    iget-object v3, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 480
    :cond_d
    sget-object p1, Lcom/github/junrar/Archive;->logger:Lorg/apache/commons/logging/Log;

    const-string p2, "Unknown Header"

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 481
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->notRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    .line 409
    :cond_e
    invoke-virtual {v7}, Lcom/github/junrar/rarfile/BlockHeader;->getHeaderSize()S

    move-result v3

    add-int/lit8 v3, v3, -0xb

    int-to-long v4, v3

    .line 412
    sget v6, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v4, v5, v6}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v4

    .line 413
    iget-object v5, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v5, v4, v3}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 414
    new-instance v3, Lcom/github/junrar/rarfile/ProtectHeader;

    invoke-direct {v3, v7, v4}, Lcom/github/junrar/rarfile/ProtectHeader;-><init>(Lcom/github/junrar/rarfile/BlockHeader;[B)V

    .line 416
    invoke-virtual {v3}, Lcom/github/junrar/rarfile/ProtectHeader;->getPositionInFile()J

    move-result-wide v4

    invoke-virtual {v3}, Lcom/github/junrar/rarfile/ProtectHeader;->getHeaderSize()S

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 417
    invoke-virtual {v3}, Lcom/github/junrar/rarfile/ProtectHeader;->getDataSize()J

    move-result-wide v6

    add-long/2addr v4, v6

    .line 418
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 421
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 422
    iget-object v3, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v3, v4, v5}, Lcom/github/junrar/io/IReadOnlyAccess;->setPosition(J)V

    goto/16 :goto_0

    .line 419
    :cond_f
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    .line 391
    :cond_10
    invoke-virtual {v7}, Lcom/github/junrar/rarfile/BlockHeader;->getHeaderSize()S

    move-result v3

    add-int/lit8 v3, v3, -0xb

    int-to-long v4, v3

    .line 394
    sget v6, Lcom/github/junrar/Archive;->MAX_HEADER_SIZE:I

    invoke-static {v4, v5, v6}, Lcom/github/junrar/Archive;->safelyAllocate(JI)[B

    move-result-object v4

    .line 395
    iget-object v5, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v5, v4, v3}, Lcom/github/junrar/io/IReadOnlyAccess;->readFully([BI)I

    .line 397
    new-instance v3, Lcom/github/junrar/rarfile/FileHeader;

    invoke-direct {v3, v7, v4}, Lcom/github/junrar/rarfile/FileHeader;-><init>(Lcom/github/junrar/rarfile/BlockHeader;[B)V

    .line 398
    iget-object v4, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 399
    invoke-virtual {v3}, Lcom/github/junrar/rarfile/FileHeader;->getPositionInFile()J

    move-result-wide v4

    invoke-virtual {v3}, Lcom/github/junrar/rarfile/FileHeader;->getHeaderSize()S

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 400
    invoke-virtual {v3}, Lcom/github/junrar/rarfile/FileHeader;->getFullPackSize()J

    move-result-wide v6

    add-long/2addr v4, v6

    .line 401
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    .line 404
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 405
    iget-object v3, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v3, v4, v5}, Lcom/github/junrar/io/IReadOnlyAccess;->setPosition(J)V

    goto/16 :goto_0

    .line 402
    :cond_11
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static safelyAllocate(JI)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    if-ltz p2, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_0

    int-to-long v0, p2

    cmp-long p2, p0, v0

    if-gtz p2, :cond_0

    long-to-int p1, p0

    .line 496
    new-array p0, p1, [B

    return-object p0

    .line 494
    :cond_0
    new-instance p0, Lcom/github/junrar/exception/RarException;

    sget-object p1, Lcom/github/junrar/exception/RarException$RarExceptionType;->badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p0, p1}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p0

    .line 491
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "maxsize must be >= 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private setFile(Lcom/github/junrar/io/IReadOnlyAccess;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 164
    iput-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedSize:J

    .line 165
    iput-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedRead:J

    .line 166
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    .line 167
    iput-object p1, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    .line 169
    :try_start_0
    invoke-direct {p0, p2, p3}, Lcom/github/junrar/Archive;->readHeaders(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 171
    sget-object p2, Lcom/github/junrar/Archive;->logger:Lorg/apache/commons/logging/Log;

    const-string p3, "exception in archive constructor maybe file is encrypted, corrupt or support not yet implemented"

    invoke-interface {p2, p3, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 173
    instance-of p2, p1, Lcom/github/junrar/exception/RarException;

    if-eqz p2, :cond_1

    check-cast p1, Lcom/github/junrar/exception/RarException;

    invoke-virtual {p1}, Lcom/github/junrar/exception/RarException;->getType()Lcom/github/junrar/exception/RarException$RarExceptionType;

    move-result-object p2

    sget-object p3, Lcom/github/junrar/exception/RarException$RarExceptionType;->unsupportedRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    if-eq p2, p3, :cond_0

    goto :goto_0

    .line 174
    :cond_0
    throw p1

    .line 180
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/github/junrar/rarfile/BaseBlock;

    .line 181
    invoke-virtual {p2}, Lcom/github/junrar/rarfile/BaseBlock;->getHeaderType()Lcom/github/junrar/rarfile/UnrarHeadertype;

    move-result-object p3

    sget-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    if-ne p3, v0, :cond_2

    .line 182
    iget-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedSize:J

    check-cast p2, Lcom/github/junrar/rarfile/FileHeader;

    invoke-virtual {p2}, Lcom/github/junrar/rarfile/FileHeader;->getFullPackSize()J

    move-result-wide p2

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedSize:J

    goto :goto_1

    .line 185
    :cond_3
    iget-object p1, p0, Lcom/github/junrar/Archive;->unrarCallback:Lcom/github/junrar/UnrarCallback;

    if-eqz p1, :cond_4

    .line 186
    iget-wide p2, p0, Lcom/github/junrar/Archive;->totalPackedRead:J

    iget-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedSize:J

    invoke-interface {p1, p2, p3, v0, v1}, Lcom/github/junrar/UnrarCallback;->volumeProgressChanged(JJ)V

    :cond_4
    return-void
.end method


# virtual methods
.method public bytesReadRead(I)V
    .locals 4

    if-lez p1, :cond_0

    .line 193
    iget-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedRead:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/github/junrar/Archive;->totalPackedRead:J

    .line 194
    iget-object p1, p0, Lcom/github/junrar/Archive;->unrarCallback:Lcom/github/junrar/UnrarCallback;

    if-eqz p1, :cond_0

    .line 195
    iget-wide v2, p0, Lcom/github/junrar/Archive;->totalPackedSize:J

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/github/junrar/UnrarCallback;->volumeProgressChanged(JJ)V

    :cond_0
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 609
    iget-object v0, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    if-eqz v0, :cond_0

    .line 610
    invoke-interface {v0}, Lcom/github/junrar/io/IReadOnlyAccess;->close()V

    const/4 v0, 0x0

    .line 611
    iput-object v0, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    .line 613
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/Archive;->unpack:Lcom/github/junrar/unpack/Unpack;

    if-eqz v0, :cond_1

    .line 614
    invoke-virtual {v0}, Lcom/github/junrar/unpack/Unpack;->cleanUp()V

    :cond_1
    return-void
.end method

.method public extractFile(Lcom/github/junrar/rarfile/FileHeader;Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 510
    iget-object v0, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 514
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/github/junrar/Archive;->doExtractFile(Lcom/github/junrar/rarfile/FileHeader;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 516
    instance-of p2, p1, Lcom/github/junrar/exception/RarException;

    if-eqz p2, :cond_0

    .line 517
    check-cast p1, Lcom/github/junrar/exception/RarException;

    throw p1

    .line 519
    :cond_0
    new-instance p2, Lcom/github/junrar/exception/RarException;

    invoke-direct {p2, p1}, Lcom/github/junrar/exception/RarException;-><init>(Ljava/lang/Exception;)V

    throw p2

    .line 511
    :cond_1
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->headerNotInArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1
.end method

.method public getFileHeaders()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/junrar/rarfile/FileHeader;",
            ">;"
        }
    .end annotation

    .line 218
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 219
    iget-object v1, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/junrar/rarfile/BaseBlock;

    .line 220
    invoke-virtual {v2}, Lcom/github/junrar/rarfile/BaseBlock;->getHeaderType()Lcom/github/junrar/rarfile/UnrarHeadertype;

    move-result-object v3

    sget-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    invoke-virtual {v3, v4}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 221
    check-cast v2, Lcom/github/junrar/rarfile/FileHeader;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getHeaders()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/junrar/rarfile/BaseBlock;",
            ">;"
        }
    .end annotation

    .line 211
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getInputStream(Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 536
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 539
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/github/junrar/Archive;->extractFile(Lcom/github/junrar/rarfile/FileHeader;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Lcom/github/junrar/exception/RarException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 544
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 550
    new-instance p1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p1

    :catch_0
    move-exception p1

    .line 546
    new-instance v0, Lcom/github/junrar/exception/RarException;

    sget-object v1, Lcom/github/junrar/exception/RarException$RarExceptionType;->ioError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {v0, p1, v1}, Lcom/github/junrar/exception/RarException;-><init>(Ljava/lang/Exception;Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw v0

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 541
    :try_start_2
    new-instance v1, Lcom/github/junrar/exception/RarException;

    sget-object v2, Lcom/github/junrar/exception/RarException$RarExceptionType;->ioError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {v1, p1, v2}, Lcom/github/junrar/exception/RarException;-><init>(Ljava/lang/Exception;Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 544
    :goto_0
    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 546
    throw p1

    :catch_2
    move-exception p1

    new-instance v0, Lcom/github/junrar/exception/RarException;

    sget-object v1, Lcom/github/junrar/exception/RarException$RarExceptionType;->ioError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {v0, p1, v1}, Lcom/github/junrar/exception/RarException;-><init>(Ljava/lang/Exception;Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw v0
.end method

.method public getMainHeader()Lcom/github/junrar/rarfile/MainHeader;
    .locals 1

    .line 596
    iget-object v0, p0, Lcom/github/junrar/Archive;->newMhd:Lcom/github/junrar/rarfile/MainHeader;

    return-object v0
.end method

.method public getRof()Lcom/github/junrar/io/IReadOnlyAccess;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/github/junrar/Archive;->rof:Lcom/github/junrar/io/IReadOnlyAccess;

    return-object v0
.end method

.method public getUnrarCallback()Lcom/github/junrar/UnrarCallback;
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/github/junrar/Archive;->unrarCallback:Lcom/github/junrar/UnrarCallback;

    return-object v0
.end method

.method public getVolume()Lcom/github/junrar/Volume;
    .locals 1

    .line 637
    iget-object v0, p0, Lcom/github/junrar/Archive;->volume:Lcom/github/junrar/Volume;

    return-object v0
.end method

.method public getVolumeManager()Lcom/github/junrar/VolumeManager;
    .locals 1

    .line 622
    iget-object v0, p0, Lcom/github/junrar/Archive;->volumeManager:Lcom/github/junrar/VolumeManager;

    return-object v0
.end method

.method public isEncrypted()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/github/junrar/Archive;->newMhd:Lcom/github/junrar/rarfile/MainHeader;

    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {v0}, Lcom/github/junrar/rarfile/MainHeader;->isEncrypted()Z

    move-result v0

    return v0

    .line 250
    :cond_0
    new-instance v0, Lcom/github/junrar/exception/RarException;

    sget-object v1, Lcom/github/junrar/exception/RarException$RarExceptionType;->mainHeaderNull:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {v0, v1}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw v0
.end method

.method public isOldFormat()Z
    .locals 1

    .line 603
    iget-object v0, p0, Lcom/github/junrar/Archive;->markHead:Lcom/github/junrar/rarfile/MarkHeader;

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/MarkHeader;->isOldFormat()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/github/junrar/rarfile/FileHeader;",
            ">;"
        }
    .end annotation

    .line 653
    new-instance v0, Lcom/github/junrar/Archive$1;

    invoke-direct {v0, p0}, Lcom/github/junrar/Archive$1;-><init>(Lcom/github/junrar/Archive;)V

    return-object v0
.end method

.method public nextFileHeader()Lcom/github/junrar/rarfile/FileHeader;
    .locals 4

    .line 228
    iget-object v0, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 229
    :cond_0
    iget v1, p0, Lcom/github/junrar/Archive;->currentHeaderIndex:I

    if-ge v1, v0, :cond_1

    .line 230
    iget-object v2, p0, Lcom/github/junrar/Archive;->headers:Ljava/util/List;

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/github/junrar/Archive;->currentHeaderIndex:I

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/junrar/rarfile/BaseBlock;

    .line 231
    invoke-virtual {v1}, Lcom/github/junrar/rarfile/BaseBlock;->getHeaderType()Lcom/github/junrar/rarfile/UnrarHeadertype;

    move-result-object v2

    sget-object v3, Lcom/github/junrar/rarfile/UnrarHeadertype;->FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    if-ne v2, v3, :cond_0

    .line 232
    check-cast v1, Lcom/github/junrar/rarfile/FileHeader;

    return-object v1

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public setVolume(Lcom/github/junrar/Volume;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 647
    iput-object p1, p0, Lcom/github/junrar/Archive;->volume:Lcom/github/junrar/Volume;

    .line 648
    invoke-interface {p1}, Lcom/github/junrar/Volume;->getReadOnlyAccess()Lcom/github/junrar/io/IReadOnlyAccess;

    move-result-object v0

    invoke-interface {p1}, Lcom/github/junrar/Volume;->getLength()J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/github/junrar/Archive;->setFile(Lcom/github/junrar/io/IReadOnlyAccess;J)V

    return-void
.end method

.method public setVolumeManager(Lcom/github/junrar/VolumeManager;)V
    .locals 0

    .line 630
    iput-object p1, p0, Lcom/github/junrar/Archive;->volumeManager:Lcom/github/junrar/VolumeManager;

    return-void
.end method
