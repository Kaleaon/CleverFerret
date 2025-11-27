.class Lch/randelshofer/fastdoubleparser/ParseDigitsTaskCharSequence;
.super Ljava/lang/Object;
.source "ParseDigitsTaskCharSequence.java"


# static fields
.field public static final RECURSION_THRESHOLD:I = 0x190


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static parseDigitsIterative(Ljava/lang/CharSequence;II)Ljava/math/BigInteger;
    .locals 6

    sub-int v0, p2, p1

    .line 46
    new-instance v1, Lch/randelshofer/fastdoubleparser/BigSignificand;

    int-to-long v2, v0

    invoke-static {v2, v3}, Lch/randelshofer/fastdoubleparser/FastIntegerMath;->estimateNumBits(J)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lch/randelshofer/fastdoubleparser/BigSignificand;-><init>(J)V

    and-int/lit8 v0, v0, 0x7

    add-int/2addr v0, p1

    .line 48
    invoke-static {p0, p1, v0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseUpTo7Digits(Ljava/lang/CharSequence;II)I

    move-result p1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ltz p1, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 50
    :goto_0
    invoke-virtual {v1, p1}, Lch/randelshofer/fastdoubleparser/BigSignificand;->add(I)V

    :goto_1
    if-ge v0, p2, :cond_2

    .line 52
    invoke-static {p0, v0}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->tryToParseEightDigits(Ljava/lang/CharSequence;I)I

    move-result p1

    if-ltz p1, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    const/4 v5, 0x0

    :goto_2
    and-int/2addr v4, v5

    const v5, 0x5f5e100

    .line 54
    invoke-virtual {v1, v5, p1}, Lch/randelshofer/fastdoubleparser/BigSignificand;->fma(II)V

    add-int/lit8 v0, v0, 0x8

    goto :goto_1

    :cond_2
    if-eqz v4, :cond_3

    .line 59
    invoke-virtual {v1}, Lch/randelshofer/fastdoubleparser/BigSignificand;->toBigInteger()Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 57
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string p1, "illegal syntax"

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static parseDigitsRecursive(Ljava/lang/CharSequence;IILjava/util/Map;)Ljava/math/BigInteger;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "II",
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

    .line 75
    invoke-static {p0, p1, p2}, Lch/randelshofer/fastdoubleparser/ParseDigitsTaskCharSequence;->parseDigitsIterative(Ljava/lang/CharSequence;II)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0

    .line 79
    :cond_0
    invoke-static {p1, p2}, Lch/randelshofer/fastdoubleparser/FastIntegerMath;->splitFloor16(II)I

    move-result v0

    .line 80
    invoke-static {p0, p1, v0, p3}, Lch/randelshofer/fastdoubleparser/ParseDigitsTaskCharSequence;->parseDigitsRecursive(Ljava/lang/CharSequence;IILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p1

    .line 81
    invoke-static {p0, v0, p2, p3}, Lch/randelshofer/fastdoubleparser/ParseDigitsTaskCharSequence;->parseDigitsRecursive(Ljava/lang/CharSequence;IILjava/util/Map;)Ljava/math/BigInteger;

    move-result-object p0

    sub-int/2addr p2, v0

    .line 84
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/math/BigInteger;

    invoke-static {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier;->multiply(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method
