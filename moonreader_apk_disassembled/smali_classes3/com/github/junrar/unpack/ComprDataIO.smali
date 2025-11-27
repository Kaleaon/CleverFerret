.class public Lcom/github/junrar/unpack/ComprDataIO;
.super Ljava/lang/Object;
.source "ComprDataIO.java"


# instance fields
.field private final archive:Lcom/github/junrar/Archive;

.field private curPackRead:J

.field private curPackWrite:J

.field private curUnpRead:J

.field private curUnpWrite:J

.field private decryption:I

.field private encryption:I

.field private inputStream:Ljava/io/InputStream;

.field private nextVolumeMissing:Z

.field private outputStream:Ljava/io/OutputStream;

.field private packFileCRC:J

.field private packVolume:Z

.field private packedCRC:J

.field private processedArcSize:J

.field private skipUnpCRC:Z

.field private subHead:Lcom/github/junrar/rarfile/FileHeader;

.field private testMode:Z

.field private totalArcSize:J

.field private totalPackRead:J

.field private unpArcSize:J

.field private unpFileCRC:J

.field private unpPackedSize:J

.field private unpVolume:Z


# direct methods
.method public constructor <init>(Lcom/github/junrar/Archive;)V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    return-void
.end method


# virtual methods
.method public getCurPackRead()J
    .locals 2

    .line 212
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackRead:J

    return-wide v0
.end method

.method public getCurPackWrite()J
    .locals 2

    .line 220
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackWrite:J

    return-wide v0
.end method

.method public getCurUnpRead()J
    .locals 2

    .line 228
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpRead:J

    return-wide v0
.end method

.method public getCurUnpWrite()J
    .locals 2

    .line 236
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpWrite:J

    return-wide v0
.end method

.method public getDecryption()I
    .locals 1

    .line 244
    iget v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->decryption:I

    return v0
.end method

.method public getEncryption()I
    .locals 1

    .line 252
    iget v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->encryption:I

    return v0
.end method

.method public getPackFileCRC()J
    .locals 2

    .line 276
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->packFileCRC:J

    return-wide v0
.end method

.method public getPackedCRC()J
    .locals 2

    .line 268
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->packedCRC:J

    return-wide v0
.end method

.method public getProcessedArcSize()J
    .locals 2

    .line 292
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->processedArcSize:J

    return-wide v0
.end method

.method public getSubHeader()Lcom/github/junrar/rarfile/FileHeader;
    .locals 1

    .line 340
    iget-object v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->subHead:Lcom/github/junrar/rarfile/FileHeader;

    return-object v0
.end method

.method public getTotalArcSize()J
    .locals 2

    .line 300
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->totalArcSize:J

    return-wide v0
.end method

.method public getTotalPackRead()J
    .locals 2

    .line 308
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->totalPackRead:J

    return-wide v0
.end method

.method public getUnpArcSize()J
    .locals 2

    .line 316
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpArcSize:J

    return-wide v0
.end method

.method public getUnpFileCRC()J
    .locals 2

    .line 324
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    return-wide v0
.end method

