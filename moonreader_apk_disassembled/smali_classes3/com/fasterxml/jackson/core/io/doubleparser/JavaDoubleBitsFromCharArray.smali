.class final Lcom/fasterxml/jackson/core/io/doubleparser/JavaDoubleBitsFromCharArray;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;
.source "JavaDoubleBitsFromCharArray.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractJavaFloatingPointBitsFromCharArray;-><init>()V

    return-void
.end method


# virtual methods
.method nan()J
    .locals 2

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    return-wide v0
.end method

.method negativeInfinity()J
    .locals 2

    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 26
    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    return-wide v0
.end method

.method positiveInfinity()J
    .locals 2

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 31
    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    return-wide v0
.end method

.method valueOfFloatLiteral([CIIZJIZI)J
    .locals 0

    .line 38
    invoke-static/range {p4 .. p9}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleMath;->tryDecFloatToDoubleTruncated(ZJIZI)D

    move-result-wide p4

    .line 40
    invoke-static {p4, p5}, Ljava/lang/Double;->isNaN(D)Z

    move-result p6

    if-eqz p6, :cond_0

    new-instance p4, Ljava/lang/String;

    sub-int/2addr p3, p2

    invoke-direct {p4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {p4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p4

    :cond_0
    invoke-static {p4, p5}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    return-wide p1
.end method

.method valueOfHexLiteral([CIIZJIZI)J
    .locals 8

    int-to-long v3, p7

    move/from16 v0, p9

    int-to-long v6, v0

    move v0, p4

    move-wide v1, p5

    move/from16 v5, p8

    .line 47
    invoke-static/range {v0 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleMath;->tryHexFloatToDoubleTruncated(ZJJZJ)D

    move-result-wide p4

    .line 49
    invoke-static {p4, p5}, Ljava/lang/Double;->isNaN(D)Z

    move-result p6

    if-eqz p6, :cond_0

    new-instance p4, Ljava/lang/String;

    sub-int/2addr p3, p2

    invoke-direct {p4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {p4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p4

    :cond_0
    invoke-static {p4, p5}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    return-wide p1
.end method
