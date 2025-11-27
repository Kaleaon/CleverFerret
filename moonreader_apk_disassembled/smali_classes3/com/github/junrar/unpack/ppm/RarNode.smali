.class public Lcom/github/junrar/unpack/ppm/RarNode;
.super Lcom/github/junrar/unpack/ppm/Pointer;
.source "RarNode.java"


# static fields
.field public static final size:I = 0x4


# instance fields
.field private next:I


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/github/junrar/unpack/ppm/Pointer;-><init>([B)V

    return-void
.end method


# virtual methods
.method public getNext()I
    .locals 2

    .line 40
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/RarNode;->mem:[B

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/RarNode;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/RarNode;->pos:I

    invoke-static {v0, v1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v0

    iput v0, p0, Lcom/github/junrar/unpack/ppm/RarNode;->next:I

    .line 43
    :cond_0
    iget v0, p0, Lcom/github/junrar/unpack/ppm/RarNode;->next:I

    return v0
.end method

.method public setNext(I)V
    .locals 2

    .line 51
    iput p1, p0, Lcom/github/junrar/unpack/ppm/RarNode;->next:I

    .line 52
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/RarNode;->mem:[B

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/RarNode;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/RarNode;->pos:I

    invoke-static {v0, v1, p1}, Lcom/github/junrar/io/Raw;->writeIntLittleEndian([BII)V

    :cond_0
    return-void
.end method

.method public setNext(Lcom/github/junrar/unpack/ppm/RarNode;)V
    .locals 0

    .line 47
    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/RarNode;->getAddress()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/github/junrar/unpack/ppm/RarNode;->setNext(I)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "State[\n  pos="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    iget v1, p0, Lcom/github/junrar/unpack/ppm/RarNode;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    const-string v1, "\n  size=4\n  next="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/RarNode;->getNext()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    const-string v1, "\n]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
