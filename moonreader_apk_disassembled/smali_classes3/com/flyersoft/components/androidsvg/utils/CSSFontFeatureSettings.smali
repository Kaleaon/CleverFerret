.class public Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
.super Ljava/lang/Object;
.source "CSSFontFeatureSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;
    }
.end annotation


# static fields
.field static CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field private static CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field static EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field public static final ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field public static final FEATURE_AFRC:Ljava/lang/String; = "afrc"

.field private static final FEATURE_C2PC:Ljava/lang/String; = "c2pc"

.field private static final FEATURE_C2SC:Ljava/lang/String; = "c2sc"

.field public static final FEATURE_CALT:Ljava/lang/String; = "calt"

.field public static final FEATURE_CLIG:Ljava/lang/String; = "clig"

.field public static final FEATURE_DLIG:Ljava/lang/String; = "dlig"

.field public static final FEATURE_FRAC:Ljava/lang/String; = "frac"

.field public static final FEATURE_FWID:Ljava/lang/String; = "fwid"

.field public static final FEATURE_HLIG:Ljava/lang/String; = "hlig"

.field public static final FEATURE_JP04:Ljava/lang/String; = "jp04"

.field public static final FEATURE_JP78:Ljava/lang/String; = "jp78"

.field public static final FEATURE_JP83:Ljava/lang/String; = "jp83"

.field public static final FEATURE_JP90:Ljava/lang/String; = "jp90"

.field public static final FEATURE_KERN:Ljava/lang/String; = "kern"

.field public static final FEATURE_LIGA:Ljava/lang/String; = "liga"

.field public static final FEATURE_LNUM:Ljava/lang/String; = "lnum"

.field private static final FEATURE_OFF:Ljava/lang/String; = "off"

.field private static final FEATURE_ON:Ljava/lang/String; = "on"

.field public static final FEATURE_ONUM:Ljava/lang/String; = "onum"

.field public static final FEATURE_ORDN:Ljava/lang/String; = "ordn"

.field private static final FEATURE_PCAP:Ljava/lang/String; = "pcap"

.field public static final FEATURE_PNUM:Ljava/lang/String; = "pnum"

.field public static final FEATURE_PWID:Ljava/lang/String; = "pwid"

.field public static final FEATURE_RUBY:Ljava/lang/String; = "ruby"

.field private static final FEATURE_SMCP:Ljava/lang/String; = "smcp"

.field public static final FEATURE_SMPL:Ljava/lang/String; = "smpl"

.field private static final FEATURE_SUBS:Ljava/lang/String; = "subs"

.field private static final FEATURE_SUPS:Ljava/lang/String; = "sups"

.field private static final FEATURE_TITL:Ljava/lang/String; = "titl"

.field public static final FEATURE_TNUM:Ljava/lang/String; = "tnum"

.field public static final FEATURE_TRAD:Ljava/lang/String; = "trad"

.field private static final FEATURE_UNIC:Ljava/lang/String; = "unic"

.field public static final FEATURE_ZERO:Ljava/lang/String; = "zero"

.field public static final FONT_FEATURE_SETTINGS_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field private static final FONT_VARIANT_ALL_PETITE_CAPS:Ljava/lang/String; = "all-petite-caps"

.field private static final FONT_VARIANT_ALL_SMALL_CAPS:Ljava/lang/String; = "all-small-caps"

.field private static final FONT_VARIANT_AUTO:Ljava/lang/String; = "auto"

.field private static final FONT_VARIANT_COMMON_LIGATURES:Ljava/lang/String; = "common-ligatures"

.field private static final FONT_VARIANT_CONTEXTUAL_LIGATURES:Ljava/lang/String; = "contextual"

.field private static final FONT_VARIANT_DIAGONAL_FRACTIONS:Ljava/lang/String; = "diagonal-fractions"

.field private static final FONT_VARIANT_DISCRETIONARY_LIGATURES:Ljava/lang/String; = "discretionary-ligatures"

.field private static final FONT_VARIANT_FULL_WIDTH:Ljava/lang/String; = "full-width"

.field private static final FONT_VARIANT_HISTORICAL_LIGATURES:Ljava/lang/String; = "historical-ligatures"

.field private static final FONT_VARIANT_JIS04:Ljava/lang/String; = "jis04"

