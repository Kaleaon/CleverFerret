.class Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;
.super Lch/randelshofer/fastdoubleparser/AbstractNumberParser;
.source "JavaBigIntegerFromCharSequence.java"


# static fields
.field private static final MAX_DECIMAL_DIGITS:I = 0x268826a1

.field private static final MAX_HEX_DIGITS:I = 0x20000000

.field public static final MAX_INPUT_LENGTH:I = 0x4d0e4c1e


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractNumberParser;-><init>()V

    return-void
.end method

.method private parseDecDigits(Ljava/lang/CharSequence;IIZ)Ljava/math/BigInteger;
    .locals 8

    sub-int v0, p3, p2

    const/16 v1, 0x12

    if-le v0, v1, :cond_0

    .line 68
    invoke-direct {p0, p1, p2, p3, p4}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseManyDecDigits(Ljava/lang/CharSequence;IIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    :cond_0
    and-int/lit8 v0, v0, 0x7

    add-int/2addr v0, p2

    .line 71
    invoke-static {p1, p2, v0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseUpTo7Digits(Ljava/lang/CharSequence;II)I

    move-result p2

    int-to-long v1, p2

    const-wide/16 v3, 0x0

    const/4 p2, 0x1

    const/4 v5, 0x0

    cmp-long v6, v1, v3

    if-ltz v6, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    if-ge v0, p3, :cond_3

    .line 74
    invoke-static {p1, v0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigits(Ljava/lang/CharSequence;I)I

    move-result v4

    if-ltz v4, :cond_2

    const/4 v6, 0x1

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_1
    and-int/2addr v3, v6

    const-wide/32 v6, 0x5f5e100

    mul-long v1, v1, v6

    int-to-long v6, v4

    add-long/2addr v1, v6

    add-int/lit8 v0, v0, 0x8

    goto :goto_0

    :cond_3
    if-eqz v3, :cond_5

    if-eqz p4, :cond_4

    neg-long v1, v1

    .line 81
    :cond_4
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 79
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private parseHexDigits(Ljava/lang/CharSequence;IIZ)Ljava/math/BigInteger;
    .locals 11

    .line 85
    invoke-direct {p0, p1, p2, p3}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->skipZeroes(Ljava/lang/CharSequence;II)I

    move-result p2

    sub-int v0, p3, p2

    if-gtz v0, :cond_0

    .line 88
    sget-object p1, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    return-object p1

    :cond_0
    const/high16 v1, 0x20000000

    if-gt v0, v1, :cond_a

    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x1

    shr-int/2addr v1, v2

    add-int/2addr v1, v2

    .line 93
    new-array v1, v1, [B

    and-int/2addr v0, v2

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    add-int/lit8 v0, p2, 0x1

    .line 97
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    .line 98
    invoke-static {p2}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->lookupHex(C)I

    move-result p2

    int-to-byte v4, p2

    .line 99
    aput-byte v4, v1, v2

    if-gez p2, :cond_1

    const/4 p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    const/4 v4, 0x2

    move v10, v0

    move v0, p2

    move p2, v10

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    const/4 v4, 0x1

    :goto_1
    sub-int v5, p3, p2

    and-int/lit8 v5, v5, 0x7

    add-int/2addr v5, p2

    :goto_2
    if-ge p2, v5, :cond_5

    .line 104
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    add-int/lit8 v7, p2, 0x1

    .line 105
    invoke-interface {p1, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    .line 106
    invoke-static {v6}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->lookupHex(C)I

    move-result v6

    .line 107
    invoke-static {v7}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->lookupHex(C)I

    move-result v7

    add-int/lit8 v8, v4, 0x1

    shl-int/lit8 v9, v6, 0x4

    or-int/2addr v9, v7

    int-to-byte v9, v9

    .line 108
    aput-byte v9, v1, v4

    if-ltz v7, :cond_4

    if-gez v6, :cond_3

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    goto :goto_4

    :cond_4
    :goto_3
    const/4 v4, 0x1

    :goto_4
    or-int/2addr v0, v4

    add-int/lit8 p2, p2, 0x2

    move v4, v8

    goto :goto_2

    :cond_5
    :goto_5
    if-ge p2, p3, :cond_7

    .line 112
    invoke-static {p1, p2}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightHexDigits(Ljava/lang/CharSequence;I)J

    move-result-wide v5

    long-to-int v7, v5

    .line 113
    invoke-static {v1, v4, v7}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->writeIntBE([BII)V

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-gez v9, :cond_6

    const/4 v5, 0x1

    goto :goto_6

    :cond_6
    const/4 v5, 0x0

    :goto_6
    or-int/2addr v0, v5

    add-int/lit8 p2, p2, 0x8

    add-int/lit8 v4, v4, 0x4

    goto :goto_5

    :cond_7
    if-nez v0, :cond_9

    .line 119
    new-instance p1, Ljava/math/BigInteger;

    invoke-direct {p1, v1}, Ljava/math/BigInteger;-><init>([B)V

    if-eqz p4, :cond_8

    .line 120
    invoke-virtual {p1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object p1

    :cond_8
    return-object p1

    .line 117
    :cond_9
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 91
    :cond_a
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "value exceeds limits"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private parseManyDecDigits(Ljava/lang/CharSequence;IIZ)Ljava/math/BigInteger;
    .locals 2

    .line 124
    invoke-direct {p0, p1, p2, p3}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->skipZeroes(Ljava/lang/CharSequence;II)I

    move-result p2

    sub-int v0, p3, p2

    const v1, 0x268826a1

    if-gt v0, v1, :cond_1

    .line 129
    invoke-static {p2, p3}, Lch/randelshofer/fastdoubleparser/FastIntegerMath;->fillPowersOf10Floor16(II)Ljava/util/NavigableMap;

    move-result-object v0

    .line 130
    invoke-static {p1, p2, p3, v0}, Lch/randelshofer/fastdoubleparser/ParseDigitsTaskCharSequence;->parseDigitsRecursive(Ljava/lang/CharSequence;IILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    if-eqz p4, :cond_0

    .line 131
    invoke-virtual {p1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object p1

    :cond_0
    return-object p1

    .line 127
    :cond_1
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "value exceeds limits"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private skipZeroes(Ljava/lang/CharSequence;II)I
    .locals 2

    :goto_0
    if-ge p2, p3, :cond_0

    .line 135
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-ne v0, v1, :cond_0

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return p2
.end method


# virtual methods
.method public parseBigIntegerLiteral(Ljava/lang/CharSequence;III)Ljava/math/BigInteger;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    add-int v0, p2, p3

    if-ltz p2, :cond_6

    if-lt v0, p2, :cond_6

    .line 35
    :try_start_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-gt v0, v1, :cond_6

    const v1, 0x4d0e4c1e    # 1.49209568E8f

    if-gt p3, v1, :cond_6

    .line 41
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0x2d

    if-ne v1, v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_2

    const/16 v3, 0x2b

    if-ne v1, v3, :cond_1

    goto :goto_1

    :cond_1
    move v1, p2

    goto :goto_2

    :cond_2
    :goto_1
    add-int/lit8 v1, p2, 0x1

    .line 44
    invoke-static {p1, v1, v0}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->charAt(Ljava/lang/CharSequence;II)C

    move-result v3

    if-eqz v3, :cond_5

    :goto_2
    const/16 v3, 0xa

    if-eq p4, v3, :cond_4

    const/16 v3, 0x10

    if-eq p4, v3, :cond_3

    .line 56
    new-instance v0, Ljava/math/BigInteger;

    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    return-object v0

    .line 54
    :cond_3
    invoke-direct {p0, p1, v1, v0, v2}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseHexDigits(Ljava/lang/CharSequence;IIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 52
    :cond_4
    invoke-direct {p0, p1, v1, v0, v2}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseDecDigits(Ljava/lang/CharSequence;IIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 46
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 36
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "offset < 0 or length > str.length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 59
    new-instance p2, Ljava/lang/NumberFormatException;

    const-string p3, "value exceeds limits"

    invoke-direct {p2, p3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p2, p1}, Ljava/lang/NumberFormatException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 61
    throw p2
.end method
