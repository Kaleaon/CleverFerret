.class Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskByteArray;
.super Ljava/lang/Object;
.source "ParseDigitsTaskByteArray.java"


# static fields
.field public static final RECURSION_THRESHOLD:I = 0x190


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static parseDigitsIterative([BII)Ljava/math/BigInteger;
    .locals 6

    sub-int v0, p2, p1

    .line 45
    new-instance v1, Lcom/fasterxml/jackson/core/io/doubleparser/BigSignificand;

    int-to-long v2, v0

    invoke-static {v2, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->estimateNumBits(J)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lcom/fasterxml/jackson/core/io/doubleparser/BigSignificand;-><init>(J)V

    and-int/lit8 v0, v0, 0x7

    add-int/2addr v0, p1

    .line 47
    invoke-static {p0, p1, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseUpTo7Digits([BII)I

    move-result p1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ltz p1, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 49
    :goto_0
    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/BigSignificand;->add(I)V

    :goto_1
    if-ge v0, p2, :cond_2

    .line 51
    invoke-static {p0, v0}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->tryToParseEightDigits([BI)I

    move-result p1

    if-ltz p1, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    const/4 v5, 0x0

    :goto_2
    and-int/2addr v4, v5

    const v5, 0x5f5e100

    .line 53
    invoke-virtual {v1, v5, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/BigSignificand;->fma(II)V

    add-int/lit8 v0, v0, 0x8

    goto :goto_1

    :cond_2
    if-eqz v4, :cond_3

    .line 58
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/io/doubleparser/BigSignificand;->toBigInteger()Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 56
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string p1, "illegal syntax"

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static parseDigitsRecursive([BIILjava/util/Map;)Ljava/math/BigInteger;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/math/BigInteger;",
            ">;)",
            "Ljava/math/BigInteger;"
        }
    .end annotation

    sub-int v0, p2, p1

    const/16 v1, 0x190

    if-gt v0, v1, :cond_0

    .line 73
    invoke-static {p0, p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskByteArray;->parseDigitsIterative([BII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 77
    :cond_0
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/FastIntegerMath;->splitFloor16(II)I

    move-result v0

    .line 78
    invoke-static {p0, p1, v0, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskByteArray;->parseDigitsRecursive([BIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    .line 79
    invoke-static {p0, v0, p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/ParseDigitsTaskByteArray;->parseDigitsRecursive([BIILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p0

    sub-int/2addr p2, v0

    .line 82
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/math/BigInteger;

    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier;->multiply(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method
