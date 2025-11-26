.class public Lcom/flyersoft/tools/C;
.super Ljava/lang/Object;
.source "C.java"


# static fields
.field public static final DEFAULT_CUSTOM_DYNAMIC_COLOR:I = -0xb9a26e

.field public static FORCE:Ljava/lang/String; = "force"

.field public static IGNORE:Ljava/lang/String; = "ignore"

.field public static NIGHT_BROWSE_COLOR:I = -0x9d9d9e

.field public static NIGHT_MAIN_COLOR:I = -0xafafb0

.field public static NIGHT_SECOND_COLOR:I = -0xafafb0

.field public static amoledBlack:I = -0x1000000

.field public static amoledBlack2:I = -0xebebec

.field public static amoledBlack3:I = -0xe8e8e9

.field public static amoledBlack4:I = -0xd8d8d9

.field public static amoledButton:I = -0xdcdcdd

.field public static colorOnPrimary:I

.field public static colorOnPrimary2:I

.field public static colorOnPrimaryContainer:I

.field public static colorOnPrimaryContainer2:I

.field public static colorOnSecondary:I

.field public static colorOnSecondary2:I

.field public static colorOnSecondaryContainer:I

.field public static colorOnSecondaryContainer2:I

.field public static colorOutline:I

.field public static colorOutline2:I

.field public static colorOutlineVariant:I

.field public static colorOutlineVariant2:I

.field public static colorPrimary:I

.field public static colorPrimary2:I

.field public static colorPrimaryContainer:I

.field public static colorPrimaryContainer2:I

.field public static colorPrimaryInverse:I

.field public static colorPrimaryInverse2:I

.field public static colorSecondary:I

.field public static colorSecondary2:I

.field public static colorSecondaryContainer:I

.field public static colorSecondaryContainer2:I

.field public static colorTertiary:I

.field public static colorTertiary2:I

.field public static textColorPrimary:I

.field public static textColorPrimary2:I

.field public static textColorSecondary:I

