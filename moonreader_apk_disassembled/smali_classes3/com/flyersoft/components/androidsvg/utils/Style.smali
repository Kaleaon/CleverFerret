.class public Lcom/flyersoft/components/androidsvg/utils/Style;
.super Ljava/lang/Object;
.source "Style.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;,
        Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;,
        Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;,
        Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;,
        Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;,
        Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;,
        Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;,
        Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;,
        Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;,
        Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;,
        Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;,
        Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;,
        Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;,
        Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;,
        Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;
    }
.end annotation


# static fields
.field static final FONT_STRETCH_MIN:F = 0.0f

.field static final FONT_STRETCH_NORMAL:F = 100.0f

.field static final FONT_WEIGHT_BOLD:F = 700.0f

.field static final FONT_WEIGHT_BOLDER:F = 3.4028235E38f

.field static final FONT_WEIGHT_LIGHTER:F = 1.4E-45f

.field static final FONT_WEIGHT_MAX:F = 1000.0f

.field static final FONT_WEIGHT_MIN:F = 1.0f

.field static final FONT_WEIGHT_NORMAL:F = 400.0f

.field static final SPECIFIED_CLIP:J = 0x100000L

.field static final SPECIFIED_CLIP_PATH:J = 0x10000000L

.field static final SPECIFIED_CLIP_RULE:J = 0x20000000L

.field static final SPECIFIED_COLOR:J = 0x1000L

.field static final SPECIFIED_DIRECTION:J = 0x1000000000L

.field static final SPECIFIED_DISPLAY:J = 0x1000000L

.field static final SPECIFIED_FILL:J = 0x1L

.field static final SPECIFIED_FILL_OPACITY:J = 0x4L

.field static final SPECIFIED_FILL_RULE:J = 0x2L

.field static final SPECIFIED_FONT_FAMILY:J = 0x2000L

.field static final SPECIFIED_FONT_FEATURE_SETTINGS:J = 0x200000000000L

.field static final SPECIFIED_FONT_KERNING:J = 0x2000000000000L

.field static final SPECIFIED_FONT_SIZE:J = 0x4000L

.field static final SPECIFIED_FONT_STRETCH:J = 0x8000000000000L

.field static final SPECIFIED_FONT_STYLE:J = 0x10000L

.field static final SPECIFIED_FONT_VARIANT_CAPS:J = 0x40000000000L

.field static final SPECIFIED_FONT_VARIANT_EAST_ASIAN:J = 0x100000000000L

.field static final SPECIFIED_FONT_VARIANT_LIGATURES:J = 0x10000000000L

.field static final SPECIFIED_FONT_VARIANT_NUMERIC:J = 0x80000000000L

.field static final SPECIFIED_FONT_VARIANT_POSITION:J = 0x20000000000L

.field static final SPECIFIED_FONT_VARIATION_SETTINGS:J = 0x4000000000000L

.field static final SPECIFIED_FONT_WEIGHT:J = 0x8000L

.field static final SPECIFIED_GLYPH_ORIENTATION_VERTICAL:J = 0x800000000000L

.field static final SPECIFIED_IMAGE_RENDERING:J = 0x2000000000L

.field static final SPECIFIED_ISOLATION:J = 0x4000000000L

.field static final SPECIFIED_LETTER_SPACING:J = 0x10000000000000L

.field static final SPECIFIED_MARKER_END:J = 0x800000L

.field static final SPECIFIED_MARKER_MID:J = 0x400000L

.field static final SPECIFIED_MARKER_START:J = 0x200000L

.field static final SPECIFIED_MASK:J = 0x40000000L

.field static final SPECIFIED_MIX_BLEND_MODE:J = 0x8000000000L

.field static final SPECIFIED_OPACITY:J = 0x800L

.field static final SPECIFIED_OVERFLOW:J = 0x80000L

.field private static final SPECIFIED_RESET:J = -0x41f0000000001L

.field static final SPECIFIED_SOLID_COLOR:J = 0x80000000L

.field static final SPECIFIED_SOLID_OPACITY:J = 0x100000000L

.field static final SPECIFIED_STOP_COLOR:J = 0x4000000L

.field static final SPECIFIED_STOP_OPACITY:J = 0x8000000L

.field static final SPECIFIED_STROKE:J = 0x8L

.field static final SPECIFIED_STROKE_DASHARRAY:J = 0x200L

.field static final SPECIFIED_STROKE_DASHOFFSET:J = 0x400L

.field static final SPECIFIED_STROKE_LINECAP:J = 0x40L