.field private static final FONT_VARIANT_JIS78:Ljava/lang/String; = "jis78"

.field private static final FONT_VARIANT_JIS83:Ljava/lang/String; = "jis83"

.field private static final FONT_VARIANT_JIS90:Ljava/lang/String; = "jis90"

.field private static final FONT_VARIANT_LINING_NUMS:Ljava/lang/String; = "lining-nums"

.field private static final FONT_VARIANT_NONE:Ljava/lang/String; = "none"

.field static final FONT_VARIANT_NORMAL:Ljava/lang/String; = "normal"

.field private static final FONT_VARIANT_NO_COMMON_LIGATURES:Ljava/lang/String; = "no-common-ligatures"

.field private static final FONT_VARIANT_NO_CONTEXTUAL_LIGATURES:Ljava/lang/String; = "no-contextual"

.field private static final FONT_VARIANT_NO_DISCRETIONARY_LIGATURES:Ljava/lang/String; = "no-discretionary-ligatures"

.field private static final FONT_VARIANT_NO_HISTORICAL_LIGATURES:Ljava/lang/String; = "no-historical-ligatures"

.field private static final FONT_VARIANT_OLDSTYLE_NUMS:Ljava/lang/String; = "oldstyle-nums"

.field private static final FONT_VARIANT_ORDINAL:Ljava/lang/String; = "ordinal"

.field private static final FONT_VARIANT_PETITE_CAPS:Ljava/lang/String; = "petite-caps"

.field private static final FONT_VARIANT_PROPORTIONAL_NUMS:Ljava/lang/String; = "proportional-nums"

.field private static final FONT_VARIANT_PROPORTIONAL_WIDTH:Ljava/lang/String; = "proportional-width"

.field private static final FONT_VARIANT_RUBY:Ljava/lang/String; = "ruby"

.field private static final FONT_VARIANT_SIMPLIFIED:Ljava/lang/String; = "simplified"

.field private static final FONT_VARIANT_SLASHED_ZERO:Ljava/lang/String; = "slashed-zero"

.field static final FONT_VARIANT_SMALL_CAPS:Ljava/lang/String; = "small-caps"

.field private static final FONT_VARIANT_STACKED_FRACTIONS:Ljava/lang/String; = "stacked-fractions"

.field private static final FONT_VARIANT_SUB:Ljava/lang/String; = "sub"

.field private static final FONT_VARIANT_SUPER:Ljava/lang/String; = "super"

.field private static final FONT_VARIANT_TABULAR_NUMS:Ljava/lang/String; = "tabular-nums"

.field private static final FONT_VARIANT_TITLING_CAPS:Ljava/lang/String; = "titling-caps"

.field private static final FONT_VARIANT_TRADITIONAL:Ljava/lang/String; = "traditional"

.field private static final FONT_VARIANT_UNICASE:Ljava/lang/String; = "unicase"

.field private static LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field static LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field static NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field static POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings; = null

.field private static final TOKEN_ERROR:Ljava/lang/String; = "ERR"

.field private static final VALUE_OFF:I = 0x0

.field private static final VALUE_ON:I = 0x1


# instance fields
.field private final settings:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 29
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->makeDefaultSettings()Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->FONT_FEATURE_SETTINGS_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 30
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Ljava/util/HashMap;)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 48
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 49
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 67
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 76
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 77
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 94
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 115
    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 153
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 154
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "liga"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "clig"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "dlig"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "hlig"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "calt"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 161
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "subs"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "sups"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 165
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "smcp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "c2sc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "pcap"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "c2pc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "unic"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "titl"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 173
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "lnum"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "onum"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "pnum"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "tnum"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "frac"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "afrc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "ordn"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "zero"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 183
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "jp78"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "jp83"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "jp90"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "jp04"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "smpl"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "trad"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "fwid"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "pwid"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "ruby"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V
    .locals 1

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    new-instance v0, Ljava/util/HashMap;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    return-void
.end method

