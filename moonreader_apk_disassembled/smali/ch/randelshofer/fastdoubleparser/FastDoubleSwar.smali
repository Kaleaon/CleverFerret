.class Lch/randelshofer/fastdoubleparser/FastDoubleSwar;
.super Ljava/lang/Object;
.source "FastDoubleSwar.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fma(DDD)D
    .locals 0

    mul-double p0, p0, p2

    add-double/2addr p0, p4

    return-wide p0
.end method

.method protected static isDigit(B)Z
    .locals 1

    add-int/lit8 p0, p0, -0x30

    int-to-char p0, p0

    const/16 v0, 0xa

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method protected static isDigit(C)Z
    .locals 1

    add-int/lit8 p0, p0, -0x30

    int-to-char p0, p0

    const/16 v0, 0xa

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isEightDigits(Ljava/lang/CharSequence;I)Z
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_0

    add-int v2, v1, p1

    .line 87
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 88
    invoke-static {v2}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v2

    and-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public static isEightDigits([BI)Z
    .locals 0

    .line 60
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->readLongLE([BI)J

    move-result-wide p0

    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isEightDigitsUtf8(J)Z

    move-result p0

    return p0
.end method

.method public static isEightDigits([CI)Z
    .locals 9

    .line 73
    aget-char v0, p0, p1

    int-to-long v0, v0

    add-int/lit8 v2, p1, 0x1

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v5, 0x20

    shl-long/2addr v2, v5

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v6, 0x30

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    .line 77
    aget-char v2, p0, v2

    int-to-long v2, v2

    add-int/lit8 v7, p1, 0x5

    aget-char v7, p0, v7

    int-to-long v7, v7

    shl-long/2addr v7, v4

    or-long/2addr v2, v7

    add-int/lit8 v4, p1, 0x6

    aget-char v4, p0, v4

    int-to-long v7, v4

    shl-long v4, v7, v5

    or-long/2addr v2, v4

    add-int/lit8 p1, p1, 0x7

    aget-char p0, p0, p1

    int-to-long p0, p0

    shl-long/2addr p0, v6

    or-long/2addr p0, v2

    .line 81
    invoke-static {v0, v1, p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isEightDigitsUtf16(JJ)Z

    move-result p0

    return p0
.end method

.method public static isEightDigitsUtf16(JJ)Z
    .locals 6

    const-wide v0, 0x30003000300030L

    sub-long v2, p0, v0

    sub-long v0, p2, v0

    const-wide v4, 0x46004600460046L    # 2.447700077935472E-307

    add-long/2addr p0, v4

    or-long/2addr p0, v2

    add-long/2addr p2, v4

    or-long/2addr p2, v0

    or-long/2addr p0, p2

    const-wide p2, -0x7f007f007f0080L

    and-long/2addr p0, p2

    const-wide/16 p2, 0x0

    cmp-long v0, p0, p2

    if-nez v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isEightDigitsUtf8(J)Z
    .locals 4

    const-wide v0, 0x3030303030303030L    # 1.398043286095289E-76

    sub-long v0, p0, v0

    const-wide v2, 0x4646464646464646L    # 3.5295369653413445E30

    add-long/2addr p0, v2

    or-long/2addr p0, v0

    const-wide v0, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr p0, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isEightZeroes(Ljava/lang/CharSequence;I)Z
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    :goto_0
    const/16 v4, 0x8

    if-ge v2, v4, :cond_1

    add-int v4, v2, p1

    .line 119
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0x30

    if-ne v5, v4, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    and-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v3
.end method

.method public static isEightZeroes([BI)Z
    .locals 0

    .line 113
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->readLongLE([BI)J

    move-result-wide p0

    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isEightZeroesUtf8(J)Z

    move-result p0

    return p0
.end method

.method public static isEightZeroes([CI)Z
    .locals 9

    .line 134
    aget-char v0, p0, p1

    int-to-long v0, v0

    add-int/lit8 v2, p1, 0x1

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v5, 0x20

    shl-long/2addr v2, v5

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v6, 0x30

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    .line 138
    aget-char v2, p0, v2

    int-to-long v2, v2

    add-int/lit8 v7, p1, 0x5

    aget-char v7, p0, v7

    int-to-long v7, v7

    shl-long/2addr v7, v4

    or-long/2addr v2, v7

    add-int/lit8 v4, p1, 0x6

    aget-char v4, p0, v4

    int-to-long v7, v4

    shl-long v4, v7, v5

    or-long/2addr v2, v4

    add-int/lit8 p1, p1, 0x7

    aget-char p0, p0, p1

    int-to-long p0, p0

    shl-long/2addr p0, v6

    or-long/2addr p0, v2

    .line 142
    invoke-static {v0, v1, p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isEightZeroesUtf16(JJ)Z

    move-result p0

    return p0
.end method

.method public static isEightZeroesUtf16(JJ)Z
    .locals 3

    const-wide v0, 0x30003000300030L

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    cmp-long p0, p2, v0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isEightZeroesUtf8(J)Z
    .locals 3

    const-wide v0, 0x3030303030303030L    # 1.398043286095289E-76

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static parseEightDigitsUtf16(JJ)I
    .locals 3

    const-wide v0, 0x30003000300030L

    sub-long/2addr p0, v0

    sub-long/2addr p2, v0

    const-wide v0, 0x3e80064000a0001L

    mul-long p2, p2, v0

    const/16 v2, 0x30

    ushr-long/2addr p2, v2

    long-to-int p3, p2

    mul-long p0, p0, v0

    ushr-long/2addr p0, v2

    long-to-int p1, p0

    mul-int/lit16 p1, p1, 0x2710

    add-int/2addr p3, p1

    return p3
.end method

.method public static readIntBE([BI)I
    .locals 2

    .line 162
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    or-int/2addr p0, v0

    return p0
.end method

.method public static readIntLE([BI)I
    .locals 2

    add-int/lit8 v0, p1, 0x3

    .line 169
    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    or-int/2addr p0, v0

    return p0
.end method

.method public static readLongBE([BI)J
    .locals 7

    .line 176
    aget-byte v0, p0, p1

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    const/16 v4, 0x38

    shl-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x4

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x5

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x6

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 p1, p1, 0x7

    aget-byte p0, p0, p1

    int-to-long p0, p0

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static readLongLE([BI)J
    .locals 7

    add-int/lit8 v0, p1, 0x7

    .line 187
    aget-byte v0, p0, v0

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    const/16 v4, 0x38

    shl-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x6

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x5

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x4

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    aget-byte p0, p0, p1

    int-to-long p0, p0

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static tryToParseEightDigits(Ljava/lang/CharSequence;I)I
    .locals 9

    .line 234
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    int-to-long v0, v0

    add-int/lit8 v2, p1, 0x1

    .line 235
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    .line 236
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    int-to-long v2, v2

    const/16 v5, 0x20

    shl-long/2addr v2, v5

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    .line 237
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    int-to-long v2, v2

    const/16 v6, 0x30

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    .line 238
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    int-to-long v2, v2

    add-int/lit8 v7, p1, 0x5

    .line 239
    invoke-interface {p0, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    int-to-long v7, v7

    shl-long/2addr v7, v4

    or-long/2addr v2, v7

    add-int/lit8 v4, p1, 0x6

    .line 240
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    int-to-long v7, v4

    shl-long v4, v7, v5

    or-long/2addr v2, v4

    add-int/lit8 p1, p1, 0x7

    .line 241
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    int-to-long p0, p0

    shl-long/2addr p0, v6

    or-long/2addr p0, v2

    .line 242
    invoke-static {v0, v1, p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigitsUtf16(JJ)I

    move-result p0

    return p0
.end method

.method public static tryToParseEightDigits([BI)I
    .locals 0

    .line 221
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->readLongLE([BI)J

    move-result-wide p0

    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigitsUtf8(J)I

    move-result p0

    return p0
.end method

.method public static tryToParseEightDigits([CI)I
    .locals 9

    .line 209
    aget-char v0, p0, p1

    int-to-long v0, v0

    add-int/lit8 v2, p1, 0x1

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v5, 0x20

    shl-long/2addr v2, v5

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v6, 0x30

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    .line 213
    aget-char v2, p0, v2

    int-to-long v2, v2

    add-int/lit8 v7, p1, 0x5

    aget-char v7, p0, v7

    int-to-long v7, v7

    shl-long/2addr v7, v4

    or-long/2addr v2, v7

    add-int/lit8 v4, p1, 0x6

    aget-char v4, p0, v4

    int-to-long v7, v4

    shl-long v4, v7, v5

    or-long/2addr v2, v4

    add-int/lit8 p1, p1, 0x7

    aget-char p0, p0, p1

    int-to-long p0, p0

    shl-long/2addr p0, v6

    or-long/2addr p0, v2

    .line 217
    invoke-static {v0, v1, p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigitsUtf16(JJ)I

    move-result p0

    return p0
.end method

.method public static tryToParseEightDigitsUtf16(JJ)I
    .locals 6

    const-wide v0, 0x30003000300030L

    sub-long v2, p0, v0

    sub-long v0, p2, v0

    const-wide v4, 0x46004600460046L    # 2.447700077935472E-307

    add-long/2addr p0, v4

    or-long/2addr p0, v2

    add-long/2addr p2, v4

    or-long/2addr p2, v0

    or-long/2addr p0, p2

    const-wide p2, -0x7f007f007f0080L

    and-long/2addr p0, p2

    const-wide/16 p2, 0x0

    cmp-long v4, p0, p2

    if-eqz v4, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const-wide p0, 0x3e80064000a0001L

    mul-long v0, v0, p0

    const/16 p2, 0x30

    ushr-long/2addr v0, p2

    long-to-int p3, v0

    mul-long v2, v2, p0

    ushr-long p0, v2, p2

    long-to-int p1, p0

    mul-int/lit16 p1, p1, 0x2710

    add-int/2addr p3, p1

    return p3
.end method

.method public static tryToParseEightDigitsUtf8(J)I
    .locals 6

    const-wide v0, 0x3030303030303030L    # 1.398043286095289E-76

    sub-long v0, p0, v0

    const-wide v2, 0x4646464646464646L    # 3.5295369653413445E30

    add-long/2addr p0, v2

    or-long/2addr p0, v0

    const-wide v2, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr p0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, p0, v2

    if-eqz v4, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const-wide/16 p0, 0xa

    mul-long p0, p0, v0

    const/16 v2, 0x8

    ushr-long/2addr v0, v2

    add-long/2addr p0, v0

    const-wide v0, 0xff000000ffL

    and-long v2, p0, v0

    const-wide v4, 0xf424000000064L

    mul-long v2, v2, v4

    const/16 v4, 0x10

    ushr-long/2addr p0, v4

    and-long/2addr p0, v0

    const-wide v0, 0x271000000001L

    mul-long p0, p0, v0

    add-long/2addr v2, p0

    const/16 p0, 0x20

    ushr-long p0, v2, p0

    long-to-int p1, p0

    return p1
.end method

.method public static tryToParseEightDigitsUtf8([BI)I
    .locals 0

    .line 287
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->readLongLE([BI)J

    move-result-wide p0

    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigitsUtf8(J)I

    move-result p0

    return p0
.end method

.method public static tryToParseEightHexDigits(Ljava/lang/CharSequence;I)J
    .locals 9

    .line 339
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    int-to-long v0, v0

    const/16 v2, 0x30

    shl-long/2addr v0, v2

    add-int/lit8 v3, p1, 0x1

    .line 340
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    int-to-long v3, v3

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    or-long/2addr v0, v3

    add-int/lit8 v3, p1, 0x2

    .line 341
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    int-to-long v3, v3

    const/16 v6, 0x10

    shl-long/2addr v3, v6

    or-long/2addr v0, v3

    add-int/lit8 v3, p1, 0x3

    .line 342
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    int-to-long v3, v3

    or-long/2addr v0, v3

    add-int/lit8 v3, p1, 0x4

    .line 344
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    int-to-long v3, v3

    shl-long v2, v3, v2

    add-int/lit8 v4, p1, 0x5

    .line 345
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    int-to-long v7, v4

    shl-long v4, v7, v5

    or-long/2addr v2, v4

    add-int/lit8 v4, p1, 0x6

    .line 346
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    int-to-long v4, v4

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    add-int/lit8 p1, p1, 0x7

    .line 347
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    int-to-long p0, p0

    or-long/2addr p0, v2

    .line 349
    invoke-static {v0, v1, p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightHexDigitsUtf16(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static tryToParseEightHexDigits([BI)J
    .locals 0

    .line 386
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->readLongBE([BI)J

    move-result-wide p0

    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightHexDigitsUtf8(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static tryToParseEightHexDigits([CI)J
    .locals 9

    .line 364
    aget-char v0, p0, p1

    int-to-long v0, v0

    const/16 v2, 0x30

    shl-long/2addr v0, v2

    add-int/lit8 v3, p1, 0x1

    aget-char v3, p0, v3

    int-to-long v3, v3

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    or-long/2addr v0, v3

    add-int/lit8 v3, p1, 0x2

    aget-char v3, p0, v3

    int-to-long v3, v3

    const/16 v6, 0x10

    shl-long/2addr v3, v6

    or-long/2addr v0, v3

    add-int/lit8 v3, p1, 0x3

    aget-char v3, p0, v3

    int-to-long v3, v3

    or-long/2addr v0, v3

    add-int/lit8 v3, p1, 0x4

    .line 369
    aget-char v3, p0, v3

    int-to-long v3, v3

    shl-long v2, v3, v2

    add-int/lit8 v4, p1, 0x5

    aget-char v4, p0, v4

    int-to-long v7, v4

    shl-long v4, v7, v5

    or-long/2addr v2, v4

    add-int/lit8 v4, p1, 0x6

    aget-char v4, p0, v4

    int-to-long v4, v4

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    add-int/lit8 p1, p1, 0x7

    aget-char p0, p0, p1

    int-to-long p0, p0

    or-long/2addr p0, v2

    .line 374
    invoke-static {v0, v1, p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightHexDigitsUtf16(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static tryToParseEightHexDigitsUtf16(JJ)J
    .locals 1

    .line 412
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseFourHexDigitsUtf16(J)J

    move-result-wide p0

    .line 413
    invoke-static {p2, p3}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseFourHexDigitsUtf16(J)J

    move-result-wide p2

    const/16 v0, 0x10

    shl-long/2addr p0, v0

    or-long/2addr p0, p2

    return-wide p0
.end method

.method public static tryToParseEightHexDigitsUtf8(J)J
    .locals 8

    const-wide v0, 0x2020202020202020L    # 6.013470016999068E-154

    or-long/2addr p0, v0

    const-wide v0, 0x3030303030303030L    # 1.398043286095289E-76

    sub-long v0, p0, v0

    const-wide v2, -0x4646464646464646L

    sub-long v2, p0, v2

    const-wide v4, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v2, v4

    const-wide v6, -0x1f1f1f1f1f1f1f1fL    # -4.634680647717984E158

    sub-long/2addr p0, v6

    and-long/2addr p0, v4

    const-wide v4, 0x7f7f7f7f7f7f7f7fL    # 1.3824172084878715E306

    xor-long/2addr v4, v0

    const-wide v6, 0x3737373737373737L    # 1.0410273767909543E-42

    add-long/2addr v4, v6

    and-long/2addr p0, v4

    cmp-long v4, v2, p0

    if-eqz v4, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_0
    const/4 p0, 0x7

    ushr-long p0, v2, p0

    const-wide/16 v2, 0xff

    mul-long p0, p0, v2

    not-long v2, p0

    and-long/2addr v2, v0

    const-wide v4, 0x2727272727272727L    # 4.483094640249093E-120

    and-long/2addr p0, v4

    sub-long/2addr v0, p0

    or-long p0, v2, v0

    const/4 v0, 0x4

    ushr-long v0, p0, v0

    or-long/2addr p0, v0

    const-wide v0, 0xff00ff00ff00ffL

    and-long/2addr p0, v0

    const/16 v0, 0x8

    ushr-long v0, p0, v0

    or-long/2addr p0, v0

    const/16 v0, 0x10

    ushr-long v0, p0, v0

    const-wide v2, 0xffff0000L

    and-long/2addr v0, v2

    const-wide/32 v2, 0xffff

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static tryToParseFourDigits(Ljava/lang/CharSequence;I)I
    .locals 5

    .line 480
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    int-to-long v0, v0

    add-int/lit8 v2, p1, 0x1

    .line 481
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    .line 482
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 p1, p1, 0x3

    .line 483
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    int-to-long p0, p0

    const/16 v2, 0x30

    shl-long/2addr p0, v2

    or-long/2addr p0, v0

    .line 485
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseFourDigitsUtf16(J)I

    move-result p0

    return p0
.end method

.method public static tryToParseFourDigits([BI)I
    .locals 0

    .line 489
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->readIntLE([BI)I

    move-result p0

    invoke-static {p0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseFourDigitsUtf8(I)I

    move-result p0

    return p0
.end method

.method public static tryToParseFourDigits([CI)I
    .locals 5

    .line 472
    aget-char v0, p0, p1

    int-to-long v0, v0

    add-int/lit8 v2, p1, 0x1

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    aget-char v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 p1, p1, 0x3

    aget-char p0, p0, p1

    int-to-long p0, p0

    const/16 v2, 0x30

    shl-long/2addr p0, v2

    or-long/2addr p0, v0

    .line 476
    invoke-static {p0, p1}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseFourDigitsUtf16(J)I

    move-result p0

    return p0
.end method

.method public static tryToParseFourDigitsUtf16(J)I
    .locals 5

    const-wide v0, 0x30003000300030L

    sub-long v0, p0, v0

    const-wide v2, 0x46004600460046L    # 2.447700077935472E-307

    add-long/2addr p0, v2

    or-long/2addr p0, v0

    const-wide v2, -0x7f007f007f0080L

    and-long/2addr p0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, p0, v2

    if-eqz v4, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const-wide p0, 0x3e80064000a0001L

    mul-long v0, v0, p0

    const/16 p0, 0x30

    ushr-long p0, v0, p0

    long-to-int p1, p0

    return p1
.end method

.method public static tryToParseFourDigitsUtf8(I)I
    .locals 5

    const v0, 0x30303030

    sub-int v0, p0, v0

    const v1, 0x46464646

    add-int/2addr p0, v1

    or-int/2addr p0, v0

    const v1, -0x7f7f7f80

    and-int/2addr p0, v1

    int-to-long v1, p0

    const-wide/16 v3, 0x0

    cmp-long p0, v1, v3

    if-eqz p0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    mul-int/lit16 v0, v0, 0xa01

    ushr-int/lit8 p0, v0, 0x8

    and-int/lit16 v0, p0, 0xff

    mul-int/lit8 v0, v0, 0x64

    const/high16 v1, 0xff0000

    and-int/2addr p0, v1

    shr-int/lit8 p0, p0, 0x10

    add-int/2addr v0, p0

    return v0
.end method

.method public static tryToParseFourHexDigitsUtf16(J)J
    .locals 8

    const-wide v0, 0x30003000300030L

    sub-long v0, p0, v0

    const-wide v2, -0x7fc67fc67fc67fc6L

    sub-long v2, p0, v2

    const-wide v4, -0x7fff7fff7fff8000L    # -6.9534619092435E-310

    and-long/2addr v2, v4

    const-wide v6, -0x7f9f7f9f7f9f7f9fL    # -7.34339901537283E-307

    sub-long/2addr p0, v6

    and-long/2addr p0, v4

    const-wide v4, 0x7fff7fff7fff7fffL

    xor-long/2addr v4, v0

    const-wide v6, 0x37003700370037L

    add-long/2addr v4, v6

    and-long/2addr p0, v4

    cmp-long v4, v2, p0

    if-eqz v4, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_0
    const/16 p0, 0xf

    ushr-long p0, v2, p0

    const-wide/32 v2, 0xffff

    mul-long p0, p0, v2

    not-long v4, p0

    and-long/2addr v4, v0

    const-wide v6, 0x27002700270027L

    and-long/2addr p0, v6

    sub-long/2addr v0, p0

    or-long p0, v4, v0

    const/16 v0, 0xc

    ushr-long v0, p0, v0

    or-long/2addr p0, v0

    const/16 v0, 0x18

    ushr-long v0, p0, v0

    or-long/2addr p0, v0

    and-long/2addr p0, v2

    return-wide p0
.end method

.method public static tryToParseUpTo7Digits(Ljava/lang/CharSequence;II)I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 598
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 599
    invoke-static {v2}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v3

    and-int/2addr v1, v3

    mul-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, -0x30

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    return v0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static tryToParseUpTo7Digits([BII)I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 576
    aget-byte v2, p0, p1

    .line 577
    invoke-static {v2}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(B)Z

    move-result v3

    and-int/2addr v1, v3

    mul-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, -0x30

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    return v0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static tryToParseUpTo7Digits([CII)I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 587
    aget-char v2, p0, p1

    .line 588
    invoke-static {v2}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v3

    and-int/2addr v1, v3

    mul-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, -0x30

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    return v0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static writeIntBE([BII)V
    .locals 2

    ushr-int/lit8 v0, p2, 0x18

    int-to-byte v0, v0

    .line 606
    aput-byte v0, p0, p1

    add-int/lit8 v0, p1, 0x1

    ushr-int/lit8 v1, p2, 0x10

    int-to-byte v1, v1

    .line 607
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x2

    ushr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    .line 608
    aput-byte v1, p0, v0

    add-int/lit8 p1, p1, 0x3

    int-to-byte p2, p2

    .line 609
    aput-byte p2, p0, p1

    return-void
.end method

.method public static writeLongBE([BIJ)V
    .locals 3

    const/16 v0, 0x38

    ushr-long v0, p2, v0

    long-to-int v1, v0

    int-to-byte v0, v1

    .line 613
    aput-byte v0, p0, p1

    add-int/lit8 v0, p1, 0x1

    const/16 v1, 0x30

    ushr-long v1, p2, v1

    long-to-int v2, v1

    int-to-byte v1, v2

    .line 614
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x2

    const/16 v1, 0x28

    ushr-long v1, p2, v1

    long-to-int v2, v1

    int-to-byte v1, v2

    .line 615
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x3

    const/16 v1, 0x20

    ushr-long v1, p2, v1

    long-to-int v2, v1

    int-to-byte v1, v2

    .line 616
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x4

    const/16 v1, 0x18

    ushr-long v1, p2, v1

    long-to-int v2, v1

    int-to-byte v1, v2

    .line 617
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x5

    const/16 v1, 0x10

    ushr-long v1, p2, v1

    long-to-int v2, v1

    int-to-byte v1, v2

    .line 618
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x6

    const/16 v1, 0x8

    ushr-long v1, p2, v1

    long-to-int v2, v1

    int-to-byte v1, v2

    .line 619
    aput-byte v1, p0, v0

    add-int/lit8 p1, p1, 0x7

    long-to-int p3, p2

    int-to-byte p2, p3

    .line 620
    aput-byte p2, p0, p1

    return-void
.end method