.field static final SPECIFIED_STROKE_LINEJOIN:J = 0x80L

.field static final SPECIFIED_STROKE_MITERLIMIT:J = 0x100L

.field static final SPECIFIED_STROKE_OPACITY:J = 0x10L

.field static final SPECIFIED_STROKE_WIDTH:J = 0x20L

.field static final SPECIFIED_TEXT_ANCHOR:J = 0x40000L

.field static final SPECIFIED_TEXT_DECORATION:J = 0x20000L

.field static final SPECIFIED_TEXT_ORIENTATION:J = 0x1000000000000L

.field static final SPECIFIED_VECTOR_EFFECT:J = 0x800000000L

.field static final SPECIFIED_VIEWPORT_FILL:J = 0x200000000L

.field static final SPECIFIED_VIEWPORT_FILL_OPACITY:J = 0x400000000L

.field static final SPECIFIED_VISIBILITY:J = 0x2000000L

.field static final SPECIFIED_WORD_SPACING:J = 0x20000000000000L

.field static final SPECIFIED_WRITING_MODE:J = 0x400000000000L


# instance fields
.field clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

.field clipPath:Ljava/lang/String;

.field clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

.field color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

.field direction:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

.field display:Ljava/lang/Boolean;

.field fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

.field fillOpacity:Ljava/lang/Float;

.field fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

.field fontFamily:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

.field fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field fontStretch:Ljava/lang/Float;

.field fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

.field fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

.field fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

.field fontWeight:Ljava/lang/Float;

.field glyphOrientationVertical:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

.field imageRendering:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

.field isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

.field letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field markerEnd:Ljava/lang/String;

.field markerMid:Ljava/lang/String;

.field markerStart:Ljava/lang/String;

.field mask:Ljava/lang/String;

.field mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

.field opacity:Ljava/lang/Float;

.field overflow:Ljava/lang/Boolean;

.field solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

.field solidOpacity:Ljava/lang/Float;

.field specifiedFlags:J

.field stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

.field stopOpacity:Ljava/lang/Float;

.field stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

.field strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field strokeDashOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field strokeLineCap:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

.field strokeLineJoin:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

.field strokeMiterLimit:Ljava/lang/Float;

.field strokeOpacity:Ljava/lang/Float;

.field strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

.field textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

.field textOrientation:Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;

.field vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

.field viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

.field viewportFillOpacity:Ljava/lang/Float;

.field visibility:Ljava/lang/Boolean;

.field wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field writingMode:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 28
    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void
.end method

