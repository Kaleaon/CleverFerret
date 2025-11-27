.class public final Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;
.super Ljava/lang/Object;
.source "IterativeBoxBlurFilter.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0015\n\u0002\u0008\r\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J \u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000bH\u0007J \u0010\r\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000bH\u0002J8\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0015\u001a\u00020\u0010H\u0002J@\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000b2\u0006\u0010\u0019\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0015\u001a\u00020\u0010H\u0002J \u0010\u001a\u001a\u00020\u000b2\u0006\u0010\u001b\u001a\u00020\u000b2\u0006\u0010\u001c\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000bH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "boxBlurBitmapInPlace",
        "",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "iterations",
        "",
        "radius",
        "fastBoxBlur",
        "internalHorizontalBlur",
        "pixels",
        "",
        "outRow",
        "w",
        "row",
        "diameter",
        "div",
        "internalVerticalBlur",
        "outCol",
        "h",
        "col",
        "bound",
        "x",
        "l",
        "imagepipeline_release"
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
.field public static final INSTANCE:Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;

.field private static final TAG:Ljava/lang/String; = "IterativeBoxBlurFilter"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->INSTANCE:Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final bound(III)I
    .locals 0

    if-ge p1, p2, :cond_0

    return p2

    :cond_0
    if-le p1, p3, :cond_1

    return p3

    :cond_1
    return p1
.end method

