.class public Lorg/mydroid/core/codec/Settings;
.super Ljava/lang/Object;
.source "Settings.java"


# static fields
.field public static bolderTextOnImage:Z = false

.field public static brigtnessImage:I = 0x0

.field public static colorDayBg:I = -0x1

.field public static colorDayText:I = -0x1000000

.field public static colorNigthBg:I = -0x1000000

.field public static colorNigthText:I = -0x1

.field public static contrastImage:I = 0x64

.field public static isDayNotInvert:Z = false

.field public static isUseBGImageDay:Z = false

.field public static isUseBGImageNight:Z = false

.field public static selectingByLetters:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBgColor()I
    .locals 2

    .line 26
    sget-boolean v0, Lorg/mydroid/core/codec/Settings;->isDayNotInvert:Z

    if-eqz v0, :cond_0

    sget-boolean v1, Lorg/mydroid/core/codec/Settings;->isUseBGImageDay:Z

    if-eqz v1, :cond_0

    .line 27
    const-string v0, "#EFEBDE"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_0
    if-nez v0, :cond_1

    .line 29
    sget-boolean v1, Lorg/mydroid/core/codec/Settings;->isUseBGImageNight:Z

    if-eqz v1, :cond_1

    .line 30
    const-string v0, "#52493A"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_1
    if-eqz v0, :cond_2

    .line 33
    sget v0, Lorg/mydroid/core/codec/Settings;->colorDayBg:I

    return v0

    :cond_2
    sget v0, Lorg/mydroid/core/codec/Settings;->colorNigthBg:I

    return v0
.end method

.method public static getHighlightColor()I
    .locals 1

    .line 38
    sget-boolean v0, Lorg/mydroid/core/codec/Settings;->isDayNotInvert:Z

    if-eqz v0, :cond_0

    const v0, -0xffff01

    return v0

    :cond_0
    const/16 v0, -0x100

    return v0
.end method

.method private static getLangCode()Ljava/lang/String;
    .locals 1

    .line 47
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 49
    :catch_0
    const-string v0, ""

    return-object v0
.end method

.method public static getTextColor()I
    .locals 1

    .line 22
    sget-boolean v0, Lorg/mydroid/core/codec/Settings;->isDayNotInvert:Z

    if-eqz v0, :cond_0

    sget v0, Lorg/mydroid/core/codec/Settings;->colorDayText:I

    return v0

    :cond_0
    sget v0, Lorg/mydroid/core/codec/Settings;->colorNigthText:I

    return v0
.end method