.method static getDefaultStyle()Lcom/flyersoft/components/androidsvg/utils/Style;
    .locals 6

    .line 335
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/Style;-><init>()V

    .line 337
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 338
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;->NonZero:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 339
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    const/4 v3, 0x0

    .line 340
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 341
    iput-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeOpacity:Ljava/lang/Float;

    .line 342
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {v4, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(F)V

    iput-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 343
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Butt:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineCap:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    .line 344
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Miter:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineJoin:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    const/high16 v1, 0x40800000    # 4.0f

    .line 345
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeMiterLimit:Ljava/lang/Float;

    .line 346
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 347
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 348
    iput-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    .line 349
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    .line 350
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    .line 351
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v4, 0x41400000    # 12.0f

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v4, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v1, 0x43c80000    # 400.0f

    .line 352
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    .line 353
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const/high16 v1, 0x42c80000    # 100.0f

    .line 354
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    .line 355
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->None:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 356
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->LTR:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->direction:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    .line 357
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const/4 v1, 0x1

    .line 358
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    .line 359
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    .line 360
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    .line 361
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    .line 362
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    .line 363
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    .line 364
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->visibility:Ljava/lang/Boolean;

    .line 365
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 366
    iput-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    .line 367
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    .line 368
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;->NonZero:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    .line 369
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    .line 370
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 371
    iput-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidOpacity:Ljava/lang/Float;

    .line 372
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 373
    iput-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    .line 374
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->None:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    .line 375
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->imageRendering:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    .line 376
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    .line 377
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    .line 378
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    .line 379
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 380
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 381
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 382
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 383
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 384
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->FONT_FEATURE_SETTINGS_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 385
    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    .line 386
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 387
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 388
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;->horizontal_tb:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->writingMode:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    .line 389
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->glyphOrientationVertical:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    .line 390
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;->mixed:Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textOrientation:Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;

    const-wide v1, -0x41f0000000001L

    .line 392
    iput-wide v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-object v0
.end method

.method static processStyleProperty(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 5

    .line 434
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 437
    :cond_0
    const-string v0, "inherit"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 440
    :cond_1
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$SVGParserImpl$SVGAttr:[I

    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-string v1, "|"

    const-string v2, "none"

    const-string v3, "currentColor"

    const/16 v4, 0x7c

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    .line 804
    :pswitch_0
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLetterOrWordSpacing(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz p1, :cond_16

    .line 806
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/high16 v0, 0x20000000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 798
    :pswitch_1
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLetterOrWordSpacing(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz p1, :cond_16

    .line 800
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/high16 v0, 0x10000000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_2
    if-eqz p3, :cond_2

    goto/16 :goto_3

    .line 792
    :cond_2
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->parseFontVariationSettings(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    if-eqz p1, :cond_16

    .line 794
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/high16 v0, 0x4000000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_3
    if-eqz p3, :cond_3

    goto/16 :goto_3

    .line 784
    :cond_3
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseFontFeatureSettings(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz p1, :cond_16

    .line 786
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x200000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_4
    if-eqz p3, :cond_4

    goto/16 :goto_3

    .line 776
    :cond_4
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseEastAsian(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz p1, :cond_16

    .line 778
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x100000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_5
    if-eqz p3, :cond_5

    goto/16 :goto_3

    .line 768
    :cond_5
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantNumeric(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz p1, :cond_16

    .line 770
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x80000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_6
    if-eqz p3, :cond_6

    goto/16 :goto_3

    .line 760
    :cond_6
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantCaps(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz p1, :cond_16

    .line 762
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x40000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_7
    if-eqz p3, :cond_7

    goto/16 :goto_3

    .line 752
    :cond_7
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantPosition(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz p1, :cond_16

    .line 754
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x20000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_8
    if-eqz p3, :cond_8

    goto/16 :goto_3

    .line 744
    :cond_8
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseVariantLigatures(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    if-eqz p1, :cond_16

    .line 746
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x10000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_9
    if-eqz p3, :cond_9

    goto/16 :goto_3

    .line 738
    :cond_9
    invoke-static {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseFontVariant(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;)V

    return-void

    :pswitch_a
    if-eqz p3, :cond_a

    goto/16 :goto_3

    .line 730
    :cond_a
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->parseFontKerning(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    if-eqz p1, :cond_16

    .line 732
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/high16 v0, 0x2000000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_b
    if-eqz p3, :cond_b

    goto/16 :goto_3

    .line 722
    :cond_b
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    if-eqz p1, :cond_16

    .line 724
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x8000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_c
    if-eqz p3, :cond_c

    goto/16 :goto_3

    .line 714
    :cond_c
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseIsolation(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    if-eqz p1, :cond_16

    .line 716
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x4000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 706
    :pswitch_d
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseRenderQuality(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->imageRendering:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    if-eqz p1, :cond_16

    .line 708
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x2000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 700
    :pswitch_e
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseVectorEffect(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    if-eqz p1, :cond_16

    .line 702
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x800000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 695
    :pswitch_f
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOpacity(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    .line 696
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x400000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 685
    :pswitch_10
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 686
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;->getInstance()Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    goto :goto_0

    .line 688
    :cond_d
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColour(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 690
    :goto_0
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x200000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_11
    if-nez p3, :cond_e

    goto/16 :goto_3

    .line 679
    :cond_e
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOpacity(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidOpacity:Ljava/lang/Float;

    .line 680
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x100000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_12
    if-nez p3, :cond_f

    goto/16 :goto_3

    .line 667
    :cond_f
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10

    .line 668
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;->getInstance()Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    goto :goto_1

    .line 670
    :cond_10
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColour(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 672
    :goto_1
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x80000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 659
    :pswitch_13
    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    .line 660
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x40000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 654
    :pswitch_14
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFillRule(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    .line 655
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x20000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 649
    :pswitch_15
    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    .line 650
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x10000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 643
    :pswitch_16
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseClip(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    if-eqz p1, :cond_16

    .line 645
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x100000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 638
    :pswitch_17
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOpacity(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    .line 639
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x8000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 629
    :pswitch_18
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    .line 630
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;->getInstance()Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    goto :goto_2

    .line 632
    :cond_11
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColour(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 634
    :goto_2
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x4000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 622
    :pswitch_19
    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-gez p1, :cond_16

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "|visible|hidden|collapse|"

    invoke-virtual {p3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_12

    goto/16 :goto_3

    .line 624
    :cond_12
    const-string p1, "visible"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->visibility:Ljava/lang/Boolean;

    .line 625
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x2000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 615
    :pswitch_1a
    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-gez p1, :cond_16

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "|inline|block|list-item|run-in|compact|marker|table|inline-table|table-row-group|table-header-group|table-footer-group|table-row|table-column-group|table-column|table-cell|table-caption|none|"

    invoke-virtual {p3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_13

    goto/16 :goto_3

    .line 617
    :cond_13
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    .line 618
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x1000000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 610
    :pswitch_1b
    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    .line 611
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x800000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 605
    :pswitch_1c
    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    .line 606
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x400000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 600
    :pswitch_1d
    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    .line 601
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x200000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 593
    :pswitch_1e
    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    .line 594
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    .line 595
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    .line 596
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0xe00000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 587
    :pswitch_1f
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOverflow(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    if-eqz p1, :cond_16

    .line 589
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x80000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 581
    :pswitch_20
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseTextAnchor(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-eqz p1, :cond_16

    .line 583
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x40000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 575
    :pswitch_21
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseTextDirection(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->direction:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    if-eqz p1, :cond_16

    .line 577
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v0, 0x1000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 569
    :pswitch_22
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseTextDecoration(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    if-eqz p1, :cond_16

    .line 571
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x20000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 563
    :pswitch_23
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontStretch(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    if-eqz p1, :cond_16

    .line 565
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/high16 v0, 0x8000000000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 557
    :pswitch_24
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontStyle(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    if-eqz p1, :cond_16

    .line 559
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x10000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 551
    :pswitch_25
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontWeight(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    if-eqz p1, :cond_16

    .line 553
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/32 v0, 0x8000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 545
    :pswitch_26
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontSize(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz p1, :cond_16

    .line 547
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x4000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 539
    :pswitch_27
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontFamily(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    if-eqz p1, :cond_16

    .line 541
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x2000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    :pswitch_28
    if-eqz p3, :cond_14

    goto/16 :goto_3

    .line 535
    :cond_14
    invoke-static {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFont(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;)V

    return-void

    .line 528
    :pswitch_29
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColour(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    .line 529
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x1000

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 523
    :pswitch_2a
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOpacity(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    .line 524
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x800

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 515
    :pswitch_2b
    :try_start_0
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 516
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x400

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 503
    :pswitch_2c
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-wide/16 v0, 0x200

    if-eqz p1, :cond_15

    const/4 p1, 0x0

    .line 504
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 505
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 508
    :cond_15
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseStrokeDashArray(Ljava/lang/String;)[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz p1, :cond_16

    .line 510
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 495
    :pswitch_2d
    :try_start_1
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeMiterLimit:Ljava/lang/Float;

    .line 496
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x100

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J
    :try_end_1
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 488
    :pswitch_2e
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseStrokeLineJoin(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineJoin:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    if-eqz p1, :cond_16

    .line 490
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x80

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 482
    :pswitch_2f
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseStrokeLineCap(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineCap:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    if-eqz p1, :cond_16

    .line 484
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x40

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 474
    :pswitch_30
    :try_start_2
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 475
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x20

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J
    :try_end_2
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    .line 467
    :pswitch_31
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOpacity(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeOpacity:Ljava/lang/Float;

    if-eqz p1, :cond_16

    .line 469
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x10

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 461
    :pswitch_32
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parsePaintSpecifier(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz p1, :cond_16

    .line 463
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x8

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 455
    :pswitch_33
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseOpacity(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    if-eqz p1, :cond_16

    .line 457
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x4

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 449
    :pswitch_34
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFillRule(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    if-eqz p1, :cond_16

    .line 451
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x2

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void

    .line 443
    :pswitch_35
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parsePaintSpecifier(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz p1, :cond_16

    .line 445
    iget-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide/16 v0, 0x1

    or-long/2addr p1, v0

    iput-wide p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    :catch_0
    :cond_16
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 424
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/Style;

    .line 425
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_0

    .line 426
    invoke-virtual {v1}, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :cond_0
    return-object v0
.end method

.method resetNonInheritingProperties(Z)V
    .locals 2

    .line 403
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    if-eqz p1, :cond_0

    .line 404
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    const/4 p1, 0x0

    .line 405
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    .line 406
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 407
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    .line 408
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iput-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 409
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    .line 410
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    .line 411
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 412
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->solidOpacity:Ljava/lang/Float;

    .line 413
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 414
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    .line 415
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->None:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    .line 416
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    .line 417
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    return-void
.end method
