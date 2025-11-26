.class public Lorg/nibor/autolink/internal/Scanners;
.super Ljava/lang/Object;
.source "Scanners.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static findUrlEnd(Ljava/lang/CharSequence;I)I
    .locals 8

    const/4 v0, 0x0

    move v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 29
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-ge p1, v6, :cond_8

    .line 30
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/16 v7, 0x2c

    if-eq v6, v7, :cond_7

    const/16 v7, 0x5b

    if-eq v6, v7, :cond_6

    const/16 v7, 0x5d

    if-eq v6, v7, :cond_5

    const/16 v7, 0x7b

    if-eq v6, v7, :cond_4

    const/16 v7, 0x7d

    if-eq v6, v7, :cond_3

    const/16 v7, 0x2e

    if-eq v6, v7, :cond_7

    const/16 v7, 0x2f

    if-eq v6, v7, :cond_2

    const/16 v7, 0x3e

    if-eq v6, v7, :cond_8

    const/16 v7, 0x3f

    if-eq v6, v7, :cond_7

    packed-switch v6, :pswitch_data_0

    packed-switch v6, :pswitch_data_1

    packed-switch v6, :pswitch_data_2

    packed-switch v6, :pswitch_data_3

    goto :goto_1

    :pswitch_0
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_8

    goto :goto_1

    :pswitch_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :pswitch_2
    xor-int/lit8 v6, v2, 0x1

    if-eqz v2, :cond_0

    move v0, p1

    :cond_0
    move v2, v6

    goto :goto_2

    :pswitch_3
    xor-int/lit8 v6, v1, 0x1

    if-eqz v1, :cond_1

    move v0, p1

    :cond_1
    move v1, v6

    goto :goto_2

    :cond_2
    add-int/lit8 v6, p1, -0x1

    if-ne v0, v6, :cond_7

    :goto_1
    move v0, p1

    goto :goto_2

    :cond_3
    add-int/lit8 v5, v5, -0x1

    if-ltz v5, :cond_8

    goto :goto_1

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_8

    goto :goto_1

    :cond_6
    add-int/lit8 v4, v4, 0x1

    :cond_7
    :goto_2
    :pswitch_4
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_8
    :pswitch_5
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x27
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x3a
        :pswitch_4
        :pswitch_4
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x7f
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public static isAlnum(C)Z
    .locals 1

    .line 14
    invoke-static {p0}, Lorg/nibor/autolink/internal/Scanners;->isAlpha(C)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lorg/nibor/autolink/internal/Scanners;->isDigit(C)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isAlpha(C)Z
    .locals 1

    const/16 v0, 0x41

    if-lt p0, v0, :cond_0

    const/16 v0, 0x5a

    if-le p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_2

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_2

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public static isDigit(C)Z
    .locals 1

    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isNonAscii(C)Z
    .locals 1

    const/16 v0, 0x80

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
