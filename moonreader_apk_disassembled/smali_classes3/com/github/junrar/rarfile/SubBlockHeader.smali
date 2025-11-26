.class public Lcom/github/junrar/rarfile/SubBlockHeader;
.super Lcom/github/junrar/rarfile/BlockHeader;
.source "SubBlockHeader.java"


# static fields
.field public static final SubBlockHeaderSize:S = 0x3s

.field private static final logger:Lorg/apache/commons/logging/Log;


# instance fields
.field private level:B

.field private subType:S


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    const-class v0, Lcom/github/junrar/rarfile/SubBlockHeader;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/rarfile/SubBlockHeader;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/BlockHeader;[B)V
    .locals 1

    .line 42
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BlockHeader;-><init>(Lcom/github/junrar/rarfile/BlockHeader;)V

    const/4 p1, 0x0

    .line 44
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result p1

    iput-short p1, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->subType:S

    .line 46
    iget-byte p1, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->level:B

    const/4 v0, 0x2

    aget-byte p2, p2, v0

    and-int/lit16 p2, p2, 0xff

    or-int/2addr p1, p2

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->level:B

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/SubBlockHeader;)V
    .locals 1

    .line 36
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BlockHeader;-><init>(Lcom/github/junrar/rarfile/BlockHeader;)V

    .line 37
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/SubBlockHeader;->getSubType()Lcom/github/junrar/rarfile/SubBlockHeaderType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->getSubblocktype()S

    move-result v0

    iput-short v0, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->subType:S

    .line 38
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/SubBlockHeader;->getLevel()B

    move-result p1

    iput-byte p1, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->level:B

    return-void
.end method


# virtual methods
.method public getLevel()B
    .locals 1

    .line 50
    iget-byte v0, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->level:B

    return v0
.end method

.method public getSubType()Lcom/github/junrar/rarfile/SubBlockHeaderType;
    .locals 1

    .line 54
    iget-short v0, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->subType:S

    invoke-static {v0}, Lcom/github/junrar/rarfile/SubBlockHeaderType;->findSubblockHeaderType(S)Lcom/github/junrar/rarfile/SubBlockHeaderType;

    move-result-object v0

    return-object v0
.end method

.method public print()V
    .locals 3

    .line 58
    invoke-super {p0}, Lcom/github/junrar/rarfile/BlockHeader;->print()V

    .line 59
    sget-object v0, Lcom/github/junrar/rarfile/SubBlockHeader;->logger:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "subtype: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/SubBlockHeader;->getSubType()Lcom/github/junrar/rarfile/SubBlockHeaderType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "level: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v2, p0, Lcom/github/junrar/rarfile/SubBlockHeader;->level:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void
.end method
