.class public Lcom/github/junrar/rarfile/SignHeader;
.super Lcom/github/junrar/rarfile/BaseBlock;
.source "SignHeader.java"


# static fields
.field public static final signHeaderSize:S = 0x8s


# instance fields
.field private arcNameSize:S

.field private creationTime:I

.field private userNameSize:S


# direct methods
.method public constructor <init>(Lcom/github/junrar/rarfile/BaseBlock;[B)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/BaseBlock;-><init>(Lcom/github/junrar/rarfile/BaseBlock;)V

    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/github/junrar/rarfile/SignHeader;->creationTime:I

    .line 34
    iput-short p1, p0, Lcom/github/junrar/rarfile/SignHeader;->arcNameSize:S

    .line 35
    iput-short p1, p0, Lcom/github/junrar/rarfile/SignHeader;->userNameSize:S

    .line 42
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result p1

    iput p1, p0, Lcom/github/junrar/rarfile/SignHeader;->creationTime:I

    const/4 p1, 0x4

    .line 44
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result p1

    iput-short p1, p0, Lcom/github/junrar/rarfile/SignHeader;->arcNameSize:S

    const/4 p1, 0x6

    .line 46
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result p1

    iput-short p1, p0, Lcom/github/junrar/rarfile/SignHeader;->userNameSize:S

    return-void
.end method


# virtual methods
.method public getArcNameSize()S
    .locals 1

    .line 50
    iget-short v0, p0, Lcom/github/junrar/rarfile/SignHeader;->arcNameSize:S

    return v0
.end method

.method public getCreationTime()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/github/junrar/rarfile/SignHeader;->creationTime:I

    return v0
.end method

.method public getUserNameSize()S
    .locals 1

    .line 58
    iget-short v0, p0, Lcom/github/junrar/rarfile/SignHeader;->userNameSize:S

    return v0
.end method
