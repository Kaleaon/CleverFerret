.class public Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;
.super Ljava/lang/Object;
.source "VMStandardFilterSignature.java"


# instance fields
.field private CRC:I

.field private length:I

.field private type:Lcom/github/junrar/unpack/vm/VMStandardFilters;


# direct methods
.method public constructor <init>(IILcom/github/junrar/unpack/vm/VMStandardFilters;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput p1, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->length:I

    .line 36
    iput p2, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->CRC:I

    .line 37
    iput-object p3, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->type:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    return-void
.end method


# virtual methods
.method public getCRC()I
    .locals 1

    .line 41
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->CRC:I

    return v0
.end method

.method public getLength()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->length:I

    return v0
.end method

.method public getType()Lcom/github/junrar/unpack/vm/VMStandardFilters;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->type:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    return-object v0
.end method

.method public setCRC(I)V
    .locals 0

    .line 45
    iput p1, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->CRC:I

    return-void
.end method

.method public setLength(I)V
    .locals 0

    .line 53
    iput p1, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->length:I

    return-void
.end method

.method public setType(Lcom/github/junrar/unpack/vm/VMStandardFilters;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/github/junrar/unpack/vm/VMStandardFilterSignature;->type:Lcom/github/junrar/unpack/vm/VMStandardFilters;

    return-void
.end method
