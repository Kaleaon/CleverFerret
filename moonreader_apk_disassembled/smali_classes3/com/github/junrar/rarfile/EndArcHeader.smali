.class public Lcom/github/junrar/rarfile/EndArcHeader;
.super Lcom/github/junrar/rarfile/BaseBlock;
.source "EndArcHeader.java"


# static fields
.field public static final endArcArchiveDataCrcSize:S = 0x4s

.field public static final endArcVolumeNumberSize:S = 0x2s


# instance fields
.field private archiveDataCRC:I

.field private volumeNumber:S


# direct methods
.method public constructor <init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V
    .locals 1

    .line 38
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BaseBlock;-><init>(Lcom/github/junrar/rarfile/BaseBlock;)V

    .line 41
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/EndArcHeader;->hasArchiveDataCRC()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 42
    invoke-static {p2, v0}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result p1

    iput p1, p0, Lcom/github/junrar/rarfile/EndArcHeader;->archiveDataCRC:I

    const/4 v0, 0x4

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/EndArcHeader;->hasVolumeNumber()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 46
    invoke-static {p2, v0}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result p1

    iput-short p1, p0, Lcom/github/junrar/rarfile/EndArcHeader;->volumeNumber:S

    :cond_1
    return-void
.end method


# virtual methods
.method public getArchiveDataCRC()I
    .locals 1

    .line 51
    iget v0, p0, Lcom/github/junrar/rarfile/EndArcHeader;->archiveDataCRC:I

    return v0
.end method

.method public getVolumeNumber()S
    .locals 1

    .line 55
    iget-short v0, p0, Lcom/github/junrar/rarfile/EndArcHeader;->volumeNumber:S

    return v0
.end method
