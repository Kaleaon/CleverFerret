.class public Lcom/github/junrar/rarfile/BlockHeader;
.super Lcom/github/junrar/rarfile/BaseBlock;
.source "BlockHeader.java"


# static fields
.field public static final blockHeaderSize:S = 0x4s

.field private static final logger:Lorg/apache/commons/logging/Log;


# instance fields
.field private dataSize:J

.field private packSize:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const-class v0, Lcom/github/junrar/rarfile/BlockHeader;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/rarfile/BlockHeader;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/github/junrar/rarfile/BaseBlock;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BaseBlock;-><init>(Lcom/github/junrar/rarfile/BaseBlock;)V

    const/4 p1, 0x0

    .line 55
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readIntLittleEndianAsLong([BI)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/github/junrar/rarfile/BlockHeader;->packSize:J

    .line 56
    iput-wide p1, p0, Lcom/github/junrar/rarfile/BlockHeader;->dataSize:J

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/BlockHeader;)V
    .locals 2

    .line 46
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BaseBlock;-><init>(Lcom/github/junrar/rarfile/BaseBlock;)V

    .line 47
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/BlockHeader;->getDataSize()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/junrar/rarfile/BlockHeader;->packSize:J

    .line 48
    iput-wide v0, p0, Lcom/github/junrar/rarfile/BlockHeader;->dataSize:J

    .line 49
    invoke-virtual {p1}, Lcom/github/junrar/rarfile/BlockHeader;->getPositionInFile()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/junrar/rarfile/BlockHeader;->positionInFile:J

    return-void
.end method


# virtual methods
.method public getDataSize()J
    .locals 2

    .line 60
    iget-wide v0, p0, Lcom/github/junrar/rarfile/BlockHeader;->dataSize:J

    return-wide v0
.end method

.method public getPackSize()J
    .locals 2

    .line 64
    iget-wide v0, p0, Lcom/github/junrar/rarfile/BlockHeader;->packSize:J

    return-wide v0
.end method

.method public print()V
    .locals 3

    .line 68
    invoke-super {p0}, Lcom/github/junrar/rarfile/BaseBlock;->print()V

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DataSize: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/BlockHeader;->getDataSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " packSize: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/github/junrar/rarfile/BlockHeader;->getPackSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    sget-object v1, Lcom/github/junrar/rarfile/BlockHeader;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v1, v0}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void
.end method
