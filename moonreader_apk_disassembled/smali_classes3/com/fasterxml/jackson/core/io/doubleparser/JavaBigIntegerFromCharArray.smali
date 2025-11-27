.class Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;
.source "JavaBigIntegerFromCharArray.java"


# static fields
.field private static final MAX_DECIMAL_DIGITS:I = 0x268826a1

.field private static final MAX_HEX_DIGITS:I = 0x20000000

.field public static final MAX_INPUT_LENGTH:I = 0x4d0e4c1e


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;-><init>()V

    return-void
.end method

.method private parseDecDigits([CIIZ)Ljava/math/BigInteger;
    .locals 8

    sub-int v0, p3, p2

    const/16 v1, 0x12

    if-le v0, v1, :cond_0

    .line 69
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;->parseManyDecDigits([CIIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    :cond_0
    and-int/lit8 v0, v0, 0x7

    add-int/2addr v0, p2

    .line 72
    invoke-static {p1, p2, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseUpTo7Digits([CII)I

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

    .line 75
    invoke-static {p1, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseEightDigits([CI)I

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

    .line 82
    :cond_4
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 80
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private parseHexDigits([CIIZ)Ljava/math/BigInteger;
    .locals 15

    move-object/from16 v0, p1

    move/from16 v1, p3

    .line 86
    invoke-direct/range {p0 .. p3}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;->skipZeroes([CII)I

    move-result v2

    sub-int v3, v1, v2

    if-gtz v3, :cond_0

    .line 89
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    return-object v0

    :cond_0
    const/high16 v4, 0x20000000

    if-gt v3, v4, :cond_c

    add-int/lit8 v4, v3, 0x1

    const/4 v5, 0x1

    shr-int/2addr v4, v5

    add-int/2addr v4, v5

    .line 94
    new-array v4, v4, [B

    and-int/2addr v3, v5

    const/4 v6, 0x0

    if-eqz v3, :cond_2

    add-int/lit8 v3, v2, 0x1

    .line 99
    aget-char v2, v0, v2

    .line 100
    sget-object v7, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;->CHAR_TO_HEX_MAP:[B

    aget-byte v2, v7, v2

    int-to-byte v7, v2

    .line 101
    aput-byte v7, v4, v5

    if-gez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    const/4 v7, 0x2

    move v14, v3

    move v3, v2

    move v2, v14

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    const/4 v7, 0x1

    :goto_1
    sub-int v8, v1, v2

    and-int/lit8 v8, v8, 0x7

    add-int/2addr v8, v2

    :goto_2
    if-ge v2, v8, :cond_7

    .line 106
    aget-char v9, v0, v2

    add-int/lit8 v10, v2, 0x1

    .line 107
    aget-char v10, v0, v10

    const/4 v11, -0x1

    const/16 v12, 0x80

    if-lt v9, v12, :cond_3

    const/4 v9, -0x1

    goto :goto_3

    .line 108
    :cond_3
    sget-object v13, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;->CHAR_TO_HEX_MAP:[B

    aget-byte v9, v13, v9

    :goto_3
    if-lt v10, v12, :cond_4

    goto :goto_4

    .line 109
    :cond_4
    sget-object v11, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;->CHAR_TO_HEX_MAP:[B

    aget-byte v11, v11, v10

    :goto_4
    add-int/lit8 v10, v7, 0x1

    shl-int/lit8 v12, v9, 0x4

    or-int/2addr v12, v11

    int-to-byte v12, v12

    .line 110
    aput-byte v12, v4, v7

    if-ltz v9, :cond_6

    if-gez v11, :cond_5

    goto :goto_5

    :cond_5
    const/4 v7, 0x0

    goto :goto_6

    :cond_6
    :goto_5
    const/4 v7, 0x1

    :goto_6
    or-int/2addr v3, v7

    add-int/lit8 v2, v2, 0x2

    move v7, v10

    goto :goto_2

    :cond_7
    :goto_7
    if-ge v2, v1, :cond_9

    .line 114
    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseEightHexDigits([CI)J

    move-result-wide v8

    long-to-int v10, v8

    .line 115
    invoke-static {v4, v7, v10}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->writeIntBE([BII)V

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-gez v12, :cond_8

    const/4 v8, 0x1

    goto :goto_8

    :cond_8
    const/4 v8, 0x0

    :goto_8
    or-int/2addr v3, v8

    add-int/lit8 v2, v2, 0x8

    add-int/lit8 v7, v7, 0x4

    goto :goto_7

    :cond_9
    if-nez v3, :cond_b

    .line 121
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, v4}, Ljava/math/BigInteger;-><init>([B)V

    if-eqz p4, :cond_a

    .line 122
    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    :cond_a
    return-object v0

    .line 119
    :cond_b
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "illegal syntax"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_c
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "value exceeds limits"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private parseManyDecDigits([CIIZ)Ljava/math/BigInteger;
    .locals 2

    .line 126
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;->skipZeroes([CII)I

    move-result p2

    sub-int v0, p3, p2

    const v1, 0x268826a1

    if-gt v0, v1, :cond_1

    .line 131
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->fillPowersOf10Floor16(II)Ljava/util/NavigableMap;

    move-result-object v0

    .line 132
    invoke-static {p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskCharArray;->parseDigitsRecursive([CIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    if-eqz p4, :cond_0

    .line 133
    invoke-virtual {p1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object p1

    :cond_0
    return-object p1

    .line 129
    :cond_1
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "value exceeds limits"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private skipZeroes([CII)I
    .locals 2

    :goto_0
    add-int/lit8 v0, p3, -0x8

    if-ge p2, v0, :cond_0

    .line 137
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isEightZeroes([CI)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 p2, p2, 0x8

    goto :goto_0

    :cond_0
    :goto_1
    if-ge p2, p3, :cond_1

    .line 140
    aget-char v0, p1, p2

    const/16 v1, 0x30

    if-ne v0, v1, :cond_1

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_1
    return p2
.end method


# virtual methods
.method public parseBigIntegerLiteral([CIII)Ljava/math/BigInteger;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    add-int v0, p2, p3

    if-ltz p2, :cond_6

    if-lt v0, p2, :cond_6

    .line 36
    :try_start_0
    array-length v1, p1

    if-gt v0, v1, :cond_6

    const v1, 0x4d0e4c1e    # 1.49209568E8f

    if-gt p3, v1, :cond_6

    .line 42
    aget-char v1, p1, p2

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

    .line 45
    invoke-static {p1, v1, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;->charAt([CII)C

    move-result v3

    if-eqz v3, :cond_5

    :goto_2
    const/16 v3, 0xa

    if-eq p4, v3, :cond_4

    const/16 v3, 0x10

    if-eq p4, v3, :cond_3

    .line 57
    new-instance v0, Ljava/math/BigInteger;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-direct {v0, v1, p4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    return-object v0

    .line 55
    :cond_3
    invoke-direct {p0, p1, v1, v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;->parseHexDigits([CIIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 53
    :cond_4
    invoke-direct {p0, p1, v1, v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromCharArray;->parseDecDigits([CIIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 47
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 37
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "offset < 0 or length > str.length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 60
    new-instance p2, Ljava/lang/NumberFormatException;

    const-string p3, "value exceeds limits"

    invoke-direct {p2, p3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p2, p1}, Ljava/lang/NumberFormatException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 62
    throw p2
.end method
