.class final Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;
.super Lch/randelshofer/fastdoubleparser/AbstractJavaFloatingPointBitsFromCharSequence;
.source "JavaFloatBitsFromCharSequence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractJavaFloatingPointBitsFromCharSequence;-><init>()V

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

.method valueOfFloatLiteral(Ljava/lang/CharSequence;IIZJIZI)J
    .locals 0

    .line 39
    invoke-static/range {p4 .. p9}, Lch/randelshofer/fastdoubleparser/FastFloatMath;->decFloatLiteralToFloat(ZJIZI)F

    move-result p4

    .line 40
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p5

    if-eqz p5, :cond_0

    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p4

    :cond_0
    invoke-static {p4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    return-wide p1
.end method

.method valueOfHexLiteral(Ljava/lang/CharSequence;IIZJIZI)J
    .locals 0

    .line 47
    invoke-static/range {p4 .. p9}, Lch/randelshofer/fastdoubleparser/FastFloatMath;->hexFloatLiteralToFloat(ZJIZI)F

    move-result p4

    .line 48
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p5

    if-eqz p5, :cond_0

    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p4

    :cond_0
    invoke-static {p4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    return-wide p1
.end method
