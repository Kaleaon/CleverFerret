.class abstract Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;
.super Lch/randelshofer/fastdoubleparser/AbstractFloatValueParser;
.source "AbstractJsonFloatingPointBitsFromByteArray.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractFloatValueParser;-><init>()V

    return-void
.end method


# virtual methods
.method public final parseNumber([BII)J
    .locals 27

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
    invoke-static {v1, v2, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->charAt([BII)B

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
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->charAt([BII)B

    move-result v9

    if-eqz v9, :cond_1

    move/from16 v26, v9

    move v9, v0

    move/from16 v0, v26

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
    invoke-static {v1, v9, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->charAt([BII)B

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

    if-ge v15, v3, :cond_a

    .line 67
    aget-byte v0, v1, v15

    .line 68
    invoke-static {v0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(B)Z

    move-result v23

    if-eqz v23, :cond_6

    mul-long v16, v16, v21

    move/from16 v24, v7

    const/16 v23, 0x1

    int-to-long v6, v0

    add-long v16, v16, v6

    sub-long v16, v16, v19

    goto :goto_8

    :cond_6
    move/from16 v24, v7

    const/16 v23, 0x1

    if-ne v0, v5, :cond_b

    if-ltz v14, :cond_7

    const/4 v5, 0x1

    goto :goto_5

    :cond_7
    const/4 v5, 0x0

    :goto_5
    or-int v18, v18, v5

    move v5, v15

    :goto_6
    add-int/lit8 v6, v3, -0x4

    if-ge v5, v6, :cond_9

    add-int/lit8 v6, v5, 0x1

    .line 84
    invoke-static {v1, v6}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseFourDigits([BI)I

    move-result v6

    if-gez v6, :cond_8

    goto :goto_7

    :cond_8
    const-wide/16 v19, 0x2710

    mul-long v16, v16, v19

    int-to-long v6, v6

    add-long v16, v16, v6

    add-int/lit8 v5, v5, 0x4

    goto :goto_6

    :cond_9
    :goto_7
    move v14, v15

    move v15, v5

    :goto_8
    add-int/lit8 v15, v15, 0x1

    move/from16 v7, v24

    goto :goto_4

    :cond_a
    move/from16 v24, v7

    const/16 v23, 0x1

    :cond_b
    if-gez v14, :cond_c

    sub-int v6, v15, v9

    move v14, v15

    const/4 v7, 0x0

    goto :goto_9

    :cond_c
    sub-int v6, v15, v9

    add-int/lit8 v6, v6, -0x1

    sub-int v7, v14, v15

    add-int/lit8 v7, v7, 0x1

    :goto_9
    or-int/lit8 v0, v0, 0x20

    const/16 v25, 0x30

    const/16 v10, 0x65

    if-ne v0, v10, :cond_13

    add-int/lit8 v0, v15, 0x1

    .line 111
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->charAt([BII)B

    move-result v10

    if-ne v10, v4, :cond_d

    const/4 v4, 0x1

    goto :goto_a

    :cond_d
    const/4 v4, 0x0

    :goto_a
    if-nez v4, :cond_e

    const/16 v12, 0x2b

    if-ne v10, v12, :cond_f

    :cond_e
    add-int/lit8 v0, v15, 0x2

    .line 114
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->charAt([BII)B

    move-result v10

    .line 116
    :cond_f
    invoke-static {v10}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(B)Z

    move-result v12

    xor-int/lit8 v12, v12, 0x1

    or-int v12, v18, v12

    const/4 v13, 0x0

    :cond_10
    const/16 v5, 0x400

    if-ge v13, v5, :cond_11

    mul-int/lit8 v13, v13, 0xa

    add-int/2addr v13, v10

    add-int/lit8 v13, v13, -0x30

    :cond_11
    add-int/lit8 v0, v0, 0x1

    .line 122
    invoke-static {v1, v0, v3}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->charAt([BII)B

    move-result v10

    .line 123
    invoke-static {v10}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->isDigit(B)Z

    move-result v5

    if-nez v5, :cond_10

    if-eqz v4, :cond_12

    neg-int v13, v13

    :cond_12
    add-int/2addr v7, v13

    move/from16 v18, v12

    goto :goto_b

    :cond_13
    move v0, v15

    const/4 v13, 0x0

    :goto_b
    if-nez v18, :cond_19

    if-lt v0, v3, :cond_19

    if-nez v11, :cond_14

    if-eqz v6, :cond_19

    :cond_14
    const/16 v0, 0x13

    if-le v6, v0, :cond_18

    const/4 v0, 0x0

    const-wide/16 v4, 0x0

    :goto_c
    if-ge v9, v15, :cond_16

    .line 145
    aget-byte v6, v1, v9

    const/16 v8, 0x2e

    if-ne v6, v8, :cond_15

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_15
    const-wide v10, 0xde0b6b3a7640000L

    .line 149
    invoke-static {v4, v5, v10, v11}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v10

    if-gez v10, :cond_16

    mul-long v4, v4, v21

    int-to-long v10, v6

    add-long/2addr v4, v10

    sub-long v4, v4, v19

    :goto_d
    add-int/lit8 v9, v9, 0x1

    goto :goto_c

    :cond_16
    if-ge v9, v15, :cond_17

    goto :goto_e

    :cond_17
    const/16 v23, 0x0

    :goto_e
    sub-int/2addr v14, v9

    add-int/2addr v14, v0

    add-int v0, v14, v13

    move v9, v0

    move-wide v5, v4

    move/from16 v8, v23

    move/from16 v4, v24

    move-object/from16 v0, p0

    goto :goto_f

    :cond_18
    move-wide/from16 v5, v16

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move/from16 v4, v24

    .line 162
    :goto_f
    invoke-virtual/range {v0 .. v9}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromByteArray;->valueOfFloatLiteral([BIIZJIZI)J

    move-result-wide v1

    return-wide v1

    .line 134
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

.method abstract valueOfFloatLiteral([BIIZJIZI)J
.end method
