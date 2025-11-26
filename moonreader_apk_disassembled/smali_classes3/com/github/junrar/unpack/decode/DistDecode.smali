.class public Lcom/github/junrar/unpack/decode/DistDecode;
.super Lcom/github/junrar/unpack/decode/Decode;
.source "DistDecode.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/github/junrar/unpack/decode/Decode;-><init>()V

    const/16 v0, 0x3c

    .line 32
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/github/junrar/unpack/decode/DistDecode;->decodeNum:[I

    return-void
.end method
