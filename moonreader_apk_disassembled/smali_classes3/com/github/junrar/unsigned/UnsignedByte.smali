.class public Lcom/github/junrar/unsigned/UnsignedByte;
.super Ljava/lang/Object;
.source "UnsignedByte.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add(BB)S
    .locals 0

    add-int/2addr p0, p1

    int-to-short p0, p0

    return p0
.end method

.method public static intToByte(I)B
    .locals 0

    and-int/lit16 p0, p0, 0xff

    int-to-byte p0, p0

    return p0
.end method

.method public static longToByte(J)B
    .locals 2

    const-wide/16 v0, 0xff

    and-long/2addr p0, v0

    long-to-int p1, p0

    int-to-byte p0, p1

    return p0
.end method

.method public static shortToByte(S)B
    .locals 0

    and-int/lit16 p0, p0, 0xff

    int-to-byte p0, p0

    return p0
.end method

.method public static sub(BB)S
    .locals 0

    sub-int/2addr p0, p1

    int-to-short p0, p0

    return p0
.end method
