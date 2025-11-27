.class public abstract Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;
.super Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParserBase;
.source "NonBlockingUtf8JsonParserBase.java"


# static fields
.field private static final FEAT_MASK_ALLOW_JAVA_COMMENTS:I

.field private static final FEAT_MASK_ALLOW_MISSING:I

.field private static final FEAT_MASK_ALLOW_SINGLE_QUOTES:I

.field private static final FEAT_MASK_ALLOW_UNQUOTED_NAMES:I

.field private static final FEAT_MASK_ALLOW_YAML_COMMENTS:I

.field private static final FEAT_MASK_LEADING_ZEROS:I

.field private static final FEAT_MASK_TRAILING_COMMA:I

.field protected static final _icLatin1:[I

.field private static final _icUTF8:[I


# instance fields
.field protected _origBufferLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_TRAILING_COMMA:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_TRAILING_COMMA:I

    .line 27
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_LEADING_ZEROS:I

    .line 29
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_MISSING_VALUES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_MISSING:I

    .line 30
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_SINGLE_QUOTES:I

    .line 31
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_UNQUOTED_NAMES:I

    .line 32
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_JAVA_COMMENTS:I

    .line 33
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser$Feature;->getMask()I

    move-result v0

    sput v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_YAML_COMMENTS:I

    .line 36
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icUTF8:[I

    .line 40
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeLatin1()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icLatin1:[I

    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingJsonParserBase;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)V

    return-void
.end method

.method private final _decodeCharEscape()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2880
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr v0, v1

    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    const/4 v0, 0x0

    const/4 v1, -0x1

    .line 2882
    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitEscaped(II)I

    move-result v0

    return v0

    .line 2884
    :cond_0
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeFastCharEscape()I

    move-result v0

    return v0
.end method

.method private final _decodeFastCharEscape()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2889
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    const/16 v1, 0x22

    if-eq v0, v1, :cond_8

    const/16 v1, 0x2f

    if-eq v0, v1, :cond_8

    const/16 v1, 0x5c

    if-eq v0, v1, :cond_8

    const/16 v1, 0x62

    if-eq v0, v1, :cond_7

    const/16 v1, 0x66

    if-eq v0, v1, :cond_6

    const/16 v1, 0x6e

    if-eq v0, v1, :cond_5

    const/16 v1, 0x72

    if-eq v0, v1, :cond_4

    const/16 v1, 0x74

    if-eq v0, v1, :cond_3

    const/16 v1, 0x75

    if-eq v0, v1, :cond_0

    int-to-char v0, v0

    .line 2917
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_handleUnrecognizedCharacterEscape(C)C

    move-result v0

    return v0

    .line 2921
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    .line 2922
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v1

    if-ltz v1, :cond_2

    .line 2926
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    .line 2927
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    if-ltz v2, :cond_2

    shl-int/lit8 v0, v1, 0x4

    or-int/2addr v0, v2

    .line 2930
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v1

    .line 2931
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    if-ltz v2, :cond_1

    shl-int/lit8 v0, v0, 0x4

    or-int/2addr v0, v2

    .line 2934
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v1

    .line 2935
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    if-ltz v2, :cond_1

    shl-int/lit8 v0, v0, 0x4

    or-int/2addr v0, v2

    return v0

    :cond_1
    move v0, v1

    :cond_2
    and-int/lit16 v0, v0, 0xff

    .line 2942
    const-string v1, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    const/4 v0, -0x1

    return v0

    :cond_3
    const/16 v0, 0x9

    return v0

    :cond_4
    const/16 v0, 0xd

    return v0

    :cond_5
    const/16 v0, 0xa

    return v0

    :cond_6
    const/16 v0, 0xc

    return v0

    :cond_7
    const/16 v0, 0x8

    return v0

    :cond_8
    int-to-char v0, v0

    return v0
.end method

.method private _decodeSplitEscaped(II)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2434
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/4 v2, -0x1

    if-lt v0, v1, :cond_0

    .line 2435
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quoted32:I

    .line 2436
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quotedDigits:I

    return v2

    .line 2439
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    if-ne p2, v2, :cond_9

    const/16 p2, 0x22

    if-eq v0, p2, :cond_8

    const/16 p2, 0x2f

    if-eq v0, p2, :cond_8

    const/16 p2, 0x5c

    if-eq v0, p2, :cond_8

    const/16 p2, 0x62

    if-eq v0, p2, :cond_7

    const/16 p2, 0x66

    if-eq v0, p2, :cond_6

    const/16 p2, 0x6e

    if-eq v0, p2, :cond_5

    const/16 p2, 0x72

    if-eq v0, p2, :cond_4

    const/16 p2, 0x74

    if-eq v0, p2, :cond_3

    const/16 p2, 0x75

    if-eq v0, p2, :cond_1

    int-to-char p1, v0

    .line 2468
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_handleUnrecognizedCharacterEscape(C)C

    move-result p1

    return p1

    .line 2471
    :cond_1
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/4 v1, 0x0

    if-lt p2, v0, :cond_2

    .line 2472
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quotedDigits:I

    .line 2473
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quoted32:I

    return v2

    .line 2476
    :cond_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    const/4 p2, 0x0

    goto :goto_0

    :cond_3
    const/16 p1, 0x9

    return p1

    :cond_4
    const/16 p1, 0xd

    return p1

    :cond_5
    const/16 p1, 0xa

    return p1

    :cond_6
    const/16 p1, 0xc

    return p1

    :cond_7
    const/16 p1, 0x8

    return p1

    :cond_8
    return v0

    :cond_9
    :goto_0
    and-int/lit16 v0, v0, 0xff

    .line 2481
    :goto_1
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v1

    if-gez v1, :cond_a

    and-int/lit16 v0, v0, 0xff

    .line 2483
    const-string v3, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    :cond_a
    const/4 v0, 0x4

    shl-int/2addr p1, v0

    or-int/2addr p1, v1

    add-int/lit8 p2, p2, 0x1

    if-ne p2, v0, :cond_b

    return p1

    .line 2489
    :cond_b
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_c

    .line 2490
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quotedDigits:I

    .line 2491
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quoted32:I

    return v2

    .line 2494
    :cond_c
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    goto :goto_1
.end method

.method private final _decodeSplitMultiByte(IIZ)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p2, v1, :cond_7

    const/4 v2, 0x2

    if-eq p2, v2, :cond_5

    const/4 v2, 0x3

    if-eq p2, v2, :cond_3

    const/4 v2, 0x4

    if-eq p2, v2, :cond_1

    const/16 p2, 0x20

    if-ge p1, p2, :cond_0

    .line 2795
    const-string p2, "string value"

    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_0

    .line 2798
    :cond_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidChar(I)V

    .line 2800
    :goto_0
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char p1, p1

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    return v1

    :cond_1
    and-int/lit8 p1, p1, 0x7

    if-eqz p3, :cond_2

    .line 2786
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p2

    invoke-direct {p0, p1, v1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitUTF8_4(III)Z

    move-result p1

    return p1

    .line 2788
    :cond_2
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2789
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    const/16 p1, 0x2c

    .line 2790
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    return v0

    :cond_3
    and-int/lit8 p1, p1, 0xf

    if-eqz p3, :cond_4

    .line 2777
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p2

    invoke-direct {p0, p1, v1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitUTF8_3(III)Z

    move-result p1

    return p1

    :cond_4
    const/16 p2, 0x2b

    .line 2779
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2780
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2781
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    return v0

    :cond_5
    if-eqz p3, :cond_6

    .line 2767
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_2(II)I

    move-result p1

    .line 2768
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char p1, p1

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    return v1

    :cond_6
    const/16 p2, 0x2a

    .line 2771
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2772
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    return v0

    :cond_7
    const/4 p1, -0x1

    .line 2757
    invoke-direct {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitEscaped(II)I

    move-result p1

    if-gez p1, :cond_8

    const/16 p1, 0x29

    .line 2759
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    return v0

    .line 2762
    :cond_8
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char p1, p1

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    return v1
.end method

.method private final _decodeSplitUTF8_3(III)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x80

    const/4 v1, 0x1

    if-ne p2, v1, :cond_2

    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v0, :cond_0

    and-int/lit16 p2, p3, 0xff

    .line 2810
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_0
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p3, 0x3f

    or-int/2addr p1, p2

    .line 2813
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p2, p3, :cond_1

    const/16 p2, 0x2b

    .line 2814
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2815
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    const/4 p1, 0x2

    .line 2816
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    const/4 p1, 0x0

    return p1

    .line 2819
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p3

    :cond_2
    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v0, :cond_3

    and-int/lit16 p2, p3, 0xff

    .line 2822
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    .line 2824
    :cond_3
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p3, p3, 0x3f

    or-int/2addr p1, p3

    int-to-char p1, p1

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    return v1
.end method

.method private final _decodeSplitUTF8_4(III)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/16 v1, 0x2c

    const/16 v2, 0x80

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-ne p2, v4, :cond_2

    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v2, :cond_0

    and-int/lit16 p2, p3, 0xff

    .line 2835
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_0
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p3, 0x3f

    or-int/2addr p1, p2

    .line 2838
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p2, p3, :cond_1

    .line 2839
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2840
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2841
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    return v0

    .line 2845
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p3

    const/4 p2, 0x2

    :cond_2
    if-ne p2, v3, :cond_5

    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v2, :cond_3

    and-int/lit16 p2, p3, 0xff

    .line 2849
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_3
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p3, 0x3f

    or-int/2addr p1, p2

    .line 2852
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p2, p3, :cond_4

    .line 2853
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2854
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    const/4 p1, 0x3

    .line 2855
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    return v0

    .line 2858
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p3

    :cond_5
    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v2, :cond_6

    and-int/lit16 p2, p3, 0xff

    .line 2861
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_6
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p3, 0x3f

    or-int/2addr p1, p2

    const/high16 p2, 0x10000

    sub-int/2addr p1, p2

    .line 2865
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    shr-int/lit8 p3, p1, 0xa

    const v0, 0xd800

    or-int/2addr p3, v0

    int-to-char p3, p3

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    and-int/lit16 p1, p1, 0x3ff

    const p2, 0xdc00

    or-int/2addr p1, p2

    .line 2868
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char p1, p1

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    return v4
.end method

.method private final _decodeUTF8_2(II)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit16 v0, p2, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    and-int/lit16 v0, p2, 0xff

    .line 2955
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_0
    and-int/lit8 p1, p1, 0x1f

    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p2, 0x3f

    or-int/2addr p1, p2

    return p1
.end method

.method private final _decodeUTF8_3(III)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p1, p1, 0xf

    and-int/lit16 v0, p2, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    and-int/lit16 v0, p2, 0xff

    .line 2964
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_0
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p2, 0x3f

    or-int/2addr p1, p2

    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v1, :cond_1

    and-int/lit16 p2, p3, 0xff

    .line 2968
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_1
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p3, 0x3f

    or-int/2addr p1, p2

    return p1
.end method

.method private final _decodeUTF8_4(IIII)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit16 v0, p2, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_0

    and-int/lit16 v0, p2, 0xff

    .line 2978
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_0
    and-int/lit8 p1, p1, 0x7

    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p2, 0x3f

    or-int/2addr p1, p2

    and-int/lit16 p2, p3, 0xc0

    if-eq p2, v1, :cond_1

    and-int/lit16 p2, p3, 0xff

    .line 2982
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_1
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p3, 0x3f

    or-int/2addr p1, p2

    and-int/lit16 p2, p4, 0xc0

    if-eq p2, v1, :cond_2

    and-int/lit16 p2, p4, 0xff

    .line 2986
    iget p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidOther(II)V

    :cond_2
    shl-int/lit8 p1, p1, 0x6

    and-int/lit8 p2, p4, 0x3f

    or-int/2addr p1, p2

    const/high16 p2, 0x10000

    sub-int/2addr p1, p2

    return p1
.end method

.method private final _fastParseName()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1933
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icLatin1:[I

    .line 1934
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    .line 1936
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    .line 1937
    aget v4, v0, v3

    const/4 v5, 0x0

    const/16 v6, 0x22

    if-nez v4, :cond_8

    add-int/lit8 v4, v1, 0x2

    .line 1938
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 1939
    aget v7, v0, v2

    if-nez v7, :cond_6

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    add-int/lit8 v3, v1, 0x3

    .line 1941
    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    .line 1942
    aget v7, v0, v4

    if-nez v7, :cond_4

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v2, v4

    add-int/lit8 v4, v1, 0x4

    .line 1944
    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    .line 1945
    aget v7, v0, v3

    if-nez v7, :cond_2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x5

    .line 1947
    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    .line 1948
    aget v0, v0, v3

    if-nez v0, :cond_0

    .line 1949
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    .line 1950
    invoke-direct {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parseMediumName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    if-ne v3, v6, :cond_1

    .line 1953
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    const/4 v0, 0x4

    .line 1954
    invoke-virtual {p0, v2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v5

    :cond_2
    if-ne v3, v6, :cond_3

    .line 1959
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    const/4 v0, 0x3

    .line 1960
    invoke-virtual {p0, v2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    return-object v5

    :cond_4
    if-ne v4, v6, :cond_5

    .line 1965
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    const/4 v0, 0x2

    .line 1966
    invoke-virtual {p0, v2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_5
    return-object v5

    :cond_6
    if-ne v2, v6, :cond_7

    .line 1971
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    const/4 v0, 0x1

    .line 1972
    invoke-virtual {p0, v3, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_7
    return-object v5

    :cond_8
    if-ne v3, v6, :cond_9

    .line 1977
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1978
    const-string v0, ""

    return-object v0

    :cond_9
    return-object v5
.end method

.method private _finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2286
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    .line 2287
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icLatin1:[I

    .line 2290
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v4, 0x9

    if-lt v2, v3, :cond_0

    .line 2291
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    .line 2292
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2293
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    .line 2294
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2295
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 2297
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v2

    const/16 v3, 0x27

    if-ne v2, v3, :cond_5

    if-lez p3, :cond_2

    .line 2366
    array-length v1, v0

    if-lt p1, v1, :cond_1

    .line 2367
    array-length v1, v0

    invoke-static {v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_1
    add-int/lit8 v1, p1, 0x1

    .line 2369
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_padLastQuad(II)I

    move-result p2

    aput p2, v0, p1

    move p1, v1

    goto :goto_1

    :cond_2
    if-nez p1, :cond_3

    .line 2371
    const-string p1, ""

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2373
    :cond_3
    :goto_1
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {p2, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_4

    .line 2375
    invoke-virtual {p0, v0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_addName([III)Ljava/lang/String;

    move-result-object p2

    .line 2377
    :cond_4
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_5
    const/16 v3, 0x22

    const/4 v5, 0x4

    const/4 v6, 0x1

    if-eq v2, v3, :cond_d

    .line 2302
    aget v3, v1, v2

    if-eqz v3, :cond_d

    const/16 v3, 0x5c

    const/16 v7, 0x8

    if-eq v2, v3, :cond_6

    .line 2305
    const-string v3, "name"

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_2

    .line 2308
    :cond_6
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeCharEscape()I

    move-result v2

    if-gez v2, :cond_7

    .line 2310
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2311
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    .line 2312
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    .line 2313
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2314
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    .line 2315
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    :cond_7
    :goto_2
    const/16 v3, 0x7f

    if-le v2, v3, :cond_d

    const/4 v3, 0x0

    if-lt p3, v5, :cond_9

    .line 2321
    array-length p3, v0

    if-lt p1, p3, :cond_8

    .line 2322
    array-length p3, v0

    invoke-static {v0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_8
    add-int/lit8 p3, p1, 0x1

    .line 2324
    aput p2, v0, p1

    move p1, p3

    const/4 p2, 0x0

    const/4 p3, 0x0

    :cond_9
    const/16 v4, 0x800

    if-ge v2, v4, :cond_a

    shl-int/lit8 p2, p2, 0x8

    shr-int/lit8 v3, v2, 0x6

    or-int/lit16 v3, v3, 0xc0

    or-int/2addr p2, v3

    add-int/lit8 p3, p3, 0x1

    goto :goto_4

    :cond_a
    shl-int/lit8 p2, p2, 0x8

    shr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int/2addr p2, v4

    add-int/lit8 p3, p3, 0x1

    if-lt p3, v5, :cond_c

    .line 2337
    array-length p3, v0

    if-lt p1, p3, :cond_b

    .line 2338
    array-length p3, v0

    invoke-static {v0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object p3

    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    move-object v0, p3

    :cond_b
    add-int/lit8 p3, p1, 0x1

    .line 2340
    aput p2, v0, p1

    move p1, p3

    const/4 p3, 0x0

    goto :goto_3

    :cond_c
    move v3, p2

    :goto_3
    shl-int/lit8 p2, v3, 0x8

    shr-int/lit8 v3, v2, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    or-int/2addr p2, v3

    add-int/2addr p3, v6

    :goto_4
    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    :cond_d
    if-ge p3, v5, :cond_e

    add-int/lit8 p3, p3, 0x1

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    goto/16 :goto_0

    .line 2356
    :cond_e
    array-length p3, v0

    if-lt p1, p3, :cond_f

    .line 2357
    array-length p3, v0

    invoke-static {v0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_f
    add-int/lit8 p3, p1, 0x1

    .line 2359
    aput p2, v0, p1

    move p1, p3

    move p2, v2

    const/4 p3, 0x1

    goto/16 :goto_0
.end method

.method private final _finishAposString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2659
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icUTF8:[I

    .line 2661
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v1

    .line 2662
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v2

    .line 2663
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2664
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    add-int/lit8 v4, v4, -0x5

    .line 2670
    :cond_0
    :goto_0
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v6, 0x2d

    if-lt v3, v5, :cond_1

    .line 2671
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2672
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2673
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2674
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 2676
    :cond_1
    array-length v5, v1

    const/4 v7, 0x0

    if-lt v2, v5, :cond_2

    .line 2677
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    const/4 v2, 0x0

    .line 2680
    :cond_2
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    array-length v8, v1

    sub-int/2addr v8, v2

    add-int/2addr v8, v3

    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    :goto_1
    if-ge v3, v5, :cond_0

    add-int/lit8 v8, v3, 0x1

    .line 2682
    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v9

    and-int/lit16 v9, v9, 0xff

    .line 2683
    aget v10, v0, v9

    if-eqz v10, :cond_d

    const/16 v11, 0x22

    if-eq v9, v11, :cond_d

    const/4 v5, 0x1

    if-lt v8, v4, :cond_5

    .line 2697
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2698
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2699
    aget v1, v0, v9

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-ge v8, v2, :cond_3

    const/4 v7, 0x1

    :cond_3
    invoke-direct {p0, v9, v1, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitMultiByte(IIZ)Z

    move-result v1

    if-nez v1, :cond_4

    .line 2700
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    .line 2701
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 2703
    :cond_4
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v1

    .line 2704
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v2

    .line 2705
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    goto :goto_0

    :cond_5
    if-eq v10, v5, :cond_b

    const/4 v5, 0x2

    if-eq v10, v5, :cond_a

    const/4 v5, 0x3

    if-eq v10, v5, :cond_9

    const/4 v5, 0x4

    if-eq v10, v5, :cond_7

    const/16 v3, 0x20

    if-ge v9, v3, :cond_6

    .line 2736
    const-string v3, "string value"

    invoke-virtual {p0, v9, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_2

    .line 2739
    :cond_6
    invoke-virtual {p0, v9}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidChar(I)V

    :goto_2
    move v3, v8

    goto :goto_4

    :cond_7
    add-int/lit8 v5, v3, 0x2

    .line 2722
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v6

    add-int/lit8 v8, v3, 0x3

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    add-int/lit8 v3, v3, 0x4

    .line 2723
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v8

    .line 2722
    invoke-direct {p0, v9, v6, v5, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_4(IIII)I

    move-result v5

    add-int/lit8 v6, v2, 0x1

    shr-int/lit8 v8, v5, 0xa

    const v9, 0xd800

    or-int/2addr v8, v9

    int-to-char v8, v8

    .line 2725
    aput-char v8, v1, v2

    .line 2726
    array-length v2, v1

    if-lt v6, v2, :cond_8

    .line 2727
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    const/4 v2, 0x0

    goto :goto_3

    :cond_8
    move v2, v6

    :goto_3
    and-int/lit16 v5, v5, 0x3ff

    const v6, 0xdc00

    or-int v9, v5, v6

    goto :goto_4

    :cond_9
    add-int/lit8 v5, v3, 0x2

    .line 2719
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v6

    add-int/lit8 v3, v3, 0x3

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    invoke-direct {p0, v9, v6, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_3(III)I

    move-result v9

    goto :goto_4

    :cond_a
    add-int/lit8 v3, v3, 0x2

    .line 2716
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    invoke-direct {p0, v9, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_2(II)I

    move-result v9

    goto :goto_4

    .line 2711
    :cond_b
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2712
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeFastCharEscape()I

    move-result v9

    .line 2713
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2743
    :goto_4
    array-length v5, v1

    if-lt v2, v5, :cond_c

    .line 2744
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    goto :goto_5

    :cond_c
    move v7, v2

    :goto_5
    add-int/lit8 v2, v7, 0x1

    int-to-char v5, v9

    .line 2748
    aput-char v5, v1, v7

    goto/16 :goto_0

    :cond_d
    const/16 v3, 0x27

    if-ne v9, v3, :cond_e

    .line 2687
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2688
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2689
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_e
    add-int/lit8 v3, v2, 0x1

    int-to-char v9, v9

    .line 2691
    aput-char v9, v1, v2

    move v2, v3

    move v3, v8

    goto/16 :goto_1
.end method

.method private final _finishBOM(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 447
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/4 v2, 0x1

    if-ge v0, v1, :cond_4

    .line 448
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    if-eq p1, v2, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    goto :goto_1

    .line 453
    :cond_0
    iget-wide v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputProcessed:J

    const-wide/16 v3, 0x3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputProcessed:J

    .line 454
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startDocument(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 v1, 0xbf

    if-eq v0, v1, :cond_3

    .line 457
    const-string v1, "Unexpected byte 0x%02x following 0xEF 0xBB; should get 0xBF as third byte of UTF-8 BOM"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportError(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    const/16 v1, 0xbb

    if-eq v0, v1, :cond_3

    .line 462
    const-string v1, "Unexpected byte 0x%02x following 0xEF; should get 0xBB as second byte UTF-8 BOM"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportError(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 468
    :cond_4
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 469
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 470
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1
.end method

.method private final _finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1039
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_1

    if-eqz p2, :cond_0

    const/16 p2, 0x34

    goto :goto_1

    :cond_0
    const/16 p2, 0x35

    .line 1040
    :goto_1
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1041
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 1042
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1044
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    const/16 v1, 0x20

    const/4 v2, 0x1

    if-ge v0, v1, :cond_4

    const/16 p2, 0xa

    if-ne v0, p2, :cond_2

    .line 1047
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    add-int/2addr p2, v2

    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    .line 1048
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_2

    :cond_2
    const/16 p2, 0xd

    if-ne v0, p2, :cond_3

    .line 1050
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    add-int/2addr p2, v2

    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    .line 1051
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_2

    :cond_3
    const/16 p2, 0x9

    if-eq v0, p2, :cond_6

    .line 1053
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwInvalidSpace(I)V

    goto :goto_2

    :cond_4
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_5

    const/4 p2, 0x1

    goto :goto_0

    :cond_5
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_6

    if-eqz p2, :cond_6

    .line 1065
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_6
    :goto_2
    const/4 p2, 0x0

    goto :goto_0
.end method

.method private final _finishCppComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1013
    :cond_0
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_1

    const/16 v0, 0x36

    .line 1014
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1015
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 1016
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1018
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    const/16 v1, 0x20

    if-ge v0, v1, :cond_0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 1021
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    .line 1022
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_1

    :cond_2
    const/16 v1, 0xd

    if-ne v0, v1, :cond_3

    .line 1025
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    .line 1026
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    .line 1033
    :goto_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 1029
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwInvalidSpace(I)V

    goto :goto_0
.end method

.method private final _finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 983
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_YAML_COMMENTS:I

    and-int/2addr v0, v1

    if-nez v0, :cond_0

    const/16 v0, 0x23

    .line 984
    const-string v1, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_YAML_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 987
    :cond_0
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_1

    const/16 v0, 0x37

    .line 988
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 989
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 990
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 992
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    const/16 v1, 0x20

    if-ge v0, v1, :cond_0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 995
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    .line 996
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_1

    :cond_2
    const/16 v1, 0xd

    if-ne v0, v1, :cond_3

    .line 999
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    .line 1000
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    .line 1007
    :goto_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 1003
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwInvalidSpace(I)V

    goto :goto_0
.end method

.method private final _finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2535
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icUTF8:[I

    .line 2537
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v1

    .line 2538
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v2

    .line 2539
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2540
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    add-int/lit8 v4, v4, -0x5

    .line 2547
    :cond_0
    :goto_0
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v6, 0x28

    if-lt v3, v5, :cond_1

    .line 2548
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2549
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2550
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2551
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 2553
    :cond_1
    array-length v5, v1

    const/4 v7, 0x0

    if-lt v2, v5, :cond_2

    .line 2554
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    const/4 v2, 0x0

    .line 2557
    :cond_2
    iget v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    array-length v8, v1

    sub-int/2addr v8, v2

    add-int/2addr v8, v3

    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    :goto_1
    if-ge v3, v5, :cond_0

    add-int/lit8 v8, v3, 0x1

    .line 2559
    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v9

    and-int/lit16 v9, v9, 0xff

    .line 2560
    aget v10, v0, v9

    if-eqz v10, :cond_e

    const/16 v5, 0x22

    if-ne v9, v5, :cond_3

    .line 2568
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2569
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2570
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_3
    const/4 v5, 0x1

    if-lt v8, v4, :cond_6

    .line 2574
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2575
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2576
    aget v1, v0, v9

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-ge v8, v2, :cond_4

    const/4 v7, 0x1

    :cond_4
    invoke-direct {p0, v9, v1, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitMultiByte(IIZ)Z

    move-result v1

    if-nez v1, :cond_5

    .line 2577
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    .line 2578
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 2580
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v1

    .line 2581
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v2

    .line 2582
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    goto :goto_0

    :cond_6
    if-eq v10, v5, :cond_c

    const/4 v5, 0x2

    if-eq v10, v5, :cond_b

    const/4 v5, 0x3

    if-eq v10, v5, :cond_a

    const/4 v5, 0x4

    if-eq v10, v5, :cond_8

    const/16 v3, 0x20

    if-ge v9, v3, :cond_7

    .line 2613
    const-string v3, "string value"

    invoke-virtual {p0, v9, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_2

    .line 2616
    :cond_7
    invoke-virtual {p0, v9}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidChar(I)V

    :goto_2
    move v3, v8

    goto :goto_4

    :cond_8
    add-int/lit8 v5, v3, 0x2

    .line 2599
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v6

    add-int/lit8 v8, v3, 0x3

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    add-int/lit8 v3, v3, 0x4

    .line 2600
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v8

    .line 2599
    invoke-direct {p0, v9, v6, v5, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_4(IIII)I

    move-result v5

    add-int/lit8 v6, v2, 0x1

    shr-int/lit8 v8, v5, 0xa

    const v9, 0xd800

    or-int/2addr v8, v9

    int-to-char v8, v8

    .line 2602
    aput-char v8, v1, v2

    .line 2603
    array-length v2, v1

    if-lt v6, v2, :cond_9

    .line 2604
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    const/4 v2, 0x0

    goto :goto_3

    :cond_9
    move v2, v6

    :goto_3
    and-int/lit16 v5, v5, 0x3ff

    const v6, 0xdc00

    or-int v9, v5, v6

    goto :goto_4

    :cond_a
    add-int/lit8 v5, v3, 0x2

    .line 2596
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v6

    add-int/lit8 v3, v3, 0x3

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    invoke-direct {p0, v9, v6, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_3(III)I

    move-result v9

    goto :goto_4

    :cond_b
    add-int/lit8 v3, v3, 0x2

    .line 2593
    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    invoke-direct {p0, v9, v5}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_2(II)I

    move-result v9

    goto :goto_4

    .line 2588
    :cond_c
    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2589
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeFastCharEscape()I

    move-result v9

    .line 2590
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2620
    :goto_4
    array-length v5, v1

    if-lt v2, v5, :cond_d

    .line 2621
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v1

    goto :goto_5

    :cond_d
    move v7, v2

    :goto_5
    add-int/lit8 v2, v7, 0x1

    int-to-char v5, v9

    .line 2625
    aput-char v5, v1, v7

    goto/16 :goto_0

    :cond_e
    add-int/lit8 v3, v2, 0x1

    int-to-char v9, v9

    .line 2563
    aput-char v9, v1, v2

    move v2, v3

    move v3, v8

    goto/16 :goto_1
.end method

.method private _finishUnquotedName(III)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2238
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    .line 2239
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v1

    .line 2244
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v2, v3, :cond_0

    .line 2245
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    .line 2246
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2247
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    const/16 p1, 0xa

    .line 2248
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2249
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 2251
    :cond_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 2252
    aget v3, v1, v2

    if-eqz v3, :cond_4

    if-lez p3, :cond_2

    .line 2271
    array-length v1, v0

    if-lt p1, v1, :cond_1

    .line 2272
    array-length v1, v0

    invoke-static {v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_1
    add-int/lit8 v1, p1, 0x1

    .line 2274
    aput p2, v0, p1

    move p1, v1

    .line 2276
    :cond_2
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {p2, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_3

    .line 2278
    invoke-virtual {p0, v0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_addName([III)Ljava/lang/String;

    move-result-object p2

    .line 2280
    :cond_3
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2255
    :cond_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    const/4 v3, 0x4

    if-ge p3, v3, :cond_5

    add-int/lit8 p3, p3, 0x1

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    goto :goto_0

    .line 2261
    :cond_5
    array-length p3, v0

    if-lt p1, p3, :cond_6

    .line 2262
    array-length p3, v0

    invoke-static {v0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_6
    add-int/lit8 p3, p1, 0x1

    .line 2264
    aput p2, v0, p1

    move p1, p3

    move p2, v2

    const/4 p3, 0x1

    goto :goto_0
.end method

.method private _handleOddName(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x23

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-eq p1, v0, :cond_3

    const/16 v0, 0x27

    if-eq p1, v0, :cond_2

    const/16 v0, 0x2f

    if-eq p1, v0, :cond_1

    const/16 v0, 0x5d

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 2210
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2203
    :cond_1
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2205
    :cond_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_SINGLE_QUOTES:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_4

    .line 2206
    invoke-direct {p0, v2, v2, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2198
    :cond_3
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v3, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_YAML_COMMENTS:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_4

    .line 2199
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2213
    :cond_4
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_UNQUOTED_NAMES:I

    and-int/2addr v0, v1

    if-nez v0, :cond_5

    int-to-char v0, p1

    .line 2217
    const-string v1, "was expecting double-quote to start field name"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2221
    :cond_5
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v0

    .line 2223
    aget v0, v0, p1

    if-eqz v0, :cond_6

    .line 2224
    const-string v0, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    :cond_6
    const/4 v0, 0x1

    .line 2227
    invoke-direct {p0, v2, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishUnquotedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method private final _parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2080
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    .line 2081
    sget-object v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icLatin1:[I

    .line 2084
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/4 v4, 0x7

    if-lt v2, v3, :cond_0

    .line 2085
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    .line 2086
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2087
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    .line 2088
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2089
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 2091
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v2

    .line 2092
    aget v3, v1, v2

    const/4 v5, 0x4

    const/4 v6, 0x1

    if-nez v3, :cond_3

    if-ge p3, v5, :cond_1

    :goto_1
    add-int/lit8 p3, p3, 0x1

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    goto :goto_0

    .line 2098
    :cond_1
    array-length p3, v0

    if-lt p1, p3, :cond_2

    .line 2099
    array-length p3, v0

    invoke-static {v0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object p3

    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    move-object v0, p3

    :cond_2
    add-int/lit8 p3, p1, 0x1

    .line 2101
    aput p2, v0, p1

    :goto_2
    move p1, p3

    move p2, v2

    const/4 p3, 0x1

    goto :goto_0

    :cond_3
    const/16 v3, 0x22

    if-ne v2, v3, :cond_8

    if-lez p3, :cond_5

    .line 2171
    array-length v1, v0

    if-lt p1, v1, :cond_4

    .line 2172
    array-length v1, v0

    invoke-static {v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_4
    add-int/lit8 v1, p1, 0x1

    .line 2174
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_padLastQuad(II)I

    move-result p2

    aput p2, v0, p1

    move p1, v1

    goto :goto_3

    :cond_5
    if-nez p1, :cond_6

    .line 2176
    const-string p1, ""

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 2178
    :cond_6
    :goto_3
    iget-object p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {p2, v0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_7

    .line 2180
    invoke-virtual {p0, v0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_addName([III)Ljava/lang/String;

    move-result-object p2

    .line 2182
    :cond_7
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_8
    const/16 v3, 0x5c

    const/16 v7, 0x8

    if-eq v2, v3, :cond_9

    .line 2114
    const-string v3, "name"

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_4

    .line 2117
    :cond_9
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeCharEscape()I

    move-result v2

    if-gez v2, :cond_a

    .line 2119
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2120
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    .line 2121
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    .line 2122
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2123
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    .line 2124
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 2131
    :cond_a
    :goto_4
    array-length v3, v0

    if-lt p1, v3, :cond_b

    .line 2132
    array-length v3, v0

    invoke-static {v0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    :cond_b
    const/16 v3, 0x7f

    if-le v2, v3, :cond_f

    const/4 v3, 0x0

    if-lt p3, v5, :cond_c

    add-int/lit8 p3, p1, 0x1

    .line 2137
    aput p2, v0, p1

    move p1, p3

    const/4 p2, 0x0

    const/4 p3, 0x0

    :cond_c
    const/16 v4, 0x800

    if-ge v2, v4, :cond_d

    shl-int/lit8 p2, p2, 0x8

    shr-int/lit8 v3, v2, 0x6

    or-int/lit16 v3, v3, 0xc0

    or-int/2addr p2, v3

    add-int/lit8 p3, p3, 0x1

    goto :goto_6

    :cond_d
    shl-int/lit8 p2, p2, 0x8

    shr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int/2addr p2, v4

    add-int/lit8 p3, p3, 0x1

    if-lt p3, v5, :cond_e

    add-int/lit8 p3, p1, 0x1

    .line 2150
    aput p2, v0, p1

    move p1, p3

    const/4 p3, 0x0

    goto :goto_5

    :cond_e
    move v3, p2

    :goto_5
    shl-int/lit8 p2, v3, 0x8

    shr-int/lit8 v3, v2, 0x6

    and-int/lit8 v3, v3, 0x3f

    or-int/lit16 v3, v3, 0x80

    or-int/2addr p2, v3

    add-int/2addr p3, v6

    :goto_6
    and-int/lit8 v2, v2, 0x3f

    or-int/lit16 v2, v2, 0x80

    :cond_f
    if-ge p3, v5, :cond_10

    goto/16 :goto_1

    :cond_10
    add-int/lit8 p3, p1, 0x1

    .line 2165
    aput p2, v0, p1

    goto/16 :goto_2
.end method

.method private final _parseMediumName(II)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1985
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icLatin1:[I

    add-int/lit8 v1, p1, 0x1

    .line 1988
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 1989
    aget v3, v0, v2

    const/4 v4, 0x0

    const/16 v5, 0x22

    if-nez v3, :cond_6

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    add-int/lit8 v2, p1, 0x2

    .line 1991
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    .line 1992
    aget v3, v0, v1

    if-nez v3, :cond_4

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v1

    add-int/lit8 v1, p1, 0x3

    .line 1994
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 1995
    aget v3, v0, v2

    if-nez v3, :cond_2

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    const/4 v2, 0x4

    add-int/2addr p1, v2

    .line 1997
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    .line 1998
    aget v0, v0, v1

    if-nez v0, :cond_0

    .line 1999
    invoke-direct {p0, p1, v1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parseMediumName2(III)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    if-ne v1, v5, :cond_1

    .line 2002
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2003
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    invoke-virtual {p0, p1, p2, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(III)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v4

    :cond_2
    if-ne v2, v5, :cond_3

    .line 2008
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2009
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    const/4 v0, 0x3

    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(III)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    return-object v4

    :cond_4
    if-ne v1, v5, :cond_5

    .line 2014
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2015
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(III)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_5
    return-object v4

    :cond_6
    if-ne v2, v5, :cond_7

    .line 2020
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2021
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(III)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_7
    return-object v4
.end method

.method private final _parseMediumName2(III)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2028
    sget-object v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icLatin1:[I

    add-int/lit8 v1, p1, 0x1

    .line 2031
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 2032
    aget v3, v0, v2

    const/4 v4, 0x0

    const/16 v5, 0x22

    if-eqz v3, :cond_1

    if-ne v2, v5, :cond_0

    .line 2034
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2035
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p3, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v4

    :cond_1
    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    add-int/lit8 v2, p1, 0x2

    .line 2040
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    .line 2041
    aget v3, v0, v1

    if-eqz v3, :cond_3

    if-ne v1, v5, :cond_2

    .line 2043
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2044
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    const/4 v0, 0x2

    invoke-virtual {p0, p1, p3, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v4

    :cond_3
    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v1

    add-int/lit8 v1, p1, 0x3

    .line 2049
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 2050
    aget v0, v0, v2

    if-eqz v0, :cond_5

    if-ne v2, v5, :cond_4

    .line 2052
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2053
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    const/4 v0, 0x3

    invoke-virtual {p0, p1, p3, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v4

    :cond_5
    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, v2

    const/4 v0, 0x4

    add-int/2addr p1, v0

    .line 2058
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    if-ne v1, v5, :cond_6

    .line 2060
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2061
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quad1:I

    invoke-virtual {p0, p1, p3, p2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_findName(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_6
    return-object v4
.end method

.method private final _skipWS(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    const/16 v0, 0x20

    if-eq p1, v0, :cond_3

    const/16 v1, 0xa

    if-ne p1, v1, :cond_1

    .line 939
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    .line 940
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_0

    :cond_1
    const/16 v1, 0xd

    if-ne p1, v1, :cond_2

    .line 942
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    .line 943
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_0

    :cond_2
    const/16 v1, 0x9

    if-eq p1, v1, :cond_3

    .line 945
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwInvalidSpace(I)V

    .line 948
    :cond_3
    :goto_0
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p1, v1, :cond_4

    .line 949
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 p1, 0x0

    return p1

    .line 952
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result p1

    if-le p1, v0, :cond_0

    return p1
.end method

.method private final _startAfterComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1071
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_0

    .line 1072
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1073
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1075
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    const/4 v1, 0x4

    if-eq p1, v1, :cond_2

    const/4 v1, 0x5

    if-eq p1, v1, :cond_1

    packed-switch p1, :pswitch_data_0

    .line 1091
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    const/4 p1, 0x0

    return-object p1

    .line 1088
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1086
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1084
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1082
    :pswitch_3
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1080
    :cond_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1078
    :cond_2
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final _startDocument(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit16 p1, p1, 0xff

    const/16 v0, 0xef

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    .line 408
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    if-eq v0, v1, :cond_0

    .line 409
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishBOM(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_0
    :goto_0
    const/16 v0, 0x20

    if-gt p1, v0, :cond_7

    if-eq p1, v0, :cond_3

    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 416
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRow:I

    .line 417
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_1

    :cond_1
    const/16 v0, 0xd

    if-ne p1, v0, :cond_2

    .line 419
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowAlt:I

    .line 420
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputRowStart:I

    goto :goto_1

    :cond_2
    const/16 v0, 0x9

    if-eq p1, v0, :cond_3

    .line 422
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_throwInvalidSpace(I)V

    .line 425
    :cond_3
    :goto_1
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p1, v0, :cond_6

    const/4 p1, 0x3

    .line 426
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 427
    iget-boolean p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closed:Z

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 431
    :cond_4
    iget-boolean p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_endOfInput:Z

    if-eqz p1, :cond_5

    .line 432
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 434
    :cond_5
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 436
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result p1

    goto :goto_0

    .line 438
    :cond_7
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method private final _startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x20

    if-gt p1, v0, :cond_0

    .line 487
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result p1

    if-gtz p1, :cond_0

    const/4 p1, 0x4

    .line 489
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 490
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 493
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_updateTokenLocation()V

    const/16 v0, 0x22

    if-eq p1, v0, :cond_2

    const/16 v0, 0x7d

    if-ne p1, v0, :cond_1

    .line 496
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 498
    :cond_1
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_handleOddName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 501
    :cond_2
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 p1, p1, 0xd

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-gt p1, v0, :cond_3

    .line 502
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fastParseName()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 504
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 p1, 0x0

    .line 507
    invoke-direct {p0, p1, p1, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method private final _startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    const/16 v1, 0x20

    if-gt p1, v1, :cond_0

    .line 514
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result p1

    if-gtz p1, :cond_0

    .line 516
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 517
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    :cond_0
    const/16 v2, 0x2c

    const/16 v3, 0x7d

    if-eq p1, v2, :cond_4

    if-ne p1, v3, :cond_1

    .line 522
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 v2, 0x23

    if-ne p1, v2, :cond_2

    .line 525
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_2
    const/16 v2, 0x2f

    if-ne p1, v2, :cond_3

    .line 528
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 530
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "was expecting comma to separate "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->typeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " entries"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 532
    :cond_4
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 533
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/4 v2, 0x4

    if-lt p1, v0, :cond_5

    .line 534
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 535
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 537
    :cond_5
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v0

    add-int/lit8 p1, p1, 0x1

    .line 538
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    if-gt v0, v1, :cond_6

    .line 540
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result v0

    if-gtz v0, :cond_6

    .line 542
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 543
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 546
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_updateTokenLocation()V

    const/16 p1, 0x22

    if-eq v0, p1, :cond_8

    if-ne v0, v3, :cond_7

    .line 549
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_TRAILING_COMMA:I

    and-int/2addr p1, v1

    if-eqz p1, :cond_7

    .line 550
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 553
    :cond_7
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_handleOddName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 556
    :cond_8
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 p1, p1, 0xd

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-gt p1, v0, :cond_9

    .line 557
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fastParseName()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_9

    .line 559
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fieldComplete(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_9
    const/4 p1, 0x0

    .line 562
    invoke-direct {p0, p1, p1, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method private final _startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 959
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_JAVA_COMMENTS:I

    and-int/2addr v0, v1

    const/16 v1, 0x2f

    if-nez v0, :cond_0

    .line 960
    const-string v0, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 964
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v2, :cond_1

    .line 965
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    const/16 p1, 0x33

    .line 966
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 967
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 969
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    const/16 v2, 0x2a

    if-ne v0, v2, :cond_2

    const/4 v0, 0x0

    .line 971
    invoke-direct {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_2
    if-ne v0, v1, :cond_3

    .line 974
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishCppComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    and-int/lit16 p1, v0, 0xff

    .line 976
    const-string v0, "was expecting either \'*\' or \'/\' for a comment"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private final _startValue(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x20

    const/16 v1, 0xc

    if-gt p1, v0, :cond_0

    .line 580
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result p1

    if-gtz p1, :cond_0

    .line 582
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 583
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 586
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_updateTokenLocation()V

    .line 588
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    const/16 v0, 0x22

    if-ne p1, v0, :cond_1

    .line 591
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 v0, 0x23

    if-eq p1, v0, :cond_b

    const/16 v0, 0x2b

    if-eq p1, v0, :cond_a

    const/16 v0, 0x5b

    if-eq p1, v0, :cond_9

    const/16 v0, 0x5d

    if-eq p1, v0, :cond_8

    const/16 v0, 0x66

    if-eq p1, v0, :cond_7

    const/16 v0, 0x6e

    if-eq p1, v0, :cond_6

    const/16 v0, 0x74

    if-eq p1, v0, :cond_5

    const/16 v0, 0x7b

    if-eq p1, v0, :cond_4

    const/16 v0, 0x7d

    if-eq p1, v0, :cond_3

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 624
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 614
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 601
    :pswitch_2
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 608
    :pswitch_3
    sget-object v0, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_DECIMAL_POINT_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 609
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloatThatStartsWithPeriod()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    const/4 v0, 0x0

    .line 641
    invoke-virtual {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 599
    :pswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 638
    :cond_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 636
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 630
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 628
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 626
    :cond_7
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 634
    :cond_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 632
    :cond_9
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 597
    :cond_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 595
    :cond_b
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x2d
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private final _startValueAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x20

    const/16 v1, 0xf

    if-gt p1, v0, :cond_0

    .line 825
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result p1

    if-gtz p1, :cond_0

    .line 827
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 828
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 831
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_updateTokenLocation()V

    const/16 v0, 0x22

    if-ne p1, v0, :cond_1

    .line 833
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 v0, 0x23

    if-eq p1, v0, :cond_c

    const/16 v0, 0x2b

    if-eq p1, v0, :cond_b

    const/16 v0, 0x2d

    if-eq p1, v0, :cond_a

    const/16 v0, 0x5b

    if-eq p1, v0, :cond_9

    const/16 v0, 0x5d

    if-eq p1, v0, :cond_7

    const/16 v0, 0x66

    if-eq p1, v0, :cond_6

    const/16 v0, 0x6e

    if-eq p1, v0, :cond_5

    const/16 v0, 0x74

    if-eq p1, v0, :cond_4

    const/16 v0, 0x7b

    if-eq p1, v0, :cond_3

    const/16 v0, 0x7d

    if-eq p1, v0, :cond_2

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 859
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 849
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 843
    :pswitch_2
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 878
    :cond_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_TRAILING_COMMA:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_8

    .line 879
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 875
    :cond_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 865
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 863
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 861
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 870
    :cond_7
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_TRAILING_COMMA:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_8

    .line 871
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_8
    :goto_0
    const/4 v0, 0x1

    .line 884
    invoke-virtual {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 867
    :cond_9
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 841
    :cond_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 839
    :cond_b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 837
    :cond_c
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private final _startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    const/16 v1, 0x20

    if-gt p1, v1, :cond_0

    .line 749
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result p1

    if-gtz p1, :cond_0

    .line 751
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 752
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    :cond_0
    const/16 v2, 0x3a

    const/16 v3, 0x23

    if-eq p1, v2, :cond_3

    const/16 v2, 0x2f

    if-ne p1, v2, :cond_1

    .line 757
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    if-ne p1, v3, :cond_2

    .line 760
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 763
    :cond_2
    const-string v0, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 765
    :cond_3
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 766
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v2, 0xc

    if-lt p1, v0, :cond_4

    .line 767
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 768
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 770
    :cond_4
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v0

    add-int/lit8 p1, p1, 0x1

    .line 771
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    if-gt v0, v1, :cond_5

    .line 773
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result v0

    if-gtz v0, :cond_5

    .line 775
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 776
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 779
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_updateTokenLocation()V

    const/16 p1, 0x22

    if-ne v0, p1, :cond_6

    .line 781
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_6
    if-eq v0, v3, :cond_e

    const/16 p1, 0x2b

    if-eq v0, p1, :cond_d

    const/16 p1, 0x2d

    if-eq v0, p1, :cond_c

    const/16 p1, 0x5b

    if-eq v0, p1, :cond_b

    const/16 p1, 0x66

    if-eq v0, p1, :cond_a

    const/16 p1, 0x6e

    if-eq v0, p1, :cond_9

    const/16 p1, 0x74

    if-eq v0, p1, :cond_8

    const/16 p1, 0x7b

    if-eq v0, p1, :cond_7

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    .line 817
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 804
    :pswitch_0
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 797
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 791
    :pswitch_2
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 814
    :cond_7
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 810
    :cond_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 808
    :cond_9
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 806
    :cond_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 812
    :cond_b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 789
    :cond_c
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 787
    :cond_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 785
    :cond_e
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private final _startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xd

    const/16 v1, 0x20

    if-gt p1, v1, :cond_0

    .line 650
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result p1

    if-gtz p1, :cond_0

    .line 652
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 653
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    :cond_0
    const/16 v2, 0x2c

    const/16 v3, 0x23

    const/16 v4, 0x7d

    const/16 v5, 0x5d

    if-eq p1, v2, :cond_5

    if-ne p1, v5, :cond_1

    .line 658
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    if-ne p1, v4, :cond_2

    .line 661
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_2
    const/16 v2, 0x2f

    if-ne p1, v2, :cond_3

    .line 664
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    if-ne p1, v3, :cond_4

    .line 667
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 669
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "was expecting comma to separate "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->typeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " entries"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 673
    :cond_5
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    .line 675
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 676
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v2, 0xf

    if-lt p1, v0, :cond_6

    .line 677
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 678
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 680
    :cond_6
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v0

    const/4 v6, 0x1

    add-int/2addr p1, v6

    .line 681
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    if-gt v0, v1, :cond_7

    .line 683
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_skipWS(I)I

    move-result v0

    if-gtz v0, :cond_7

    .line 685
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 686
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 689
    :cond_7
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_updateTokenLocation()V

    const/16 p1, 0x22

    if-ne v0, p1, :cond_8

    .line 691
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_8
    if-eq v0, v3, :cond_13

    const/16 p1, 0x2b

    if-eq v0, p1, :cond_12

    const/16 p1, 0x2d

    if-eq v0, p1, :cond_11

    const/16 p1, 0x5b

    if-eq v0, p1, :cond_10

    if-eq v0, v5, :cond_e

    const/16 p1, 0x66

    if-eq v0, p1, :cond_d

    const/16 p1, 0x6e

    if-eq v0, p1, :cond_c

    const/16 p1, 0x74

    if-eq v0, p1, :cond_b

    const/16 p1, 0x7b

    if-eq v0, p1, :cond_a

    if-eq v0, v4, :cond_9

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 714
    :pswitch_0
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 707
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 701
    :pswitch_2
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 733
    :cond_9
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_TRAILING_COMMA:I

    and-int/2addr p1, v1

    if-eqz p1, :cond_f

    .line 734
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 730
    :cond_a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startObjectScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 720
    :cond_b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 718
    :cond_c
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNullToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 716
    :cond_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 725
    :cond_e
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_TRAILING_COMMA:I

    and-int/2addr p1, v1

    if-eqz p1, :cond_f

    .line 726
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closeArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 739
    :cond_f
    :goto_0
    invoke-virtual {p0, v6, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 722
    :cond_10
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startArrayScope()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 699
    :cond_11
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 697
    :cond_12
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startPositiveNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 695
    :cond_13
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x2f
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected _decodeEscaped()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    const/16 v0, 0x20

    return v0
.end method

.method protected _finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1236
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-ge v0, v1, :cond_1

    .line 1237
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v0

    int-to-char v0, v0

    .line 1243
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1246
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 1247
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    const/16 v1, 0x100

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 1251
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportErrorToken(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1253
    :cond_1
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0
.end method

.method protected _finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1258
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportErrorToken(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected final _finishFieldWithEscape()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2383
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quoted32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quotedDigits:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitEscaped(II)I

    move-result v0

    const/16 v1, 0x8

    if-gez v0, :cond_0

    .line 2385
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 2386
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 2388
    :cond_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    array-length v3, v3

    if-lt v2, v3, :cond_1

    .line 2389
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    const/16 v3, 0x20

    invoke-static {v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->growArrayBy([II)[I

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    .line 2391
    :cond_1
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 2392
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    const/16 v4, 0x7f

    const/4 v5, 0x4

    const/4 v6, 0x1

    if-le v0, v4, :cond_5

    const/4 v4, 0x0

    if-lt v3, v5, :cond_2

    .line 2396
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    aput v2, v3, v7

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_2
    const/16 v7, 0x800

    if-ge v0, v7, :cond_3

    shl-int/2addr v2, v1

    shr-int/lit8 v4, v0, 0x6

    or-int/lit16 v4, v4, 0xc0

    :goto_0
    or-int/2addr v2, v4

    add-int/2addr v3, v6

    goto :goto_2

    :cond_3
    shl-int/2addr v2, v1

    shr-int/lit8 v7, v0, 0xc

    or-int/lit16 v7, v7, 0xe0

    or-int/2addr v2, v7

    add-int/2addr v3, v6

    if-lt v3, v5, :cond_4

    .line 2408
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    aput v2, v3, v7

    const/4 v3, 0x0

    goto :goto_1

    :cond_4
    move v4, v2

    :goto_1
    shl-int/lit8 v2, v4, 0x8

    shr-int/lit8 v4, v0, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/lit16 v4, v4, 0x80

    goto :goto_0

    :goto_2
    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    :cond_5
    if-ge v3, v5, :cond_6

    add-int/2addr v6, v3

    shl-int/lit8 v1, v2, 0x8

    or-int/2addr v0, v1

    goto :goto_3

    .line 2422
    :cond_6
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadBuffer:[I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    aput v2, v1, v3

    .line 2426
    :goto_3
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    const/16 v2, 0x9

    if-ne v1, v2, :cond_7

    .line 2427
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    invoke-direct {p0, v1, v0, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2429
    :cond_7
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    invoke-direct {p0, v1, v0, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_2

    const/16 p1, 0x20

    .line 1878
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    const/16 v0, 0x2d

    if-eq p2, v0, :cond_0

    const/16 v0, 0x2b

    if-ne p2, v0, :cond_2

    .line 1880
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char p2, p2

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 1881
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p2, v0, :cond_1

    .line 1882
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    const/4 p1, 0x0

    .line 1883
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1884
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1886
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p2

    .line 1890
    :cond_2
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object p1

    .line 1891
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v0

    .line 1892
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    :goto_0
    const/16 v2, 0x30

    if-lt p2, v2, :cond_5

    const/16 v2, 0x39

    if-gt p2, v2, :cond_5

    add-int/lit8 v1, v1, 0x1

    .line 1896
    array-length v2, p1

    if-lt v0, v2, :cond_3

    .line 1897
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_3
    add-int/lit8 v2, v0, 0x1

    int-to-char p2, p2

    .line 1899
    aput-char p2, p1, v0

    .line 1900
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p2, v0, :cond_4

    .line 1901
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1902
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1903
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1905
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result p2

    move v0, v2

    goto :goto_0

    :cond_5
    and-int/lit16 p1, p2, 0xff

    if-nez v1, :cond_6

    .line 1910
    const-string p2, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1913
    :cond_6
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1914
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1916
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1917
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _finishFloatFraction()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1816
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fractLength:I

    .line 1817
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v1

    .line 1818
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v2

    .line 1821
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x1

    :goto_0
    const/4 v6, 0x0

    if-eqz v5, :cond_6

    const/16 v7, 0x30

    if-lt v3, v7, :cond_2

    const/16 v7, 0x39

    if-gt v3, v7, :cond_2

    add-int/lit8 v0, v0, 0x1

    .line 1826
    array-length v6, v1

    if-lt v2, v6, :cond_0

    .line 1827
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v1

    :cond_0
    add-int/lit8 v6, v2, 0x1

    int-to-char v3, v3

    .line 1829
    aput-char v3, v1, v2

    .line 1830
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v2, v3, :cond_1

    .line 1831
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1832
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fractLength:I

    .line 1833
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1835
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v3

    move v2, v6

    goto :goto_0

    :cond_2
    const/16 v7, 0x66

    if-eq v3, v7, :cond_5

    const/16 v7, 0x64

    if-eq v3, v7, :cond_5

    const/16 v7, 0x46

    if-eq v3, v7, :cond_5

    const/16 v7, 0x44

    if-ne v3, v7, :cond_3

    goto :goto_1

    :cond_3
    const/16 v7, 0x2e

    if-ne v3, v7, :cond_4

    .line 1839
    const-string v6, "Cannot parse number with more than one decimal point"

    invoke-virtual {p0, v3, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    const/4 v5, 0x0

    goto :goto_0

    .line 1837
    :cond_5
    :goto_1
    const-string v6, "JSON does not support parsing numbers that have \'f\' or \'d\' suffixes"

    invoke-virtual {p0, v3, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    :cond_6
    if-nez v0, :cond_7

    .line 1848
    sget-object v1, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_TRAILING_DECIMAL_POINT_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 1849
    const-string v1, "Decimal point not followed by a digit"

    invoke-virtual {p0, v3, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1852
    :cond_7
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fractLength:I

    .line 1853
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    const/16 v0, 0x65

    if-eq v3, v0, :cond_9

    const/16 v0, 0x45

    if-ne v3, v0, :cond_8

    goto :goto_2

    .line 1868
    :cond_8
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr v0, v4

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1869
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1871
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1872
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1857
    :cond_9
    :goto_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v1, v3

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 1858
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1859
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_a

    const/16 v0, 0x1f

    .line 1860
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1861
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    :cond_a
    const/16 v0, 0x20

    .line 1863
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1864
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-virtual {p0, v4, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1159
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1162
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v1, v2, :cond_0

    .line 1163
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    .line 1164
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1166
    :cond_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    if-ne p2, v0, :cond_2

    const/16 v0, 0x30

    if-lt v1, v0, :cond_1

    const/16 v0, 0x5d

    if-eq v1, v0, :cond_1

    const/16 v0, 0x7d

    if-ne v1, v0, :cond_3

    .line 1169
    :cond_1
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1173
    :cond_2
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_4

    :cond_3
    const/16 p3, 0x32

    .line 1179
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1180
    iget-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v0, 0x0

    invoke-virtual {p3, p1, v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1181
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_4
    add-int/lit8 p2, p2, 0x1

    .line 1177
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    goto :goto_0
.end method

.method protected _finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1187
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 1188
    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p3

    .line 1190
    :cond_0
    iget-object p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v0, 0x0

    invoke-virtual {p3, p1, v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1191
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1196
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_nonStdToken(I)Ljava/lang/String;

    move-result-object v0

    .line 1197
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1200
    :goto_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v2, v3, :cond_0

    .line 1201
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_nonStdTokenType:I

    .line 1202
    iput p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    const/16 p1, 0x13

    .line 1203
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1204
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1206
    :cond_0
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    if-ne p2, v1, :cond_2

    const/16 v1, 0x30

    if-lt v2, v1, :cond_1

    const/16 v1, 0x5d

    if-eq v2, v1, :cond_1

    const/16 v1, 0x7d

    if-ne v2, v1, :cond_3

    .line 1209
    :cond_1
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueNonStdNumberComplete(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1213
    :cond_2
    invoke-virtual {v0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_4

    :cond_3
    const/16 p1, 0x32

    .line 1219
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1220
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1221
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_4
    add-int/lit8 p2, p2, 0x1

    .line 1217
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    goto :goto_0
.end method

.method protected _finishNonStdTokenWithEOF(II)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1226
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_nonStdToken(I)Ljava/lang/String;

    move-result-object v0

    .line 1227
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ne p2, v1, :cond_0

    .line 1228
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueNonStdNumberComplete(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1230
    :cond_0
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy(Ljava/lang/String;II)V

    .line 1231
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1688
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numberNegative:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1691
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v1, v2, :cond_1

    const/16 p1, 0x1a

    .line 1692
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1693
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1694
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1696
    :cond_1
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0x30

    if-ge v1, v2, :cond_2

    const/16 v2, 0x2e

    if-ne v1, v2, :cond_3

    add-int/2addr v0, p2

    .line 1699
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1700
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1701
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_2
    const/16 v2, 0x39

    if-le v1, v2, :cond_5

    const/16 v2, 0x65

    if-eq v1, v2, :cond_4

    const/16 v2, 0x45

    if-ne v1, v2, :cond_3

    goto :goto_1

    :cond_3
    add-int/2addr v0, p2

    .line 1721
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1722
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1723
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_4
    :goto_1
    add-int/2addr v0, p2

    .line 1707
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1708
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1709
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1713
    :cond_5
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1714
    array-length v2, p1

    if-lt p2, v2, :cond_6

    .line 1717
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_6
    add-int/lit8 v2, p2, 0x1

    int-to-char v1, v1

    .line 1719
    aput-char v1, p1, p2

    move p2, v2

    goto :goto_0
.end method

.method protected _finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1627
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingPosNegZeroes(Z)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _finishNumberLeadingPosNegZeroes(Z)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1638
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_1

    if-eqz p1, :cond_0

    const/16 p1, 0x19

    goto :goto_1

    :cond_0
    const/16 p1, 0x18

    .line 1639
    :goto_1
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1640
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1642
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    const/4 v1, 0x2

    const/16 v2, 0x2d

    const/16 v3, 0x2b

    const/4 v4, 0x0

    const/16 v5, 0x30

    const/4 v6, 0x1

    if-ge v0, v5, :cond_3

    const/16 v7, 0x2e

    if-ne v0, v7, :cond_5

    .line 1645
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v7

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    const/16 v2, 0x2b

    .line 1646
    :goto_2
    aput-char v2, v7, v4

    .line 1647
    aput-char v5, v7, v6

    .line 1648
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1649
    invoke-virtual {p0, v7, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    const/16 v7, 0x39

    if-le v0, v7, :cond_8

    const/16 v7, 0x65

    if-eq v0, v7, :cond_6

    const/16 v7, 0x45

    if-ne v0, v7, :cond_4

    goto :goto_3

    :cond_4
    const/16 p1, 0x5d

    if-eq v0, p1, :cond_5

    const/16 p1, 0x7d

    if-eq v0, p1, :cond_5

    .line 1663
    const-string p1, "expected digit (0-9), decimal point (.) or exponent indicator (e/E) to follow \'0\'"

    invoke-virtual {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1682
    :cond_5
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr p1, v6

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1683
    const-string p1, "0"

    invoke-virtual {p0, v4, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1653
    :cond_6
    :goto_3
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v7

    if-eqz p1, :cond_7

    goto :goto_4

    :cond_7
    const/16 v2, 0x2b

    .line 1654
    :goto_4
    aput-char v2, v7, v4

    .line 1655
    aput-char v5, v7, v6

    .line 1656
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1657
    invoke-virtual {p0, v7, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1669
    :cond_8
    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v8, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_LEADING_ZEROS:I

    and-int/2addr v7, v8

    if-nez v7, :cond_9

    .line 1670
    const-string v7, "Leading zeroes not allowed"

    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->reportInvalidNumber(Ljava/lang/String;)V

    :cond_9
    if-ne v0, v5, :cond_a

    goto/16 :goto_0

    .line 1675
    :cond_a
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    if-eqz p1, :cond_b

    goto :goto_5

    :cond_b
    const/16 v2, 0x2b

    .line 1677
    :goto_5
    aput-char v2, v5, v4

    int-to-char p1, v0

    .line 1678
    aput-char p1, v5, v6

    .line 1679
    iput v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1680
    invoke-virtual {p0, v5, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _finishNumberLeadingPosZeroes()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1631
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingPosNegZeroes(Z)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _finishNumberLeadingZeroes()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1580
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_0

    const/16 v0, 0x18

    .line 1581
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1582
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1584
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x30

    const/4 v3, 0x1

    if-ge v0, v2, :cond_1

    const/16 v4, 0x2e

    if-ne v0, v4, :cond_3

    .line 1587
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1588
    aput-char v2, v4, v1

    .line 1589
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1590
    invoke-virtual {p0, v4, v3, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_1
    const/16 v4, 0x39

    if-le v0, v4, :cond_5

    const/16 v4, 0x65

    if-eq v0, v4, :cond_4

    const/16 v4, 0x45

    if-ne v0, v4, :cond_2

    goto :goto_1

    :cond_2
    const/16 v2, 0x5d

    if-eq v0, v2, :cond_3

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_3

    .line 1603
    const-string v2, "expected digit (0-9), decimal point (.) or exponent indicator (e/E) to follow \'0\'"

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1621
    :cond_3
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1622
    const-string v0, "0"

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1594
    :cond_4
    :goto_1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 1595
    aput-char v2, v4, v1

    .line 1596
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1597
    invoke-virtual {p0, v4, v3, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1609
    :cond_5
    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v5, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_LEADING_ZEROS:I

    and-int/2addr v4, v5

    if-nez v4, :cond_6

    .line 1610
    const-string v4, "Leading zeroes not allowed"

    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->reportInvalidNumber(Ljava/lang/String;)V

    :cond_6
    if-ne v0, v2, :cond_7

    goto :goto_0

    .line 1615
    :cond_7
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    int-to-char v0, v0

    .line 1617
    aput-char v0, v2, v1

    .line 1618
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1619
    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _finishNumberMinus(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1519
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberPlusMinus(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _finishNumberPlus(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1524
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberPlusMinus(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _finishNumberPlusMinus(IZ)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1529
    const-string v0, "expected digit (0-9) to follow minus sign, for valid numeric value"

    const-string v1, "expected digit (0-9) for valid numeric value"

    const/4 v2, 0x2

    const-string v3, "JSON spec does not allow numbers to have plus signs: enable `JsonReadFeature.ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS` to allow"

    const/4 v4, 0x1

    const/16 v5, 0x2b

    const/16 v6, 0x30

    if-gt p1, v6, :cond_7

    if-ne p1, v6, :cond_2

    if-eqz p2, :cond_0

    .line 1532
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1534
    :cond_0
    sget-object p1, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 1535
    invoke-virtual {p0, v5, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1537
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingPosZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_2
    const/16 v6, 0x2e

    if-ne p1, v6, :cond_5

    .line 1539
    sget-object v6, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_DECIMAL_POINT_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v6

    if-eqz v6, :cond_5

    if-eqz p2, :cond_3

    .line 1541
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr p1, v4

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1542
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1544
    :cond_3
    sget-object p1, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 1545
    invoke-virtual {p0, v5, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1547
    :cond_4
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr p1, v4

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1548
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingPosZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_5
    if-eqz p2, :cond_6

    goto :goto_0

    :cond_6
    move-object v0, v1

    .line 1554
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    goto :goto_3

    :cond_7
    const/16 v6, 0x39

    if-le p1, v6, :cond_b

    const/16 v6, 0x49

    if-ne p1, v6, :cond_9

    if-eqz p2, :cond_8

    const/4 p1, 0x3

    goto :goto_1

    :cond_8
    const/4 p1, 0x2

    .line 1558
    :goto_1
    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_9
    if-eqz p2, :cond_a

    goto :goto_2

    :cond_a
    move-object v0, v1

    .line 1563
    :goto_2
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    :cond_b
    :goto_3
    if-nez p2, :cond_c

    .line 1565
    sget-object v0, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 1566
    invoke-virtual {p0, v5, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1568
    :cond_c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v0

    if-eqz p2, :cond_d

    const/16 v5, 0x2d

    :cond_d
    const/4 p2, 0x0

    .line 1569
    aput-char v5, v0, p2

    int-to-char p1, p1

    .line 1570
    aput-char p1, v0, v4

    .line 1571
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1572
    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected final _finishToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_9

    const/4 v2, 0x4

    if-eq v0, v2, :cond_8

    const/4 v2, 0x5

    if-eq v0, v2, :cond_7

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_3

    const/16 v3, 0x2d

    packed-switch v0, :pswitch_data_4

    packed-switch v0, :pswitch_data_5

    .line 316
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    const/4 v0, 0x0

    return-object v0

    .line 314
    :pswitch_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishHashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 312
    :pswitch_1
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishCppComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 310
    :pswitch_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-direct {p0, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 308
    :pswitch_3
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishCComment(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 306
    :pswitch_4
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startSlashComment(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 301
    :pswitch_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishErrorToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 298
    :pswitch_6
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 276
    :pswitch_7
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitUTF8_4(III)Z

    move-result v0

    if-nez v0, :cond_0

    .line 277
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 279
    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    if-ne v0, v3, :cond_1

    .line 280
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 282
    :cond_1
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 268
    :pswitch_8
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitUTF8_3(III)Z

    move-result v0

    if-nez v0, :cond_2

    .line 269
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 271
    :cond_2
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    if-ne v0, v3, :cond_3

    .line 272
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 274
    :cond_3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 262
    :pswitch_9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeUTF8_2(II)I

    move-result v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 263
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    if-ne v0, v3, :cond_4

    .line 264
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 266
    :cond_4
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 286
    :pswitch_a
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quoted32:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quotedDigits:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_decodeSplitEscaped(II)I

    move-result v0

    if-gez v0, :cond_5

    .line 288
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 290
    :cond_5
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    int-to-char v0, v0

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append(C)V

    .line 292
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorStateAfterSplit:I

    if-ne v0, v3, :cond_6

    .line 293
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 295
    :cond_6
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 260
    :pswitch_b
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 257
    :pswitch_c
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 255
    :pswitch_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishFloatExponent(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 253
    :pswitch_e
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishFloatFraction()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 250
    :pswitch_f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getBufferWithoutReset()[C

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 251
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v1

    .line 250
    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberIntegralPart([CI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 248
    :pswitch_10
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 246
    :pswitch_11
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 244
    :pswitch_12
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberMinus(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 242
    :pswitch_13
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberPlus(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 239
    :pswitch_14
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_nonStdTokenType:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 237
    :pswitch_15
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "false"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 235
    :pswitch_16
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "true"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 233
    :pswitch_17
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "null"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 226
    :pswitch_18
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 230
    :pswitch_19
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 228
    :pswitch_1a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 224
    :pswitch_1b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 219
    :pswitch_1c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishUnquotedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 217
    :pswitch_1d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 215
    :pswitch_1e
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishFieldWithEscape()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 213
    :pswitch_1f
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_quadLength:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pendingBytes:I

    invoke-direct {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parseEscapedName(III)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 209
    :cond_7
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 207
    :cond_8
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 205
    :cond_9
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishBOM(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x16
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1e
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x28
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x32
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected final _finishTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 333
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 334
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_3

    const/16 v2, 0xc

    if-eq v1, v2, :cond_2

    const/16 v2, 0x32

    if-eq v1, v2, :cond_1

    packed-switch v1, :pswitch_data_0

    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_1

    packed-switch v1, :pswitch_data_2

    packed-switch v1, :pswitch_data_3

    .line 393
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ": was expecting rest of token (internal state: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    return-object v0

    .line 376
    :pswitch_0
    const-string v0, ": was expecting fraction after exponent marker"

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 384
    :pswitch_1
    const-string v0, ": was expecting closing \'*/\' for comment"

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportInvalidEOF(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonToken;)V

    .line 389
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 370
    :pswitch_3
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 373
    :pswitch_4
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 361
    :pswitch_5
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v0

    .line 362
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numberNegative:Z

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 365
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 367
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 357
    :pswitch_6
    const-string v0, "0"

    invoke-virtual {p0, v2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 348
    :pswitch_7
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_nonStdTokenType:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdTokenWithEOF(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 346
    :pswitch_8
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "false"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 344
    :pswitch_9
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "true"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 342
    :pswitch_a
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_pending32:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    const-string v2, "null"

    invoke-virtual {p0, v2, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordTokenWithEOF(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 350
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishErrorTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 338
    :cond_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 336
    :cond_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x18
        :pswitch_6
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1e
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x34
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method protected _reportErrorToken(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1264
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object p1

    .line 1265
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_validJsonTokenList()Ljava/lang/String;

    move-result-object v0

    .line 1264
    const-string v1, "Unrecognized token \'%s\': was expecting %s"

    invoke-virtual {p0, v1, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportError(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1266
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1
.end method

.method protected _startAposString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2631
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2633
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 2634
    sget-object v2, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icUTF8:[I

    .line 2636
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    array-length v4, v1

    add-int/2addr v4, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    if-ge v0, v3, :cond_2

    .line 2638
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    and-int/lit16 v5, v5, 0xff

    const/16 v6, 0x27

    if-ne v5, v6, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 2640
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2641
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2642
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 2645
    :cond_0
    aget v6, v2, v5

    if-eqz v6, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v6, v4, 0x1

    int-to-char v5, v5

    .line 2649
    aput-char v5, v1, v4

    move v4, v6

    goto :goto_0

    .line 2651
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2652
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2653
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startFalseToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1103
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v1, v0, 0x4

    .line 1104
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-ge v1, v2, :cond_1

    add-int/lit8 v1, v0, 0x1

    .line 1105
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    const/16 v3, 0x61

    if-ne v2, v3, :cond_1

    add-int/lit8 v2, v0, 0x2

    .line 1106
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    const/16 v3, 0x6c

    if-ne v1, v3, :cond_1

    add-int/lit8 v1, v0, 0x3

    .line 1107
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    const/16 v3, 0x73

    if-ne v2, v3, :cond_1

    add-int/lit8 v0, v0, 0x4

    .line 1108
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    const/16 v2, 0x65

    if-ne v1, v2, :cond_1

    .line 1109
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0x30

    if-lt v1, v2, :cond_0

    const/16 v2, 0x5d

    if-eq v1, v2, :cond_0

    const/16 v2, 0x7d

    if-ne v1, v2, :cond_1

    .line 1111
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1112
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_1
    const/16 v0, 0x12

    .line 1116
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1117
    const-string v0, "false"

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x39

    const/16 v1, 0x30

    const/4 v2, 0x0

    const/16 v3, 0x2e

    if-ne p3, v3, :cond_5

    .line 1730
    array-length p3, p1

    if-lt p2, p3, :cond_0

    .line 1731
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_0
    add-int/lit8 p3, p2, 0x1

    .line 1733
    aput-char v3, p1, p2

    move p2, p3

    const/4 p3, 0x0

    .line 1735
    :goto_0
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v3, v4, :cond_1

    .line 1736
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    const/16 p1, 0x1e

    .line 1737
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1738
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fractLength:I

    .line 1739
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1741
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v3

    if-lt v3, v1, :cond_4

    if-le v3, v0, :cond_2

    goto :goto_1

    .line 1752
    :cond_2
    array-length v4, p1

    if-lt p2, v4, :cond_3

    .line 1753
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_3
    add-int/lit8 v4, p2, 0x1

    int-to-char v3, v3

    .line 1755
    aput-char v3, p1, p2

    add-int/lit8 p3, p3, 0x1

    move p2, v4

    goto :goto_0

    :cond_4
    :goto_1
    and-int/lit16 v3, v3, 0xff

    if-nez p3, :cond_6

    .line 1746
    sget-object v4, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_TRAILING_DECIMAL_POINT_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 1747
    const-string v4, "Decimal point not followed by a digit"

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    goto :goto_2

    :cond_5
    move v3, p3

    const/4 p3, 0x0

    .line 1759
    :cond_6
    :goto_2
    iput p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_fractLength:I

    const/16 p3, 0x65

    if-eq v3, p3, :cond_7

    const/16 p3, 0x45

    if-ne v3, p3, :cond_11

    .line 1762
    :cond_7
    array-length p3, p1

    if-lt p2, p3, :cond_8

    .line 1763
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_8
    add-int/lit8 p3, p2, 0x1

    int-to-char v3, v3

    .line 1765
    aput-char v3, p1, p2

    .line 1766
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v3, v4, :cond_9

    .line 1767
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    const/16 p1, 0x1f

    .line 1768
    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1769
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1770
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1772
    :cond_9
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v3

    const/16 v4, 0x2d

    const/16 v5, 0x20

    if-eq v3, v4, :cond_b

    const/16 v4, 0x2b

    if-ne v3, v4, :cond_a

    goto :goto_4

    :cond_a
    :goto_3
    move p2, p3

    goto :goto_5

    .line 1774
    :cond_b
    :goto_4
    array-length v4, p1

    if-lt p3, v4, :cond_c

    .line 1775
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_c
    add-int/lit8 p2, p2, 0x2

    int-to-char v3, v3

    .line 1777
    aput-char v3, p1, p3

    .line 1778
    iget p3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p3, v3, :cond_d

    .line 1779
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1780
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1781
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1782
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1784
    :cond_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v3

    :goto_5
    if-lt v3, v1, :cond_10

    if-gt v3, v0, :cond_10

    add-int/lit8 v2, v2, 0x1

    .line 1788
    array-length p3, p1

    if-lt p2, p3, :cond_e

    .line 1789
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object p1

    :cond_e
    add-int/lit8 p3, p2, 0x1

    int-to-char v3, v3

    .line 1791
    aput-char v3, p1, p2

    .line 1792
    iget p2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p2, v3, :cond_f

    .line 1793
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1794
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1795
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1796
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1798
    :cond_f
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextSignedByteFromBuffer()B

    move-result v3

    goto :goto_3

    :cond_10
    and-int/lit16 p1, v3, 0xff

    if-nez v2, :cond_11

    .line 1803
    const-string p3, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p1, p3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1807
    :cond_11
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1808
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1810
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_expLength:I

    .line 1811
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1
.end method

.method protected _startFloatThatStartsWithPeriod()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1278
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numberNegative:Z

    .line 1279
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1280
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    const/16 v2, 0x2e

    .line 1281
    invoke-virtual {p0, v1, v0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startNegativeNumber()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1336
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numberNegative:Z

    .line 1337
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v1, v2, :cond_0

    const/16 v0, 0x17

    .line 1338
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1339
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1341
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v1

    .line 1342
    const-string v2, "expected digit (0-9) to follow minus sign, for valid numeric value"

    const/16 v3, 0x39

    const/4 v4, 0x2

    const/16 v5, 0x30

    if-gt v1, v5, :cond_2

    if-ne v1, v5, :cond_1

    .line 1344
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingNegZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1347
    :cond_1
    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    if-le v1, v3, :cond_4

    const/16 v6, 0x49

    if-ne v1, v6, :cond_3

    const/4 v0, 0x3

    .line 1350
    invoke-virtual {p0, v0, v4}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1352
    :cond_3
    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1354
    :cond_4
    :goto_0
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    const/4 v6, 0x0

    const/16 v7, 0x2d

    .line 1355
    aput-char v7, v2, v6

    int-to-char v1, v1

    .line 1356
    aput-char v1, v2, v0

    .line 1357
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v7, 0x1a

    if-lt v1, v6, :cond_5

    .line 1358
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1359
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1360
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1361
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1363
    :cond_5
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    :goto_1
    if-ge v1, v5, :cond_6

    const/16 v3, 0x2e

    if-ne v1, v3, :cond_7

    add-int/lit8 v3, v4, -0x1

    .line 1369
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1370
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v3, v0

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1371
    invoke-virtual {p0, v2, v4, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_6
    if-le v1, v3, :cond_9

    const/16 v3, 0x65

    if-eq v1, v3, :cond_8

    const/16 v3, 0x45

    if-ne v1, v3, :cond_7

    goto :goto_2

    :cond_7
    add-int/lit8 v0, v4, -0x1

    .line 1395
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1396
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1397
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_8
    :goto_2
    add-int/lit8 v3, v4, -0x1

    .line 1377
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1378
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v3, v0

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1379
    invoke-virtual {p0, v2, v4, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1383
    :cond_9
    array-length v6, v2

    if-lt v4, v6, :cond_a

    .line 1385
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v2

    :cond_a
    add-int/lit8 v6, v4, 0x1

    int-to-char v1, v1

    .line 1387
    aput-char v1, v2, v4

    .line 1388
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v1, v4, :cond_b

    .line 1389
    iput v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1390
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1391
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1393
    :cond_b
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    move v4, v6

    goto :goto_1
.end method

.method protected _startNullToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1140
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v1, v0, 0x3

    .line 1141
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-ge v1, v2, :cond_1

    add-int/lit8 v1, v0, 0x1

    .line 1142
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    const/16 v3, 0x75

    if-ne v2, v3, :cond_1

    add-int/lit8 v2, v0, 0x2

    .line 1143
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    const/16 v3, 0x6c

    if-ne v1, v3, :cond_1

    add-int/lit8 v0, v0, 0x3

    .line 1144
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    if-ne v1, v3, :cond_1

    .line 1145
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0x30

    if-lt v1, v2, :cond_0

    const/16 v2, 0x5d

    if-eq v1, v2, :cond_0

    const/16 v2, 0x7d

    if-ne v1, v2, :cond_1

    .line 1147
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1148
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_1
    const/16 v0, 0x10

    .line 1152
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1153
    const-string v0, "null"

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startNumberLeadingZero()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1474
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1475
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_0

    const/16 v0, 0x18

    .line 1476
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1477
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    :cond_0
    add-int/lit8 v1, v0, 0x1

    .line 1484
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v2, 0x0

    const/16 v3, 0x30

    const/4 v4, 0x1

    if-ge v0, v3, :cond_1

    const/16 v5, 0x2e

    if-ne v0, v5, :cond_3

    .line 1488
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1489
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1490
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1491
    aput-char v3, v1, v2

    .line 1492
    invoke-virtual {p0, v1, v4, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_1
    const/16 v5, 0x39

    if-le v0, v5, :cond_5

    const/16 v5, 0x65

    if-eq v0, v5, :cond_4

    const/16 v5, 0x45

    if-ne v0, v5, :cond_2

    goto :goto_0

    :cond_2
    const/16 v1, 0x5d

    if-eq v0, v1, :cond_3

    const/16 v1, 0x7d

    if-eq v0, v1, :cond_3

    .line 1506
    const-string v1, "expected digit (0-9), decimal point (.) or exponent indicator (e/E) to follow \'0\'"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1514
    :cond_3
    const-string v0, "0"

    invoke-virtual {p0, v2, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueCompleteInt(ILjava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1496
    :cond_4
    :goto_0
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1497
    iput v4, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1498
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1499
    aput-char v3, v1, v2

    .line 1500
    invoke-virtual {p0, v1, v4, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1511
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startPositiveNumber()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1402
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numberNegative:Z

    .line 1403
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v1, v2, :cond_0

    const/16 v0, 0x16

    .line 1404
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1405
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1407
    :cond_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v1

    .line 1408
    const-string v2, "JSON spec does not allow numbers to have plus signs: enable `JsonReadFeature.ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS` to allow"

    const-string v3, "expected digit (0-9) to follow plus sign, for valid numeric value"

    const/16 v4, 0x39

    const/16 v5, 0x2b

    const/16 v6, 0x30

    const/4 v7, 0x2

    if-gt v1, v6, :cond_3

    if-ne v1, v6, :cond_2

    .line 1410
    sget-object v0, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1411
    invoke-virtual {p0, v5, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1413
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNumberLeadingPosZeroes()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1416
    :cond_2
    invoke-virtual {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    if-le v1, v4, :cond_5

    const/16 v8, 0x49

    if-ne v1, v8, :cond_4

    .line 1419
    invoke-virtual {p0, v7, v7}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1421
    :cond_4
    invoke-virtual {p0, v1, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1423
    :cond_5
    :goto_0
    sget-object v3, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->ALLOW_LEADING_PLUS_SIGN_FOR_NUMBERS:Lcom/fasterxml/jackson/core/json/JsonReadFeature;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadFeature;->mappedFeature()Lcom/fasterxml/jackson/core/JsonParser$Feature;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 1424
    invoke-virtual {p0, v5, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedNumberChar(ILjava/lang/String;)Ljava/lang/Object;

    .line 1426
    :cond_6
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 1427
    aput-char v5, v2, v0

    int-to-char v0, v1

    const/4 v1, 0x1

    .line 1428
    aput-char v0, v2, v1

    .line 1429
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v5, 0x1a

    if-lt v0, v3, :cond_7

    .line 1430
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1431
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1432
    iput v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1433
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1435
    :cond_7
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v0

    :goto_1
    if-ge v0, v6, :cond_8

    const/16 v3, 0x2e

    if-ne v0, v3, :cond_9

    add-int/lit8 v3, v7, -0x1

    .line 1441
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1442
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1443
    invoke-virtual {p0, v2, v7, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_8
    if-le v0, v4, :cond_b

    const/16 v3, 0x65

    if-eq v0, v3, :cond_a

    const/16 v3, 0x45

    if-ne v0, v3, :cond_9

    goto :goto_2

    :cond_9
    add-int/lit8 v0, v7, -0x1

    .line 1467
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1468
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1469
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_a
    :goto_2
    add-int/lit8 v3, v7, -0x1

    .line 1449
    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1450
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1451
    invoke-virtual {p0, v2, v7, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 1455
    :cond_b
    array-length v3, v2

    if-lt v7, v3, :cond_c

    .line 1457
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v2

    :cond_c
    add-int/lit8 v3, v7, 0x1

    int-to-char v0, v0

    .line 1459
    aput-char v0, v2, v7

    .line 1460
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v7, :cond_d

    .line 1461
    iput v5, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1462
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1463
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 1465
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    move v7, v3

    goto :goto_1
.end method

.method protected _startPositiveNumber(I)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1286
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numberNegative:Z

    .line 1287
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    int-to-char p1, p1

    .line 1288
    aput-char p1, v1, v0

    .line 1290
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/16 v2, 0x1a

    const/4 v3, 0x1

    if-lt p1, v0, :cond_0

    .line 1291
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1292
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1293
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1298
    :cond_0
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result p1

    and-int/lit16 p1, p1, 0xff

    const/4 v0, 0x1

    :goto_0
    const/16 v4, 0x30

    if-ge p1, v4, :cond_1

    const/16 v2, 0x2e

    if-ne p1, v2, :cond_2

    .line 1302
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1303
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1304
    invoke-virtual {p0, v1, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_1
    const/16 v4, 0x39

    if-le p1, v4, :cond_4

    const/16 v2, 0x65

    if-eq p1, v2, :cond_3

    const/16 v2, 0x45

    if-ne p1, v2, :cond_2

    goto :goto_1

    .line 1329
    :cond_2
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1330
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1331
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1310
    :cond_3
    :goto_1
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_intLength:I

    .line 1311
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1312
    invoke-virtual {p0, v1, v0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFloat([CII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 1316
    :cond_4
    array-length v4, v1

    if-lt v0, v4, :cond_5

    .line 1319
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v1

    :cond_5
    add-int/lit8 v4, v0, 0x1

    int-to-char p1, p1

    .line 1321
    aput-char p1, v1, v0

    .line 1322
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt p1, v0, :cond_6

    .line 1323
    iput v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1324
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1325
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object p1

    .line 1327
    :cond_6
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result p1

    and-int/lit16 p1, p1, 0xff

    move v0, v4

    goto :goto_0
.end method

.method protected _startString()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2506
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2508
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 2509
    sget-object v2, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_icUTF8:[I

    .line 2511
    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    array-length v4, v1

    add-int/2addr v4, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    if-ge v0, v3, :cond_1

    .line 2513
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v5

    and-int/lit16 v5, v5, 0xff

    .line 2514
    aget v6, v2, v5

    if-eqz v6, :cond_0

    const/16 v1, 0x22

    if-ne v5, v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 2516
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2517
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2518
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v6, v4, 0x1

    int-to-char v5, v5

    .line 2523
    aput-char v5, v1, v4

    move v4, v6

    goto :goto_0

    .line 2525
    :cond_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2526
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 2527
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishRegularString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startTrueToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1122
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    add-int/lit8 v1, v0, 0x3

    .line 1123
    iget v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-ge v1, v2, :cond_1

    add-int/lit8 v1, v0, 0x1

    .line 1124
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v2

    const/16 v3, 0x72

    if-ne v2, v3, :cond_1

    add-int/lit8 v2, v0, 0x2

    .line 1125
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    const/16 v3, 0x75

    if-ne v1, v3, :cond_1

    add-int/lit8 v0, v0, 0x3

    .line 1126
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    const/16 v2, 0x65

    if-ne v1, v2, :cond_1

    .line 1127
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getByteFromBuffer(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0x30

    if-lt v1, v2, :cond_0

    const/16 v2, 0x5d

    if-eq v1, v2, :cond_0

    const/16 v2, 0x7d

    if-ne v1, v2, :cond_1

    .line 1129
    :cond_0
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 1130
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_1
    const/16 v0, 0x11

    .line 1134
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_minorState:I

    .line 1135
    const-string v0, "true"

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishKeywordToken(Ljava/lang/String;ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0
.end method

.method protected _startUnexpectedValue(ZI)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 p1, 0x27

    if-eq p2, p1, :cond_5

    const/16 p1, 0x49

    const/4 v0, 0x1

    if-eq p2, p1, :cond_4

    const/16 p1, 0x4e

    if-eq p2, p1, :cond_3

    const/16 p1, 0x5d

    if-eq p2, p1, :cond_1

    const/16 p1, 0x7d

    if-eq p2, p1, :cond_6

    const/16 p1, 0x2b

    if-eq p2, p1, :cond_0

    const/16 p1, 0x2c

    if-eq p2, p1, :cond_2

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    .line 917
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 891
    :cond_1
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 900
    :cond_2
    iget-object p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result p1

    if-nez p1, :cond_6

    .line 901
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v1, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_MISSING:I

    and-int/2addr p1, v1

    if-eqz p1, :cond_6

    .line 902
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    .line 903
    sget-object p1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_valueComplete(Lcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 p1, 0x0

    .line 919
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 921
    :cond_4
    invoke-virtual {p0, v0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishNonStdToken(II)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 912
    :cond_5
    iget p1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_features:I

    sget v0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->FEAT_MASK_ALLOW_SINGLE_QUOTES:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_6

    .line 913
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startAposString()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p1

    return-object p1

    .line 924
    :cond_6
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "expected a valid value "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_validJsonValueList()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_reportUnexpectedChar(ILjava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public endOfInput()V
    .locals 1

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_endOfInput:Z

    return-void
.end method

.method protected abstract getByteFromBuffer(I)B
.end method

.method protected abstract getNextSignedByteFromBuffer()B
.end method

.method protected abstract getNextUnsignedByteFromBuffer()I
.end method

.method public final needMoreInput()Z
    .locals 2

    .line 75
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    if-lt v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_endOfInput:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public nextToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    iget v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputEnd:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_3

    .line 119
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_closed:Z

    if-eqz v0, :cond_0

    return-object v2

    .line 123
    :cond_0
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_endOfInput:Z

    if-eqz v0, :cond_2

    .line 126
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1

    .line 127
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishTokenWithEOF()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 129
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_eofAsNextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 131
    :cond_2
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 134
    :cond_3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_4

    .line 135
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_finishToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    :cond_4
    const/4 v0, 0x0

    .line 139
    iput v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_numTypesValid:I

    .line 140
    iget-wide v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_currInputProcessed:J

    iget v3, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_inputPtr:I

    int-to-long v3, v3

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_tokenInputTotal:J

    .line 142
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_binaryValue:[B

    .line 143
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->getNextUnsignedByteFromBuffer()I

    move-result v0

    .line 145
    iget v1, p0, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_majorState:I

    packed-switch v1, :pswitch_data_0

    .line 168
    invoke-static {}, Lcom/fasterxml/jackson/core/util/VersionUtil;->throwInternal()V

    return-object v2

    .line 164
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueExpectComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 161
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 158
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValueExpectColon(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 155
    :pswitch_3
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFieldNameAfterComma(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 153
    :pswitch_4
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startFieldName(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 150
    :pswitch_5
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    .line 147
    :pswitch_6
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase;->_startDocument(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
