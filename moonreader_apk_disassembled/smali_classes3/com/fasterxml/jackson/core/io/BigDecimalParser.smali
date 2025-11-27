.class public final Lcom/fasterxml/jackson/core/io/BigDecimalParser;
.super Ljava/lang/Object;
.source "BigDecimalParser.java"


# static fields
.field static final MAX_CHARS_TO_REPORT:I = 0x3e8


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static adjustScale(IJ)I
    .locals 5

    int-to-long v0, p0

    sub-long/2addr v0, p1

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    const-wide/32 v2, -0x80000000

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    long-to-int p0, v0

    return p0

    .line 188
    :cond_0
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Scale out of range: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " while adjusting scale "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " to exponent "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static parse(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse([C)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parse([C)Ljava/math/BigDecimal;
    .locals 2

    const/4 v0, 0x0

    .line 62
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parse([CII)Ljava/math/BigDecimal;
    .locals 3

    const/16 v0, 0x1f4

    if-ge p2, v0, :cond_0

    .line 37
    :try_start_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0, p1, p2}, Ljava/math/BigDecimal;-><init>([CII)V

    return-object v0

    .line 39
    :cond_0
    div-int/lit8 v0, p2, 0xa

    invoke-static {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parseBigDecimal([CIII)Ljava/math/BigDecimal;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 44
    :goto_0
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 47
    const-string v0, "Not a valid number representation"

    :cond_1
    const/16 v1, 0x3e8

    if-gt p2, v1, :cond_2

    .line 51
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_1

    .line 53
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v2, Ljava/lang/String;

    invoke-static {p0, p1, v1}, Ljava/util/Arrays;->copyOfRange([CII)[C

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "(truncated, full length is "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p0, p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " chars)"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 56
    :goto_1
    new-instance p0, Ljava/lang/NumberFormatException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Value \""

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\" can not be represented as `java.math.BigDecimal`, reason: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static parseBigDecimal([CIII)Ljava/math/BigDecimal;
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p3

    add-int v2, p1, p2

    const/4 v4, -0x1

    move/from16 v5, p1

    move v6, v5

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_0
    if-ge v5, v2, :cond_d

    .line 98
    aget-char v14, v0, v5

    const/16 v15, 0x2b

    .line 99
    const-string v3, "Multiple signs in exponent"

    const/16 p1, 0x1

    const-string v13, "Multiple signs in number"

    if-eq v14, v15, :cond_8

    const/16 v15, 0x45

    if-eq v14, v15, :cond_6

    const/16 v15, 0x65

    if-eq v14, v15, :cond_6

    const/16 v15, 0x2d

    if-eq v14, v15, :cond_2

    const/16 v3, 0x2e

    if-eq v14, v3, :cond_0

    if-ltz v9, :cond_b

    if-ne v7, v4, :cond_b

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_0
    if-gez v9, :cond_1

    move v9, v5

    goto :goto_2

    .line 138
    :cond_1
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "Multiple decimal points"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    if-ltz v7, :cond_4

    if-nez v11, :cond_3

    goto :goto_1

    .line 117
    :cond_3
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    if-nez v10, :cond_5

    add-int/lit8 v3, v5, 0x1

    move v6, v3

    const/4 v10, 0x1

    const/4 v12, 0x1

    goto :goto_2

    .line 122
    :cond_5
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    if-gez v7, :cond_7

    move v7, v5

    goto :goto_2

    .line 132
    :cond_7
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "Multiple exponent markers"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    if-ltz v7, :cond_a

    if-nez v11, :cond_9

    :goto_1
    const/4 v11, 0x1

    goto :goto_2

    .line 103
    :cond_9
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    if-nez v10, :cond_c

    add-int/lit8 v3, v5, 0x1

    move v6, v3

    const/4 v10, 0x1

    :cond_b
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 108
    :cond_c
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    const/16 p1, 0x1

    if-ltz v7, :cond_e

    .line 153
    new-instance v3, Ljava/lang/String;

    add-int/lit8 v4, v7, 0x1

    sub-int/2addr v2, v7

    add-int/lit8 v2, v2, -0x1

    invoke-direct {v3, v0, v4, v2}, Ljava/lang/String;-><init>([CII)V

    .line 154
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    int-to-long v4, v3

    .line 155
    invoke-static {v8, v4, v5}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->adjustScale(IJ)I

    move-result v8

    move v2, v7

    goto :goto_3

    :cond_e
    const/4 v3, 0x0

    :goto_3
    if-ltz v9, :cond_f

    sub-int v4, v9, v6

    .line 164
    invoke-static {v0, v6, v4, v3, v1}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->toBigDecimalRec([CIIII)Ljava/math/BigDecimal;

    move-result-object v4

    sub-int/2addr v2, v9

    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v9, v9, 0x1

    sub-int/2addr v3, v2

    .line 167
    invoke-static {v0, v9, v2, v3, v1}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->toBigDecimalRec([CIIII)Ljava/math/BigDecimal;

    move-result-object v0

    .line 169
    invoke-virtual {v4, v0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_4

    :cond_f
    sub-int/2addr v2, v6

    .line 171
    invoke-static {v0, v6, v2, v3, v1}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->toBigDecimalRec([CIIII)Ljava/math/BigDecimal;

    move-result-object v0

    :goto_4
    if-eqz v8, :cond_10

    .line 175
    invoke-virtual {v0, v8}, Ljava/math/BigDecimal;->setScale(I)Ljava/math/BigDecimal;

    move-result-object v0

    :cond_10
    if-eqz v12, :cond_11

    .line 179
    invoke-virtual {v0}, Ljava/math/BigDecimal;->negate()Ljava/math/BigDecimal;

    move-result-object v0

    :cond_11
    return-object v0
.end method

.method public static parseWithFastParser(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 4

    .line 67
    :try_start_0
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalParser;->parseBigDecimal(Ljava/lang/CharSequence;)Ljava/math/BigDecimal;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3e8

    if-gt v1, v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    .line 70
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " [truncated]"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 71
    :goto_0
    new-instance v1, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Value \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\" can not be represented as `java.math.BigDecimal`, reason: "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static parseWithFastParser([CII)Ljava/math/BigDecimal;
    .locals 2

    .line 78
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaBigDecimalParser;->parseBigDecimal([CII)Ljava/math/BigDecimal;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    const/16 v1, 0x3e8

    if-gt p2, v1, :cond_0

    .line 80
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, p0, p1, v1}, Ljava/lang/String;-><init>([CII)V

    const-string p0, " [truncated]"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 82
    :goto_0
    new-instance p0, Ljava/lang/NumberFormatException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Value \""

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\" can not be represented as `java.math.BigDecimal`, reason: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static toBigDecimalRec([CIIII)Ljava/math/BigDecimal;
    .locals 2

    if-le p2, p4, :cond_0

    .line 198
    div-int/lit8 v0, p2, 0x2

    add-int v1, p3, p2

    sub-int/2addr v1, v0

    .line 199
    invoke-static {p0, p1, v0, v1, p4}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->toBigDecimalRec([CIIII)Ljava/math/BigDecimal;

    move-result-object v1

    add-int/2addr p1, v0

    sub-int/2addr p2, v0

    .line 200
    invoke-static {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->toBigDecimalRec([CIIII)Ljava/math/BigDecimal;

    move-result-object p0

    .line 202
    invoke-virtual {v1, p0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0

    :cond_0
    if-nez p2, :cond_1

    .line 206
    sget-object p0, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    return-object p0

    .line 210
    :cond_1
    new-instance p4, Ljava/math/BigDecimal;

    invoke-direct {p4, p0, p1, p2}, Ljava/math/BigDecimal;-><init>([CII)V

    .line 212
    invoke-virtual {p4, p3}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method
