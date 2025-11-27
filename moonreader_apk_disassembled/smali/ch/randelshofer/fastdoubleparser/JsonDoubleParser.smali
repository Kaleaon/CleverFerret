.class public Lch/randelshofer/fastdoubleparser/JsonDoubleParser;
.super Ljava/lang/Object;
.source "JsonDoubleParser.java"


# static fields
.field private static final BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromByteArray;

.field private static final CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;

.field private static final CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    new-instance v0, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromByteArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromByteArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromByteArray;

    .line 46
    new-instance v0, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;

    .line 48
    new-instance v0, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 53
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

    .line 66
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->parseDouble(Ljava/lang/CharSequence;II)D

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

    .line 82
    sget-object v0, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharSequence;->parseNumber(Ljava/lang/CharSequence;II)J

    move-result-wide p0

    .line 83
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

    .line 97
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->parseDouble([BII)D

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

    .line 114
    sget-object v0, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromByteArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromByteArray;->parseNumber([BII)J

    move-result-wide p0

    .line 115
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

    .line 127
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->parseDouble([CII)D

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

    .line 145
    sget-object v0, Lch/randelshofer/fastdoubleparser/JsonDoubleParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JsonDoubleBitsFromCharArray;->parseNumber([CII)J

    move-result-wide p0

    .line 146
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    return-wide p0
.end method
