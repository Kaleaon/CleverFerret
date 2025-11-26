.class public final Lcom/facebook/imageformat/DefaultImageFormatChecker;
.super Ljava/lang/Object;
.source "DefaultImageFormatChecker.kt"

# interfaces
.implements Lcom/facebook/imageformat/ImageFormat$FormatChecker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0002\u0018\u0000 \u000c2\u00020\u0001:\u0001\u000cB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0004\u001a\u00020\u0005H\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/facebook/imageformat/DefaultImageFormatChecker;",
        "Lcom/facebook/imageformat/ImageFormat$FormatChecker;",
        "<init>",
        "()V",
        "headerSize",
        "",
        "getHeaderSize",
        "()I",
        "determineFormat",
        "Lcom/facebook/imageformat/ImageFormat;",
        "headerBytes",
        "",
        "Companion",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final AVIF_HEADER_LENGTH:I = 0xc

.field private static final AVIF_HEADER_PREFIX:[B

.field private static final AVIF_HEADER_SUFFIX:[B

.field private static final BINARY_XML_HEADER:[B

.field private static final BINARY_XML_HEADER_LENGTH:I = 0x4

.field private static final BMP_HEADER:[B

.field private static final BMP_HEADER_LENGTH:I

.field public static final Companion:Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;

.field private static final DNG_HEADER_II:[B

.field private static final DNG_HEADER_LENGTH:I

.field private static final DNG_HEADER_MM:[B

.field private static final EXTENDED_WEBP_HEADER_LENGTH:I = 0x15

.field private static final GIF_HEADER_87A:[B

.field private static final GIF_HEADER_89A:[B

.field private static final GIF_HEADER_LENGTH:I = 0x6

.field private static final HEIF_HEADER_LENGTH:I = 0xc

.field private static final HEIF_HEADER_PREFIX:[B

.field private static final HEIF_HEADER_SUFFIXES:[[B

.field private static final ICO_HEADER:[B

.field private static final ICO_HEADER_LENGTH:I

.field private static final JPEG_HEADER:[B

.field private static final JPEG_HEADER_LENGTH:I

.field private static final PNG_HEADER:[B

.field private static final PNG_HEADER_LENGTH:I

.field private static final SIMPLE_WEBP_HEADER_LENGTH:I = 0x14


# instance fields
.field private final headerSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->Companion:Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;

    const/4 v0, 0x3

    .line 116
    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->JPEG_HEADER:[B

    .line 117
    array-length v1, v1

    sput v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->JPEG_HEADER_LENGTH:I

    const/16 v1, 0x8

    .line 143
    new-array v1, v1, [B

    fill-array-data v1, :array_1

    .line 135
    sput-object v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->PNG_HEADER:[B

    .line 144
    array-length v1, v1

    sput v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->PNG_HEADER_LENGTH:I

    .line 162
    const-string v1, "GIF87a"

    invoke-static {v1}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v1

    sput-object v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->GIF_HEADER_87A:[B

    .line 163
    const-string v1, "GIF89a"

    invoke-static {v1}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v1

    sput-object v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->GIF_HEADER_89A:[B

    .line 184
    const-string v1, "BM"

    invoke-static {v1}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v1

    sput-object v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->BMP_HEADER:[B

    .line 185
    array-length v1, v1

    sput v1, Lcom/facebook/imageformat/DefaultImageFormatChecker;->BMP_HEADER_LENGTH:I

    const/4 v1, 0x4

    .line 204
    new-array v2, v1, [B

    fill-array-data v2, :array_2

    sput-object v2, Lcom/facebook/imageformat/DefaultImageFormatChecker;->ICO_HEADER:[B

    .line 205
    array-length v2, v2

    sput v2, Lcom/facebook/imageformat/DefaultImageFormatChecker;->ICO_HEADER_LENGTH:I

    .line 228
    const-string v2, "ftyp"

    invoke-static {v2}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v3

    sput-object v3, Lcom/facebook/imageformat/DefaultImageFormatChecker;->HEIF_HEADER_PREFIX:[B

    .line 231
    const-string v3, "heic"

    invoke-static {v3}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 232
    const-string v4, "heix"

    invoke-static {v4}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 233
    const-string v5, "hevc"

    invoke-static {v5}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 234
    const-string v6, "hevx"

    invoke-static {v6}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 235
    const-string v7, "mif1"

    invoke-static {v7}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v7

    .line 236
    const-string v8, "msf1"

    invoke-static {v8}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v8

    const/4 v9, 0x6

    new-array v9, v9, [[B

    const/4 v10, 0x0

    aput-object v3, v9, v10

    const/4 v3, 0x1

    aput-object v4, v9, v3

    const/4 v3, 0x2

    aput-object v5, v9, v3

    aput-object v6, v9, v0

    aput-object v7, v9, v1

    const/4 v0, 0x5

    aput-object v8, v9, v0

    .line 230
    sput-object v9, Lcom/facebook/imageformat/DefaultImageFormatChecker;->HEIF_HEADER_SUFFIXES:[[B

    .line 270
    new-array v0, v1, [B

    fill-array-data v0, :array_3

    sput-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->DNG_HEADER_II:[B

    .line 272
    new-array v3, v1, [B

    fill-array-data v3, :array_4

    sput-object v3, Lcom/facebook/imageformat/DefaultImageFormatChecker;->DNG_HEADER_MM:[B

    .line 273
    array-length v0, v0

    sput v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->DNG_HEADER_LENGTH:I

    .line 303
    new-array v0, v1, [B

    fill-array-data v0, :array_5

    .line 299
    sput-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->BINARY_XML_HEADER:[B

    .line 313
    invoke-static {v2}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->AVIF_HEADER_PREFIX:[B

    .line 314
    const-string v0, "avif"

    invoke-static {v0}, Lcom/facebook/imageformat/ImageFormatCheckerUtils;->asciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->AVIF_HEADER_SUFFIX:[B

    return-void

    nop

    :array_0
    .array-data 1
        -0x1t
        -0x28t
        -0x1t
    .end array-data

    :array_1
    .array-data 1
        -0x77t
        0x50t
        0x4et
        0x47t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data

    :array_2
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data

    :array_3
    .array-data 1
        0x49t
        0x49t
        0x2at
        0x0t
    .end array-data

    :array_4
    .array-data 1
        0x4dt
        0x4dt
        0x0t
        0x2at
    .end array-data

    :array_5
    .array-data 1
        0x3t
        0x0t
        0x8t
        0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 13

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x15

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x14

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 26
    sget v2, Lcom/facebook/imageformat/DefaultImageFormatChecker;->JPEG_HEADER_LENGTH:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 27
    sget v3, Lcom/facebook/imageformat/DefaultImageFormatChecker;->PNG_HEADER_LENGTH:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x6

    .line 28
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 29
    sget v6, Lcom/facebook/imageformat/DefaultImageFormatChecker;->BMP_HEADER_LENGTH:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 30
    sget v7, Lcom/facebook/imageformat/DefaultImageFormatChecker;->ICO_HEADER_LENGTH:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v8, 0xc

    .line 31
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x4

    .line 32
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v11, 0xa

    .line 33
    new-array v11, v11, [Ljava/lang/Integer;

    const/4 v12, 0x0

    aput-object v0, v11, v12

    const/4 v0, 0x1

    aput-object v1, v11, v0

    const/4 v0, 0x2

    aput-object v2, v11, v0

    const/4 v0, 0x3

    aput-object v3, v11, v0

    aput-object v5, v11, v9

    const/4 v0, 0x5

    aput-object v6, v11, v0

    aput-object v7, v11, v4

    const/4 v0, 0x7

    aput-object v8, v11, v0

    const/16 v0, 0x8

    aput-object v10, v11, v0

    const/16 v0, 0x9

    aput-object v8, v11, v0

    .line 24
    check-cast v11, [Ljava/lang/Comparable;

    .line 35
    invoke-static {v11}, Lkotlin/collections/ArraysKt;->maxOrNull([Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 22
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->headerSize:I

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Required value was null."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final synthetic access$getAVIF_HEADER_PREFIX$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->AVIF_HEADER_PREFIX:[B

    return-object v0
.end method

.method public static final synthetic access$getAVIF_HEADER_SUFFIX$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->AVIF_HEADER_SUFFIX:[B

    return-object v0
.end method

.method public static final synthetic access$getBINARY_XML_HEADER$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->BINARY_XML_HEADER:[B

    return-object v0
.end method

.method public static final synthetic access$getBMP_HEADER$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->BMP_HEADER:[B

    return-object v0
.end method

.method public static final synthetic access$getDNG_HEADER_II$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->DNG_HEADER_II:[B

    return-object v0
.end method

.method public static final synthetic access$getDNG_HEADER_LENGTH$cp()I
    .locals 1

    .line 14
    sget v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->DNG_HEADER_LENGTH:I

    return v0
.end method

.method public static final synthetic access$getDNG_HEADER_MM$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->DNG_HEADER_MM:[B

    return-object v0
.end method

.method public static final synthetic access$getGIF_HEADER_87A$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->GIF_HEADER_87A:[B

    return-object v0
.end method

.method public static final synthetic access$getGIF_HEADER_89A$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->GIF_HEADER_89A:[B

    return-object v0
.end method

.method public static final synthetic access$getHEIF_HEADER_PREFIX$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->HEIF_HEADER_PREFIX:[B

    return-object v0
.end method

.method public static final synthetic access$getHEIF_HEADER_SUFFIXES$cp()[[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->HEIF_HEADER_SUFFIXES:[[B

    return-object v0
.end method

.method public static final synthetic access$getICO_HEADER$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->ICO_HEADER:[B

    return-object v0
.end method

.method public static final synthetic access$getJPEG_HEADER$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->JPEG_HEADER:[B

    return-object v0
.end method

.method public static final synthetic access$getPNG_HEADER$cp()[B
    .locals 1

    .line 14
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->PNG_HEADER:[B

    return-object v0
.end method


# virtual methods
.method public determineFormat([BI)Lcom/facebook/imageformat/ImageFormat;
    .locals 2

    const-string v0, "headerBytes"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 46
    invoke-static {p1, v0, p2}, Lcom/facebook/common/webp/WebpSupportStatus;->isWebpHeader([BII)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->Companion:Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;

    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$getWebpFormat(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Lcom/facebook/imageformat/ImageFormat;

    move-result-object p1

    return-object p1

    .line 49
    :cond_0
    sget-object v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->Companion:Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;

    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isJpegHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 50
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->JPEG:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 52
    :cond_1
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isPngHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 53
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->PNG:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 55
    :cond_2
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isGifHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 56
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->GIF:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 58
    :cond_3
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isBmpHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 59
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->BMP:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 61
    :cond_4
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isIcoHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 62
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->ICO:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 64
    :cond_5
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isAvifHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 65
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->AVIF:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 67
    :cond_6
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isHeifHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 68
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->HEIF:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 70
    :cond_7
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isBinaryXmlHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 71
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->BINARY_XML:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 73
    :cond_8
    invoke-static {v0, p1, p2}, Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;->access$isDngHeader(Lcom/facebook/imageformat/DefaultImageFormatChecker$Companion;[BI)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 74
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->DNG:Lcom/facebook/imageformat/ImageFormat;

    return-object p1

    .line 76
    :cond_9
    sget-object p1, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    return-object p1
.end method

.method public getHeaderSize()I
    .locals 1

    .line 21
    iget v0, p0, Lcom/facebook/imageformat/DefaultImageFormatChecker;->headerSize:I

    return v0
.end method
