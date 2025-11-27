.class final Lio/opencensus/trace/BigendianEncoding;
.super Ljava/lang/Object;
.source "BigendianEncoding.java"


# static fields
.field private static final ALPHABET:Ljava/lang/String; = "0123456789abcdef"

.field private static final ASCII_CHARACTERS:I = 0x80

.field static final BYTE_BASE16:I = 0x2

.field private static final DECODING:[B

.field private static final ENCODING:[C

.field static final LONG_BASE16:I = 0x10

.field static final LONG_BYTES:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    invoke-static {}, Lio/opencensus/trace/BigendianEncoding;->buildEncodingArray()[C

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/BigendianEncoding;->ENCODING:[C

    .line 29
    invoke-static {}, Lio/opencensus/trace/BigendianEncoding;->buildDecodingArray()[B

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/BigendianEncoding;->DECODING:[B

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildDecodingArray()[B
    .locals 4

    const/16 v0, 0x80

    .line 41
    new-array v0, v0, [B

    const/4 v1, -0x1

    .line 42
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x10

    if-ge v1, v2, :cond_0

    .line 44
    const-string v2, "0123456789abcdef"

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    int-to-byte v3, v1

    .line 45
    aput-byte v3, v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static buildEncodingArray()[C
    .locals 5

    const/16 v0, 0x200

    .line 32
    new-array v0, v0, [C

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x100

    if-ge v1, v2, :cond_0

    ushr-int/lit8 v2, v1, 0x4

    .line 34
    const-string v3, "0123456789abcdef"

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    aput-char v2, v0, v1

    or-int/lit16 v2, v1, 0x100

    and-int/lit8 v4, v1, 0xf

    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    aput-char v3, v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static byteFromBase16String(Ljava/lang/CharSequence;I)B
    .locals 3

    .line 149
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    add-int/lit8 v1, p1, 0x2

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "chars too small"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 150
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    add-int/2addr p1, v2

    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    invoke-static {v0, p0}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result p0

    return p0
.end method

.method private static byteToBase16(B[CI)V
    .locals 2

    and-int/lit16 p0, p0, 0xff

    .line 162
    sget-object v0, Lio/opencensus/trace/BigendianEncoding;->ENCODING:[C

    aget-char v1, v0, p0

    aput-char v1, p1, p2

    add-int/lit8 p2, p2, 0x1

    or-int/lit16 p0, p0, 0x100

    .line 163
    aget-char p0, v0, p0

    aput-char p0, p1, p2

    return-void
.end method

.method static byteToBase16String(B[CI)V
    .locals 0

    .line 136
    invoke-static {p0, p1, p2}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    return-void
.end method

.method private static decodeByte(CC)B
    .locals 7

    const/4 v0, 0x1

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/16 v3, 0x80

    if-ge p1, v3, :cond_0

    .line 154
    sget-object v4, Lio/opencensus/trace/BigendianEncoding;->DECODING:[B

    aget-byte v4, v4, p1

    if-eq v4, v1, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "invalid character "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    if-ge p0, v3, :cond_1

    .line 155
    sget-object v3, Lio/opencensus/trace/BigendianEncoding;->DECODING:[B

    aget-byte v3, v3, p0

    if-eq v3, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 156
    sget-object v0, Lio/opencensus/trace/BigendianEncoding;->DECODING:[B

    aget-byte p0, v0, p0

    shl-int/lit8 p0, p0, 0x4

    aget-byte p1, v0, p1

    or-int/2addr p0, p1

    int-to-byte p0, p0

    return p0
.end method

.method static longFromBase16String(Ljava/lang/CharSequence;I)J
    .locals 7

    .line 99
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    add-int/lit8 v1, p1, 0x10

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "chars too small"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 100
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    add-int/lit8 v1, p1, 0x1

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-static {v0, v1}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    const/16 v4, 0x38

    shl-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    .line 101
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v5, p1, 0x3

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x4

    .line 102
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v5, p1, 0x5

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x6

    .line 103
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v5, p1, 0x7

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x8

    .line 104
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v5, p1, 0x9

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0xa

    .line 105
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v5, p1, 0xb

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0xc

    .line 106
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v5, p1, 0xd

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0xe

    .line 107
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 p1, p1, 0xf

    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    invoke-static {v4, p0}, Lio/opencensus/trace/BigendianEncoding;->decodeByte(CC)B

    move-result p0

    int-to-long p0, p0

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method static longFromByteArray([BI)J
    .locals 7

    .line 60
    array-length v0, p0

    add-int/lit8 v1, p1, 0x8

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "array too small"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 61
    aget-byte v0, p0, p1

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    const/16 v4, 0x38

    shl-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x4

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x5

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x6

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 p1, p1, 0x7

    aget-byte p0, p0, p1

    int-to-long p0, p0

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method static longToBase16String(J[CI)V
    .locals 4

    const/16 v0, 0x38

    shr-long v0, p0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    .line 118
    invoke-static {v0, p2, p3}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    const/16 v0, 0x30

    shr-long v0, p0, v0

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    add-int/lit8 v1, p3, 0x2

    .line 119
    invoke-static {v0, p2, v1}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    const/16 v0, 0x28

    shr-long v0, p0, v0

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    add-int/lit8 v1, p3, 0x4

    .line 120
    invoke-static {v0, p2, v1}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    const/16 v0, 0x20

    shr-long v0, p0, v0

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    add-int/lit8 v1, p3, 0x6

    .line 121
    invoke-static {v0, p2, v1}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    const/16 v0, 0x18

    shr-long v0, p0, v0

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    add-int/lit8 v1, p3, 0x8

    .line 122
    invoke-static {v0, p2, v1}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    const/16 v0, 0x10

    shr-long v0, p0, v0

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    add-int/lit8 v1, p3, 0xa

    .line 123
    invoke-static {v0, p2, v1}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    const/16 v0, 0x8

    shr-long v0, p0, v0

    and-long/2addr v0, v2

    long-to-int v1, v0

    int-to-byte v0, v1

    add-int/lit8 v1, p3, 0xc

    .line 124
    invoke-static {v0, p2, v1}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    and-long/2addr p0, v2

    long-to-int p1, p0

    int-to-byte p0, p1

    add-int/lit8 p3, p3, 0xe

    .line 125
    invoke-static {p0, p2, p3}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16(B[CI)V

    return-void
.end method

.method static longToByteArray(J[BI)V
    .locals 5

    .line 80
    array-length v0, p2

    add-int/lit8 v1, p3, 0x8

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "array too small"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    add-int/lit8 v0, p3, 0x7

    const-wide/16 v1, 0xff

    and-long v3, p0, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 81
    aput-byte v3, p2, v0

    add-int/lit8 v0, p3, 0x6

    const/16 v3, 0x8

    shr-long v3, p0, v3

    and-long/2addr v3, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 82
    aput-byte v3, p2, v0

    add-int/lit8 v0, p3, 0x5

    const/16 v3, 0x10

    shr-long v3, p0, v3

    and-long/2addr v3, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 83
    aput-byte v3, p2, v0

    add-int/lit8 v0, p3, 0x4

    const/16 v3, 0x18

    shr-long v3, p0, v3

    and-long/2addr v3, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 84
    aput-byte v3, p2, v0

    add-int/lit8 v0, p3, 0x3

    const/16 v3, 0x20

    shr-long v3, p0, v3

    and-long/2addr v3, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 85
    aput-byte v3, p2, v0

    add-int/lit8 v0, p3, 0x2

    const/16 v3, 0x28

    shr-long v3, p0, v3

    and-long/2addr v3, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 86
    aput-byte v3, p2, v0

    add-int/lit8 v0, p3, 0x1

    const/16 v3, 0x30

    shr-long v3, p0, v3

    and-long/2addr v3, v1

    long-to-int v4, v3

    int-to-byte v3, v4

    .line 87
    aput-byte v3, p2, v0

    const/16 v0, 0x38

    shr-long/2addr p0, v0

    and-long/2addr p0, v1

    long-to-int p1, p0

    int-to-byte p0, p1

    .line 88
    aput-byte p0, p2, p3

    return-void
.end method
