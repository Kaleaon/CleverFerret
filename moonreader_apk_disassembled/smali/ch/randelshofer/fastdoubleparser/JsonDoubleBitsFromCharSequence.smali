.class final Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;
.super Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharSequence;
.source "JsonDoubleBitsFromCharSequence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractJsonFloatingPointBitsFromCharSequence;-><init>()V

    return-void
.end method


# virtual methods
.method valueOfFloatLiteral(Ljava/lang/CharSequence;IIZJIZI)J
    .locals 0

    .line 23
    invoke-static/range {p4 .. p9}, Lch/randelshofer/fastdoubleparser/FastDoubleMath;->tryDecFloatToDoubleTruncated(ZJIZI)D

    move-result-wide p4

    .line 25
    invoke-static {p4, p5}, Ljava/lang/Double;->isNaN(D)Z

    move-result p6

    if-eqz p6, :cond_0

    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p4

    :cond_0
    invoke-static {p4, p5}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    return-wide p1
.end method
