.class public Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;
.super Ljava/lang/Object;
.source "CSSFontVariationSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;
    }
.end annotation


# static fields
.field private static final NORMAL:Ljava/lang/String; = "normal"

.field static final VARIATION_ITALIC:Ljava/lang/String; = "ital"

.field static final VARIATION_ITALIC_VALUE_ON:Ljava/lang/Float;

.field static final VARIATION_OBLIQUE:Ljava/lang/String; = "slnt"

.field static final VARIATION_OBLIQUE_VALUE_ON:Ljava/lang/Float;

.field static final VARIATION_WEIGHT:Ljava/lang/String; = "wght"

.field static final VARIATION_WIDTH:Ljava/lang/String; = "wdth"


# instance fields
.field private final settings:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->VARIATION_ITALIC_VALUE_ON:Ljava/lang/Float;

    const/high16 v0, -0x3ea00000    # -14.0f

    .line 19
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->VARIATION_OBLIQUE_VALUE_ON:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;)V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    return-void
.end method

.method private static nextFeatureEntry(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;
    .locals 4

    .line 113
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 114
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextQuotedString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 118
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    .line 120
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    if-nez p0, :cond_2

    return-object v1

    .line 123
    :cond_2
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;

    invoke-direct {v1, v0, p0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;-><init>(Ljava/lang/String;Ljava/lang/Float;)V

    :cond_3
    :goto_0
    return-object v1
.end method

.method static parseFontVariationSettings(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;
    .locals 5

    .line 90
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;-><init>()V

    .line 92
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 93
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 95
    const-string p0, "normal"

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(Ljava/lang/String;)Z

    move-result p0

    const/4 v2, 0x0

    if-eqz p0, :cond_0

    return-object v2

    .line 99
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result p0

    if-eqz p0, :cond_1

    return-object v0

    .line 101
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->nextFeatureEntry(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;

    move-result-object p0

    if-nez p0, :cond_2

    return-object v2

    .line 104
    :cond_2
    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;->name:Ljava/lang/String;

    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;->val:Ljava/lang/Float;

    invoke-virtual {v3, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    goto :goto_0
.end method


# virtual methods
.method public addSetting(Ljava/lang/String;F)V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->settings:Ljava/util/HashMap;

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

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0x2c

    .line 69
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    :cond_0
    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    const-string v3, "\' "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    new-instance v3, Ljava/text/DecimalFormat;

    const-string v4, "#.##"

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 74
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 76
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
