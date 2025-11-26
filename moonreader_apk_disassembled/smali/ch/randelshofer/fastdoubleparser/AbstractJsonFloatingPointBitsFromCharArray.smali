.class abstract Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;
.super Lch/randelshofer/fastdoubleparser/AbstractFloatValueParser;
.source "AbstractJsonFloatingPointBitsFromCharArray.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractFloatValueParser;-><init>()V

    return-void
.end method

.method private tryToParseEightDigits([CI)I
    .locals 0

    .line 159
    invoke-static {p1, p2}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigits([CI)I

    move-result p1

    return p1
.end method


# virtual methods
.method public final parseNumber([CII)J
    .locals 28

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v0, p3

    add-int v3, v2, v0

    if-ltz v2, :cond_1a

    if-lt v3, v2, :cond_1a

    .line 32
    array-length v4, v1

    if-gt v3, v4, :cond_1a

    const v4, 0x7ffffffb

    if-gt v0, v4, :cond_1a

    .line 36
    invoke-static {v1, v2, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v0

    const/16 v4, 0x2d

    if-ne v0, v4, :cond_0

    const/4 v7, 0x1

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    .line 41
    :goto_0
    const-string v8, "illegal syntax"

    if-eqz v7, :cond_2

    add-int/lit8 v0, v2, 0x1

    .line 42
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v9

    if-eqz v9, :cond_1

    move/from16 v27, v9

    move v9, v0

    move/from16 v0, v27

    goto :goto_1

    .line 44
    :cond_1
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move v9, v2

    :goto_1
    const/16 v10, 0x30

    if-ne v0, v10, :cond_3

    const/4 v11, 0x1

    goto :goto_2

    :cond_3
    const/4 v11, 0x0

    :goto_2
    if-eqz v11, :cond_5

    add-int/lit8 v9, v9, 0x1

    .line 52
    invoke-static {v1, v9, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v0

    if-eq v0, v10, :cond_4

    goto :goto_3

    .line 54
    :cond_4
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_3
    const/4 v14, -0x1

    move v15, v9

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    :goto_4
    const-wide/16 v19, 0x30

    const-wide/16 v21, 0xa

    const/16 v5, 0x2e

    if-ge v15, v3, :cond_b

    .line 67
    aget-char v0, v1, v15

    .line 68
    invoke-static {v0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v23

    if-eqz v23, :cond_6

    mul-long v16, v16, v21

    move/from16 v24, v7

    const/16 v23, 0x1

    int-to-long v6, v0

    add-long v16, v16, v6

    sub-long v16, v16, v19

    const/16 v25, 0x30

    move-object/from16 v7, p0

    move/from16 v26, v11

    goto :goto_8

    :cond_6
    move/from16 v24, v7

    const/16 v23, 0x1

    if-ne v0, v5, :cond_a

    if-ltz v14, :cond_7

    const/4 v5, 0x1

    goto :goto_5

    :cond_7
    const/4 v5, 0x0

    :goto_5
    or-int v18, v18, v5

    move v5, v15

    :goto_6
    add-int/lit8 v6, v3, -0x8

    if-ge v5, v6, :cond_9

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v7, p0

    .line 75
    invoke-direct {v7, v1, v6}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->tryToParseEightDigits([CI)I

    move-result v6

    if-gez v6, :cond_8

    move/from16 v26, v11

    const/16 v25, 0x30

    goto :goto_7

    :cond_8
    const-wide/32 v19, 0x5f5e100

    mul-long v16, v16, v19

    move/from16 v26, v11

    const/16 v25, 0x30

    int-to-long v10, v6

    add-long v16, v16, v10

    add-int/lit8 v5, v5, 0x8

    move/from16 v11, v26

    const/16 v10, 0x30

    goto :goto_6

    :cond_9
    move-object/from16 v7, p0

    const/16 v25, 0x30

    move/from16 v26, v11

    :goto_7
    move v14, v15

    move v15, v5

    :goto_8
    add-int/lit8 v15, v15, 0x1

    move/from16 v7, v24

    move/from16 v11, v26

    const/16 v10, 0x30

    goto :goto_4

    :cond_a
    const/16 v25, 0x30

    move-object/from16 v7, p0

    move/from16 v26, v11

    goto :goto_9

    :cond_b
    const/16 v23, 0x1

    move/from16 v24, v7

    const/16 v25, 0x30

    move/from16 v26, v11

    move-object/from16 v7, p0

    :goto_9
    if-gez v14, :cond_c

    sub-int v6, v15, v9

    move v14, v15

    const/4 v10, 0x0

    goto :goto_a

    :cond_c
    sub-int v6, v15, v9

    add-int/lit8 v6, v6, -0x1

    sub-int v10, v14, v15

    add-int/lit8 v10, v10, 0x1

    :goto_a
    or-int/lit8 v0, v0, 0x20

    const/16 v11, 0x65

    if-ne v0, v11, :cond_13

    add-int/lit8 v0, v15, 0x1

    .line 102
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v11

    if-ne v11, v4, :cond_d

    const/4 v4, 0x1

    goto :goto_b

    :cond_d
    const/4 v4, 0x0

    :goto_b
    if-nez v4, :cond_e

    const/16 v12, 0x2b

    if-ne v11, v12, :cond_f

    :cond_e
    add-int/lit8 v0, v15, 0x2

    .line 105
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v11

    .line 107
    :cond_f
    invoke-static {v11}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v12

    xor-int/lit8 v12, v12, 0x1

    or-int v12, v18, v12

    const/4 v13, 0x0

    :cond_10
    const/16 v5, 0x400

    if-ge v13, v5, :cond_11

    mul-int/lit8 v13, v13, 0xa

    add-int/2addr v13, v11

    add-int/lit8 v13, v13, -0x30

    :cond_11
    add-int/lit8 v0, v0, 0x1

    .line 113
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->charAt([CII)C

    move-result v11

    .line 114
    invoke-static {v11}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(C)Z

    move-result v5

    if-nez v5, :cond_10

    if-eqz v4, :cond_12

    neg-int v13, v13

    :cond_12
    add-int/2addr v10, v13

    move/from16 v18, v12

    goto :goto_c

    :cond_13
    move v0, v15

    const/4 v13, 0x0

    :goto_c
    if-nez v18, :cond_19

    if-lt v0, v3, :cond_19

    if-nez v26, :cond_14

    if-eqz v6, :cond_19

    :cond_14
    const/16 v0, 0x13

    if-le v6, v0, :cond_18

    const/4 v0, 0x0

    const-wide/16 v4, 0x0

    :goto_d
    if-ge v9, v15, :cond_16

    .line 136
    aget-char v6, v1, v9

    const/16 v8, 0x2e

    if-ne v6, v8, :cond_15

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_15
    const-wide v11, 0xde0b6b3a7640000L

    .line 140
    invoke-static {v4, v5, v11, v12}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v11

    if-gez v11, :cond_16

    mul-long v4, v4, v21

    int-to-long v11, v6

    add-long/2addr v4, v11

    sub-long v4, v4, v19

    :goto_e
    add-int/lit8 v9, v9, 0x1

    goto :goto_d

    :cond_16
    if-ge v9, v15, :cond_17

    goto :goto_f

    :cond_17
    const/16 v23, 0x0

    :goto_f
    sub-int/2addr v14, v9

    add-int/2addr v14, v0

    add-int v0, v14, v13

    move v9, v0

    move-wide v5, v4

    move/from16 v8, v23

    goto :goto_10

    :cond_18
    move-wide/from16 v5, v16

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_10
    move-object v0, v7

    move v7, v10

    move/from16 v4, v24

    .line 153
    invoke-virtual/range {v0 .. v9}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;->valueOfFloatLiteral([CIIZJIZI)J

    move-result-wide v1

    return-wide v1

    .line 125
    :cond_19
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_1a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "offset < 0 or length > str.length"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method abstract valueOfFloatLiteral([CIIZJIZI)J
.end method
