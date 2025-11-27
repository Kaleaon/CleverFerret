.class public final Lcom/fasterxml/jackson/core/io/NumberInput;
.super Ljava/lang/Object;
.source "NumberInput.java"


# static fields
.field static final L_BILLION:J = 0x3b9aca00L

.field static final MAX_LONG_STR:Ljava/lang/String;

.field static final MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

.field public static final NASTY_SMALL_DOUBLE:Ljava/lang/String; = "2.2250738585072012e-308"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-wide/high16 v0, -0x8000000000000000L

    .line 31
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

    const-wide v0, 0x7fffffffffffffffL

    .line 32
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MAX_LONG_STR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inLongRange(Ljava/lang/String;Z)Z
    .locals 6

    if-eqz p1, :cond_0

    .line 244
    sget-object p1, Lcom/fasterxml/jackson/core/io/NumberInput;->MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/fasterxml/jackson/core/io/NumberInput;->MAX_LONG_STR:Ljava/lang/String;

    .line 245
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 246
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v0, :cond_1

    return v2

    :cond_1
    const/4 v3, 0x0

    if-le v1, v0, :cond_2

    return v3

    :cond_2
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_5

    .line 252
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    sub-int/2addr v4, v5

    if-eqz v4, :cond_4

    if-gez v4, :cond_3

    return v2

    :cond_3
    return v3

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    return v2
.end method

.method public static inLongRange([CIIZ)Z
    .locals 5

    if-eqz p3, :cond_0

    .line 217
    sget-object p3, Lcom/fasterxml/jackson/core/io/NumberInput;->MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p3, Lcom/fasterxml/jackson/core/io/NumberInput;->MAX_LONG_STR:Ljava/lang/String;

    .line 218
    :goto_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge p2, v0, :cond_1

    return v1

    :cond_1
    const/4 v2, 0x0

    if-le p2, v0, :cond_2

    return v2

    :cond_2
    const/4 p2, 0x0

    :goto_1
    if-ge p2, v0, :cond_5

    add-int v3, p1, p2

    .line 223
    aget-char v3, p0, v3

    invoke-virtual {p3, p2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    sub-int/2addr v3, v4

    if-eqz v3, :cond_4

    if-gez v3, :cond_3

    return v1

    :cond_3
    return v2

    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_5
    return v1
.end method

.method public static parseAsDouble(Ljava/lang/String;D)D
    .locals 1

    const/4 v0, 0x0

    .line 346
    invoke-static {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseAsDouble(Ljava/lang/String;DZ)D

    move-result-wide p0

    return-wide p0
.end method

.method public static parseAsDouble(Ljava/lang/String;DZ)D
    .locals 1

    if-nez p0, :cond_0

    goto :goto_0

    .line 359
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 360
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 365
    :cond_1
    :try_start_0
    invoke-static {p0, p3}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;Z)D

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    :goto_0
    return-wide p1
.end method

.method public static parseAsInt(Ljava/lang/String;I)I
    .locals 5

    if-nez p0, :cond_0

    goto :goto_2

    .line 265
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 266
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_2

    :cond_1
    const/4 v1, 0x0

    .line 273
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2b

    const/4 v4, 0x1

    if-ne v2, v3, :cond_2

    .line 275
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 276
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    :cond_2
    const/16 v3, 0x2d

    if-ne v2, v3, :cond_3

    const/4 v1, 0x1

    :cond_3
    :goto_0
    if-ge v1, v0, :cond_6

    .line 281
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x39

    if-gt v2, v3, :cond_5

    const/16 v3, 0x30

    if-ge v2, v3, :cond_4

    goto :goto_1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 287
    :cond_5
    :goto_1
    :try_start_0
    invoke-static {p0, v4}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;Z)D

    move-result-wide p0

    double-to-int p0, p0

    return p0

    .line 294
    :cond_6
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :goto_2
    return p1
.end method

.method public static parseAsLong(Ljava/lang/String;J)J
    .locals 5

    if-nez p0, :cond_0

    goto :goto_2

    .line 304
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 305
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_2

    :cond_1
    const/4 v1, 0x0

    .line 312
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2b

    const/4 v4, 0x1

    if-ne v2, v3, :cond_2

    .line 314
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 315
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    :cond_2
    const/16 v3, 0x2d

    if-ne v2, v3, :cond_3

    const/4 v1, 0x1

    :cond_3
    :goto_0
    if-ge v1, v0, :cond_6

    .line 320
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x39

    if-gt v2, v3, :cond_5

    const/16 v3, 0x30

    if-ge v2, v3, :cond_4

    goto :goto_1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 326
    :cond_5
    :goto_1
    :try_start_0
    invoke-static {p0, v4}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;Z)D

    move-result-wide p0

    double-to-long p0, p0

    return-wide p0

    .line 333
    :cond_6
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    :goto_2
    return-wide p1
