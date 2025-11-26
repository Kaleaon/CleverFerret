.class abstract Lcom/flyersoft/staticlayout/SHArrayUtils;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createCopy([BII)[B
    .locals 1

    .line 28
    new-array p2, p2, [B

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 30
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2
.end method

.method public static createCopy([CII)[C
    .locals 1

    .line 36
    new-array p2, p2, [C

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 38
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2
.end method

.method public static createCopy([III)[I
    .locals 1

    .line 44
    new-array p2, p2, [I

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 46
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2
.end method

.method public static createCopy([Ljava/lang/String;II)[Ljava/lang/String;
    .locals 1

    .line 52
    new-array p2, p2, [Ljava/lang/String;

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 54
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2
.end method

.method public static createCopy([ZII)[Z
    .locals 1

    .line 20
    new-array p2, p2, [Z

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 22
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2
.end method
