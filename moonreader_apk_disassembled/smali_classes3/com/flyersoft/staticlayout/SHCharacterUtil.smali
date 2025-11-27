.class abstract Lcom/flyersoft/staticlayout/SHCharacterUtil;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isLetter(C)Z
    .locals 1

    const/16 v0, 0x61

    if-gt v0, p0, :cond_0

    const/16 v0, 0x7a

    if-le p0, v0, :cond_6

    :cond_0
    const/16 v0, 0x41

    if-gt v0, p0, :cond_1

    const/16 v0, 0x5a

    if-le p0, v0, :cond_6

    :cond_1
    const/16 v0, 0x27

    if-eq p0, v0, :cond_6

    const/16 v0, 0x5e

    if-eq p0, v0, :cond_6

    const/16 v0, 0xc0

    if-gt v0, p0, :cond_2

    const/16 v0, 0xff

    if-gt p0, v0, :cond_2

    const/16 v0, 0xd7

    if-eq p0, v0, :cond_2

    const/16 v0, 0xf7

    if-ne p0, v0, :cond_6

    :cond_2
    const/16 v0, 0x100

    if-gt v0, p0, :cond_3

    const/16 v0, 0x178

    if-le p0, v0, :cond_6

    :cond_3
    const/16 v0, 0x410

    if-gt v0, p0, :cond_4

    const/16 v0, 0x44f

    if-le p0, v0, :cond_6

    :cond_4
    const/16 v0, 0x401

    if-eq p0, v0, :cond_6

    const/16 v0, 0x451

    if-ne p0, v0, :cond_5

    goto :goto_0

    :cond_5
    const/4 p0, 0x0

    return p0

    :cond_6
    :goto_0
    const/4 p0, 0x1

    return p0
.end method