.method private addSettings(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    .line 461
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static containsOnce(Ljava/util/List;Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 363
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 364
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static varargs containsOneOf(Ljava/util/List;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 377
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p1, v2

    if-nez v1, :cond_0

    .line 379
    invoke-interface {p0, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move-object v1, v3

    .line 382
    :cond_0
    invoke-interface {p0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 383
    const-string p0, "ERR"

    return-object p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method private static containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 346
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_2

    .line 347
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    return v1

    .line 348
    :cond_2
    invoke-interface {p0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 349
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    return v1

    :cond_3
    const/4 p0, 0x2

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method private static ensureLigaturesNone()V
    .locals 5

    .line 799
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz v0, :cond_0

    return-void

    .line 801
    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    .line 802
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "liga"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "clig"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 804
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "dlig"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 805
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "hlig"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 806
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "calt"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 807
    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-void
.end method

.method private ensurePositionNormal()V
    .locals 5

    .line 814
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-nez v0, :cond_0

    .line 815
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    .line 816
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "subs"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 817
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "sups"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 818
    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    :cond_0
    return-void
.end method

.method private static extractTokensAsList(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 323
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 324
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 325
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 327
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 328
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 330
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 331
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method private static final makeDefaultSettings()Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 4

    .line 782
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    .line 783
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "rlig"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 784
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "liga"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 785
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "clig"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 786
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "calt"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 787
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "locl"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 788
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "ccmp"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 789
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "mark"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 790
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v3, "mkmk"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method static makeSmallCaps()Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 4

    .line 826
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-nez v0, :cond_0

    .line 827
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 828
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "smcp"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 829
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "c2sc"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "pcap"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 831
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "c2pc"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "unic"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 833
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "titl"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    :cond_0
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_SMALL_CAPS:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object v0
.end method

.method private static nextFeatureEntry(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;
    .locals 3

    .line 282
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 283
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextQuotedString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 284
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_0

    goto :goto_2

    .line 286
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 288
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v1, 0x0

    .line 289
    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextInteger(Z)Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_2

    .line 291
    const-string v2, "off"

    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 294
    :cond_1
    const-string v1, "on"

    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(Ljava/lang/String;)Z

    goto :goto_0

    .line 298
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v1, 0x1

    .line 301
    :goto_1
    new-instance p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;-><init>(Ljava/lang/String;I)V

    return-object p0

    :cond_4
    :goto_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseEastAsian(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 3

    .line 622
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 623
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 625
    :cond_0
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->extractTokensAsList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_1

    return-object v0

    .line 629
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantEastAsianSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 632
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eq v1, v2, :cond_3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_2

    goto :goto_0

    :cond_2
    return-object v1

    :cond_3
    :goto_0
    return-object v0
.end method

.method static parseFontFeatureSettings(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 4

    .line 262
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    .line 264
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 265
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 268
    :goto_0
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result p0

    if-eqz p0, :cond_0

    return-object v0

    .line 270
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->nextFeatureEntry(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;

    move-result-object p0

    if-nez p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 273
    :cond_1
    iget-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;->name:Ljava/lang/String;

    iget p0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;->val:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v2, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    goto :goto_0
.end method

.method static parseFontKerning(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;
    .locals 2

    .line 311
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_1
    const-string v0, "auto"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    packed-switch v1, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 315
    :pswitch_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->none:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    return-object p0

    .line 313
    :pswitch_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    return-object p0

    .line 314
    :pswitch_2
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x3df94319 -> :sswitch_2
        0x2dddaf -> :sswitch_1
        0x33af38 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static parseFontVariant(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;)V
    .locals 8

    .line 683
    const-string v0, "normal"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide v1, 0x1f0000000000L

    if-eqz v0, :cond_0

    .line 685
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 686
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 687
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 688
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 689
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 690
    iget-wide v3, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    or-long/2addr v1, v3

    iput-wide v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 695
    :cond_0
    const-string v0, "none"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 697
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ensureLigaturesNone()V

    .line 698
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 699
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 700
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 701
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 702
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 703
    iget-wide v3, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    or-long/2addr v1, v3

    iput-wide v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 709
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->extractTokensAsList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_2

    goto/16 :goto_0

    .line 713
    :cond_2
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantLigaturesSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v0

    .line 714
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-ne v0, v1, :cond_3

    goto/16 :goto_0

    .line 718
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_4

    .line 719
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantPositionSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v2

    if-ne v2, v1, :cond_5

    goto/16 :goto_0

    :cond_4
    move-object v2, v3

    .line 725
    :cond_5
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_6

    .line 726
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantCapsSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v4

    if-ne v4, v1, :cond_7

    goto :goto_0

    :cond_6
    move-object v4, v3

    .line 732
    :cond_7
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_8

    .line 733
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantNumericSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v5

    if-ne v5, v1, :cond_9

    goto :goto_0

    :cond_8
    move-object v5, v3

    .line 739
    :cond_9
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_a

    .line 740
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantEastAsianSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v3

    if-ne v3, v1, :cond_a

    goto :goto_0

    :cond_a
    if-eqz v0, :cond_b

    .line 750
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 751
    iget-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v6, 0x10000000000L

    or-long/2addr v0, v6

    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    :cond_b
    if-eqz v2, :cond_c

    .line 755
    iput-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 756
    iget-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v6, 0x20000000000L

    or-long/2addr v0, v6

    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    :cond_c
    if-eqz v4, :cond_d

    .line 760
    iput-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 761
    iget-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v6, 0x40000000000L

    or-long/2addr v0, v6

    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    :cond_d
    if-eqz v5, :cond_e

    .line 765
    iput-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 766
    iget-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v4, 0x80000000000L

    or-long/2addr v0, v4

    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    :cond_e
    if-eqz v3, :cond_f

    .line 770
    iput-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 771
    iget-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v2, 0x100000000000L

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    :cond_f
    :goto_0
    return-void
.end method

.method static parseVariantCaps(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 2

    .line 503
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 504
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 506
    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 507
    invoke-static {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->setCapsFeature(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static parseVariantCapsSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;"
        }
    .end annotation

    .line 530
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 532
    const-string v6, "unicase"

    const-string v7, "titling-caps"

    const-string v2, "small-caps"

    const-string v3, "all-small-caps"

    const-string v4, "petite-caps"

    const-string v5, "all-petite-caps"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsOneOf(Ljava/util/List;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 534
    const-string v1, "ERR"

    if-ne p0, v1, :cond_0

    .line 535
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    :cond_0
    if-nez p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 539
    :cond_1
    invoke-static {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->setCapsFeature(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;Ljava/lang/String;)Z

    return-object v0
.end method

.method private static parseVariantEastAsianSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;"
        }
    .end annotation

    .line 641
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 644
    const-string v6, "simplified"

    const-string v7, "traditional"

    const-string v2, "jis78"

    const-string v3, "jis83"

    const-string v4, "jis90"

    const-string v5, "jis04"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsOneOf(Ljava/util/List;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    .line 663
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v1, :cond_7

    .line 648
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v7

    const/4 v8, -0x1

    sparse-switch v7, :sswitch_data_0

    :goto_0
    const/4 v6, -0x1

    goto :goto_1

    :sswitch_0
    const-string v6, "jis90"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v6, 0x6

    goto :goto_1

    :sswitch_1
    const-string v6, "jis83"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v6, 0x5

    goto :goto_1

    :sswitch_2
    const-string v6, "jis78"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v6, 0x4

    goto :goto_1

    :sswitch_3
    const-string v6, "jis04"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v6, 0x3

    goto :goto_1

    :sswitch_4
    const-string v6, "ERR"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v6, 0x2

    goto :goto_1

    :sswitch_5
    const-string v6, "simplified"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v6, 0x1

    goto :goto_1

    :sswitch_6
    const-string v7, "traditional"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_0

    :cond_6
    :goto_1
    packed-switch v6, :pswitch_data_0

    goto :goto_2

    .line 652
    :pswitch_0
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v6, "jp90"

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 651
    :pswitch_1
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v6, "jp83"

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 650
    :pswitch_2
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v6, "jp78"

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 653
    :pswitch_3
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v6, "jp04"

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 656
    :pswitch_4
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 654
    :pswitch_5
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v6, "smpl"

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 655
    :pswitch_6
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v6, "trad"

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    const/4 v6, 0x1

    .line 661
    :cond_7
    const-string v1, "full-width"

    const-string v7, "proportional-width"

    invoke-static {p0, v1, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eq v1, v4, :cond_a

    if-eq v1, v3, :cond_9

    if-eq v1, v2, :cond_8

    goto :goto_4

    .line 665
    :cond_8
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 664
    :cond_9
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "pwid"

    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 663
    :cond_a
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "fwid"

    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3
    const/4 v6, 0x1

    .line 668
    :goto_4
    const-string v1, "ruby"

    invoke-static {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsOnce(Ljava/util/List;Ljava/lang/String;)I

    move-result p0

    if-eq p0, v4, :cond_c

    if-eq p0, v3, :cond_b

    move v4, v6

    goto :goto_5

    .line 671
    :cond_b
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 670
    :cond_c
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {p0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_5
    if-eqz v4, :cond_d

    return-object v0

    :cond_d
    const/4 p0, 0x0

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7f6ad259 -> :sswitch_6
        -0x5513a4a8 -> :sswitch_5
        0x10d45 -> :sswitch_4
        0x6072c18 -> :sswitch_3
        0x6072cf5 -> :sswitch_2
        0x6072d0f -> :sswitch_1
        0x6072d2b -> :sswitch_0
    .end sparse-switch

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

.method static parseVariantLigatures(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 3

    .line 400
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 401
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 402
    :cond_0
    const-string v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 403
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ensureLigaturesNone()V

    .line 404
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 407
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->extractTokensAsList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_2

    return-object v0

    .line 411
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ensureLigaturesNone()V

    .line 412
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantLigaturesSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 415
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eq v1, v2, :cond_4

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_3

    goto :goto_0

    :cond_3
    return-object v1

    :cond_4
    :goto_0
    return-object v0
.end method

.method private static parseVariantLigaturesSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;"
        }
    .end annotation

    .line 424
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ensureLigaturesNone()V

    .line 425
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 428
    const-string v1, "common-ligatures"

    const-string v2, "no-common-ligatures"

    invoke-static {p0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const-string v2, "liga"

    const-string v3, "clig"

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eq v1, v6, :cond_2

    if-eq v1, v5, :cond_1

    if-eq v1, v4, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 432
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 431
    :cond_1
    invoke-direct {v0, v3, v2, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->addSettings(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 430
    :cond_2
    invoke-direct {v0, v3, v2, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->addSettings(Ljava/lang/String;Ljava/lang/String;I)V

    :goto_0
    const/4 v1, 0x1

    .line 435
    :goto_1
    const-string v2, "discretionary-ligatures"

    const-string v3, "no-discretionary-ligatures"

    invoke-static {p0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    const-string v3, "dlig"

    if-eq v2, v6, :cond_5

    if-eq v2, v5, :cond_4

    if-eq v2, v4, :cond_3

    goto :goto_3

    .line 439
    :cond_3
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 438
    :cond_4
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 437
    :cond_5
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    const/4 v1, 0x1

    .line 442
    :goto_3
    const-string v2, "historical-ligatures"

    const-string v3, "no-historical-ligatures"

    invoke-static {p0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    const-string v3, "hlig"

    if-eq v2, v6, :cond_8

    if-eq v2, v5, :cond_7

    if-eq v2, v4, :cond_6

    goto :goto_5

    .line 446
    :cond_6
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 445
    :cond_7
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 444
    :cond_8
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_4
    const/4 v1, 0x1

    .line 449
    :goto_5
    const-string v2, "contextual"

    const-string v3, "no-contextual"

    invoke-static {p0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    const-string v2, "calt"

    if-eq p0, v6, :cond_b

    if-eq p0, v5, :cond_a

    if-eq p0, v4, :cond_9

    move v6, v1

    goto :goto_6

    .line 453
    :cond_9
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 452
    :cond_a
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 451
    :cond_b
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_6
    if-eqz v6, :cond_c

    return-object v0

    :cond_c
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseVariantNumeric(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 3

    .line 554
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 555
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 557
    :cond_0
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->extractTokensAsList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_1

    return-object v0

    .line 561
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantNumericSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 564
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eq v1, v2, :cond_3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_2

    goto :goto_0

    :cond_2
    return-object v1

    :cond_3
    :goto_0
    return-object v0
.end method

.method private static parseVariantNumericSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;"
        }
    .end annotation

    .line 573
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 576
    const-string v1, "lining-nums"

    const-string v2, "oldstyle-nums"

    invoke-static {p0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v1, v4, :cond_2

    if-eq v1, v3, :cond_1

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 580
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 579
    :cond_1
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v5, "onum"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 578
    :cond_2
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v5, "lnum"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    const/4 v1, 0x1

    .line 583
    :goto_1
    const-string v5, "proportional-nums"

    const-string v6, "tabular-nums"

    invoke-static {p0, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    if-eq v5, v4, :cond_5

    if-eq v5, v3, :cond_4

    if-eq v5, v2, :cond_3

    goto :goto_3

    .line 587
    :cond_3
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 586
    :cond_4
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v5, "tnum"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 585
    :cond_5
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v5, "pnum"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    const/4 v1, 0x1

    .line 590
    :goto_3
    const-string v5, "diagonal-fractions"

    const-string v6, "stacked-fractions"

    invoke-static {p0, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    if-eq v5, v4, :cond_8

    if-eq v5, v3, :cond_7

    if-eq v5, v2, :cond_6

    goto :goto_5

    .line 594
    :cond_6
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 593
    :cond_7
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "afrc"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 592
    :cond_8
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "frac"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_4
    const/4 v1, 0x1

    .line 597
    :goto_5
    const-string v2, "ordinal"

    invoke-static {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsOnce(Ljava/util/List;Ljava/lang/String;)I

    move-result v2

    if-eq v2, v4, :cond_a

    if-eq v2, v3, :cond_9

    goto :goto_6

    .line 600
    :cond_9
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 599
    :cond_a
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "ordn"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    .line 603
    :goto_6
    const-string v2, "slashed-zero"

    invoke-static {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsOnce(Ljava/util/List;Ljava/lang/String;)I

    move-result p0

    if-eq p0, v4, :cond_c

    if-eq p0, v3, :cond_b

    move v4, v1

    goto :goto_7

    .line 606
    :cond_b
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 605
    :cond_c
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "zero"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_7
    if-eqz v4, :cond_d

    return-object v0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseVariantPosition(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 3

    .line 469
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 472
    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 473
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v1, "sub"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    const-string v1, "super"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 476
    :cond_1
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "sups"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    .line 475
    :cond_2
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v1, "subs"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private static parseVariantPositionSpecial(Ljava/util/List;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;"
        }
    .end annotation

    .line 487
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 490
    const-string v1, "sub"

    const-string v2, "super"

    invoke-static {p0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->containsWhich(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    const/4 v1, 0x1

    if-eq p0, v1, :cond_2

    const/4 v2, 0x2

    if-eq p0, v2, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 494
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->ERROR:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    return-object p0

    .line 493
    :cond_1
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "sups"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    .line 492
    :cond_2
    iget-object p0, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string v2, "subs"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private static setCapsFeature(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;Ljava/lang/String;)Z
    .locals 5

    .line 512
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 514
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 512
    :sswitch_0
    const-string v0, "small-caps"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x5

    goto :goto_0

    :sswitch_1
    const-string v0, "all-petite-caps"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x4

    goto :goto_0

    :sswitch_2
    const-string v0, "petite-caps"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x3

    goto :goto_0

    :sswitch_3
    const-string v0, "unicase"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x2

    goto :goto_0

    :sswitch_4
    const-string v0, "all-small-caps"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v4, 0x1

    goto :goto_0

    :sswitch_5
    const-string v0, "titling-caps"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v4, 0x0

    .line 520
    :goto_0
    const-string p1, "pcap"

    const-string v0, "smcp"

    packed-switch v4, :pswitch_data_0

    return v1

    .line 514
    :pswitch_0
    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 517
    :pswitch_1
    const-string v0, "c2pc"

    invoke-direct {p0, p1, v0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->addSettings(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_1

    .line 516
    :pswitch_2
    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 518
    :pswitch_3
    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string p1, "unic"

    invoke-virtual {p0, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 515
    :pswitch_4
    const-string p1, "c2sc"

    invoke-direct {p0, v0, p1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->addSettings(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_1

    .line 519
    :pswitch_5
    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const-string p1, "titl"

    invoke-virtual {p0, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x2ad90767 -> :sswitch_5
        -0x1a02986d -> :sswitch_4
        -0x111bb7e0 -> :sswitch_3
        -0x94589ad -> :sswitch_2
        0x45ef9827 -> :sswitch_1
        0x468813e7 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public applyKerning(Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;)V
    .locals 2

    .line 221
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->none:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    const-string v1, "kern"

    if-ne p1, v0, :cond_0

    .line 222
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 224
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public hasSettings()Z
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 238
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 239
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0x2c

    .line 240
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 241
    :cond_0
    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    const-string v3, "\' "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 246
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
