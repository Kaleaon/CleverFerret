.class public Lcom/github/junrar/rarfile/UnixOwnersHeader;
.super Lcom/github/junrar/rarfile/SubBlockHeader;
.source "UnixOwnersHeader.java"


# static fields
.field private static final logger:Lorg/apache/commons/logging/Log;


# instance fields
.field private group:Ljava/lang/String;

.field private groupNameSize:I

.field private owner:Ljava/lang/String;

.field private ownerNameSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    const-class v0, Lcom/github/junrar/rarfile/UnixOwnersHeader;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/rarfile/SubBlockHeader;[B)V
    .locals 4

    .line 16
    invoke-direct {p0, p1}, Lcom/github/junrar/rarfile/SubBlockHeader;-><init>(Lcom/github/junrar/rarfile/SubBlockHeader;)V

    const/4 p1, 0x0

    .line 18
    invoke-static {p2, p1}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    iput v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->ownerNameSize:I

    const/4 v0, 0x2

    .line 20
    invoke-static {p2, v0}, Lcom/github/junrar/io/Raw;->readShortLittleEndian([BI)S

    move-result v0

    and-int/2addr v0, v1

    iput v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->groupNameSize:I

    .line 22
    iget v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->ownerNameSize:I

    const/4 v1, 0x4

    add-int v2, v1, v0

    array-length v3, p2

    if-ge v2, v3, :cond_0

    .line 23
    new-array v2, v0, [B

    .line 24
    invoke-static {p2, v1, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->owner:Ljava/lang/String;

    .line 27
    :cond_0
    iget v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->ownerNameSize:I

    add-int/2addr v1, v0

    .line 28
    iget v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->groupNameSize:I

    add-int v2, v1, v0

    array-length v3, p2

    if-ge v2, v3, :cond_1

    .line 29
    new-array v2, v0, [B

    .line 30
    invoke-static {p2, v1, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v2}, Ljava/lang/String;-><init>([B)V

    iput-object p1, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->group:Ljava/lang/String;

    :cond_1
    return-void
.end method


# virtual methods
.method public getGroup()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupNameSize()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->groupNameSize:I

    return v0
.end method

.method public getOwner()Ljava/lang/String;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->owner:Ljava/lang/String;

    return-object v0
.end method

.method public getOwnerNameSize()I
    .locals 1

    .line 74
    iget v0, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->ownerNameSize:I

    return v0
.end method

.method public print()V
    .locals 3

    .line 87
    invoke-super {p0}, Lcom/github/junrar/rarfile/SubBlockHeader;->print()V

    .line 88
    sget-object v0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->logger:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ownerNameSize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->ownerNameSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "owner: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->owner:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "groupNameSize: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->groupNameSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "group: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->group:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->group:Ljava/lang/String;

    return-void
.end method

.method public setGroupNameSize(I)V
    .locals 0

    .line 56
    iput p1, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->groupNameSize:I

    return-void
.end method

.method public setOwner(Ljava/lang/String;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->owner:Ljava/lang/String;

    return-void
.end method

.method public setOwnerNameSize(I)V
    .locals 0

    .line 80
    iput p1, p0, Lcom/github/junrar/rarfile/UnixOwnersHeader;->ownerNameSize:I

    return-void
.end method
