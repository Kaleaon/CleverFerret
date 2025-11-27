.class Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;
.source "JavaBigIntegerFromByteArray.java"


# static fields
.field private static final MAX_DECIMAL_DIGITS:I = 0x268826a1

.field private static final MAX_HEX_DIGITS:I = 0x20000000

.field public static final MAX_INPUT_LENGTH:I = 0x4d0e4c1e


# direct methods
.method constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;-><init>()V

    return-void
.end method

.method private parseDecDigits([BIIZ)Ljava/math/BigInteger;
    .locals 8

    sub-int v0, p3, p2

    const/16 v1, 0x12

    if-le v0, v1, :cond_0

    .line 75
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;->parseManyDecDigits([BIIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    :cond_0
    and-int/lit8 v0, v0, 0x7

    add-int/2addr v0, p2

    .line 78
    invoke-static {p1, p2, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseUpTo7Digits([BII)I

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

    .line 81
    invoke-static {p1, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseEightDigitsUtf8([BI)I

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

    .line 88
    :cond_4
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 86
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private parseHexDigits([BIIZ)Ljava/math/BigInteger;
    .locals 15

    move-object/from16 v0, p1

    move/from16 v1, p3

    .line 92
    invoke-direct/range {p0 .. p3}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;->skipZeroes([BII)I

    move-result v2

    sub-int v3, v1, v2

    if-gtz v3, :cond_0

    .line 95
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    return-object v0

    :cond_0
    const/high16 v4, 0x20000000

    if-gt v3, v4, :cond_d

    add-int/lit8 v4, v3, 0x1

    const/4 v5, 0x1

    shr-int/2addr v4, v5

    add-int/2addr v4, v5

    .line 100
    new-array v4, v4, [B

    and-int/2addr v3, v5

    const/4 v6, -0x1

    const/4 v7, 0x0

    if-eqz v3, :cond_3

    add-int/lit8 v3, v2, 0x1

    .line 105
    aget-byte v2, v0, v2

    if-gez v2, :cond_1

    const/4 v2, -0x1

    goto :goto_0

    .line 106
    :cond_1
    sget-object v8, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;->CHAR_TO_HEX_MAP:[B

    aget-byte v2, v8, v2

    :goto_0
    int-to-byte v8, v2

    .line 107
    aput-byte v8, v4, v5

    if-gez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    const/4 v8, 0x2

    move v14, v3

    move v3, v2

    move v2, v14

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    const/4 v8, 0x1

    :goto_2
    sub-int v9, v1, v2

    and-int/lit8 v9, v9, 0x7

    add-int/2addr v9, v2

    :goto_3
    if-ge v2, v9, :cond_8

    .line 112
    aget-byte v10, v0, v2

    add-int/lit8 v11, v2, 0x1

    .line 113
    aget-byte v11, v0, v11

    if-gez v10, :cond_4

    const/4 v10, -0x1

    goto :goto_4

    .line 114
    :cond_4
    sget-object v12, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;->CHAR_TO_HEX_MAP:[B

    aget-byte v10, v12, v10

    :goto_4
    if-gez v11, :cond_5

    const/4 v11, -0x1

    goto :goto_5

    .line 115
    :cond_5
    sget-object v12, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;->CHAR_TO_HEX_MAP:[B

    aget-byte v11, v12, v11

    :goto_5
    add-int/lit8 v12, v8, 0x1

    shl-int/lit8 v13, v10, 0x4

    or-int/2addr v13, v11

    int-to-byte v13, v13

    .line 116
    aput-byte v13, v4, v8

    if-ltz v10, :cond_7

    if-gez v11, :cond_6

    goto :goto_6

    :cond_6
    const/4 v8, 0x0

    goto :goto_7

    :cond_7
    :goto_6
    const/4 v8, 0x1

    :goto_7
    or-int/2addr v3, v8

    add-int/lit8 v2, v2, 0x2

    move v8, v12

    goto :goto_3

    :cond_8
    :goto_8
    if-ge v2, v1, :cond_a

    .line 120
    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseEightHexDigits([BI)J

    move-result-wide v9

    long-to-int v6, v9

    .line 121
    invoke-static {v4, v8, v6}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->writeIntBE([BII)V

    const-wide/16 v11, 0x0

    cmp-long v6, v9, v11

    if-gez v6, :cond_9

    const/4 v6, 0x1

    goto :goto_9

    :cond_9
    const/4 v6, 0x0

    :goto_9
    or-int/2addr v3, v6

    add-int/lit8 v2, v2, 0x8

    add-int/lit8 v8, v8, 0x4

    goto :goto_8

    :cond_a
    if-nez v3, :cond_c

    .line 127
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, v4}, Ljava/math/BigInteger;-><init>([B)V

    if-eqz p4, :cond_b

    .line 128
    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    :cond_b
    return-object v0

    .line 125
    :cond_c
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "illegal syntax"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_d
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "value exceeds limits"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private parseManyDecDigits([BIIZ)Ljava/math/BigInteger;
    .locals 2

    .line 132
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;->skipZeroes([BII)I

    move-result p2

    sub-int v0, p3, p2

    const v1, 0x268826a1

    if-gt v0, v1, :cond_1

    .line 137
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->fillPowersOf10Floor16(II)Ljava/util/NavigableMap;

    move-result-object v0

    .line 138
    invoke-static {p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskByteArray;->parseDigitsRecursive([BIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    if-eqz p4, :cond_0

    .line 139
    invoke-virtual {p1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object p1

    :cond_0
    return-object p1

    .line 135
    :cond_1
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "value exceeds limits"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private skipZeroes([BII)I
    .locals 2

    :goto_0
    add-int/lit8 v0, p3, -0x8

    if-ge p2, v0, :cond_0

    .line 143
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isEightZeroes([BI)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 p2, p2, 0x8

    goto :goto_0

    :cond_0
    :goto_1
    if-ge p2, p3, :cond_1

    .line 146
    aget-byte v0, p1, p2

    const/16 v1, 0x30

    if-ne v0, v1, :cond_1

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_1
    return p2
.end method


# virtual methods
.method public parseBigIntegerLiteral([BIII)Ljava/math/BigInteger;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    add-int v0, p2, p3

    if-ltz p2, :cond_6

    if-lt v0, p2, :cond_6

    .line 42
    :try_start_0
    array-length v1, p1

    if-gt v0, v1, :cond_6

    const v1, 0x4d0e4c1e    # 1.49209568E8f

    if-gt p3, v1, :cond_6

    .line 48
    aget-byte v1, p1, p2

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

    .line 51
    invoke-static {p1, v1, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;->charAt([BII)B

    move-result v3

    if-eqz v3, :cond_5

    :goto_2
    const/16 v3, 0xa

    if-eq p4, v3, :cond_4

    const/16 v3, 0x10

    if-eq p4, v3, :cond_3

    .line 63
    new-instance v0, Ljava/math/BigInteger;

    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v1, p1, p2, p3, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-direct {v0, v1, p4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    return-object v0

    .line 61
    :cond_3
    invoke-direct {p0, p1, v1, v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;->parseHexDigits([BIIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 59
    :cond_4
    invoke-direct {p0, p1, v1, v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigIntegerFromByteArray;->parseDecDigits([BIIZ)Ljava/math/BigInteger;

    move-result-object p1

    return-object p1

    .line 53
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "offset < 0 or length > str.length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 66
    new-instance p2, Ljava/lang/NumberFormatException;

    const-string p3, "value exceeds limits"

    invoke-direct {p2, p3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p2, p1}, Ljava/lang/NumberFormatException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 68
    throw p2
.end method
