.class public Lch/randelshofer/fastdoubleparser/JavaDoubleParser;
.super Ljava/lang/Object;
.source "JavaDoubleParser.java"


# static fields
.field private static final BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromByteArray;

.field private static final CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharArray;

.field private static final CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 155
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromByteArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromByteArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromByteArray;

    .line 157
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharArray;

    .line 159
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharSequence;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharSequence;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharSequence;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseDouble(Ljava/lang/CharSequence;)D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 177
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->parseDouble(Ljava/lang/CharSequence;II)D

    move-result-wide v0

    return-wide v0
.end method

.method public static parseDouble(Ljava/lang/CharSequence;II)D
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 193
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharSequence;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharSequence;->parseFloatingPointLiteral(Ljava/lang/CharSequence;II)J

    move-result-wide p0

    .line 194
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    return-wide p0
.end method

.method public static parseDouble([B)D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 208
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->parseDouble([BII)D

    move-result-wide v0

    return-wide v0
.end method

.method public static parseDouble([BII)D
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 225
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromByteArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromByteArray;->parseFloatingPointLiteral([BII)J

    move-result-wide p0

    .line 226
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    return-wide p0
.end method

.method public static parseDouble([C)D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 238
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->parseDouble([CII)D

    move-result-wide v0

    return-wide v0
.end method

.method public static parseDouble([CII)D
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 257
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaDoubleParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaDoubleBitsFromCharArray;->parseFloatingPointLiteral([CII)J

    move-result-wide p0

    .line 258
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    return-wide p0
.end method
