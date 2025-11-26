.class public Lcom/github/junrar/unpack/vm/VMPreparedOperand;
.super Ljava/lang/Object;
.source "VMPreparedOperand.java"


# instance fields
.field private Base:I

.field private Data:I

.field private Type:Lcom/github/junrar/unpack/vm/VMOpType;

.field private offset:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBase()I
    .locals 1

    .line 34
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->Base:I

    return v0
.end method

.method public getData()I
    .locals 1

    .line 40
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->Data:I

    return v0
.end method

.method public getOffset()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->offset:I

    return v0
.end method

.method public getType()Lcom/github/junrar/unpack/vm/VMOpType;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->Type:Lcom/github/junrar/unpack/vm/VMOpType;

    return-object v0
.end method

.method public setBase(I)V
    .locals 0

    .line 37
    iput p1, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->Base:I

    return-void
.end method

.method public setData(I)V
    .locals 0

    .line 43
    iput p1, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->Data:I

    return-void
.end method

.method public setOffset(I)V
    .locals 0

    .line 55
    iput p1, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->offset:I

    return-void
.end method

.method public setType(Lcom/github/junrar/unpack/vm/VMOpType;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/github/junrar/unpack/vm/VMPreparedOperand;->Type:Lcom/github/junrar/unpack/vm/VMOpType;

    return-void
.end method
