.class public Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;
.super Ljava/lang/Object;
.source "JavaBigDecimalParser.java"


# static fields
.field private static final BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromByteArray;

.field private static final CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharArray;

.field private static final CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromByteArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromByteArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromByteArray;

    .line 104
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharArray;

    .line 106
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharSequence;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharSequence;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharSequence;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseBigDecimal(Ljava/lang/CharSequence;)Ljava/math/BigDecimal;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 124
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->parseBigDecimal(Ljava/lang/CharSequence;II)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal(Ljava/lang/CharSequence;II)Ljava/math/BigDecimal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 140
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharSequence;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharSequence;->parseBigDecimalString(Ljava/lang/CharSequence;II)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([B)Ljava/math/BigDecimal;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 153
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->parseBigDecimal([BII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([BII)Ljava/math/BigDecimal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 170
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromByteArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromByteArray;->parseBigDecimalString([BII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([C)Ljava/math/BigDecimal;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 182
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->parseBigDecimal([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigDecimal([CII)Ljava/math/BigDecimal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 201
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigDecimalParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharArray;

    invoke-virtual {v0, p0, p1, p2}, Lch/randelshofer/fastdoubleparser/JavaBigDecimalFromCharArray;->parseBigDecimalString([CII)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method