.end method

.method public static parseBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 419
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal(Ljava/lang/String;Z)Ljava/math/BigDecimal;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 431
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parseWithFastParser(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0

    .line 432
    :cond_0
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([C)Ljava/math/BigDecimal;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 469
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse([C)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([CII)Ljava/math/BigDecimal;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 443
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([CIIZ)Ljava/math/BigDecimal;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 459
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parseWithFastParser([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0

    .line 460
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([CZ)Ljava/math/BigDecimal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 480
    array-length v0, p0

    .line 481
    invoke-static {p0, p1, v0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parseWithFastParser([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0

    .line 482
    :cond_0
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigDecimalParser;->parse([C)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 492
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static parseBigInteger(Ljava/lang/String;Z)Ljava/math/BigInteger;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 504
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/BigIntegerParser;->parseWithFastParser(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 506
    :cond_0
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigIntegerWithRadix(Ljava/lang/String;IZ)Ljava/math/BigInteger;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 521
    invoke-static {p0, p1}, Lcom/fasterxml/jackson/core/io/BigIntegerParser;->parseWithFastParser(Ljava/lang/String;I)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 523
    :cond_0
    new-instance p2, Ljava/math/BigInteger;

    invoke-direct {p2, p0, p1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    return-object p2
.end method

.method public static parseDouble(Ljava/lang/String;)D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 377
    invoke-static {p0, v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;Z)D

    move-result-wide v0

    return-wide v0
.end method

.method public static parseDouble(Ljava/lang/String;Z)D
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 388
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaDoubleParser;->parseDouble(Ljava/lang/CharSequence;)D

    move-result-wide p0

    return-wide p0

    :cond_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    return-wide p0
.end method

.method public static parseFloat(Ljava/lang/String;)F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 399
    invoke-static {p0, v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseFloat(Ljava/lang/String;Z)F

    move-result p0

    return p0
.end method

.method public static parseFloat(Ljava/lang/String;Z)F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 410
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/JavaFloatParser;->parseFloat(Ljava/lang/CharSequence;)F

    move-result p0

    return p0

    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    return p0
.end method

.method public static parseInt(Ljava/lang/String;)I
    .locals 10

    const/4 v0, 0x0

    .line 97
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 98
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x2d

    const/4 v4, 0x1

    if-ne v1, v3, :cond_0

    const/4 v0, 0x1

    :cond_0
    const/4 v3, 0x2

    const/16 v5, 0xa

    if-eqz v0, :cond_3

    if-eq v2, v4, :cond_2

    if-le v2, v5, :cond_1

    goto :goto_0

    .line 107
    :cond_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/4 v4, 0x2

    goto :goto_1

    .line 105
    :cond_2
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_3
    const/16 v6, 0x9

    if-le v2, v6, :cond_4

    .line 110
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_4
    :goto_1
    const/16 v6, 0x39

    if-gt v1, v6, :cond_f

    const/16 v7, 0x30

    if-ge v1, v7, :cond_5

    goto :goto_7

    :cond_5
    sub-int/2addr v1, v7

    if-ge v4, v2, :cond_d

    add-int/lit8 v8, v4, 0x1

    .line 118
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-gt v9, v6, :cond_c

    if-ge v9, v7, :cond_6

    goto :goto_5

    :cond_6
    mul-int/lit8 v1, v1, 0xa

    sub-int/2addr v9, v7

    add-int/2addr v1, v9

    if-ge v8, v2, :cond_d

    add-int/2addr v4, v3

    .line 124
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-gt v3, v6, :cond_b

    if-ge v3, v7, :cond_7

    goto :goto_4

    :cond_7
    mul-int/lit8 v1, v1, 0xa

    sub-int/2addr v3, v7

    add-int/2addr v1, v3

    if-ge v4, v2, :cond_d

    :goto_2
    add-int/lit8 v3, v4, 0x1

    .line 132
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-gt v4, v6, :cond_a

    if-ge v4, v7, :cond_8

    goto :goto_3

    :cond_8
    mul-int/lit8 v1, v1, 0xa

    add-int/lit8 v4, v4, -0x30

    add-int/2addr v1, v4

    if-lt v3, v2, :cond_9

    goto :goto_6

    :cond_9
    move v4, v3

    goto :goto_2

    .line 134
    :cond_a
    :goto_3
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 126
    :cond_b
    :goto_4
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 120
    :cond_c
    :goto_5
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_d
    :goto_6
    if-eqz v0, :cond_e

    neg-int p0, v1

    return p0

    :cond_e
    return v1

    .line 114
    :cond_f
    :goto_7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static parseInt([CII)I
    .locals 2

    if-lez p2, :cond_0

    .line 50
    aget-char v0, p0, p1

    const/16 v1, 0x2b

    if-ne v0, v1, :cond_0

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, -0x1

    :cond_0
    add-int v0, p1, p2

    add-int/lit8 v0, v0, -0x1

    .line 55
    aget-char v0, p0, v0

    add-int/lit8 v0, v0, -0x30

    packed-switch p2, :pswitch_data_0

    return v0

    :pswitch_0
    add-int/lit8 p2, p1, 0x1

    .line 59
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    const v1, 0x5f5e100

    mul-int p1, p1, v1

    add-int/2addr v0, p1

    move p1, p2

    :pswitch_1
    add-int/lit8 p2, p1, 0x1

    .line 61
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    const v1, 0x989680

    mul-int p1, p1, v1

    add-int/2addr v0, p1

    move p1, p2

    :pswitch_2
    add-int/lit8 p2, p1, 0x1

    .line 63
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    const v1, 0xf4240

    mul-int p1, p1, v1

    add-int/2addr v0, p1

    move p1, p2

    :pswitch_3
    add-int/lit8 p2, p1, 0x1

    .line 65
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    const v1, 0x186a0

    mul-int p1, p1, v1

    add-int/2addr v0, p1

    move p1, p2

    :pswitch_4
    add-int/lit8 p2, p1, 0x1

    .line 67
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    mul-int/lit16 p1, p1, 0x2710

    add-int/2addr v0, p1

    move p1, p2

    :pswitch_5
    add-int/lit8 p2, p1, 0x1

    .line 69
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    mul-int/lit16 p1, p1, 0x3e8

    add-int/2addr v0, p1

    move p1, p2

    :pswitch_6
    add-int/lit8 p2, p1, 0x1

    .line 71
    aget-char p1, p0, p1

    add-int/lit8 p1, p1, -0x30

    mul-int/lit8 p1, p1, 0x64

    add-int/2addr v0, p1

    move p1, p2

    .line 73
    :pswitch_7
    aget-char p0, p0, p1

    add-int/lit8 p0, p0, -0x30

    mul-int/lit8 p0, p0, 0xa

    add-int/2addr v0, p0

    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parseLong(Ljava/lang/String;)J
    .locals 2

    .line 191
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-gt v0, v1, :cond_0

    .line 193
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt(Ljava/lang/String;)I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    .line 196
    :cond_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static parseLong([CII)J
    .locals 5

    const/16 v0, 0x9

    sub-int/2addr p2, v0

    .line 148
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt([CII)I

    move-result v1

    int-to-long v1, v1

    const-wide/32 v3, 0x3b9aca00

    mul-long v1, v1, v3

    add-int/2addr p1, p2

    .line 149
    invoke-static {p0, p1, v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt([CII)I

    move-result p0

    int-to-long p0, p0

    add-long/2addr v1, p0

    return-wide v1
.end method

.method public static parseLong19([CIZ)J
    .locals 6

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x13

    if-ge v2, v3, :cond_0

    add-int v3, p1, v2

    .line 174
    aget-char v3, p0, v3

    const-wide/16 v4, 0xa

    mul-long v0, v0, v4

    add-int/lit8 v3, v3, -0x30

    int-to-long v3, v3

    add-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    neg-long p0, v0

    return-wide p0

    :cond_1
    return-wide v0
.end method
