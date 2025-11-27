.class public Lcom/github/junrar/rarfile/MarkHeader;
.super Lcom/github/junrar/rarfile/BaseBlock;
.source "MarkHeader.java"


# instance fields
.field private logger:Lorg/apache/commons/logging/Log;

.field private version:Lcom/github/junrar/rarfile/RARVersion;


# direct methods
.method public constructor <init>(Lcom/github/junrar/rarfile/BaseBlock;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BaseBlock;-><init>(Lcom/github/junrar/rarfile/BaseBlock;)V

    .line 35
    const-class p1, Lcom/github/junrar/rarfile/MarkHeader;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object p1

    iput-object p1, p0, Lcom/github/junrar/rarfile/MarkHeader;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method


# virtual methods
.method public getVersion()Lcom/github/junrar/rarfile/RARVersion;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    return-object v0
.end method

.method public isOldFormat()Z
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    invoke-static {v0}, Lcom/github/junrar/rarfile/RARVersion;->isOldFormat(Lcom/github/junrar/rarfile/RARVersion;)Z

    move-result v0

    return v0
.end method

.method public isSignature()Z
    .locals 10

    const/4 v0, 0x7

    .line 59
    new-array v1, v0, [B

    .line 60
    iget-short v2, p0, Lcom/github/junrar/rarfile/MarkHeader;->headCRC:S

    const/4 v3, 0x0

    invoke-static {v1, v3, v2}, Lcom/github/junrar/io/Raw;->writeShortLittleEndian([BIS)V

    .line 61
    iget-byte v2, p0, Lcom/github/junrar/rarfile/MarkHeader;->headerType:B

    const/4 v4, 0x2

    aput-byte v2, v1, v4

    .line 62
    iget-short v2, p0, Lcom/github/junrar/rarfile/MarkHeader;->flags:S

    const/4 v5, 0x3

    invoke-static {v1, v5, v2}, Lcom/github/junrar/io/Raw;->writeShortLittleEndian([BIS)V

    .line 63
    iget-short v2, p0, Lcom/github/junrar/rarfile/MarkHeader;->headerSize:S

    const/4 v6, 0x5

    invoke-static {v1, v6, v2}, Lcom/github/junrar/io/Raw;->writeShortLittleEndian([BIS)V

    .line 65
    aget-byte v2, v1, v3

    const/16 v7, 0x52

    const/4 v8, 0x1

    if-ne v2, v7, :cond_2

    .line 66
    aget-byte v2, v1, v8

    const/16 v7, 0x45

    if-ne v2, v7, :cond_0

    aget-byte v7, v1, v4

    const/16 v9, 0x7e

    if-ne v7, v9, :cond_0

    aget-byte v7, v1, v5

    const/16 v9, 0x5e

    if-ne v7, v9, :cond_0

    .line 67
    sget-object v0, Lcom/github/junrar/rarfile/RARVersion;->OLD:Lcom/github/junrar/rarfile/RARVersion;

    iput-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    goto :goto_0

    :cond_0
    const/16 v7, 0x61

    if-ne v2, v7, :cond_2

    .line 68
    aget-byte v2, v1, v4

    const/16 v4, 0x72

    if-ne v2, v4, :cond_2

    aget-byte v2, v1, v5

    const/16 v4, 0x21

    if-ne v2, v4, :cond_2

    const/4 v2, 0x4

    aget-byte v2, v1, v2

    const/16 v4, 0x1a

    if-ne v2, v4, :cond_2

    aget-byte v2, v1, v6

    if-ne v2, v0, :cond_2

    const/4 v0, 0x6

    .line 69
    aget-byte v0, v1, v0

    if-nez v0, :cond_1

    .line 70
    sget-object v0, Lcom/github/junrar/rarfile/RARVersion;->V4:Lcom/github/junrar/rarfile/RARVersion;

    iput-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    goto :goto_0

    :cond_1
    if-ne v0, v8, :cond_2

    .line 72
    sget-object v0, Lcom/github/junrar/rarfile/RARVersion;->V5:Lcom/github/junrar/rarfile/RARVersion;

    iput-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    .line 76
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    sget-object v1, Lcom/github/junrar/rarfile/RARVersion;->OLD:Lcom/github/junrar/rarfile/RARVersion;

    if-eq v0, v1, :cond_4

    iget-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->version:Lcom/github/junrar/rarfile/RARVersion;

    sget-object v1, Lcom/github/junrar/rarfile/RARVersion;->V4:Lcom/github/junrar/rarfile/RARVersion;

    if-ne v0, v1, :cond_3

    goto :goto_1

    :cond_3
    return v3

    :cond_4
    :goto_1
    return v8
.end method

.method public isValid()Z
    .locals 3

    .line 43
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/MarkHeader;->getHeadCRC()S

    move-result v0

    const/16 v1, 0x6152

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/MarkHeader;->getHeaderType()Lcom/github/junrar/rarfile/UnrarHeadertype;

    move-result-object v0

    sget-object v1, Lcom/github/junrar/rarfile/UnrarHeadertype;->MarkHeader:Lcom/github/junrar/rarfile/UnrarHeadertype;

    if-eq v0, v1, :cond_1

    return v2

    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/MarkHeader;->getFlags()S

    move-result v0

    const/16 v1, 0x1a21

    if-eq v0, v1, :cond_2

    return v2

    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/github/junrar/rarfile/MarkHeader;->getHeaderSize()S

    move-result v0

    const/4 v1, 0x7

    if-eq v0, v1, :cond_3

    return v2

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public print()V
    .locals 3

    .line 88
    invoke-super {p0}, Lcom/github/junrar/rarfile/BaseBlock;->print()V

    .line 89
    iget-object v0, p0, Lcom/github/junrar/rarfile/MarkHeader;->logger:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "valid: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/MarkHeader;->isValid()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void
.end method
