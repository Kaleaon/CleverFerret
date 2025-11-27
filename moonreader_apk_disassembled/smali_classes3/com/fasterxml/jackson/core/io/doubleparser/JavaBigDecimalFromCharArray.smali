.class final Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;
.source "JavaBigDecimalFromCharArray.java"


# static fields
.field private static final MANY_DIGITS_THRESHOLD:I = 0x20

.field private static final MAX_DIGIT_COUNT:I = 0x4d0e4c1d

.field private static final MAX_EXPONENT_NUMBER:J = 0x7fffffffL

.field public static final MAX_INPUT_LENGTH:I = 0x4d0e4c2b


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;-><init>()V

    return-void
.end method

.method private valueOfBigDecimalString([CIIIIZI)Ljava/math/BigDecimal;
    .locals 4

    sub-int v0, p5, p3

    add-int/lit8 v0, v0, -0x1

    sub-int p4, p5, p4

    sub-int v1, p3, p2

    const/16 v2, 0x190

    const/4 v3, 0x0

    if-lez v1, :cond_1

    if-le v1, v2, :cond_0

    .line 338
    invoke-static {}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->createPowersOfTenFloor16Map()Ljava/util/NavigableMap;

    move-result-object v1

    .line 339
    invoke-static {v1, p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->fillPowersOfNFloor16Recursive(Ljava/util/NavigableMap;II)V

    .line 340
    invoke-static {p1, p2, p3, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskCharArray;->parseDigitsRecursive([CIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p2

    goto :goto_1

    .line 342
    :cond_0
    invoke-static {p1, p2, p3, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskCharArray;->parseDigitsRecursive([CIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p2

    goto :goto_0

    .line 345
    :cond_1
    sget-object p2, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    :goto_0
    move-object v1, v3

    :goto_1
    if-lez p4, :cond_5

    if-le p4, v2, :cond_3

    if-nez v1, :cond_2

    .line 354
    invoke-static {}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->createPowersOfTenFloor16Map()Ljava/util/NavigableMap;

    move-result-object v1

    :cond_2
    add-int/lit8 p3, p3, 0x1

    .line 356
    invoke-static {v1, p3, p5}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->fillPowersOfNFloor16Recursive(Ljava/util/NavigableMap;II)V

    .line 357
    invoke-static {p1, p3, p5, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskCharArray;->parseDigitsRecursive([CIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    goto :goto_2

    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 359
    invoke-static {p1, p3, p5, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskCharArray;->parseDigitsRecursive([CIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    .line 362
    :goto_2
    invoke-virtual {p2}, Ljava/math/BigInteger;->signum()I

    move-result p3

    if-nez p3, :cond_4

    goto :goto_3

    .line 365
    :cond_4
    invoke-static {v1, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->computePowerOfTen(Ljava/util/NavigableMap;I)Ljava/math/BigInteger;

    move-result-object p3

    .line 366
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier;->multiply(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p1

    :goto_3
    move-object p2, p1

    .line 374
    :cond_5
    new-instance p1, Ljava/math/BigDecimal;

    if-eqz p6, :cond_6

    invoke-virtual {p2}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object p2

    :cond_6
    neg-int p3, p7

    invoke-direct {p1, p2, p3}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;I)V

    return-object p1
.end method


# virtual methods
.method public parseBigDecimalString([CII)Ljava/math/BigDecimal;
    .locals 28

    move-object/from16 v2, p1

    move/from16 v0, p2

    move/from16 v1, p3

    .line 74
    const-string v9, "value exceeds limits"

    const/16 v3, 0x20

    if-lt v1, v3, :cond_0

    .line 75
    :try_start_0
    invoke-virtual/range {p0 .. p3}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->parseBigDecimalStringWithManyDigits([CII)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    :cond_0
    add-int/2addr v1, v0

    .line 84
    invoke-static {v2, v0, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v4
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_2

    const/16 v5, 0x2d

    const/4 v7, 0x1

    if-ne v4, v5, :cond_1

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    :goto_0
    const/4 v8, 0x1

    .line 91
    const-string v10, "illegal syntax"

    const/16 v11, 0x2b

    if-nez v7, :cond_2

    if-ne v4, v11, :cond_3

    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 92
    :try_start_1
    invoke-static {v2, v0, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v4

    if-eqz v4, :cond_16

    :cond_3
    const/4 v14, -0x1

    move v15, v0

    move/from16 p2, v4

    const-wide/16 v3, 0x0

    const/16 v16, 0x20

    const/16 v17, 0x0

    :goto_1
    const-wide/16 v18, 0x30

    const-wide/16 v20, 0xa

    if-ge v15, v1, :cond_8

    .line 101
    aget-char v6, v2, v15

    .line 102
    invoke-static {v6}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v22

    if-eqz v22, :cond_4

    mul-long v3, v3, v20

    int-to-long v12, v6

    add-long/2addr v3, v12

    sub-long v3, v3, v18

    goto :goto_5

    :cond_4
    const/16 v12, 0x2e

    if-ne v6, v12, :cond_9

    if-ltz v14, :cond_5

    const/4 v12, 0x1

    goto :goto_2

    :cond_5
    const/4 v12, 0x0

    :goto_2
    or-int v17, v17, v12

    move v12, v15

    :goto_3
    add-int/lit8 v13, v1, -0x4

    if-ge v12, v13, :cond_7

    add-int/lit8 v13, v12, 0x1

    .line 109
    invoke-static {v2, v13}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseFourDigits([CI)I

    move-result v13
    :try_end_1
    .catch Ljava/lang/ArithmeticException; {:try_start_1 .. :try_end_1} :catch_2

    if-gez v13, :cond_6

    goto :goto_4

    :cond_6
    const-wide/16 v18, 0x2710

    mul-long v3, v3, v18

    int-to-long v13, v13

    add-long/2addr v3, v13

    add-int/lit8 v12, v12, 0x4

    goto :goto_3

    :cond_7
    :goto_4
    move v14, v15

    move v15, v12

    :goto_5
    add-int/2addr v15, v8

    move/from16 p2, v6

    goto :goto_1

    :cond_8
    move/from16 v6, p2

    :cond_9
    if-gez v14, :cond_a

    sub-int v12, v15, v0

    move-object/from16 v24, v9

    move v14, v15

    const-wide/16 v8, 0x0

    const/16 v25, 0x1

    goto :goto_6

    :cond_a
    sub-int v12, v15, v0

    sub-int/2addr v12, v8

    sub-int v13, v14, v15

    add-int/2addr v13, v8

    move-object/from16 v24, v9

    const/16 v25, 0x1

    int-to-long v8, v13

    :goto_6
    or-int/lit8 v6, v6, 0x20

    const/16 v13, 0x65

    const-wide/32 v26, 0x7fffffff

    if-ne v6, v13, :cond_11

    add-int/lit8 v6, v15, 0x1

    .line 138
    :try_start_2
    invoke-static {v2, v6, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v13

    if-ne v13, v5, :cond_b

    const/4 v5, 0x1

    goto :goto_7

    :cond_b
    const/4 v5, 0x0

    :goto_7
    if-nez v5, :cond_c

    if-ne v13, v11, :cond_d

    :cond_c
    add-int/lit8 v6, v15, 0x2

    .line 141
    invoke-static {v2, v6, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v13

    .line 143
    :cond_d
    invoke-static {v13}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v11

    xor-int/lit8 v11, v11, 0x1

    or-int v17, v17, v11

    const-wide/16 v22, 0x0

    :goto_8
    cmp-long v11, v22, v26

    if-gez v11, :cond_e

    mul-long v22, v22, v20

    move/from16 p2, v5

    move/from16 p3, v6

    int-to-long v5, v13

    add-long v22, v22, v5

    sub-long v22, v22, v18

    goto :goto_9

    :cond_e
    move/from16 p2, v5

    move/from16 p3, v6

    :goto_9
    move-wide/from16 v5, v22

    add-int/lit8 v11, p3, 0x1

    .line 149
    invoke-static {v2, v11, v1}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v13

    .line 150
    invoke-static {v13}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v16

    if-nez v16, :cond_10

    if-eqz p2, :cond_f

    neg-long v5, v5

    :cond_f
    add-long/2addr v8, v5

    move v6, v15

    move v15, v11

    goto :goto_a

    :cond_10
    move-wide/from16 v22, v5

    move v6, v11

    move/from16 v5, p2

    goto :goto_8

    :catch_0
    move-exception v0

    move-object/from16 v1, v24

    goto :goto_b

    :cond_11
    move v6, v1

    :goto_a
    if-nez v17, :cond_15

    if-lt v15, v1, :cond_15

    if-eqz v12, :cond_15

    const v1, 0x4d0e4c1d    # 1.49209552E8f

    if-gt v12, v1, :cond_15

    const-wide/32 v10, -0x80000000

    cmp-long v1, v8, v10

    if-lez v1, :cond_14

    cmp-long v1, v8, v26

    if-gtz v1, :cond_14

    const/16 v1, 0x12

    if-gt v12, v1, :cond_13

    .line 169
    new-instance v0, Ljava/math/BigDecimal;

    if-eqz v7, :cond_12

    neg-long v3, v3

    :cond_12
    invoke-direct {v0, v3, v4}, Ljava/math/BigDecimal;-><init>(J)V

    long-to-int v1, v8

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    :cond_13
    add-int/lit8 v5, v14, 0x1

    long-to-int v8, v8

    move-object/from16 v1, p0

    move v3, v0

    move v4, v14

    .line 171
    invoke-direct/range {v1 .. v8}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->valueOfBigDecimalString([CIIIIZI)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    .line 165
    :cond_14
    new-instance v0, Ljava/lang/NumberFormatException;
    :try_end_2
    .catch Ljava/lang/ArithmeticException; {:try_start_2 .. :try_end_2} :catch_0

    move-object/from16 v1, v24

    :try_start_3
    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    move-object/from16 v1, v24

    .line 161
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v10}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    move-object v1, v9

    .line 94
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v10}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catch Ljava/lang/ArithmeticException; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    move-exception v0

    goto :goto_b

    :catch_2
    move-exception v0

    move-object v1, v9

    .line 173
    :goto_b
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 174
    invoke-virtual {v2, v0}, Ljava/lang/NumberFormatException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 175
    throw v2
.end method

.method parseBigDecimalStringWithManyDigits([CII)Ljava/math/BigDecimal;
    .locals 22

    move-object/from16 v1, p1

    move/from16 v0, p2

    move/from16 v2, p3

    const v3, 0x4d0e4c2b    # 1.49209776E8f

    .line 183
    const-string v4, "illegal syntax"

    if-gt v2, v3, :cond_19

    add-int/2addr v2, v0

    .line 194
    invoke-static {v1, v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v3

    const/16 v5, 0x2d

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ne v3, v5, :cond_0

    const/4 v6, 0x1

    :cond_0
    const/4 v8, 0x0

    const/16 v9, 0x2b

    if-nez v6, :cond_1

    if-ne v3, v9, :cond_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 201
    invoke-static {v1, v0, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v3

    if-eqz v3, :cond_18

    :cond_2
    add-int/lit8 v10, v2, -0x8

    const/high16 v11, 0x40000000    # 2.0f

    .line 210
    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    move v11, v0

    :goto_0
    if-ge v11, v10, :cond_3

    .line 211
    invoke-static {v1, v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isEightZeroes([CI)Z

    move-result v12

    if-eqz v12, :cond_3

    add-int/lit8 v11, v11, 0x8

    goto :goto_0

    :cond_3
    :goto_1
    const/16 v12, 0x30

    if-ge v11, v2, :cond_4

    .line 214
    aget-char v13, v1, v11

    if-ne v13, v12, :cond_4

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_4
    move v13, v11

    :goto_2
    if-ge v13, v10, :cond_5

    .line 219
    invoke-static {v1, v13}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isEightDigits([CI)Z

    move-result v14

    if-eqz v14, :cond_5

    add-int/lit8 v13, v13, 0x8

    goto :goto_2

    :cond_5
    :goto_3
    if-ge v13, v2, :cond_6

    .line 222
    aget-char v3, v1, v13

    invoke-static {v3}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v14

    if-eqz v14, :cond_6

    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    :cond_6
    const/16 v14, 0x2e

    if-ne v3, v14, :cond_b

    add-int/lit8 v14, v13, 0x1

    :goto_4
    if-ge v14, v10, :cond_7

    .line 228
    invoke-static {v1, v14}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isEightZeroes([CI)Z

    move-result v15

    if-eqz v15, :cond_7

    add-int/lit8 v14, v14, 0x8

    goto :goto_4

    :cond_7
    :goto_5
    if-ge v14, v2, :cond_8

    .line 231
    aget-char v15, v1, v14

    if-ne v15, v12, :cond_8

    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    :cond_8
    move v12, v14

    :goto_6
    if-ge v12, v10, :cond_9

    .line 236
    invoke-static {v1, v12}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isEightDigits([CI)Z

    move-result v15

    if-eqz v15, :cond_9

    add-int/lit8 v12, v12, 0x8

    goto :goto_6

    :cond_9
    :goto_7
    if-ge v12, v2, :cond_a

    .line 239
    aget-char v3, v1, v12

    invoke-static {v3}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v10

    if-eqz v10, :cond_a

    add-int/lit8 v12, v12, 0x1

    goto :goto_7

    :cond_a
    move v10, v14

    move v14, v13

    move v13, v12

    goto :goto_8

    :cond_b
    const/4 v14, -0x1

    const/4 v10, -0x1

    :goto_8
    if-gez v14, :cond_c

    sub-int v10, v13, v11

    move v12, v10

    move v10, v13

    move v14, v10

    const/16 p3, 0x1

    const-wide/16 v8, 0x0

    goto :goto_a

    :cond_c
    if-ne v11, v14, :cond_d

    sub-int v12, v13, v10

    goto :goto_9

    :cond_d
    sub-int v12, v13, v11

    sub-int/2addr v12, v7

    :goto_9
    sub-int v17, v14, v13

    const/16 p3, 0x1

    add-int/lit8 v7, v17, 0x1

    int-to-long v8, v7

    :goto_a
    or-int/lit8 v3, v3, 0x20

    const/16 v7, 0x65

    const-wide/32 v18, 0x7fffffff

    if-ne v3, v7, :cond_14

    add-int/lit8 v3, v13, 0x1

    .line 264
    invoke-static {v1, v3, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v7

    if-ne v7, v5, :cond_e

    const/4 v5, 0x1

    goto :goto_b

    :cond_e
    const/4 v5, 0x0

    :goto_b
    if-nez v5, :cond_f

    const/16 v15, 0x2b

    if-ne v7, v15, :cond_10

    :cond_f
    add-int/lit8 v3, v13, 0x2

    .line 267
    invoke-static {v1, v3, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v7

    .line 269
    :cond_10
    invoke-static {v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v15

    xor-int/lit8 v15, v15, 0x1

    const-wide/16 v20, 0x0

    :goto_c
    cmp-long v16, v20, v18

    if-gez v16, :cond_11

    const-wide/16 v16, 0xa

    mul-long v20, v20, v16

    move/from16 p2, v5

    move/from16 v16, v6

    int-to-long v5, v7

    add-long v20, v20, v5

    const-wide/16 v5, 0x30

    sub-long v20, v20, v5

    goto :goto_d

    :cond_11
    move/from16 p2, v5

    move/from16 v16, v6

    :goto_d
    move-wide/from16 v5, v20

    add-int/lit8 v3, v3, 0x1

    .line 275
    invoke-static {v1, v3, v2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->charAt([CII)C

    move-result v7

    .line 276
    invoke-static {v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v17

    if-nez v17, :cond_13

    if-eqz p2, :cond_12

    neg-long v5, v5

    :cond_12
    add-long/2addr v8, v5

    move v5, v13

    move v6, v15

    move v13, v3

    goto :goto_e

    :cond_13
    move-wide/from16 v20, v5

    move/from16 v6, v16

    move/from16 v5, p2

    goto :goto_c

    :cond_14
    move/from16 v16, v6

    move v5, v2

    const/4 v6, 0x0

    :goto_e
    if-nez v6, :cond_17

    if-lt v13, v2, :cond_17

    sub-int v0, v5, v0

    if-eqz v0, :cond_16

    const-wide/32 v2, -0x80000000

    cmp-long v0, v8, v2

    if-ltz v0, :cond_15

    cmp-long v0, v8, v18

    if-gtz v0, :cond_15

    const v0, 0x4d0e4c1d    # 1.49209552E8f

    if-gt v12, v0, :cond_15

    long-to-int v7, v8

    move-object/from16 v0, p0

    move v4, v10

    move v2, v11

    move v3, v14

    move/from16 v6, v16

    .line 295
    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalFromCharArray;->valueOfBigDecimalString([CIIIIZI)Ljava/math/BigDecimal;

    move-result-object v1

    return-object v1

    .line 293
    :cond_15
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "value exceeds limits"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_16
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_17
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 203
    :cond_18
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_19
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
