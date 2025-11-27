.class public Lcom/github/junrar/rarfile/FileHeader;
.super Lcom/github/junrar/rarfile/BlockHeader;
.source "FileHeader.java"


# static fields
.field private static final NEWLHD_SIZE:B = 0x20t

.field private static final SALT_SIZE:B = 0x8t

.field private static final logger:Lorg/apache/commons/logging/Log;


# instance fields
.field private aTime:Ljava/util/Date;

.field private arcTime:Ljava/util/Date;

.field private cTime:Ljava/util/Date;

.field private fileAttr:I

.field private final fileCRC:I

.field private fileName:Ljava/lang/String;

.field private final fileNameBytes:[B

.field private fileNameW:Ljava/lang/String;

.field private final fileTime:I

.field private fullPackSize:J

.field private fullUnpackSize:J

.field private highPackSize:I

.field private highUnpackSize:I

.field private final hostOS:Lcom/github/junrar/rarfile/HostSystem;

.field private mTime:Ljava/util/Date;

.field private nameSize:S

.field private recoverySectors:I

.field private final salt:[B

.field private subData:[B

.field private subFlags:I

.field private unpMethod:B

.field private unpSize:J

.field private unpVersion:B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    const-class v0, Lcom/github/junrar/rarfile/FileHeader;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/rarfile/FileHeader;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/BlockHeader;[B)V
    .locals 8

    .line 89
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BlockHeader;-><init>(Lcom/github/junrar/rarfile/BlockHeader;)V

    const/16 p1, 0x8

    .line 68
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->salt:[B

    const/4 v0, -0x1

    .line 86
    iput v0, p0, Lcom/github/junrar/rarfile/FileHeader;->recoverySectors:I

    const/4 v0, 0x0

    .line 92
    invoke-static {p2, v0}, Lcom/github/junrar/io/Raw;->readIntLittleEndianAsLong([BI)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/github/junrar/rarfile/FileHeader;->unpSize:J

    const/4 v1, 0x4

    .line 94
    aget-byte v1, p2, v1

    invoke-static {v1}, Lcom/github/junrar/rarfile/HostSystem;->findHostSystem(B)Lcom/github/junrar/rarfile/HostSystem;

    move-result-object v1

    iput-object v1, p0, Lcom/github/junrar/rarfile/FileHeader;->hostOS:Lcom/github/junrar/rarfile/HostSystem;

    const/4 v1, 0x5

    .line 97
    invoke-static {p2, v1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v1

    iput v1, p0, Lcom/github/junrar/rarfile/FileHeader;->fileCRC:I

    const/16 v1, 0x9

    .line 100
    invoke-static {p2, v1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v2

    iput v2, p0, Lcom/github/junrar/rarfile/FileHeader;->fileTime:I

    .line 103
    iget-byte v2, p0, Lcom/github/junrar/rarfile/FileHeader;->unpVersion:B

    const/16 v3, 0xd

    aget-byte v3, p2, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-byte v2, v2

    iput-byte v2, p0, Lcom/github/junrar/rarfile/FileHeader;->unpVersion:B

    .line 105
    iget-byte v2, p0, Lcom/github/junrar/rarfile/FileHeader;->unpMethod:B

    const/16 v3, 0xe

    aget-byte v3, p2, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-byte v2, v2

    iput-byte v2, p0, Lcom/github/junrar/rarfile/FileHeader;->unpMethod:B

    const/16 v2, 0xf

    .line 107
    invoke-static {p2, v2}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result v2

    iput-short v2, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    const/16 v2, 0x11

    .line 110
    invoke-static {p2, v2}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v2

    iput v2, p0, Lcom/github/junrar/rarfile/FileHeader;->fileAttr:I

    .line 112
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isLargeBlock()Z

    move-result v2

    const/16 v3, 0x15

    if-eqz v2, :cond_0

    .line 113
    invoke-static {p2, v3}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v2

    iput v2, p0, Lcom/github/junrar/rarfile/FileHeader;->highPackSize:I

    const/16 v2, 0x19

    .line 116
    invoke-static {p2, v2}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v2

    iput v2, p0, Lcom/github/junrar/rarfile/FileHeader;->highUnpackSize:I

    const/16 v3, 0x1d

    goto :goto_0

    .line 119
    :cond_0
    iput v0, p0, Lcom/github/junrar/rarfile/FileHeader;->highPackSize:I

    .line 120
    iput v0, p0, Lcom/github/junrar/rarfile/FileHeader;->highUnpackSize:I

    .line 121
    iget-wide v4, p0, Lcom/github/junrar/rarfile/FileHeader;->unpSize:J

    const-wide/16 v6, -0x1

    cmp-long v2, v4, v6

    if-nez v2, :cond_1

    .line 123
    iput-wide v6, p0, Lcom/github/junrar/rarfile/FileHeader;->unpSize:J

    const v2, 0x7fffffff

    .line 124
    iput v2, p0, Lcom/github/junrar/rarfile/FileHeader;->highUnpackSize:I

    .line 128
    :cond_1
    :goto_0
    iget-wide v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fullPackSize:J

    iget v2, p0, Lcom/github/junrar/rarfile/FileHeader;->highPackSize:I

    int-to-long v6, v2

    or-long/2addr v4, v6

    const/16 v2, 0x20

    shl-long/2addr v4, v2

    .line 129
    iput-wide v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fullPackSize:J

    .line 130
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getPackSize()J

    move-result-wide v6

    or-long/2addr v4, v6

    iput-wide v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fullPackSize:J

    .line 132
    iget-wide v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fullUnpackSize:J

    iget v6, p0, Lcom/github/junrar/rarfile/FileHeader;->highUnpackSize:I

    int-to-long v6, v6

    or-long/2addr v4, v6

    shl-long/2addr v4, v2

    .line 134
    iget-wide v6, p0, Lcom/github/junrar/rarfile/FileHeader;->unpSize:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fullUnpackSize:J

    .line 136
    iget-short v4, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    const/16 v5, 0x1000

    if-le v4, v5, :cond_2

    const/16 v4, 0x1000

    :cond_2
    iput-short v4, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    .line 138
    new-array v4, v4, [B

    iput-object v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    const/4 v4, 0x0

    .line 139
    :goto_1
    iget-short v5, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    if-ge v4, v5, :cond_3

    .line 140
    iget-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    aget-byte v6, p2, v3

    aput-byte v6, v5, v4

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 144
    :cond_3
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isFileHeader()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 145
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isUnicode()Z

    move-result v4

    const-string v5, ""

    if-eqz v4, :cond_5

    .line 147
    iput-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileName:Ljava/lang/String;

    .line 148
    iput-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameW:Ljava/lang/String;

    const/4 v4, 0x0

    .line 149
    :goto_2
    iget-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    array-length v6, v5

    if-ge v4, v6, :cond_4

    aget-byte v6, v5, v4

    if-eqz v6, :cond_4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 153
    :cond_4
    new-array v6, v4, [B

    .line 154
    invoke-static {v5, v0, v6, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    iput-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileName:Ljava/lang/String;

    .line 156
    iget-short v5, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    if-eq v4, v5, :cond_6

    add-int/lit8 v4, v4, 0x1

    .line 158
    iget-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    invoke-static {v5, v4}, Lcom/github/junrar/rarfile/FileNameDecoder;->decode([BI)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameW:Ljava/lang/String;

    goto :goto_3

    .line 161
    :cond_5
    new-instance v4, Ljava/lang/String;

    iget-object v6, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    invoke-direct {v4, v6}, Ljava/lang/String;-><init>([B)V

    iput-object v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fileName:Ljava/lang/String;

    .line 162
    iput-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameW:Ljava/lang/String;

    .line 166
    :cond_6
    :goto_3
    sget-object v4, Lcom/github/junrar/rarfile/UnrarHeadertype;->NewSubHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    iget-byte v5, p0, Lcom/github/junrar/rarfile/FileHeader;->headerType:B

    invoke-virtual {v4, v5}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 167
    iget-short v4, p0, Lcom/github/junrar/rarfile/FileHeader;->headerSize:S

    sub-int/2addr v4, v2

    iget-short v2, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    sub-int/2addr v4, v2

    .line 168
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->hasSalt()Z

    move-result v2

    if-eqz v2, :cond_7

    add-int/lit8 v4, v4, -0x8

    :cond_7
    if-lez v4, :cond_8

    .line 172
    new-array v2, v4, [B

    iput-object v2, p0, Lcom/github/junrar/rarfile/FileHeader;->subData:[B

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v4, :cond_8

    .line 174
    iget-object v5, p0, Lcom/github/junrar/rarfile/FileHeader;->subData:[B

    aget-byte v6, p2, v3

    aput-byte v6, v5, v2

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 179
    :cond_8
    sget-object v2, Lcom/github/junrar/rarfile/NewSubHeaderType;->SUBHEAD_TYPE_RR:Lcom/github/junrar/rarfile/NewSubHeaderType;

    iget-object v4, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    invoke-virtual {v2, v4}, Lcom/github/junrar/rarfile/NewSubHeaderType;->byteEquals([B)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 180
    iget-object v2, p0, Lcom/github/junrar/rarfile/FileHeader;->subData:[B

    aget-byte v4, v2, p1

    and-int/lit16 v4, v4, 0xff

    aget-byte v1, v2, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/2addr v1, p1

    add-int/2addr v4, v1

    const/16 v1, 0xa

    aget-byte v1, v2, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v4, v1

    const/16 v1, 0xb

    aget-byte v1, v2, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/2addr v4, v1

    iput v4, p0, Lcom/github/junrar/rarfile/FileHeader;->recoverySectors:I

    .line 185
    :cond_9
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->hasSalt()Z

    move-result v1

    if-eqz v1, :cond_a

    :goto_5
    if-ge v0, p1, :cond_a

    .line 187
    iget-object v1, p0, Lcom/github/junrar/rarfile/FileHeader;->salt:[B

    aget-byte v2, p2, v3

    aput-byte v2, v1, v0

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 191
    :cond_a
    iget p1, p0, Lcom/github/junrar/rarfile/FileHeader;->fileTime:I

    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/FileHeader;->getDateDos(I)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->mTime:Ljava/util/Date;

    return-void
.end method

.method private getDateDos(I)Ljava/util/Date;
    .locals 4

    .line 225
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    ushr-int/lit8 v1, p1, 0x19

    add-int/lit16 v1, v1, 0x7bc

    const/4 v2, 0x1

    .line 226
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    ushr-int/lit8 v1, p1, 0x15

    and-int/lit8 v1, v1, 0xf

    sub-int/2addr v1, v2

    const/4 v2, 0x2

    .line 227
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    ushr-int/lit8 v1, p1, 0x10

    and-int/lit8 v1, v1, 0x1f

    const/4 v3, 0x5

    .line 228
    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    ushr-int/lit8 v1, p1, 0xb

    and-int/lit8 v1, v1, 0x1f

    const/16 v3, 0xb

    .line 229
    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    ushr-int/lit8 v1, p1, 0x5

    and-int/lit8 v1, v1, 0x3f

    const/16 v3, 0xc

    .line 230
    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    and-int/lit8 p1, p1, 0x1f

    mul-int/lit8 p1, p1, 0x2

    const/16 v1, 0xd

    .line 231
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 232
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getATime()Ljava/util/Date;
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->aTime:Ljava/util/Date;

    return-object v0
.end method

.method public getArcTime()Ljava/util/Date;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->arcTime:Ljava/util/Date;

    return-object v0
.end method

.method public getCTime()Ljava/util/Date;
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->cTime:Ljava/util/Date;

    return-object v0
.end method

.method public getFileAttr()I
    .locals 1

    .line 260
    iget v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fileAttr:I

    return v0
.end method

.method public getFileCRC()I
    .locals 1

    .line 268
    iget v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fileCRC:I

    return v0
.end method

.method public getFileNameByteArray()[B
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameBytes:[B

    return-object v0
.end method

.method public getFileNameString()Ljava/lang/String;
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getFileNameW()Ljava/lang/String;
    .locals 1

    .line 284
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameW:Ljava/lang/String;

    return-object v0
.end method

.method public getFullPackSize()J
    .locals 2

    .line 344
    iget-wide v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fullPackSize:J

    return-wide v0
.end method

.method public getFullUnpackSize()J
    .locals 2

    .line 348
    iget-wide v0, p0, Lcom/github/junrar/rarfile/FileHeader;->fullUnpackSize:J

    return-wide v0
.end method

.method public getHighPackSize()I
    .locals 1

    .line 292
    iget v0, p0, Lcom/github/junrar/rarfile/FileHeader;->highPackSize:I

    return v0
.end method

.method public getHighUnpackSize()I
    .locals 1

    .line 296
    iget v0, p0, Lcom/github/junrar/rarfile/FileHeader;->highUnpackSize:I

    return v0
.end method

.method public getHostOS()Lcom/github/junrar/rarfile/HostSystem;
    .locals 1

    .line 300
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->hostOS:Lcom/github/junrar/rarfile/HostSystem;

    return-object v0
.end method

.method public getMTime()Ljava/util/Date;
    .locals 1

    .line 304
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->mTime:Ljava/util/Date;

    return-object v0
.end method

.method public getNameSize()S
    .locals 1

    .line 312
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->nameSize:S

    return v0
.end method

.method public getRecoverySectors()I
    .locals 1

    .line 316
    iget v0, p0, Lcom/github/junrar/rarfile/FileHeader;->recoverySectors:I

    return v0
.end method

.method public getSalt()[B
    .locals 1

    .line 320
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->salt:[B

    return-object v0
.end method

.method public getSubData()[B
    .locals 1

    .line 324
    iget-object v0, p0, Lcom/github/junrar/rarfile/FileHeader;->subData:[B

    return-object v0
.end method

.method public getSubFlags()I
    .locals 1

    .line 328
    iget v0, p0, Lcom/github/junrar/rarfile/FileHeader;->subFlags:I

    return v0
.end method

.method public getUnpMethod()B
    .locals 1

    .line 332
    iget-byte v0, p0, Lcom/github/junrar/rarfile/FileHeader;->unpMethod:B

    return v0
.end method

.method public getUnpSize()J
    .locals 2

    .line 336
    iget-wide v0, p0, Lcom/github/junrar/rarfile/FileHeader;->unpSize:J

    return-wide v0
.end method

.method public getUnpVersion()B
    .locals 1

    .line 340
    iget-byte v0, p0, Lcom/github/junrar/rarfile/FileHeader;->unpVersion:B

    return v0
.end method

.method public hasSalt()Z
    .locals 1

    .line 406
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDirectory()Z
    .locals 2

    .line 419
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    const/16 v1, 0xe0

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEncrypted()Z
    .locals 1

    .line 389
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFileHeader()Z
    .locals 2

    .line 402
    sget-object v0, Lcom/github/junrar/rarfile/UnrarHeadertype;->FileHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    iget-byte v1, p0, Lcom/github/junrar/rarfile/FileHeader;->headerType:B

    invoke-virtual {v0, v1}, Lcom/github/junrar/rarfile/UnrarHeadertype;->equals(B)Z

    move-result v0

    return v0
.end method

.method public isLargeBlock()Z
    .locals 1

    .line 410
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSolid()Z
    .locals 1

    .line 380
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSplitAfter()Z
    .locals 1

    .line 362
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSplitBefore()Z
    .locals 2

    .line 371
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnicode()Z
    .locals 1

    .line 398
    iget-short v0, p0, Lcom/github/junrar/rarfile/FileHeader;->flags:S

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public print()V
    .locals 4

    .line 198
    invoke-super {p0}, Lcom/github/junrar/rarfile/BlockHeader;->print()V

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unpSize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getUnpSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nHostOS: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/github/junrar/rarfile/FileHeader;->hostOS:Lcom/github/junrar/rarfile/HostSystem;

    invoke-virtual {v2}, Lcom/github/junrar/rarfile/HostSystem;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nMDate: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/github/junrar/rarfile/FileHeader;->mTime:Ljava/util/Date;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nFileName: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getFileNameString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nunpMethod: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getUnpMethod()B

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nunpVersion: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getUnpVersion()B

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nfullpackedsize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getFullPackSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nfullunpackedsize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getFullUnpackSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisEncrypted: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isEncrypted()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisfileHeader: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isFileHeader()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisSolid: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isSolid()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisSplitafter: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isSplitAfter()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisSplitBefore:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isSplitBefore()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nunpSize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getUnpSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\ndataSize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->getDataSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisUnicode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isUnicode()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nhasVolumeNumber: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->hasVolumeNumber()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nhasArchiveDataCRC: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->hasArchiveDataCRC()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nhasSalt: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->hasSalt()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nhasEncryptVersions: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->hasEncryptVersion()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nisSubBlock: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/FileHeader;->isSubBlock()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    sget-object v1, Lcom/github/junrar/rarfile/FileHeader;->logger:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void
.end method

.method public setATime(Ljava/util/Date;)V
    .locals 0

    .line 248
    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->aTime:Ljava/util/Date;

    return-void
.end method

.method public setArcTime(Ljava/util/Date;)V
    .locals 0

    .line 240
    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->arcTime:Ljava/util/Date;

    return-void
.end method

.method public setCTime(Ljava/util/Date;)V
    .locals 0

    .line 256
    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->cTime:Ljava/util/Date;

    return-void
.end method

.method public setFileAttr(I)V
    .locals 0

    .line 264
    iput p1, p0, Lcom/github/junrar/rarfile/FileHeader;->fileAttr:I

    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0

    .line 280
    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->fileName:Ljava/lang/String;

    return-void
.end method

.method public setFileNameW(Ljava/lang/String;)V
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->fileNameW:Ljava/lang/String;

    return-void
.end method

.method public setMTime(Ljava/util/Date;)V
    .locals 0

    .line 308
    iput-object p1, p0, Lcom/github/junrar/rarfile/FileHeader;->mTime:Ljava/util/Date;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 353
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
