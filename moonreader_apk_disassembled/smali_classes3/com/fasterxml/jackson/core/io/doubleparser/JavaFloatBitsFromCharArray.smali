.class final Lcom/fasterxml/jackson/core/io/doubleparser/JavaFloatBitsFromCharArray;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;
.source "JavaFloatBitsFromCharArray.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;-><init>()V

    return-void
.end method


# virtual methods
.method nan()J
    .locals 2

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 22
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method negativeInfinity()J
    .locals 2

    const/high16 v0, -0x800000    # Float.NEGATIVE_INFINITY

    .line 27
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method positiveInfinity()J
    .locals 2

    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 32
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method valueOfFloatLiteral([CIIZJIZI)J
    .locals 0

    .line 39
    invoke-static/range {p4 .. p9}, Lcom/fasterxml/jackson/core/io/doubleparser/FastFloatMath;->decFloatLiteralToFloat(ZJIZI)F

    move-result p4

    .line 40
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p5

    if-eqz p5, :cond_0

    new-instance p4, Ljava/lang/String;

    sub-int/2addr p3, p2

    invoke-direct {p4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {p4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    :goto_0
    int-to-long p1, p1

    return-wide p1

    :cond_0
    invoke-static {p4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    goto :goto_0
.end method

.method valueOfHexLiteral([CIIZJIZI)J
    .locals 0

    .line 47
    invoke-static/range {p4 .. p9}, Lcom/fasterxml/jackson/core/io/doubleparser/FastFloatMath;->hexFloatLiteralToFloat(ZJIZI)F

    move-result p4

    .line 48
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p5

    if-eqz p5, :cond_0

    new-instance p4, Ljava/lang/String;

    sub-int/2addr p3, p2

    invoke-direct {p4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {p4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p4

    :cond_0
    invoke-static {p4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    return-wide p1
.end method
