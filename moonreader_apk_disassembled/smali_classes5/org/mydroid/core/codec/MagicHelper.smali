.class public Lorg/mydroid/core/codec/MagicHelper;
.super Ljava/lang/Object;
.source "MagicHelper.java"


# static fields
.field private static final LIGHT_VALUE:I = 0x1c2

.field static brightnessContrastMap:[I = null

.field public static volatile isNeedBC:Z = true

.field static simpleHash:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x100

    .line 82
    new-array v0, v0, [I

    sput-object v0, Lorg/mydroid/core/codec/MagicHelper;->brightnessContrastMap:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyQuickContrastAndBrightness([III)V
    .locals 0

    return-void
.end method

.method public static isNeedMagic()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static ivanEbolden([I)V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 129
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_3

    .line 130
    aget v3, p0, v1

    const/high16 v4, -0x1000000

    if-ne v3, v4, :cond_0

    const/4 v2, 0x0

    goto :goto_2

    :cond_0
    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 136
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    aput v2, p0, v1

    const/16 v2, 0xff

    goto :goto_2

    .line 141
    :cond_1
    invoke-static {v3}, Landroid/graphics/Color;->red(I)I

    move-result v4

    .line 142
    invoke-static {v3}, Landroid/graphics/Color;->green(I)I

    move-result v5

    .line 143
    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    add-int/2addr v4, v5

    add-int/2addr v4, v3

    .line 145
    div-int/lit8 v4, v4, 0x3

    const/4 v3, 0x1

    if-le v1, v3, :cond_2

    .line 149
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    goto :goto_1

    :cond_2
    move v2, v4

    .line 152
    :goto_1
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    aput v2, p0, v1

    move v2, v4

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static mixColorsFontColor(II)I
    .locals 4

    .line 63
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    .line 64
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 65
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    .line 67
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 68
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    .line 69
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    .line 71
    invoke-static {v0, v2}, Lorg/mydroid/core/codec/MagicHelper;->multiply(II)I

    move-result v0

    .line 72
    invoke-static {v1, v3}, Lorg/mydroid/core/codec/MagicHelper;->multiply(II)I

    move-result v1

    .line 73
    invoke-static {p0, p1}, Lorg/mydroid/core/codec/MagicHelper;->multiply(II)I

    move-result p0

    .line 75
    invoke-static {v0, v1, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method public static multiply(II)I
    .locals 0

    mul-int p0, p0, p1

    .line 79
    div-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public static quickContrast3([III)V
    .locals 8

    add-int/lit8 v0, p1, 0x64

    int-to-double v0, v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    div-double/2addr v0, v2

    mul-int/lit8 p1, p1, 0x3

    mul-int/lit8 v2, p2, 0x2

    add-int/2addr p1, v2

    .line 94
    sget v2, Lorg/mydroid/core/codec/MagicHelper;->simpleHash:I

    const/4 v3, 0x0

    if-eq v2, p1, :cond_3

    const/4 v2, 0x0

    :goto_0
    const/16 v4, 0x100

    if-ge v2, v4, :cond_2

    sub-int v4, v2, p2

    add-int/lit8 v4, v4, -0x80

    int-to-double v4, v4

    mul-double v4, v4, v0

    const-wide/high16 v6, 0x4060000000000000L    # 128.0

    add-double/2addr v4, v6

    double-to-int v4, v4

    if-gez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_1

    :cond_0
    const/16 v5, 0xff

    if-le v4, v5, :cond_1

    const/16 v4, 0xff

    .line 107
    :cond_1
    :goto_1
    sget-object v5, Lorg/mydroid/core/codec/MagicHelper;->brightnessContrastMap:[I

    shl-int/lit8 v6, v4, 0x10

    shl-int/lit8 v7, v4, 0x8

    add-int/2addr v6, v7

    add-int/2addr v6, v4

    aput v6, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 110
    :cond_2
    sput p1, Lorg/mydroid/core/codec/MagicHelper;->simpleHash:I

    .line 114
    :cond_3
    :goto_2
    array-length p1, p0

    if-ge v3, p1, :cond_6

    .line 116
    aget p1, p0, v3

    const/4 p2, -0x1

    if-eq p1, p2, :cond_5

    const/high16 p2, -0x1000000

    if-ne p1, p2, :cond_4

    goto :goto_3

    :cond_4
    const/high16 p2, 0xff0000

    and-int/2addr p2, p1

    shr-int/lit8 p2, p2, 0x11

    const v0, 0xff00

    and-int/2addr v0, p1

    shr-int/lit8 v0, v0, 0xa

    add-int/2addr p2, v0

    and-int/lit16 p1, p1, 0xff

    shr-int/lit8 p1, p1, 0x2

    add-int/2addr p2, p1

    .line 122
    sget-object p1, Lorg/mydroid/core/codec/MagicHelper;->brightnessContrastMap:[I

    aget p1, p1, p2

    aput p1, p0, v3

    :cond_5
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_6
    return-void
.end method

.method public static udpateColorsMagic([I)V
    .locals 11

    .line 25
    invoke-static {}, Lorg/mydroid/core/codec/MagicHelper;->isNeedMagic()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 29
    :cond_0
    invoke-static {}, Lorg/mydroid/core/codec/Settings;->getTextColor()I

    move-result v0

    .line 30
    invoke-static {}, Lorg/mydroid/core/codec/Settings;->getBgColor()I

    move-result v1

    const/4 v2, 0x0

    .line 31
    aget v3, p0, v2

    .line 32
    array-length v4, p0

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    aget v4, p0, v4

    if-ne v3, v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 34
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const-string v10, "MAGIC0ON"

    aput-object v10, v9, v2

    aput-object v6, v9, v5

    const/4 v5, 0x2

    aput-object v7, v9, v5

    const/4 v5, 0x3

    aput-object v8, v9, v5

    invoke-static {v9}, Lorg/mydroid/core/codec/LOG;->d([Ljava/lang/Object;)V

    .line 36
    :goto_1
    array-length v5, p0

    if-ge v2, v5, :cond_6

    .line 37
    aget v5, p0, v2

    const/high16 v6, -0x1000000

    if-ne v5, v6, :cond_2

    .line 40
    aput v0, p0, v2

    goto :goto_3

    :cond_2
    const/4 v6, -0x1

    if-eq v5, v6, :cond_5

    if-eqz v4, :cond_3

    if-ne v5, v3, :cond_3

    goto :goto_2

    .line 49
    :cond_3
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    move-result v6

    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    move-result v7

    add-int/2addr v6, v7

    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    add-int/2addr v6, v7

    const/16 v7, 0x1c2

    if-le v6, v7, :cond_4

    .line 52
    invoke-static {v5, v1}, Lorg/mydroid/core/codec/MagicHelper;->mixColorsFontColor(II)I

    move-result v5

    aput v5, p0, v2

    goto :goto_3

    :cond_4
    not-int v5, v5

    .line 55
    invoke-static {v5, v0}, Lorg/mydroid/core/codec/MagicHelper;->mixColorsFontColor(II)I

    move-result v5

    aput v5, p0, v2

    goto :goto_3

    .line 45
    :cond_5
    :goto_2
    aput v1, p0, v2

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_6
    :goto_4
    return-void
.end method


# virtual methods
.method public udpateColorsMagic(Landroid/graphics/Bitmap;)V
    .locals 9

    .line 15
    invoke-static {}, Lorg/mydroid/core/codec/MagicHelper;->isNeedMagic()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int v0, v0, v1

    new-array v2, v0, [I

    .line 19
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 20
    invoke-static {v2}, Lorg/mydroid/core/codec/MagicHelper;->udpateColorsMagic([I)V

    .line 21
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-void
.end method