.method public init(Lcom/github/junrar/rarfile/FileHeader;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->getPositionInFile()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->getHeaderSize()S

    move-result v2

    int-to-long v2, v2

    add-long v6, v0, v2

    .line 104
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/FileHeader;->getFullPackSize()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    .line 105
    new-instance v4, Lcom/github/junrar/io/ReadOnlyAccessInputStream;

    iget-object v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    .line 106
    invoke-virtual {v0}, Lcom/github/junrar/Archive;->getRof()Lcom/github/junrar/io/IReadOnlyAccess;

    move-result-object v5

    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    add-long v8, v6, v0

    invoke-direct/range {v4 .. v9}, Lcom/github/junrar/io/ReadOnlyAccessInputStream;-><init>(Lcom/github/junrar/io/IReadOnlyAccess;JJ)V

    iput-object v4, p0, Lcom/github/junrar/unpack/ComprDataIO;->inputStream:Ljava/io/InputStream;

    .line 110
    iput-object p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->subHead:Lcom/github/junrar/rarfile/FileHeader;

    const-wide/16 v0, 0x0

    .line 111
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpRead:J

    .line 112
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackWrite:J

    const-wide/16 v0, -0x1

    .line 113
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->packedCRC:J

    return-void
.end method

.method public init(Ljava/io/OutputStream;)V
    .locals 4

    .line 85
    iput-object p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->outputStream:Ljava/io/OutputStream;

    const-wide/16 v0, 0x0

    .line 86
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    const/4 p1, 0x0

    .line 87
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->testMode:Z

    .line 88
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->skipUnpCRC:Z

    .line 89
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->packVolume:Z

    .line 90
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpVolume:Z

    .line 91
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->nextVolumeMissing:Z

    .line 93
    iput p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->encryption:I

    .line 94
    iput p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->decryption:I

    .line 95
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->totalPackRead:J

    .line 96
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpWrite:J

    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpRead:J

    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackWrite:J

    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackRead:J

    const-wide/16 v2, -0x1

    .line 97
    iput-wide v2, p0, Lcom/github/junrar/unpack/ComprDataIO;->packedCRC:J

    iput-wide v2, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    iput-wide v2, p0, Lcom/github/junrar/unpack/ComprDataIO;->packFileCRC:J

    const/4 p1, 0x0

    .line 98
    iput-object p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->subHead:Lcom/github/junrar/rarfile/FileHeader;

    .line 99
    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->totalArcSize:J

    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->processedArcSize:J

    return-void
.end method

.method public isNextVolumeMissing()Z
    .locals 1

    .line 260
    iget-boolean v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->nextVolumeMissing:Z

    return v0
.end method

.method public isPackVolume()Z
    .locals 1

    .line 284
    iget-boolean v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->packVolume:Z

    return v0
.end method

.method public isUnpVolume()Z
    .locals 1

    .line 332
    iget-boolean v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpVolume:Z

    return v0
.end method

.method public setCurPackRead(J)V
    .locals 0

    .line 216
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackRead:J

    return-void
.end method

.method public setCurPackWrite(J)V
    .locals 0

    .line 224
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->curPackWrite:J

    return-void
.end method

.method public setCurUnpRead(J)V
    .locals 0

    .line 232
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpRead:J

    return-void
.end method

.method public setCurUnpWrite(J)V
    .locals 0

    .line 240
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpWrite:J

    return-void
.end method

.method public setDecryption(I)V
    .locals 0

    .line 248
    iput p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->decryption:I

    return-void
.end method

.method public setEncryption(I)V
    .locals 0

    .line 256
    iput p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->encryption:I

    return-void
.end method

.method public setNextVolumeMissing(Z)V
    .locals 0

    .line 264
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->nextVolumeMissing:Z

    return-void
.end method

.method public setPackFileCRC(J)V
    .locals 0

    .line 280
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->packFileCRC:J

    return-void
.end method

.method public setPackVolume(Z)V
    .locals 0

    .line 288
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->packVolume:Z

    return-void
.end method

.method public setPackedCRC(J)V
    .locals 0

    .line 272
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->packedCRC:J

    return-void
.end method

.method public setPackedSizeToRead(J)V
    .locals 0

    .line 195
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    return-void
.end method

.method public setProcessedArcSize(J)V
    .locals 0

    .line 296
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->processedArcSize:J

    return-void
.end method

.method public setSkipUnpCRC(Z)V
    .locals 0

    .line 203
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->skipUnpCRC:Z

    return-void
.end method

.method public setSubHeader(Lcom/github/junrar/rarfile/FileHeader;)V
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->subHead:Lcom/github/junrar/rarfile/FileHeader;

    return-void
.end method

.method public setTestMode(Z)V
    .locals 0

    .line 199
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->testMode:Z

    return-void
.end method

.method public setTotalArcSize(J)V
    .locals 0

    .line 304
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->totalArcSize:J

    return-void
.end method

.method public setTotalPackRead(J)V
    .locals 0

    .line 312
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->totalPackRead:J

    return-void
.end method

.method public setUnpArcSize(J)V
    .locals 0

    .line 320
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpArcSize:J

    return-void
.end method

.method public setUnpFileCRC(J)V
    .locals 0

    .line 328
    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    return-void
.end method

.method public setUnpVolume(Z)V
    .locals 0

    .line 336
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpVolume:Z

    return-void
.end method

.method public unpRead([BII)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-lez p3, :cond_8

    int-to-long v3, p3

    .line 120
    iget-wide v5, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    cmp-long v1, v3, v5

    if-lez v1, :cond_0

    long-to-int v1, v5

    goto :goto_1

    :cond_0
    move v1, p3

    .line 122
    :goto_1
    iget-object v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v3, p1, p2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    if-ltz v1, :cond_7

    .line 126
    iget-object v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->subHead:Lcom/github/junrar/rarfile/FileHeader;

    invoke-virtual {v3}, Lcom/github/junrar/rarfile/FileHeader;->isSplitAfter()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 127
    iget-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->packedCRC:J

    long-to-int v4, v3

    invoke-static {v4, p1, p2, v1}, Lcom/github/junrar/crc/RarCRC;->checkCrc(I[BII)I

    move-result v3

    int-to-long v3, v3

    iput-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->packedCRC:J

    .line 131
    :cond_1
    iget-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpRead:J

    int-to-long v5, v1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpRead:J

    add-int/2addr v0, v1

    add-int/2addr p2, v1

    sub-int/2addr p3, v1

    .line 135
    iget-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    .line 136
    iget-object v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v3, v1}, Lcom/github/junrar/Archive;->bytesReadRead(I)V

    .line 137
    iget-wide v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpPackedSize:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-nez v7, :cond_8

    iget-object v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->subHead:Lcom/github/junrar/rarfile/FileHeader;

    invoke-virtual {v3}, Lcom/github/junrar/rarfile/FileHeader;->isSplitAfter()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 138
    iget-object v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v3}, Lcom/github/junrar/Archive;->getVolumeManager()Lcom/github/junrar/VolumeManager;

    move-result-object v3

    iget-object v4, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v4}, Lcom/github/junrar/Archive;->getVolume()Lcom/github/junrar/Volume;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lcom/github/junrar/VolumeManager;->nextArchive(Lcom/github/junrar/Archive;Lcom/github/junrar/Volume;)Lcom/github/junrar/Volume;

    move-result-object v3

    if-nez v3, :cond_2

    const/4 p1, 0x1

    .line 140
    iput-boolean p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->nextVolumeMissing:Z

    return v2

    .line 144
    :cond_2
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ComprDataIO;->getSubHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v4

    .line 145
    invoke-virtual {v4}, Lcom/github/junrar/rarfile/FileHeader;->getUnpVersion()B

    move-result v5

    const/16 v6, 0x14

    if-lt v5, v6, :cond_4

    invoke-virtual {v4}, Lcom/github/junrar/rarfile/FileHeader;->getFileCRC()I

    move-result v5

    if-eq v5, v2, :cond_4

    .line 146
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ComprDataIO;->getPackedCRC()J

    move-result-wide v5

    invoke-virtual {v4}, Lcom/github/junrar/rarfile/FileHeader;->getFileCRC()I

    move-result v4

    not-int v4, v4

    int-to-long v7, v4

    cmp-long v4, v5, v7

    if-nez v4, :cond_3

    goto :goto_2

    .line 147
    :cond_3
    new-instance p1, Lcom/github/junrar/exception/RarException;

    sget-object p2, Lcom/github/junrar/exception/RarException$RarExceptionType;->crcError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-direct {p1, p2}, Lcom/github/junrar/exception/RarException;-><init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V

    throw p1

    .line 149
    :cond_4
    :goto_2
    iget-object v4, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v4}, Lcom/github/junrar/Archive;->getUnrarCallback()Lcom/github/junrar/UnrarCallback;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 151
    invoke-interface {v4, v3}, Lcom/github/junrar/UnrarCallback;->isNextVolumeReady(Lcom/github/junrar/Volume;)Z

    move-result v4

    if-nez v4, :cond_5

    return v2

    .line 154
    :cond_5
    iget-object v4, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v4, v3}, Lcom/github/junrar/Archive;->setVolume(Lcom/github/junrar/Volume;)V

    .line 155
    iget-object v3, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v3}, Lcom/github/junrar/Archive;->nextFileHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v3

    if-nez v3, :cond_6

    return v2

    .line 159
    :cond_6
    invoke-virtual {p0, v3}, Lcom/github/junrar/unpack/ComprDataIO;->init(Lcom/github/junrar/rarfile/FileHeader;)V

    goto/16 :goto_0

    .line 124
    :cond_7
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_8
    if-eq v1, v2, :cond_9

    return v0

    :cond_9
    return v1
.end method

.method public unpWrite([BII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 173
    iget-boolean v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->testMode:Z

    if-nez v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 178
    :cond_0
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpWrite:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->curUnpWrite:J

    .line 180
    iget-boolean v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->skipUnpCRC:Z

    if-nez v0, :cond_2

    .line 181
    iget-object v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->archive:Lcom/github/junrar/Archive;

    invoke-virtual {v0}, Lcom/github/junrar/Archive;->isOldFormat()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 182
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    long-to-int p2, v0

    int-to-short p2, p2

    .line 183
    invoke-static {p2, p1, p3}, Lcom/github/junrar/crc/RarCRC;->checkOldCrc(S[BI)S

    move-result p1

    int-to-long p1, p1

    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    return-void

    .line 185
    :cond_1
    iget-wide v0, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    long-to-int v1, v0

    invoke-static {v1, p1, p2, p3}, Lcom/github/junrar/crc/RarCRC;->checkCrc(I[BII)I

    move-result p1

    int-to-long p1, p1

    iput-wide p1, p0, Lcom/github/junrar/unpack/ComprDataIO;->unpFileCRC:J

    :cond_2
    return-void
.end method
