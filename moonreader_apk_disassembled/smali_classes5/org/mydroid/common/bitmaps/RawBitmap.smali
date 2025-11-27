.class public final Lorg/mydroid/common/bitmaps/RawBitmap;
.super Ljava/lang/Object;
.source "RawBitmap.java"


# instance fields
.field public final hasAlpha:Z

.field public height:I

.field public pixels:[I

.field public width:I


# direct methods
.method public constructor <init>(IIZ)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    .line 17
    iput p2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    .line 18
    iput-boolean p3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    mul-int p1, p1, p2

    .line 19
    new-array p1, p1, [I

    iput-object p1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;IIII)V
    .locals 9

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p4, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    .line 33
    iput p5, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    .line 34
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    iput-boolean v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    mul-int v0, p4, p5

    .line 35
    new-array v2, v0, [I

    iput-object v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    const/4 v3, 0x0

    move v7, p4

    move-object v1, p1

    move v5, p2

    move v6, p3

    move v4, p4

    move v8, p5

    .line 37
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    .locals 9

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    .line 24
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    .line 25
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    iput-boolean v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    .line 26
    iget v4, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    mul-int v0, v0, v4

    new-array v2, v0, [I

    iput-object v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    .line 28
    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    iget v7, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v8, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    return-void
.end method

.method public static invert(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 9

    .line 84
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int v0, v0, v1

    new-array v2, v0, [I

    .line 85
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 86
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-static {v2, p0, v0}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeInvert([III)V

    .line 88
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {v1, p0, v0}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 89
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-object v1
.end method

.method private static native nativeAutoLevels([III)V
.end method

.method private static native nativeAutoLevels2([III)V
.end method

.method private static native nativeContrast([IIII)V
.end method

.method private static native nativeExposure([IIII)V
.end method

.method private static native nativeHq2x([I[III)V
.end method

.method private static native nativeHq3x([I[III)V
.end method

.method private static native nativeHq4x([I[III)V
.end method

.method private static native nativeInvert([III)V
.end method

.method public static scaleHq2x(Lorg/mydroid/common/bitmaps/RawBitmap;)Landroid/graphics/Bitmap;
    .locals 4

    .line 136
    new-instance v0, Lorg/mydroid/common/bitmaps/RawBitmap;

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    mul-int/lit8 v2, v2, 0x2

    iget-boolean v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    invoke-direct {v0, v1, v2, v3}, Lorg/mydroid/common/bitmaps/RawBitmap;-><init>(IIZ)V

    const/4 v1, 0x0

    .line 137
    invoke-virtual {p0, v1}, Lorg/mydroid/common/bitmaps/RawBitmap;->fillAlpha(I)V

    .line 139
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget-object v2, v0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget p0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    invoke-static {v1, v2, v3, p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeHq2x([I[III)V

    const/16 p0, 0xff

    .line 140
    invoke-virtual {v0, p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->fillAlpha(I)V

    .line 141
    invoke-virtual {v0}, Lorg/mydroid/common/bitmaps/RawBitmap;->toBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static scaleHq3x(Lorg/mydroid/common/bitmaps/RawBitmap;)Landroid/graphics/Bitmap;
    .locals 4

    .line 127
    new-instance v0, Lorg/mydroid/common/bitmaps/RawBitmap;

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    mul-int/lit8 v1, v1, 0x3

    iget v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    mul-int/lit8 v2, v2, 0x3

    iget-boolean v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    invoke-direct {v0, v1, v2, v3}, Lorg/mydroid/common/bitmaps/RawBitmap;-><init>(IIZ)V

    const/4 v1, 0x0

    .line 128
    invoke-virtual {p0, v1}, Lorg/mydroid/common/bitmaps/RawBitmap;->fillAlpha(I)V

    .line 130
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget-object v2, v0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget p0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    invoke-static {v1, v2, v3, p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeHq3x([I[III)V

    const/16 p0, 0xff

    .line 131
    invoke-virtual {v0, p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->fillAlpha(I)V

    .line 132
    invoke-virtual {v0}, Lorg/mydroid/common/bitmaps/RawBitmap;->toBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static scaleHq4x(Lorg/mydroid/common/bitmaps/RawBitmap;)Landroid/graphics/Bitmap;
    .locals 4

    .line 118
    new-instance v0, Lorg/mydroid/common/bitmaps/RawBitmap;

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    mul-int/lit8 v1, v1, 0x4

    iget v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    mul-int/lit8 v2, v2, 0x4

    iget-boolean v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    invoke-direct {v0, v1, v2, v3}, Lorg/mydroid/common/bitmaps/RawBitmap;-><init>(IIZ)V

    const/4 v1, 0x0

    .line 119
    invoke-virtual {p0, v1}, Lorg/mydroid/common/bitmaps/RawBitmap;->fillAlpha(I)V

    .line 121
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget-object v2, v0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget p0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    invoke-static {v1, v2, v3, p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeHq4x([I[III)V

    const/16 p0, 0xff

    .line 122
    invoke-virtual {v0, p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->fillAlpha(I)V

    .line 123
    invoke-virtual {v0}, Lorg/mydroid/common/bitmaps/RawBitmap;->toBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public autoLevels()V
    .locals 3

    .line 102
    iget-object v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    invoke-static {v0, v1, v2}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeAutoLevels2([III)V

    return-void
.end method

.method public contrast(I)V
    .locals 3

    .line 94
    iget-object v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    mul-int/lit16 p1, p1, 0x100

    div-int/lit8 p1, p1, 0x64

    invoke-static {v0, v1, v2, p1}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeContrast([IIII)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V
    .locals 10

    .line 59
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v7, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    iget-boolean v8, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    const/4 v2, 0x0

    move v6, v3

    move-object v0, p1

    move v4, p2

    move v5, p3

    move-object v9, p4

    invoke-virtual/range {v0 .. v9}, Landroid/graphics/Canvas;->drawBitmap([IIIFFIIZLandroid/graphics/Paint;)V

    return-void
.end method

.method public exposure(I)V
    .locals 3

    .line 98
    iget-object v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v2, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    mul-int/lit16 p1, p1, 0x80

    div-int/lit8 p1, p1, 0x64

    invoke-static {v0, v1, v2, p1}, Lorg/mydroid/common/bitmaps/RawBitmap;->nativeExposure([IIII)V

    return-void
.end method

.method public fillAlpha(I)V
    .locals 4

    const/4 v0, 0x0

    .line 77
    :goto_0
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    array-length v2, v1

    if-ge v0, v2, :cond_0

    const v2, 0xffffff

    .line 78
    aget v3, v1, v0

    and-int/2addr v2, v3

    shl-int/lit8 v3, p1, 0x18

    or-int/2addr v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getHeight()I
    .locals 1

    .line 55
    iget v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    return v0
.end method

.method public getPixels()[I
    .locals 1

    .line 47
    iget-object v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 51
    iget v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    return v0
.end method

.method public hasAlpha()Z
    .locals 1

    .line 73
    iget-boolean v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->hasAlpha:Z

    return v0
.end method

.method public retrieve(Landroid/graphics/Bitmap;IIII)V
    .locals 8

    .line 41
    iput p4, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    .line 42
    iput p5, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    .line 43
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    const/4 v2, 0x0

    move v6, p4

    move-object v0, p1

    move v4, p2

    move v5, p3

    move v3, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    return-void
.end method

.method public scaleHq2x()Landroid/graphics/Bitmap;
    .locals 1

    .line 114
    invoke-static {p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->scaleHq2x(Lorg/mydroid/common/bitmaps/RawBitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public scaleHq3x()Landroid/graphics/Bitmap;
    .locals 1

    .line 110
    invoke-static {p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->scaleHq3x(Lorg/mydroid/common/bitmaps/RawBitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public scaleHq4x()Landroid/graphics/Bitmap;
    .locals 1

    .line 106
    invoke-static {p0}, Lorg/mydroid/common/bitmaps/RawBitmap;->scaleHq4x(Lorg/mydroid/common/bitmaps/RawBitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .locals 11

    .line 67
    iget v0, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    iget v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 68
    iget-object v4, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v6, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    const/4 v8, 0x0

    iget v10, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move v9, v6

    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-object v3
.end method

.method public toBitmap(Landroid/graphics/Bitmap;)V
    .locals 8

    .line 63
    iget-object v1, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->pixels:[I

    iget v3, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->width:I

    const/4 v5, 0x0

    iget v7, p0, Lorg/mydroid/common/bitmaps/RawBitmap;->height:I

    const/4 v2, 0x0

    const/4 v4, 0x0

    move v6, v3

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-void
.end method
