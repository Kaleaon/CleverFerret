.class public Lorg/apache/tools/zip/AsiExtraField;
.super Ljava/lang/Object;
.source "AsiExtraField.java"

# interfaces
.implements Lorg/apache/tools/zip/ZipExtraField;
.implements Lorg/apache/tools/zip/UnixStat;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final HEADER_ID:Lorg/apache/tools/zip/ZipShort;


# instance fields
.field private crc:Ljava/util/zip/CRC32;

.field private dirFlag:Z

.field private gid:I

.field private link:Ljava/lang/String;

.field private mode:I

.field private uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 89
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v1, 0x756e

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    sput-object v0, Lorg/apache/tools/zip/AsiExtraField;->HEADER_ID:Lorg/apache/tools/zip/ZipShort;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 96
    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    .line 102
    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    .line 108
    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    .line 116
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 122
    iput-boolean v0, p0, Lorg/apache/tools/zip/AsiExtraField;->dirFlag:Z

    .line 129
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    return-void
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 1

    .line 205
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLocalFileDataData()[B

    move-result-object v0

    return-object v0
.end method

.method public getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    return-object v0
.end method

.method public getGroupId()I
    .locals 1

    .line 241
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    return v0
.end method

.method public getHeaderId()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .line 140
    sget-object v0, Lorg/apache/tools/zip/AsiExtraField;->HEADER_ID:Lorg/apache/tools/zip/ZipShort;

    return-object v0
.end method

.method public getLinkedFile()Ljava/lang/String;
    .locals 1

    .line 266
    iget-object v0, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 9

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v0

    add-int/lit8 v1, v0, -0x4

    new-array v2, v1, [B

    .line 176
    new-instance v3, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getMode()I

    move-result v4

    invoke-direct {v3, v4}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v3, v4, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 179
    new-instance v6, Lorg/apache/tools/zip/ZipLong;

    array-length v7, v3

    int-to-long v7, v7

    invoke-direct {v6, v7, v8}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v6

    const/4 v7, 0x4

    invoke-static {v6, v4, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 182
    new-instance v6, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getUserId()I

    move-result v8

    invoke-direct {v6, v8}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v6

    const/4 v8, 0x6

    invoke-static {v6, v4, v2, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    new-instance v6, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getGroupId()I

    move-result v8

    invoke-direct {v6, v8}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v6

    const/16 v8, 0x8

    invoke-static {v6, v4, v2, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/16 v5, 0xa

    .line 187
    array-length v6, v3

    invoke-static {v3, v4, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    iget-object v3, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->reset()V

    .line 190
    iget-object v3, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3, v2}, Ljava/util/zip/CRC32;->update([B)V

    .line 191
    iget-object v3, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v5

    .line 193
    new-array v0, v0, [B

    .line 194
    new-instance v3, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v3, v5, v6}, Lorg/apache/tools/zip/ZipLong;-><init>(J)V

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipLong;->getBytes()[B

    move-result-object v3

    invoke-static {v3, v4, v0, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    invoke-static {v2, v4, v0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .line 150
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, 0xe

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .line 293
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    return v0
.end method

.method protected getMode(I)I
    .locals 1

    .line 358
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->isLink()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0xa000

    goto :goto_0

    .line 360
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x4000

    goto :goto_0

    :cond_1
    const v0, 0x8000

    :goto_0
    and-int/lit16 p1, p1, 0xfff

    or-int/2addr p1, v0

    return p1
.end method

.method public getUserId()I
    .locals 1

    .line 223
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    return v0
.end method

.method public isDirectory()Z
    .locals 1

    .line 312
    iget-boolean v0, p0, Lorg/apache/tools/zip/AsiExtraField;->dirFlag:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->isLink()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isLink()Z
    .locals 1

    .line 275
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public parseFromLocalFileData([BII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 323
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-direct {v0, p1, p2}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v0

    add-int/lit8 p3, p3, -0x4

    .line 324
    new-array v2, p3, [B

    add-int/lit8 p2, p2, 0x4

    const/4 v3, 0x0

    .line 325
    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    iget-object p1, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {p1}, Ljava/util/zip/CRC32;->reset()V

    .line 327
    iget-object p1, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {p1, v2}, Ljava/util/zip/CRC32;->update([B)V

    .line 328
    iget-object p1, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {p1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide p1

    cmp-long p3, v0, p1

    if-nez p3, :cond_2

    .line 336
    new-instance p1, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {p1, v2, v3}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result p1

    .line 337
    new-instance p2, Lorg/apache/tools/zip/ZipLong;

    const/4 p3, 0x2

    invoke-direct {p2, v2, p3}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    invoke-virtual {p2}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide p2

    long-to-int p3, p2

    new-array p2, p3, [B

    .line 338
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/4 v1, 0x6

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    .line 339
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v1, 0x8

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    if-nez p3, :cond_0

    .line 342
    const-string p2, ""

    iput-object p2, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/16 v0, 0xa

    .line 344
    invoke-static {v2, v0, p2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 345
    new-instance p3, Ljava/lang/String;

    invoke-direct {p3, p2}, Ljava/lang/String;-><init>([B)V

    iput-object p3, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    :goto_0
    and-int/lit16 p2, p1, 0x4000

    if-eqz p2, :cond_1

    const/4 v3, 0x1

    .line 347
    :cond_1
    invoke-virtual {p0, v3}, Lorg/apache/tools/zip/AsiExtraField;->setDirectory(Z)V

    .line 348
    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/AsiExtraField;->setMode(I)V

    return-void

    .line 330
    :cond_2
    new-instance p3, Ljava/util/zip/ZipException;

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "bad CRC checksum "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " instead of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method public setDirectory(Z)V
    .locals 0

    .line 302
    iput-boolean p1, p0, Lorg/apache/tools/zip/AsiExtraField;->dirFlag:Z

    .line 303
    iget p1, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/AsiExtraField;->getMode(I)I

    move-result p1

    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    return-void
.end method

.method public setGroupId(I)V
    .locals 0

    .line 232
    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    return-void
.end method

.method public setLinkedFile(Ljava/lang/String;)V
    .locals 0

    .line 253
    iput-object p1, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 254
    iget p1, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/AsiExtraField;->getMode(I)I

    move-result p1

    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    return-void
.end method

.method public setMode(I)V
    .locals 0

    .line 284
    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/AsiExtraField;->getMode(I)I

    move-result p1

    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    return-void
.end method

.method public setUserId(I)V
    .locals 0

    .line 214
    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    return-void
.end method
