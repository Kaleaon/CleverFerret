.class public Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;
.super Ljava/lang/Object;
.source "JavaBigIntegerParser.java"


# static fields
.field private static final BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

.field private static final CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

.field private static final CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

    .line 60
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

    .line 62
    new-instance v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;

    invoke-direct {v0}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;-><init>()V

    sput-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseBigInteger(Ljava/lang/CharSequence;)Ljava/math/BigInteger;
    .locals 4

    .line 79
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v3, v1, v2}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseBigIntegerLiteral(Ljava/lang/CharSequence;III)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger(Ljava/lang/CharSequence;I)Ljava/math/BigInteger;
    .locals 3

    .line 92
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;

    const/4 v1, 0x0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-virtual {v0, p0, v1, v2, p1}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseBigIntegerLiteral(Ljava/lang/CharSequence;III)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger(Ljava/lang/CharSequence;II)Ljava/math/BigInteger;
    .locals 2

    .line 107
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;

    const/16 v1, 0xa

    invoke-virtual {v0, p0, p1, p2, v1}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseBigIntegerLiteral(Ljava/lang/CharSequence;III)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger(Ljava/lang/CharSequence;III)Ljava/math/BigInteger;
    .locals 1

    .line 124
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_SEQUENCE_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;

    invoke-virtual {v0, p0, p1, p2, p3}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharSequence;->parseBigIntegerLiteral(Ljava/lang/CharSequence;III)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([B)Ljava/math/BigInteger;
    .locals 4

    .line 136
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

    array-length v1, p0

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v3, v1, v2}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;->parseBigIntegerLiteral([BIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([BI)Ljava/math/BigInteger;
    .locals 3

    .line 149
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

    const/4 v1, 0x0

    array-length v2, p0

    invoke-virtual {v0, p0, v1, v2, p1}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;->parseBigIntegerLiteral([BIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([BII)Ljava/math/BigInteger;
    .locals 2

    .line 168
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

    const/16 v1, 0xa

    invoke-virtual {v0, p0, p1, p2, v1}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;->parseBigIntegerLiteral([BIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([BIII)Ljava/math/BigInteger;
    .locals 1

    .line 188
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->BYTE_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;

    invoke-virtual {v0, p0, p1, p2, p3}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromByteArray;->parseBigIntegerLiteral([BIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([C)Ljava/math/BigInteger;
    .locals 4

    .line 200
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

    array-length v1, p0

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v3, v1, v2}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;->parseBigIntegerLiteral([CIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([CI)Ljava/math/BigInteger;
    .locals 3

    .line 213
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

    const/4 v1, 0x0

    array-length v2, p0

    invoke-virtual {v0, p0, v1, v2, p1}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;->parseBigIntegerLiteral([CIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([CII)Ljava/math/BigInteger;
    .locals 2

    .line 232
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

    const/16 v1, 0xa

    invoke-virtual {v0, p0, p1, p2, v1}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;->parseBigIntegerLiteral([CIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public static parseBigInteger([CIII)Ljava/math/BigInteger;
    .locals 1

    .line 252
    sget-object v0, Lch/randelshofer/fastdoubleparser/JavaBigIntegerParser;->CHAR_ARRAY_PARSER:Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;

    invoke-virtual {v0, p0, p1, p2, p3}, Lch/randelshofer/fastdoubleparser/JavaBigIntegerFromCharArray;->parseBigIntegerLiteral([CIII)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method
