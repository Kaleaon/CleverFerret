.class final Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;
.super Lch/randelshofer/fastdoubleparser/AbstractJavaFloatingPointBitsFromByteArray;
.source "JavaFloatBitsFromByteArray.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lch/randelshofer/fastdoubleparser/AbstractJavaFloatingPointBitsFromByteArray;-><init>()V

    return-void
.end method


# virtual methods
.method nan()J
    .locals 2

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 24
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method negativeInfinity()J
    .locals 2

    const/high16 v0, -0x800000    # Float.NEGATIVE_INFINITY

    .line 29
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method positiveInfinity()J
    .locals 2

    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 34
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method valueOfFloatLiteral([BIIZJIZI)J
    .locals 0

    .line 41
    invoke-static/range {p4 .. p9}, Lch/randelshofer/fastdoubleparser/FastFloatMath;->decFloatLiteralToFloat(ZJIZI)F

    move-result p4

    .line 42
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p5

    if-eqz p5, :cond_0

    new-instance p4, Ljava/lang/String;

    sub-int/2addr p3, p2

    sget-object p5, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {p4, p1, p2, p3, p5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-static {p4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p4

    :cond_0
    invoke-static {p4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    return-wide p1
.end method

.method valueOfHexLiteral([BIIZJIZI)J
    .locals 0

    .line 50
    invoke-static/range {p4 .. p9}, Lch/randelshofer/fastdoubleparser/FastFloatMath;->hexFloatLiteralToFloat(ZJIZI)F

    move-result p4

    .line 51
    invoke-static {p4}, Ljava/lang/Float;->isNaN(F)Z

    move-result p5

    if-eqz p5, :cond_0

    new-instance p4, Ljava/lang/String;

    sub-int/2addr p3, p2

    sget-object p5, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {p4, p1, p2, p3, p5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-static {p4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p4

    :cond_0
    invoke-static {p4}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    return-wide p1
.end method