.field public static textColorSecondary2:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buttonColorState()Landroid/content/res/ColorStateList;
    .locals 3

    .line 375
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    const v1, -0xa2a2a3

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 376
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->colorPrimary2:I

    sget v2, Lcom/flyersoft/tools/C;->colorPrimaryInverse2:I

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/C;->colorState(III)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    .line 377
    :cond_0
    sget v0, Lcom/flyersoft/tools/C;->colorPrimary:I

    const v1, -0x777778

    sget v2, Lcom/flyersoft/tools/C;->colorPrimaryInverse:I

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/C;->colorState(III)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    .line 378
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_2

    const v0, -0xededee

    const v1, 0x474747

    const v2, -0xdcdcdd

    invoke-static {v2, v0, v1}, Lcom/flyersoft/tools/C;->colorState(III)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    :cond_2
    const v0, -0x979798

    const v2, 0x878787

    .line 379
    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/C;->colorState(III)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public static checkBoxColorState()Landroid/content/res/ColorStateList;
    .locals 7

    const/4 v0, 0x3

    .line 393
    new-array v1, v0, [[I

    const v2, -0x101009e

    filled-new-array {v2}, [I

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, -0x10100a0

    const v4, 0x101009e

    filled-new-array {v4, v2}, [I

    move-result-object v2

    const/4 v5, 0x1

    aput-object v2, v1, v5

    const v2, 0x10100a0

    filled-new-array {v4, v2}, [I

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v1, v4

    .line 396
    sget-boolean v2, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v2, :cond_0

    sget v2, Lcom/flyersoft/material/components/icons/R$color;->base_color:I

    invoke-static {v2}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v2

    goto :goto_1

    .line 399
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_1

    sget v2, Lcom/flyersoft/tools/C;->colorPrimary2:I

    goto :goto_0

    :cond_1
    sget v2, Lcom/flyersoft/tools/C;->colorPrimary:I

    :goto_0
    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v2

    .line 400
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 401
    new-array v0, v0, [I

    const v6, -0x99999a

    aput v6, v0, v3

    const v3, -0x777778

    aput v3, v0, v5

    aput v2, v0, v4

    goto :goto_2

    .line 402
    :cond_2
    new-array v0, v0, [I

    const v6, -0x555556

    aput v6, v0, v3

    const v3, -0x606061

    aput v3, v0, v5

    aput v2, v0, v4

    .line 403
    :goto_2
    new-instance v2, Landroid/content/res/ColorStateList;

    invoke-direct {v2, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v2
.end method

.method public static colorState(III)Landroid/content/res/ColorStateList;
    .locals 3

    const/4 v0, 0x3

    .line 383
    new-array v0, v0, [[I

    const v1, 0x101009e

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const v1, -0x101009e

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const v1, 0x10100a7

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 388
    filled-new-array {p0, p1, p2}, [I

    move-result-object p0

    .line 389
    new-instance p1, Landroid/content/res/ColorStateList;

    invoke-direct {p1, v0, p0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p1
.end method

.method public static createCoverFlowDrawable()Landroid/graphics/drawable/GradientDrawable;
    .locals 5

    .line 413
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 415
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, -0xfcfbf8

    aput v4, v2, v3

    const/4 v3, 0x1

    const v4, -0xbfbfb8

    aput v4, v2, v3

    goto :goto_4

    .line 416
    :cond_0
    sget-boolean v2, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v2, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_1

    const v2, -0xecebe8

    goto :goto_0

    :cond_1
    const v2, -0xbcbbb8

    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v3

    if-eqz v3, :cond_2

    const v3, -0x8f8f88

    goto :goto_1

    :cond_2
    const v3, -0x5f5f58

    :goto_1
    filled-new-array {v2, v3}, [I

    move-result-object v2

    goto :goto_4

    .line 417
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_4

    sget v2, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    const/16 v3, -0x2d

    goto :goto_2

    :cond_4
    sget v2, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/16 v3, -0x8c

    :goto_2
    invoke-static {v2, v3}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v2

    .line 418
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v3

    if-eqz v3, :cond_5

    sget v3, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    const/4 v4, 0x5

    goto :goto_3

    :cond_5
    sget v3, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/16 v4, -0x46

    :goto_3
    invoke-static {v3, v4}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v3

    filled-new-array {v2, v3}, [I

    move-result-object v2

    :goto_4
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    return-object v0
.end method

.method public static createShapDrawable(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 422
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 423
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float p0, p1

    .line 424
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public static dialogColor()I
    .locals 2

    .line 58
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 59
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 60
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    :cond_3
    const/16 v0, -0x402

    return v0
.end method

.method public static footerMainColor()I
    .locals 1

    .line 80
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v0

    return v0
.end method

.method public static footerSubColor()I
    .locals 1

    .line 84
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 86
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    .line 87
    invoke-static {}, Lcom/flyersoft/tools/C;->headerSubColor()I

    move-result v0

    return v0

    .line 88
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/C;->NIGHT_BROWSE_COLOR:I

    return v0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static footerSubLightColor()I
    .locals 2

    .line 92
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 94
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    .line 95
    invoke-static {}, Lcom/flyersoft/tools/C;->headerMainColor()I

    move-result v0

    const/4 v1, -0x6

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    .line 96
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/C;->NIGHT_BROWSE_COLOR:I

    return v0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static furtherColor(II)I
    .locals 3

    if-nez p1, :cond_0

    return p0

    .line 622
    :cond_0
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    .line 623
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 624
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    add-int/2addr v0, p1

    add-int/2addr v1, p1

    add-int/2addr v2, p1

    const/16 p1, 0xff

    if-le v0, p1, :cond_1

    const/16 v0, 0xff

    :cond_1
    if-le v1, p1, :cond_2

    const/16 v1, 0xff

    :cond_2
    if-le v2, p1, :cond_3

    const/16 v2, 0xff

    :cond_3
    const/4 p1, 0x0

    if-gez v0, :cond_4

    const/4 v0, 0x0

    :cond_4
    if-gez v1, :cond_5

    const/4 v1, 0x0

    :cond_5
    if-gez v2, :cond_6

    const/4 v2, 0x0

    .line 634
    :cond_6
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result p0

    invoke-static {p0, v0, v1, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method public static getBookCardColor()I
    .locals 1

    .line 245
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    return v0

    .line 247
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    .line 248
    invoke-static {}, Lcom/flyersoft/tools/C;->getDashRoundLayColor()I

    move-result v0

    return v0

    .line 249
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    goto :goto_0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_50:I

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getBookTitleColor()I
    .locals 1

    .line 253
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    .line 254
    invoke-static {}, Lcom/flyersoft/tools/C;->mainTextColor()I

    move-result v0

    return v0

    .line 255
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_900:I

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getBookmarksFrameColor()I
    .locals 1

    .line 233
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    .line 234
    invoke-static {}, Lcom/flyersoft/tools/C;->getDashFrameColor()I

    move-result v0

    return v0

    .line 235
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_1000:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_750:I

    goto :goto_0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_100:I

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getBottomBarColor()I
    .locals 2

    .line 211
    invoke-static {}, Lcom/flyersoft/tools/C;->getDashFrameColor()I

    move-result v0

    const/4 v1, -0x3

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0
.end method

.method public static getColor(I)I
    .locals 1

    .line 409
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    return p0
.end method

.method public static getDashFrameColor()I
    .locals 2

    .line 227
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    .line 229
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v0

    return v0
.end method

.method public static getDashRoundLayColor()I
    .locals 2

    .line 437
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 438
    invoke-static {}, Lcom/flyersoft/tools/C;->getDashFrameColor()I

    move-result v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    .line 439
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/C;->getRoundLayColor()I

    move-result v0

    return v0
.end method

.method public static getDividerColor(I)I
    .locals 1

    .line 116
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x28

    goto :goto_0

    :cond_0
    const/16 v0, 0xa

    goto :goto_0

    :cond_1
    const/16 v0, -0x28

    :goto_0
    invoke-static {p0, v0}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result p0

    return p0
.end method

.method public static getDynamicColorTitle()Ljava/lang/String;
    .locals 1

    .line 528
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->use_dynamic_color:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDynamicColorsFromColor(I)V
    .locals 2

    if-nez p0, :cond_0

    const p0, -0xb9a26e

    .line 565
    :cond_0
    invoke-static {p0}, Lcom/google/android/material/color/utilities/Scheme;->lightContent(I)Lcom/google/android/material/color/utilities/Scheme;

    move-result-object v0

    .line 567
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getPrimary()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    .line 568
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getOnPrimary()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnPrimary:I

    .line 569
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getPrimaryContainer()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorPrimaryContainer:I

    .line 570
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getOnPrimaryContainer()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnPrimaryContainer:I

    .line 571
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getSecondary()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorSecondary:I

    .line 572
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getOnSecondary()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnSecondary:I

    .line 573
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getSecondaryContainer()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    .line 574
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getOnSecondaryContainer()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnSecondaryContainer:I

    .line 575
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getTertiary()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorTertiary:I

    .line 576
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getOutline()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOutline:I

    .line 577
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getOutlineVariant()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOutlineVariant:I

    .line 578
    invoke-virtual {v0}, Lcom/google/android/material/color/utilities/Scheme;->getSurfaceVariant()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorPrimaryInverse:I

    .line 580
    invoke-static {p0}, Lcom/google/android/material/color/utilities/Scheme;->darkContent(I)Lcom/google/android/material/color/utilities/Scheme;

    move-result-object p0

    .line 582
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getPrimary()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorPrimary2:I

    .line 583
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getOnPrimary()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorOnPrimary2:I

    .line 584
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getPrimaryContainer()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorPrimaryContainer2:I

    .line 585
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getOnPrimaryContainer()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorOnPrimaryContainer2:I

    .line 586
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getSecondary()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorSecondary2:I

    .line 587
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getOnSecondary()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorOnSecondary2:I

    .line 588
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getSecondaryContainer()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    .line 589
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getOnSecondaryContainer()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorOnSecondaryContainer2:I

    .line 590
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getTertiary()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorTertiary2:I

    .line 591
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getOutline()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorOutline2:I

    .line 592
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getOutlineVariant()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/C;->colorOutlineVariant2:I

    .line 593
    invoke-virtual {p0}, Lcom/google/android/material/color/utilities/Scheme;->getSurfaceVariant()I

    move-result p0

    sput p0, Lcom/flyersoft/tools/C;->colorPrimaryInverse2:I

    .line 595
    sget p0, Lcom/flyersoft/material/components/icons/R$color;->dialog_main_text:I

    invoke-static {p0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result p0

    sput p0, Lcom/flyersoft/tools/C;->textColorPrimary:I

    .line 596
    sget p0, Lcom/flyersoft/material/components/icons/R$color;->dialog_second_text:I

    invoke-static {p0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result p0

    sput p0, Lcom/flyersoft/tools/C;->textColorSecondary:I

    .line 597
    sget p0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_50:I

    invoke-static {p0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result p0

    sput p0, Lcom/flyersoft/tools/C;->textColorPrimary2:I

    .line 598
    sget p0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-static {p0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result p0

    sput p0, Lcom/flyersoft/tools/C;->textColorSecondary2:I

    .line 599
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "getDynamicColorsFromColor: #"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v0, Lcom/flyersoft/tools/C;->colorPrimary:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public static getFileTitleColor()I
    .locals 1

    .line 259
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    .line 260
    invoke-static {}, Lcom/flyersoft/tools/C;->mainTextColor()I

    move-result v0

    return v0

    .line 261
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getLeftDrawerColor()I
    .locals 2

    .line 221
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    return v0

    .line 222
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 223
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_50:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getOtherFrameColor()I
    .locals 1

    .line 239
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    .line 240
    invoke-static {}, Lcom/flyersoft/tools/C;->getDashFrameColor()I

    move-result v0

    return v0

    .line 241
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    return v0

    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_750:I

    goto :goto_0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_50:I

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getRoundLayColor()I
    .locals 2

    .line 429
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 430
    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 431
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v0, :cond_2

    .line 432
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, -0xb8b8b9

    return v0

    :cond_1
    const v0, -0x9090a

    return v0

    .line 433
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x6

    goto :goto_0

    :cond_3
    const/16 v1, 0x8

    :goto_0
    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0
.end method

.method public static getSelectedBarColor()I
    .locals 1

    .line 215
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 216
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorOutlineVariant2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_780:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 217
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorOutline:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_600:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getTertiaryColor()I
    .locals 1

    .line 315
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->colorTertiary2:I

    return v0

    :cond_0
    sget v0, Lcom/flyersoft/tools/C;->colorTertiary:I

    return v0
.end method

.method public static getTopBarColor()I
    .locals 1

    .line 202
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    return v0

    .line 203
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorOnSecondary2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 204
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorPrimary:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->base_color:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getTxtBottomBarColor()I
    .locals 2

    .line 273
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 274
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorOnSecondary2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 275
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getTxtBottomSubColor()I
    .locals 2

    .line 279
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    .line 280
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 281
    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    const/16 v1, 0x1e

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    .line 282
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/C;->getBottomBarColor()I

    move-result v0

    return v0

    .line 284
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/flyersoft/tools/C;->getTxtBottomBarColor()I

    move-result v0

    return v0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_600:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getTxtTopBarColor()I
    .locals 1

    .line 267
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 268
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorOnSecondary2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_800:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 269
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorPrimary:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->base_color:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static gridViewColor()I
    .locals 1

    .line 112
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    return v0

    :cond_0
    const v0, -0x777778

    return v0
.end method

.method public static headerMainColor()I
    .locals 1

    .line 70
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v0

    return v0
.end method

.method public static headerSubColor()I
    .locals 2

    .line 74
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack2:I

    return v0

    .line 75
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_700:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 76
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorSecondary:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->small_options_header:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static initDynamicColors(Landroid/content/Context;)V
    .locals 18

    move-object/from16 v0, p0

    .line 456
    invoke-static {}, Lcom/google/android/material/color/DynamicColors;->isDynamicColorAvailable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 457
    invoke-static {}, Lcom/flyersoft/tools/C;->useCustomDynamicColors()V

    return-void

    .line 461
    :cond_0
    :try_start_0
    sget v1, Lcom/google/android/material/R$style;->ThemeOverlay_Material3_DynamicColors_Light:I

    invoke-static {v0, v1}, Lcom/google/android/material/color/DynamicColors;->wrapContextIfAvailable(Landroid/content/Context;I)Landroid/content/Context;

    move-result-object v1

    .line 462
    sget v2, Lcom/google/android/material/R$attr;->colorPrimary:I

    sget v3, Lcom/google/android/material/R$attr;->colorOnPrimary:I

    sget v4, Lcom/google/android/material/R$attr;->colorPrimaryInverse:I

    sget v5, Lcom/google/android/material/R$attr;->colorPrimaryContainer:I

    sget v6, Lcom/google/android/material/R$attr;->colorOnPrimaryContainer:I

    sget v7, Lcom/google/android/material/R$attr;->colorSecondary:I

    sget v8, Lcom/google/android/material/R$attr;->colorOnSecondary:I

    sget v9, Lcom/google/android/material/R$attr;->colorSecondaryContainer:I

    sget v10, Lcom/google/android/material/R$attr;->colorOnSecondaryContainer:I

    sget v11, Lcom/google/android/material/R$attr;->colorTertiary:I

    sget v12, Lcom/google/android/material/R$attr;->colorOutline:I

    sget v13, Lcom/google/android/material/R$attr;->colorOutlineVariant:I

    const v15, 0x1010038

    const v14, 0x1010036

    filled-new-array/range {v2 .. v15}, [I

    move-result-object v2

    .line 478
    invoke-virtual {v1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v3, 0x0

    .line 479
    invoke-virtual {v1, v3, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    sput v4, Lcom/flyersoft/tools/C;->colorPrimary:I

    const/4 v4, 0x1

    .line 480
    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    sput v5, Lcom/flyersoft/tools/C;->colorOnPrimary:I

    const/4 v5, 0x2

    .line 481
    invoke-virtual {v1, v5, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    sput v6, Lcom/flyersoft/tools/C;->colorPrimaryInverse:I

    const/4 v6, 0x3

    .line 482
    invoke-virtual {v1, v6, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    sput v7, Lcom/flyersoft/tools/C;->colorPrimaryContainer:I

    const/4 v7, 0x4

    .line 483
    invoke-virtual {v1, v7, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v8

    sput v8, Lcom/flyersoft/tools/C;->colorOnPrimaryContainer:I

    const/4 v8, 0x5

    .line 484
    invoke-virtual {v1, v8, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v9

    sput v9, Lcom/flyersoft/tools/C;->colorSecondary:I

    const/4 v9, 0x6

    .line 485
    invoke-virtual {v1, v9, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    sput v10, Lcom/flyersoft/tools/C;->colorOnSecondary:I

    const/4 v10, 0x7

    .line 486
    invoke-virtual {v1, v10, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v11

    sput v11, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/16 v11, 0x8

    .line 487
    invoke-virtual {v1, v11, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v12

    sput v12, Lcom/flyersoft/tools/C;->colorOnSecondaryContainer:I

    const/16 v12, 0x9

    .line 488
    invoke-virtual {v1, v12, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v13

    sput v13, Lcom/flyersoft/tools/C;->colorTertiary:I

    const/16 v13, 0xa

    .line 489
    invoke-virtual {v1, v13, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v14

    sput v14, Lcom/flyersoft/tools/C;->colorOutline:I

    const/16 v14, 0xb

    .line 490
    invoke-virtual {v1, v14, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v15

    sput v15, Lcom/flyersoft/tools/C;->colorOutlineVariant:I

    const/16 v15, 0xc

    .line 491
    invoke-virtual {v1, v15, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v16

    sput v16, Lcom/flyersoft/tools/C;->textColorPrimary:I

    const/16 v15, 0xd

    .line 492
    invoke-virtual {v1, v15, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v17

    sput v17, Lcom/flyersoft/tools/C;->textColorSecondary:I

    .line 493
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 495
    sget v1, Lcom/google/android/material/R$style;->ThemeOverlay_Material3_DynamicColors_Dark:I

    invoke-static {v0, v1}, Lcom/google/android/material/color/DynamicColors;->wrapContextIfAvailable(Landroid/content/Context;I)Landroid/content/Context;

    move-result-object v0

    .line 496
    invoke-virtual {v0, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 497
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorPrimary2:I

    .line 498
    invoke-virtual {v0, v4, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnPrimary2:I

    .line 499
    invoke-virtual {v0, v5, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorPrimaryInverse2:I

    .line 500
    invoke-virtual {v0, v6, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorPrimaryContainer2:I

    .line 501
    invoke-virtual {v0, v7, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnPrimaryContainer2:I

    .line 502
    invoke-virtual {v0, v8, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorSecondary2:I

    .line 503
    invoke-virtual {v0, v9, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnSecondary2:I

    .line 504
    invoke-virtual {v0, v10, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    .line 505
    invoke-virtual {v0, v11, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOnSecondaryContainer2:I

    .line 506
    invoke-virtual {v0, v12, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorTertiary2:I

    .line 507
    invoke-virtual {v0, v13, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOutline2:I

    .line 508
    invoke-virtual {v0, v14, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->colorOutlineVariant2:I

    const/16 v1, 0xc

    .line 509
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->textColorPrimary2:I

    .line 510
    invoke-virtual {v0, v15, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    sput v1, Lcom/flyersoft/tools/C;->textColorSecondary2:I

    .line 511
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 513
    sput-boolean v4, Lcom/flyersoft/tools/A;->sysHasDynamicColors:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 515
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 516
    invoke-static {}, Lcom/flyersoft/tools/C;->useCustomDynamicColors()V

    return-void
.end method

.method public static mainBackColor()I
    .locals 1

    .line 46
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    return v0

    .line 47
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/tools/C;->NIGHT_MAIN_COLOR:I

    return v0

    .line 48
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static mainTextColor()I
    .locals 1

    .line 120
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->textColorPrimary2:I

    return v0

    .line 121
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_50:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 122
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->textColorPrimary:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_900:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static menuDynamicColor()I
    .locals 2

    .line 64
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack4:I

    return v0

    .line 65
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    const/16 v1, -0x10

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    :cond_1
    const v0, -0xb5b5b6

    return v0

    .line 66
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    const/16 v1, 0x1c

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    return v0

    :cond_3
    const/16 v0, -0x402

    return v0
.end method

.method public static resetViewColorsFinal(Landroid/view/View;Landroid/view/View;)V
    .locals 4

    .line 605
    invoke-virtual {p1}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 606
    invoke-virtual {p1}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    .line 608
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 609
    :goto_0
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 610
    check-cast p0, Landroid/widget/ImageView;

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 611
    :cond_1
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 612
    check-cast p0, Landroid/widget/TextView;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void

    .line 613
    :cond_2
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    .line 614
    :goto_1
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 615
    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 616
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/tools/C;->resetViewColorsFinal(Landroid/view/View;Landroid/view/View;)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return-void
.end method

.method public static secondBackColor()I
    .locals 1

    .line 52
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack2:I

    return v0

    .line 53
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/tools/C;->NIGHT_SECOND_COLOR:I

    return v0

    .line 54
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorPrimaryContainer:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static secondTextColor()I
    .locals 1

    .line 126
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/C;->textColorSecondary2:I

    return v0

    .line 127
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_400:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    :cond_1
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0

    .line 128
    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->textColorSecondary:I

    return v0

    :cond_3
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_750:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static setButtonColorState(Landroid/view/View;)V
    .locals 3

    .line 290
    instance-of v0, p0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz v0, :cond_0

    .line 291
    check-cast p0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-static {}, Lcom/flyersoft/tools/C;->switchTrackColorState()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setTrackTintList(Landroid/content/res/ColorStateList;)V

    return-void

    .line 292
    :cond_0
    instance-of v0, p0, Landroid/widget/CompoundButton;

    if-eqz v0, :cond_1

    .line 293
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_6

    .line 294
    check-cast p0, Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/flyersoft/tools/C;->checkBoxColorState()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/CompoundButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    return-void

    .line 295
    :cond_1
    instance-of v0, p0, Landroid/widget/Button;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/flyersoft/tools/C;->IGNORE:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 296
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v0, :cond_2

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 297
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/C;->buttonColorState()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 298
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-nez v0, :cond_6

    .line 299
    check-cast p0, Landroid/widget/Button;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->colorOnPrimary2:I

    goto :goto_0

    :cond_3
    sget v0, Lcom/flyersoft/tools/C;->colorOnPrimary:I

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    return-void

    .line 301
    :cond_4
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_6

    .line 302
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_5

    const-string v0, "round"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 303
    invoke-static {}, Lcom/flyersoft/tools/C;->getRoundLayColor()I

    move-result v0

    const/high16 v1, 0x41e00000    # 28.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->createShapDrawable(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_5
    const/4 v0, 0x0

    .line 304
    :goto_1
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_6

    .line 305
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/C;->setButtonColorState(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6
    return-void
.end method

.method public static setIconColor(Landroid/widget/ImageView;I)V
    .locals 2

    if-eqz p0, :cond_0

    .line 329
    sget-object v0, Lcom/flyersoft/tools/C;->IGNORE:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 330
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_0
    return-void
.end method

.method public static setIconPrimary(Landroid/widget/ImageView;Z)V
    .locals 0

    if-eqz p1, :cond_1

    .line 334
    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_0

    sget p1, Lcom/flyersoft/tools/C;->textColorPrimary2:I

    goto :goto_0

    :cond_0
    sget p1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_0:I

    invoke-static {p1}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result p1

    goto :goto_0

    .line 335
    :cond_1
    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_2

    sget p1, Lcom/flyersoft/tools/C;->textColorPrimary:I

    goto :goto_0

    :cond_2
    sget p1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_900:I

    invoke-static {p1}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result p1

    .line 334
    :goto_0
    invoke-static {p0, p1}, Lcom/flyersoft/tools/C;->setIconColor(Landroid/widget/ImageView;I)V

    return-void
.end method

.method public static setIconTertiary(Landroid/widget/ImageView;)V
    .locals 2

    if-eqz p0, :cond_0

    .line 310
    sget-object v0, Lcom/flyersoft/tools/C;->IGNORE:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 311
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {}, Lcom/flyersoft/tools/C;->getTertiaryColor()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_0
    return-void
.end method

.method public static setLayIconColor(Landroid/view/View;I)V
    .locals 3

    .line 339
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 340
    check-cast p0, Landroid/widget/ImageView;

    invoke-static {p0, p1}, Lcom/flyersoft/tools/C;->setIconColor(Landroid/widget/ImageView;I)V

    return-void

    .line 341
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 342
    :goto_0
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 343
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/flyersoft/tools/C;->setLayIconColor(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static setLayIconTertiary(Landroid/view/View;)V
    .locals 3

    .line 319
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 321
    :cond_0
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 322
    check-cast p0, Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/flyersoft/tools/C;->setIconTertiary(Landroid/widget/ImageView;)V

    return-void

    .line 323
    :cond_1
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 324
    :goto_0
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 325
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public static setNavigationBarColor(Landroid/view/Window;Z)V
    .locals 3

    .line 183
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    const/high16 v2, -0x1000000

    if-ge v0, v1, :cond_0

    .line 184
    invoke-virtual {p0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void

    .line 188
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_1

    .line 189
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    goto :goto_0

    .line 190
    :cond_1
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    and-int/lit8 v0, v0, -0x11

    :goto_0
    const/high16 v1, -0x80000000

    .line 191
    invoke-virtual {p0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 192
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    if-eqz p1, :cond_2

    .line 195
    invoke-static {}, Lcom/flyersoft/tools/C;->getBottomBarColor()I

    move-result v2

    goto :goto_1

    .line 196
    :cond_2
    sget-boolean p1, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/C;->getTxtBottomBarColor()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v2

    .line 197
    :cond_3
    :goto_1
    invoke-virtual {p0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void
.end method

.method public static setStatusBarColor(Landroid/view/Window;ILcom/flyersoft/tools/T$OnResult;)V
    .locals 2

    .line 143
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_0

    .line 144
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/tools/C$1;

    invoke-direct {v1, p1, p0, p2}, Lcom/flyersoft/tools/C$1;-><init>(ILandroid/view/Window;Lcom/flyersoft/tools/T$OnResult;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void

    .line 175
    :cond_0
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    .line 176
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    or-int/lit16 v0, v0, 0x100

    .line 175
    invoke-virtual {p2, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    const/high16 p2, -0x80000000

    .line 177
    invoke-virtual {p0, p2}, Landroid/view/Window;->addFlags(I)V

    .line 178
    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    return-void
.end method

.method public static setTextViewColor(Landroid/widget/TextView;)V
    .locals 2

    .line 132
    sget-object v0, Lcom/flyersoft/tools/C;->IGNORE:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 134
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v0

    .line 135
    invoke-static {v0}, Lcom/flyersoft/tools/A;->colorValue(I)I

    move-result v0

    const/16 v1, 0x258

    if-gt v0, v1, :cond_2

    const/16 v1, 0x96

    if-ge v0, v1, :cond_1

    goto :goto_0

    .line 137
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result v0

    goto :goto_1

    :cond_2
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/C;->mainTextColor()I

    move-result v0

    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public static setToggleButtonColorState(Landroid/view/View;)V
    .locals 4

    .line 347
    instance-of v0, p0, Lcom/google/android/material/button/MaterialButton;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 348
    move-object v0, p0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    .line 349
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_1

    sget-boolean v2, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v2, :cond_0

    const v2, -0x555556

    goto :goto_0

    :cond_0
    const v2, -0x333334

    goto :goto_0

    :cond_1
    const v2, -0xaaaaab

    .line 348
    :goto_0
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/button/MaterialButton;->setIconTint(Landroid/content/res/ColorStateList;)V

    .line 351
    new-instance v0, Landroid/content/res/ColorStateList;

    const/4 v2, 0x1

    new-array v2, v2, [[I

    const v3, 0x10100a0

    filled-new-array {v3}, [I

    move-result-object v3

    aput-object v3, v2, v1

    .line 353
    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v1, :cond_2

    const v1, 0x551e88e5

    goto :goto_2

    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_3

    sget v1, Lcom/flyersoft/tools/C;->colorPrimary2:I

    goto :goto_1

    :cond_3
    sget v1, Lcom/flyersoft/tools/C;->colorPrimary:I

    :goto_1
    const/16 v3, -0x8c

    invoke-static {v1, v3}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v1

    :goto_2
    filled-new-array {v1}, [I

    move-result-object v1

    invoke-direct {v0, v2, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 351
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void

    .line 355
    :cond_4
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5

    .line 356
    :goto_3
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 357
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/C;->setToggleButtonColorState(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    return-void
.end method

.method private static switchTrackColorState()Landroid/content/res/ColorStateList;
    .locals 11

    .line 361
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const v0, -0xe1771b

    goto :goto_1

    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->colorPrimary2:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/tools/C;->colorPrimary:I

    :goto_0
    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    .line 362
    :goto_1
    sget-boolean v2, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v2, :cond_2

    const v2, -0x77e1771b

    goto :goto_3

    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_3

    sget v2, Lcom/flyersoft/tools/C;->colorPrimary2:I

    goto :goto_2

    :cond_3
    sget v2, Lcom/flyersoft/tools/C;->colorPrimary:I

    :goto_2
    invoke-static {v2, v1}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v2

    .line 363
    :goto_3
    new-instance v3, Landroid/content/res/ColorStateList;

    const/4 v4, 0x4

    new-array v5, v4, [[I

    const v6, 0x10100a0

    const v7, 0x101009e

    filled-new-array {v6, v7}, [I

    move-result-object v8

    aput-object v8, v5, v1

    const v8, -0x101009e

    filled-new-array {v6, v8}, [I

    move-result-object v6

    const/4 v9, 0x1

    aput-object v6, v5, v9

    const v6, -0x10100a0

    filled-new-array {v6, v7}, [I

    move-result-object v7

    const/4 v10, 0x2

    aput-object v7, v5, v10

    filled-new-array {v6, v8}, [I

    move-result-object v6

    const/4 v7, 0x3

    aput-object v6, v5, v7

    .line 369
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v6

    if-eqz v6, :cond_4

    new-array v0, v4, [I

    aput v2, v0, v1

    const v1, 0x11888888

    aput v1, v0, v9

    aput v1, v0, v10

    aput v1, v0, v7

    goto :goto_4

    .line 370
    :cond_4
    new-array v2, v4, [I

    aput v0, v2, v1

    const v0, 0x44888888

    aput v0, v2, v9

    aput v0, v2, v10

    aput v0, v2, v7

    move-object v0, v2

    :goto_4
    invoke-direct {v3, v5, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method public static toolbarColor()I
    .locals 1

    .line 100
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    return v0

    .line 102
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    .line 103
    invoke-static {}, Lcom/flyersoft/tools/C;->headerSubColor()I

    move-result v0

    return v0

    .line 104
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/C;->NIGHT_MAIN_COLOR:I

    return v0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->small_options_footer:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static toolbarLightColor()I
    .locals 1

    .line 108
    invoke-static {}, Lcom/flyersoft/tools/C;->footerSubLightColor()I

    move-result v0

    return v0
.end method

.method public static useCustomDynamicColors()V
    .locals 1

    .line 521
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->customDynamicColor:I

    if-eqz v0, :cond_0

    .line 522
    sget v0, Lcom/flyersoft/tools/A;->customDynamicColor:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getDynamicColorsFromColor(I)V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 524
    sput-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    return-void
.end method
