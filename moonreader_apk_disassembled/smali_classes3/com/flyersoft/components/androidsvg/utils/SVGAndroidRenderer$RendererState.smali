.class public Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RendererState"
.end annotation


# instance fields
.field final fillPaint:Landroid/graphics/Paint;

.field final fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field final fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

.field hasFill:Z

.field hasStroke:Z

.field spacePreserve:Z

.field final strokePaint:Landroid/graphics/Paint;

.field style:Lcom/flyersoft/components/androidsvg/utils/Style;

.field viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

.field viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;


# direct methods
.method constructor <init>()V
    .locals 4

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    const/16 v1, 0xc1

    .line 140
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 141
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$sfgetSUPPORTS_FONT_HINTING()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 142
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setHinting(I)V

    .line 144
    :cond_0
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 145
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 147
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    .line 148
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 149
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$sfgetSUPPORTS_FONT_HINTING()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setHinting(I)V

    .line 152
    :cond_1
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 153
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 155
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 156
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    .line 158
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style;->getDefaultStyle()Lcom/flyersoft/components/androidsvg/utils/Style;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)V
    .locals 2

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    iget-boolean v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    .line 164
    iget-boolean v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    .line 165
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    .line 166
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    .line 167
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v0, :cond_0

    .line 168
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 169
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v0, :cond_1

    .line 170
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 171
    :cond_1
    iget-boolean v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->spacePreserve:Z

    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->spacePreserve:Z

    .line 172
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 173
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    .line 176
    :try_start_0
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/Style;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/Style;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 181
    const-string v0, "SVGAndroidRenderer"

    const-string v1, "Unexpected clone error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 182
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style;->getDefaultStyle()Lcom/flyersoft/components/androidsvg/utils/Style;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    return-void
.end method
