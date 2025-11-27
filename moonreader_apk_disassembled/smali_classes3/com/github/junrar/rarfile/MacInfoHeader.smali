.class public Lcom/github/junrar/rarfile/MacInfoHeader;
.super Lcom/github/junrar/rarfile/SubBlockHeader;
.source "MacInfoHeader.java"


# static fields
.field public static final MacInfoHeaderSize:S = 0x8s

.field private static final logger:Lorg/apache/commons/logging/Log;


# instance fields
.field private fileCreator:I

.field private fileType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    const-class v0, Lcom/github/junrar/rarfile/MacInfoHeader;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/rarfile/MacInfoHeader;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/SubBlockHeader;[B)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/SubBlockHeader;-><init>(Lcom/github/junrar/rarfile/SubBlockHeader;)V

    const/4 p1, 0x0

    .line 42
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result p1

    iput p1, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileType:I

    const/4 p1, 0x4

    .line 44
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result p1

    iput p1, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileCreator:I

    return-void
.end method


# virtual methods
.method public getFileCreator()I
    .locals 1

    .line 51
    iget v0, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileCreator:I

    return v0
.end method

.method public getFileType()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileType:I

    return v0
.end method

.method public print()V
    .locals 3

    .line 76
    invoke-super {p0}, Lcom/github/junrar/rarfile/SubBlockHeader;->print()V

    .line 77
    sget-object v0, Lcom/github/junrar/rarfile/MacInfoHeader;->logger:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "filetype: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "creator :"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileCreator:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void
.end method

.method public setFileCreator(I)V
    .locals 0

    .line 58
    iput p1, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileCreator:I

    return-void
.end method

.method public setFileType(I)V
    .locals 0

    .line 72
    iput p1, p0, Lcom/github/junrar/rarfile/MacInfoHeader;->fileType:I

    return-void
.end method
