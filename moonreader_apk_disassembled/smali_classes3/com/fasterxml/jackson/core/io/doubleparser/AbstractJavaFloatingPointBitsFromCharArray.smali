.class abstract Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;
.source "AbstractJavaFloatingPointBitsFromCharArray.java"


# static fields
.field private static final CONDITIONAL_COMPILATION_PARSE_EIGHT_HEX_DIGITS:Z = true


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;-><init>()V

    return-void
.end method

.method private parseDecFloatLiteral([CIIIZZ)J
    .locals 22

    move-object/from16 v1, p1

    move/from16 v3, p4

    add-int/lit8 v0, v3, -0x4

    const/high16 v2, 0x40000000    # 2.0f

    .line 81
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v2, -0x1

    move/from16 v7, p2

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_0
    const-wide/16 v12, 0x30

    const-wide/16 v14, 0xa

    const/16 v4, 0x2e

    const/4 v5, 0x1

    if-ge v7, v3, :cond_4

    .line 83
    aget-char v10, v1, v7

    .line 84
    invoke-static {v10}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v16

    if-eqz v16, :cond_0

    mul-long v8, v8, v14

    int-to-long v14, v10

    add-long/2addr v8, v14

    sub-long/2addr v8, v12

    goto :goto_4

    :cond_0
    if-ne v10, v4, :cond_4

    if-ltz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    or-int/2addr v11, v2

    move v2, v7

    :goto_2
    if-ge v2, v0, :cond_3

    add-int/lit8 v4, v2, 0x1

    .line 91
    invoke-static {v1, v4}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseFourDigits([CI)I

    move-result v4

    if-gez v4, :cond_2

    goto :goto_3

    :cond_2
    const-wide/16 v12, 0x2710

    mul-long v8, v8, v12

    int-to-long v12, v4

    add-long/2addr v8, v12

    add-int/lit8 v2, v2, 0x4

    goto :goto_2

    :cond_3
    :goto_3
    move/from16 v20, v7

    move v7, v2

    move/from16 v2, v20

    :goto_4
    add-int/2addr v7, v5

    goto :goto_0

    :cond_4
    if-gez v2, :cond_5

    sub-int v0, v7, p2

    move v2, v7

    const/16 v16, 0x0

    goto :goto_5

    :cond_5
    sub-int v0, v7, p2

    sub-int/2addr v0, v5

    sub-int v16, v2, v7

    add-int/lit8 v16, v16, 0x1

    :goto_5
    const/16 v17, 0x1

    or-int/lit8 v5, v10, 0x20

    const/16 v6, 0x65

    if-ne v5, v6, :cond_c

    add-int/lit8 v5, v7, 0x1

    .line 118
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v6

    const/16 v10, 0x2d

    if-ne v6, v10, :cond_6

    const/16 v18, 0x1

    goto :goto_6

    :cond_6
    const/16 v18, 0x0

    :goto_6
    if-nez v18, :cond_7

    const/16 v10, 0x2b

    if-ne v6, v10, :cond_8

    :cond_7
    add-int/lit8 v5, v7, 0x2

    .line 121
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v6

    .line 123
    :cond_8
    invoke-static {v6}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v10

    xor-int/lit8 v10, v10, 0x1

    or-int v19, v11, v10

    const/4 v10, 0x0

    :cond_9
    const/16 v11, 0x400

    if-ge v10, v11, :cond_a

    mul-int/lit8 v10, v10, 0xa

    add-int/2addr v10, v6

    add-int/lit8 v10, v10, -0x30

    :cond_a
    add-int/lit8 v5, v5, 0x1

    .line 129
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v6

    .line 130
    invoke-static {v6}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v11

    if-nez v11, :cond_9

    if-eqz v18, :cond_b

    neg-int v10, v10

    :cond_b
    add-int v16, v16, v10

    move v11, v10

    move v10, v6

    move v6, v11

    move/from16 v11, v19

    goto :goto_7

    :cond_c
    move v5, v7

    const/4 v6, 0x0

    :goto_7
    move-wide/from16 v18, v12

    const/16 v12, 0x64

    if-ne v10, v12, :cond_d

    const/4 v12, 0x1

    goto :goto_8

    :cond_d
    const/4 v12, 0x0

    :goto_8
    const/16 v13, 0x44

    if-ne v10, v13, :cond_e

    const/4 v13, 0x1

    goto :goto_9

    :cond_e
    const/4 v13, 0x0

    :goto_9
    or-int/2addr v12, v13

    const/16 v13, 0x66

    if-ne v10, v13, :cond_f

    const/4 v13, 0x1

    goto :goto_a

    :cond_f
    const/4 v13, 0x0

    :goto_a
    or-int/2addr v12, v13

    const/16 v13, 0x46

    if-ne v10, v13, :cond_10

    const/4 v10, 0x1

    goto :goto_b

    :cond_10
    const/4 v10, 0x0

    :goto_b
    or-int/2addr v10, v12

    if-eqz v10, :cond_11

    add-int/lit8 v5, v5, 0x1

    .line 146
    :cond_11
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->skipWhitespace([CII)I

    move-result v5

    if-nez v11, :cond_17

    if-lt v5, v3, :cond_17

    if-nez p6, :cond_12

    if-eqz v0, :cond_17

    :cond_12
    const/16 v5, 0x13

    if-le v0, v5, :cond_16

    move/from16 v0, p2

    const/4 v5, 0x0

    const-wide/16 v8, 0x0

    :goto_c
    if-ge v0, v7, :cond_14

    .line 160
    aget-char v10, v1, v0

    if-ne v10, v4, :cond_13

    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    :cond_13
    const-wide v11, 0xde0b6b3a7640000L

    .line 164
    invoke-static {v8, v9, v11, v12}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v11

    if-gez v11, :cond_14

    mul-long v8, v8, v14

    int-to-long v10, v10

    add-long/2addr v8, v10

    sub-long v8, v8, v18

    :goto_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_14
    if-ge v0, v7, :cond_15

    goto :goto_e

    :cond_15
    const/16 v17, 0x0

    :goto_e
    sub-int/2addr v2, v0

    add-int/2addr v2, v5

    add-int/2addr v6, v2

    move-wide/from16 v20, v8

    move v9, v6

    move-wide/from16 v5, v20

    move/from16 v8, v17

    goto :goto_f

    :cond_16
    move-wide v5, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_f
    move-object/from16 v0, p0

    move/from16 v2, p3

    move/from16 v4, p5

    move/from16 v7, v16

    .line 177
    invoke-virtual/range {v0 .. v9}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->valueOfFloatLiteral([CIIZJIZI)J

    move-result-wide v1

    return-wide v1

    .line 149
    :cond_17
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "illegal syntax"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private parseHexFloatLiteral([CIIIZ)J
    .locals 21

    move-object/from16 v1, p1

    move/from16 v3, p4

    const-wide/16 v4, 0x0

    const/4 v2, -0x1

    move/from16 v6, p2

    move-wide v7, v4

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_0
    const/4 v11, 0x4

    const/4 v12, 0x1

    if-ge v6, v3, :cond_4

    .line 278
    aget-char v9, v1, v6

    .line 280
    invoke-static {v9}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->lookupHex(C)I

    move-result v13

    if-ltz v13, :cond_0

    shl-long/2addr v7, v11

    int-to-long v13, v13

    or-long/2addr v7, v13

    move-object/from16 v13, p0

    goto :goto_3

    :cond_0
    const/4 v14, -0x4

    if-ne v13, v14, :cond_4

    if-ltz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    or-int/2addr v10, v2

    move v2, v6

    :goto_2
    add-int/lit8 v11, v3, -0x8

    if-ge v2, v11, :cond_2

    add-int/lit8 v11, v2, 0x1

    move-object/from16 v13, p0

    .line 288
    invoke-direct {v13, v1, v11}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->tryToParseEightHexDigits([CI)J

    move-result-wide v14

    cmp-long v11, v14, v4

    if-ltz v11, :cond_3

    const/16 v11, 0x20

    shl-long/2addr v7, v11

    add-long/2addr v7, v14

    add-int/lit8 v2, v2, 0x8

    goto :goto_2

    :cond_2
    move-object/from16 v13, p0

    :cond_3
    move/from16 v20, v6

    move v6, v2

    move/from16 v2, v20

    :goto_3
    add-int/2addr v6, v12

    goto :goto_0

    :cond_4
    move-object/from16 v13, p0

    const/16 v14, 0x400

    if-gez v2, :cond_5

    sub-int v2, v6, p2

    move v15, v6

    const/4 v0, 0x0

    goto :goto_4

    :cond_5
    sub-int v15, v6, p2

    sub-int/2addr v15, v12

    sub-int v16, v2, v6

    add-int/lit8 v0, v16, 0x1

    .line 307
    invoke-static {v0, v14}, Ljava/lang/Math;->min(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    move/from16 v20, v15

    move v15, v2

    move/from16 v2, v20

    :goto_4
    or-int/lit8 v4, v9, 0x20

    const/16 v5, 0x70

    if-ne v4, v5, :cond_6

    const/4 v4, 0x1

    goto :goto_5

    :cond_6
    const/4 v4, 0x0

    :goto_5
    if-eqz v4, :cond_d

    add-int/lit8 v5, v6, 0x1

    .line 315
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v9

    const/16 v16, 0x4

    const/16 v11, 0x2d

    if-ne v9, v11, :cond_7

    const/4 v11, 0x1

    goto :goto_6

    :cond_7
    const/4 v11, 0x0

    :goto_6
    const/16 v18, 0x1

    if-nez v11, :cond_8

    const/16 v12, 0x2b

    if-ne v9, v12, :cond_9

    :cond_8
    add-int/lit8 v5, v6, 0x2

    .line 318
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v9

    .line 320
    :cond_9
    invoke-static {v9}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v12

    xor-int/lit8 v12, v12, 0x1

    or-int/2addr v12, v10

    const/4 v10, 0x0

    :cond_a
    if-ge v10, v14, :cond_b

    mul-int/lit8 v10, v10, 0xa

    add-int/2addr v10, v9

    add-int/lit8 v10, v10, -0x30

    :cond_b
    add-int/lit8 v5, v5, 0x1

    .line 326
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v9

    .line 327
    invoke-static {v9}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v19

    if-nez v19, :cond_a

    if-eqz v11, :cond_c

    neg-int v10, v10

    :cond_c
    add-int/2addr v0, v10

    move v11, v10

    move v10, v12

    goto :goto_7

    :cond_d
    const/16 v16, 0x4

    const/16 v18, 0x1

    move v5, v6

    const/4 v11, 0x0

    :goto_7
    const/16 v12, 0x64

    if-ne v9, v12, :cond_e

    const/4 v12, 0x1

    goto :goto_8

    :cond_e
    const/4 v12, 0x0

    :goto_8
    const/16 v14, 0x44

    if-ne v9, v14, :cond_f

    const/4 v14, 0x1

    goto :goto_9

    :cond_f
    const/4 v14, 0x0

    :goto_9
    or-int/2addr v12, v14

    const/16 v14, 0x66

    if-ne v9, v14, :cond_10

    const/4 v14, 0x1

    goto :goto_a

    :cond_10
    const/4 v14, 0x0

    :goto_a
    or-int/2addr v12, v14

    const/16 v14, 0x46

    if-ne v9, v14, :cond_11

    const/4 v9, 0x1

    goto :goto_b

    :cond_11
    const/4 v9, 0x0

    :goto_b
    or-int/2addr v9, v12

    if-eqz v9, :cond_12

    add-int/lit8 v5, v5, 0x1

    .line 343
    :cond_12
    invoke-static {v1, v5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->skipWhitespace([CII)I

    move-result v5

    if-nez v10, :cond_17

    if-lt v5, v3, :cond_17

    if-eqz v2, :cond_17

    if-eqz v4, :cond_17

    const/16 v4, 0x10

    if-le v2, v4, :cond_16

    move/from16 v2, p2

    const-wide/16 v4, 0x0

    const/4 v7, 0x0

    :goto_c
    if-ge v2, v6, :cond_14

    .line 357
    aget-char v8, v1, v2

    .line 359
    invoke-static {v8}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->lookupHex(C)I

    move-result v8

    if-ltz v8, :cond_13

    const-wide v9, 0xde0b6b3a7640000L

    .line 361
    invoke-static {v4, v5, v9, v10}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v9

    if-gez v9, :cond_14

    shl-long v4, v4, v16

    int-to-long v8, v8

    or-long/2addr v4, v8

    goto :goto_d

    :cond_13
    add-int/lit8 v7, v7, 0x1

    :goto_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_14
    if-ge v2, v6, :cond_15

    const/16 v17, 0x1

    goto :goto_e

    :cond_15
    const/16 v17, 0x0

    :goto_e
    move/from16 v8, v17

    move/from16 v17, v7

    move-wide v6, v4

    move v5, v2

    goto :goto_f

    :cond_16
    move-wide v6, v7

    const/4 v8, 0x0

    const/16 v17, 0x0

    :goto_f
    sub-int/2addr v15, v5

    add-int v15, v15, v17

    mul-int/lit8 v15, v15, 0x4

    add-int v9, v15, v11

    move/from16 v2, p3

    move/from16 v4, p5

    move-wide v5, v6

    move v7, v0

    move-object v0, v13

    .line 375
    invoke-virtual/range {v0 .. v9}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->valueOfHexLiteral([CIIZJIZI)J

    move-result-wide v1

    return-wide v1

    .line 347
    :cond_17
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "illegal syntax"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private parseNaNOrInfinity([CIIZ)J
    .locals 4

    .line 380
    aget-char v0, p1, p2

    const/16 v1, 0x4e

    if-ne v0, v1, :cond_0

    add-int/lit8 p4, p2, 0x2

    if-ge p4, p3, :cond_2

    add-int/lit8 v0, p2, 0x1

    .line 381
    aget-char v0, p1, v0

    const/16 v2, 0x61

    if-ne v0, v2, :cond_2

    aget-char p4, p1, p4

    if-ne p4, v1, :cond_2

    add-int/lit8 p2, p2, 0x3

    .line 386
    invoke-static {p1, p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->skipWhitespace([CII)I

    move-result p1

    if-ne p1, p3, :cond_2

    .line 388
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->nan()J

    move-result-wide p1

    return-wide p1

    :cond_0
    add-int/lit8 v1, p2, 0x7

    if-ge v1, p3, :cond_2

    const/16 v2, 0x49

    if-ne v0, v2, :cond_2

    add-int/lit8 v0, p2, 0x1

    .line 392
    aget-char v0, p1, v0

    const/16 v2, 0x6e

    if-ne v0, v2, :cond_2

    add-int/lit8 v0, p2, 0x2

    aget-char v0, p1, v0

    const/16 v3, 0x66

    if-ne v0, v3, :cond_2

    add-int/lit8 v0, p2, 0x3

    aget-char v0, p1, v0

    const/16 v3, 0x69

    if-ne v0, v3, :cond_2

    add-int/lit8 v0, p2, 0x4

    aget-char v0, p1, v0

    if-ne v0, v2, :cond_2

    add-int/lit8 v0, p2, 0x5

    aget-char v0, p1, v0

    if-ne v0, v3, :cond_2

    add-int/lit8 v0, p2, 0x6

    aget-char v0, p1, v0

    const/16 v2, 0x74

    if-ne v0, v2, :cond_2

    aget-char v0, p1, v1

    const/16 v1, 0x79

    if-ne v0, v1, :cond_2

    add-int/lit8 p2, p2, 0x8

    .line 402
    invoke-static {p1, p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->skipWhitespace([CII)I

    move-result p1

    if-ne p1, p3, :cond_2

    if-eqz p4, :cond_1

    .line 404
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->negativeInfinity()J

    move-result-wide p1

    return-wide p1

    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->positiveInfinity()J

    move-result-wide p1

    return-wide p1

    .line 408
    :cond_2
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string p2, "illegal syntax"

    invoke-direct {p1, p2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static skipWhitespace([CII)I
    .locals 2

    :goto_0
    if-ge p1, p2, :cond_0

    .line 31
    aget-char v0, p0, p1

    const/16 v1, 0x20

    if-gt v0, v1, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return p1
.end method

.method private tryToParseEightHexDigits([CI)J
    .locals 0

    .line 418
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseEightHexDigits([CI)J

    move-result-wide p1

    return-wide p1
.end method


# virtual methods
.method abstract nan()J
.end method

.method abstract negativeInfinity()J
.end method

.method public parseFloatingPointLiteral([CII)J
    .locals 7

    add-int v4, p2, p3

    if-ltz p2, :cond_a

    if-lt v4, p2, :cond_a

    .line 201
    array-length v0, p1

    if-gt v4, v0, :cond_a

    const v0, 0x7ffffffb

    if-gt p3, v0, :cond_a

    .line 207
    invoke-static {p1, p2, v4}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->skipWhitespace([CII)I

    move-result p3

    .line 208
    const-string v0, "illegal syntax"

    if-eq p3, v4, :cond_9

    .line 211
    aget-char v1, p1, p3

    const/16 v2, 0x2d

    const/4 v3, 0x0

    const/4 v5, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    const/4 v2, 0x1

    if-nez v5, :cond_1

    const/16 v6, 0x2b

    if-ne v1, v6, :cond_2

    :cond_1
    add-int/lit8 p3, p3, 0x1

    .line 217
    invoke-static {p1, p3, v4}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v1

    if-eqz v1, :cond_8

    :cond_2
    const/16 v0, 0x49

    if-lt v1, v0, :cond_3

    .line 226
    invoke-direct {p0, p1, p3, v4, v5}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->parseNaNOrInfinity([CIIZ)J

    move-result-wide p1

    return-wide p1

    :cond_3
    const/16 v0, 0x30

    if-ne v1, v0, :cond_4

    const/4 v6, 0x1

    goto :goto_1

    :cond_4
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_7

    add-int/lit8 v0, p3, 0x1

    .line 233
    invoke-static {p1, v0, v4}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v1

    const/16 v2, 0x78

    if-eq v1, v2, :cond_6

    const/16 v2, 0x58

    if-ne v1, v2, :cond_5

    goto :goto_2

    :cond_5
    move v2, v0

    move-object v1, p1

    move v3, p2

    move-object v0, p0

    goto :goto_3

    :cond_6
    :goto_2
    add-int/lit8 v2, p3, 0x2

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    .line 235
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->parseHexFloatLiteral([CIIIZ)J

    move-result-wide p1

    return-wide p1

    :cond_7
    move v2, p3

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    .line 239
    :goto_3
    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;->parseDecFloatLiteral([CIIIZZ)J

    move-result-wide p1

    return-wide p1

    .line 219
    :cond_8
    new-instance p1, Ljava/lang/NumberFormatException;

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 209
    :cond_9
    new-instance p1, Ljava/lang/NumberFormatException;

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 202
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "offset < 0 or length > str.length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method abstract positiveInfinity()J
.end method

.method abstract valueOfFloatLiteral([CIIZJIZI)J
.end method

.method abstract valueOfHexLiteral([CIIZJIZI)J
.end method
