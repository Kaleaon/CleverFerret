.class public Lcom/github/junrar/unpack/ppm/State;
.super Lcom/github/junrar/unpack/ppm/Pointer;
.source "State.java"


# static fields
.field public static final size:I = 0x6


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/github/junrar/unpack/ppm/Pointer;-><init>([B)V

    return-void
.end method

.method public static ppmdSwap(Lcom/github/junrar/unpack/ppm/State;Lcom/github/junrar/unpack/ppm/State;)V
    .locals 5

    .line 95
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget-object v1, p1, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    .line 96
    iget p0, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    iget p1, p1, Lcom/github/junrar/unpack/ppm/State;->pos:I

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x6

    if-ge v2, v3, :cond_0

    .line 97
    aget-byte v3, v0, p0

    .line 98
    aget-byte v4, v1, p1

    aput-byte v4, v0, p0

    .line 99
    aput-byte v3, v1, p1

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 p0, p0, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public decAddress()Lcom/github/junrar/unpack/ppm/State;
    .locals 1

    .line 85
    iget v0, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v0, v0, -0x6

    invoke-virtual {p0, v0}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    return-object p0
.end method

.method public getFreq()I
    .locals 2

    .line 51
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v1, v1, 0x1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public getSuccessor()I
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Lcom/github/junrar/io/Raw;->readIntLittleEndian([BI)I

    move-result v0

    return v0
.end method

.method public getSymbol()I
    .locals 2

    .line 43
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public incAddress()Lcom/github/junrar/unpack/ppm/State;
    .locals 1

    .line 90
    iget v0, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v0, v0, 0x6

    invoke-virtual {p0, v0}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    return-object p0
.end method

.method public incFreq(I)V
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v1, v1, 0x1

    aget-byte v2, v0, v1

    add-int/2addr v2, p1

    int-to-byte p1, v2

    aput-byte p1, v0, v1

    return-void
.end method

.method public init([B)Lcom/github/junrar/unpack/ppm/State;
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    return-object p0
.end method

.method public setFreq(I)V
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v1, v1, 0x1

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    return-void
.end method

.method public setSuccessor(I)V
    .locals 2

    .line 71
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    add-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1, p1}, Lcom/github/junrar/io/Raw;->writeIntLittleEndian([BII)V

    return-void
.end method

.method public setSuccessor(Lcom/github/junrar/unpack/ppm/PPMContext;)V
    .locals 0

    .line 67
    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/github/junrar/unpack/ppm/State;->setSuccessor(I)V

    return-void
.end method

.method public setSymbol(I)V
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    return-void
.end method

.method public setValues(Lcom/github/junrar/unpack/ppm/State;)V
    .locals 4

    .line 81
    iget-object v0, p1, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget p1, p1, Lcom/github/junrar/unpack/ppm/State;->pos:I

    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/State;->mem:[B

    iget v2, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    const/4 v3, 0x6

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public setValues(Lcom/github/junrar/unpack/ppm/StateRef;)V
    .locals 1

    .line 75
    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/junrar/unpack/ppm/State;->setSymbol(I)V

    .line 76
    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/StateRef;->getFreq()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/junrar/unpack/ppm/State;->setFreq(I)V

    .line 77
    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/StateRef;->getSuccessor()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/github/junrar/unpack/ppm/State;->setSuccessor(I)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "State[\n  pos="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    iget v1, p0, Lcom/github/junrar/unpack/ppm/State;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    const-string v1, "\n  size=6\n  symbol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    const-string v1, "\n  freq="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    const-string v1, "\n  successor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    const-string v1, "\n]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