.method public static final boxBlurBitmapInPlace(Landroid/graphics/Bitmap;II)V
    .locals 6
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "bitmap"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    .line 41
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v3, 0x45000000    # 2048.0f

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    .line 42
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    if-lez p2, :cond_2

    const/16 v0, 0x19

    if-gt p2, v0, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 43
    :goto_2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    if-lez p1, :cond_3

    const/4 v0, 0x1

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    .line 44
    :goto_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    .line 46
    :try_start_0
    sget-object v0, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->INSTANCE:Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->fastBoxBlur(Landroid/graphics/Bitmap;II)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 50
    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 54
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 55
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    .line 56
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v4, 0x4

    new-array v5, v4, [Ljava/lang/Object;

    aput-object p1, v5, v2

    aput-object v3, v5, v1

    const/4 p1, 0x2

    aput-object p0, v5, p1

    const/4 p0, 0x3

    aput-object p2, v5, p0

    .line 50
    invoke-static {v5, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    const-string p2, "OOM: %d iterations on %dx%d with %d radius"

    invoke-static {p1, p2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "format(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    const-string p1, "IterativeBoxBlurFilter"

    invoke-static {p1, p0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    throw v0
.end method

.method private final fastBoxBlur(Landroid/graphics/Bitmap;II)V
    .locals 11

    .line 62
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 63
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    mul-int v0, v3, v7

    .line 64
    new-array v1, v0, [I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move v6, v3

    move-object v0, p1

    .line 65
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    add-int/lit8 v0, p3, 0x1

    add-int v5, v0, p3

    mul-int/lit16 p3, v5, 0x100

    .line 70
    new-array v6, p3, [I

    const/4 p3, 0x1

    :goto_0
    const/4 v8, 0x0

    const/16 v2, 0x100

    if-ge p3, v2, :cond_1

    :goto_1
    if-ge v8, v5, :cond_0

    .line 77
    aput p3, v6, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 81
    :cond_1
    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result p3

    new-array v2, p3, [I

    const/4 p3, 0x0

    :goto_2
    if-ge p3, p2, :cond_5

    const/4 v4, 0x0

    :goto_3
    if-ge v4, v7, :cond_2

    move-object v0, p0

    .line 85
    invoke-direct/range {v0 .. v6}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->internalHorizontalBlur([I[IIII[I)V

    mul-int v0, v4, v3

    .line 86
    invoke-static {v2, v8, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_2
    move v0, v5

    const/4 v5, 0x0

    :goto_4
    if-ge v5, v3, :cond_4

    move v4, v7

    move-object v7, v6

    move v6, v0

    move-object v0, p0

    .line 91
    invoke-direct/range {v0 .. v7}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->internalVerticalBlur([I[IIIII[I)V

    move v0, v6

    move-object v6, v7

    move v7, v4

    move v4, v5

    const/4 v9, 0x0

    :goto_5
    if-ge v9, v7, :cond_3

    .line 94
    aget v10, v2, v9

    aput v10, v1, v4

    add-int/2addr v4, v3

    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_4
    add-int/lit8 p3, p3, 0x1

    move v5, v0

    goto :goto_2

    :cond_5
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move v6, v3

    move-object v0, p1

    .line 99
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-void
.end method

.method private final internalHorizontalBlur([I[IIII[I)V
    .locals 11

    mul-int v0, p3, p4

    add-int/lit8 v1, p4, 0x1

    mul-int v1, v1, p3

    add-int/lit8 v1, v1, -0x1

    shr-int/lit8 v2, p5, 0x1

    neg-int v3, v2

    add-int/2addr p3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v3, p3, :cond_1

    add-int v8, v0, v3

    .line 129
    invoke-direct {p0, v8, v0, v1}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->bound(III)I

    move-result v8

    .line 130
    aget v8, p1, v8

    shr-int/lit8 v9, v8, 0x10

    and-int/lit16 v9, v9, 0xff

    add-int/2addr v4, v9

    shr-int/lit8 v9, v8, 0x8

    and-int/lit16 v9, v9, 0xff

    add-int/2addr v5, v9

    and-int/lit16 v9, v8, 0xff

    add-int/2addr v6, v9

    ushr-int/lit8 v8, v8, 0x18

    add-int/2addr v7, v8

    if-lt v3, v2, :cond_0

    sub-int v8, v3, v2

    .line 137
    aget v9, p6, v7

    shl-int/lit8 v9, v9, 0x18

    aget v10, p6, v4

    shl-int/lit8 v10, v10, 0x10

    or-int/2addr v9, v10

    aget v10, p6, v5

    shl-int/lit8 v10, v10, 0x8

    or-int/2addr v9, v10

    aget v10, p6, v6

    or-int/2addr v9, v10

    aput v9, p2, v8

    add-int/lit8 v8, p5, -0x1

    sub-int v8, v3, v8

    add-int/2addr v8, v0

    .line 139
    invoke-direct {p0, v8, v0, v1}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->bound(III)I

    move-result v8

    .line 140
    aget v8, p1, v8

    shr-int/lit8 v9, v8, 0x10

    and-int/lit16 v9, v9, 0xff

    sub-int/2addr v4, v9

    shr-int/lit8 v9, v8, 0x8

    and-int/lit16 v9, v9, 0xff

    sub-int/2addr v5, v9

    and-int/lit16 v9, v8, 0xff

    sub-int/2addr v6, v9

    ushr-int/lit8 v8, v8, 0x18

    sub-int/2addr v7, v8

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final internalVerticalBlur([I[IIIII[I)V
    .locals 12

    move/from16 v0, p5

    add-int/lit8 v1, p4, -0x1

    mul-int v1, v1, p3

    add-int/2addr v1, v0

    shr-int/lit8 v2, p6, 0x1

    mul-int v2, v2, p3

    add-int/lit8 v3, p6, -0x1

    mul-int v3, v3, p3

    sub-int v4, v0, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_0
    add-int v10, v1, v2

    if-gt v4, v10, :cond_1

    .line 179
    invoke-direct {p0, v4, v0, v1}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->bound(III)I

    move-result v10

    .line 180
    aget v10, p1, v10

    shr-int/lit8 v11, v10, 0x10

    and-int/lit16 v11, v11, 0xff

    add-int/2addr v5, v11

    shr-int/lit8 v11, v10, 0x8

    and-int/lit16 v11, v11, 0xff

    add-int/2addr v6, v11

    and-int/lit16 v11, v10, 0xff

    add-int/2addr v7, v11

    ushr-int/lit8 v10, v10, 0x18

    add-int/2addr v8, v10

    sub-int v10, v4, v2

    if-lt v10, v0, :cond_0

    .line 187
    aget v10, p7, v8

    shl-int/lit8 v10, v10, 0x18

    aget v11, p7, v5

    shl-int/lit8 v11, v11, 0x10

    or-int/2addr v10, v11

    aget v11, p7, v6

    shl-int/lit8 v11, v11, 0x8

    or-int/2addr v10, v11

    aget v11, p7, v7

    or-int/2addr v10, v11

    aput v10, p2, v9

    add-int/lit8 v9, v9, 0x1

    sub-int v10, v4, v3

    .line 190
    invoke-direct {p0, v10, v0, v1}, Lcom/facebook/imagepipeline/filter/IterativeBoxBlurFilter;->bound(III)I

    move-result v10

    .line 191
    aget v10, p1, v10

    shr-int/lit8 v11, v10, 0x10

    and-int/lit16 v11, v11, 0xff

    sub-int/2addr v5, v11

    shr-int/lit8 v11, v10, 0x8

    and-int/lit16 v11, v11, 0xff

    sub-int/2addr v6, v11

    and-int/lit16 v11, v10, 0xff

    sub-int/2addr v7, v11

    ushr-int/lit8 v10, v10, 0x18

    sub-int/2addr v8, v10

    :cond_0
    add-int/2addr v4, p3

    goto :goto_0

    :cond_1
    return-void
.end method
