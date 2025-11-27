.class final Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;
.super Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;
.source "JsonDoubleBitsFromCharArray.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharArray;-><init>()V

    return-void
.end method


# virtual methods
.method valueOfFloatLiteral([CIIZJIZI)J
    .locals 0

    .line 23
    invoke-static/range {p4 .. p9}, Lch/randelshofer/fastdoubleparser/FastDoubleMath;->tryDecFloatToDoubleTruncated(ZJIZI)D

    move-result-wide p4

    .line 25
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
