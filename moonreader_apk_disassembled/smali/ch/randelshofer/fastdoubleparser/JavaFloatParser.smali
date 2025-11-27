.class public Lch/randelshofer/fastdoubleparser/JavaFloatParser;
.super Ljava/lang/Object;
.source "JavaFloatParser.java"


# static fields
.field private static final BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;

.field private static final CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharArray;

.field private static final CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;

    .line 32
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharArray;

    .line 34
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseFloat(Ljava/lang/CharSequence;)F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 52
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->parseFloat(Ljava/lang/CharSequence;II)F

    move-result p0

    return p0
.end method

.method public static parseFloat(Ljava/lang/CharSequence;II)F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 68
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharSequence;->parseFloatingPointLiteral(Ljava/lang/CharSequence;II)J

    move-result-wide p0

    long-to-int p1, p0

    .line 69
    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method

.method public static parseFloat([B)F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 82
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->parseFloat([BII)F

    move-result p0

    return p0
.end method

.method public static parseFloat([BII)F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 99
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromByteArray;->parseFloatingPointLiteral([BII)J

    move-result-wide p0

    long-to-int p1, p0

    .line 100
    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method

.method public static parseFloat([C)F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 113
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->parseFloat([CII)F

    move-result p0

    return p0
.end method

.method public static parseFloat([CII)F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 130
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaFloatParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaFloatBitsFromCharArray;->parseFloatingPointLiteral([CII)J

    move-result-wide p0

    long-to-int p1, p0

    .line 131
    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method
