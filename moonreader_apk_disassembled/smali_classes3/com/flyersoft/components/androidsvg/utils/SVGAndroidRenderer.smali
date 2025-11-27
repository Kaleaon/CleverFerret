.class public Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;,
        Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;
    }
.end annotation


# static fields
.field private static final BEZIER_ARC_FACTOR:F = 0.5522848f

.field private static final DEFAULT_FONT_FAMILY:Ljava/lang/String; = "serif"

.field public static final LUMINANCE_TO_ALPHA_BLUE:F = 0.0722f

.field public static final LUMINANCE_TO_ALPHA_GREEN:F = 0.7151f

.field public static final LUMINANCE_TO_ALPHA_RED:F = 0.2127f

.field private static final PATTERN_DOUBLE_SPACES:Ljava/util/regex/Pattern;

.field private static final PATTERN_END_SPACES:Ljava/util/regex/Pattern;

.field private static final PATTERN_LINE_BREAKS:Ljava/util/regex/Pattern;

.field private static final PATTERN_START_SPACES:Ljava/util/regex/Pattern;

.field private static final PATTERN_TABS:Ljava/util/regex/Pattern;

.field private static final PATTERN_TABS_OR_LINE_BREAKS:Ljava/util/regex/Pattern;

.field private static final SUPPORTS_BLEND_MODE:Z

.field private static final SUPPORTS_FONT_HINTING:Z

.field private static final SUPPORTS_PAINT_FONT_FEATURE_SETTINGS:Z

.field private static final SUPPORTS_PAINT_FONT_VARIATION_SETTINGS:Z

.field private static final SUPPORTS_PAINT_LETTER_SPACING:Z

.field private static final SUPPORTS_PAINT_WORD_SPACING:Z

.field private static final SUPPORTS_PATH_OP:Z

.field private static final SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

.field private static final SUPPORTS_SAVE_LAYER_FLAGLESS:Z

.field private static final SUPPORTS_STROKED_UNDERLINES:Z

.field private static final TAG:Ljava/lang/String; = "SVGAndroidRenderer"

.field private static supportedFeatures:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final canvas:Landroid/graphics/Canvas;

.field private document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

.field private final dpi:F

.field private externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

.field private matrixStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Landroid/graphics/Matrix;",
            ">;"
        }
    .end annotation
.end field

.field private parentStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;",
            ">;"
        }
    .end annotation
.end field

.field private ruleMatchContext:Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;

.field private state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

.field private stateStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetcanvas(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Landroid/graphics/Canvas;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mmeasureText(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Ljava/lang/String;Landroid/graphics/Paint;)F
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->measureText(Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mvisible(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Z
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$sfgetSUPPORTS_FONT_HINTING()Z
    .locals 1

    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_FONT_HINTING:Z

    return v0
.end method

.method static bridge synthetic -$$Nest$sfgetSUPPORTS_PAINT_LETTER_SPACING()Z
    .locals 1

    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_LETTER_SPACING:Z

    return v0
.end method

.method static bridge synthetic -$$Nest$smarcTo(FFFFFZZFFLcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V
    .locals 0

    invoke-static/range {p0 .. p9}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->arcTo(FFFFFZZFFLcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdebug(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smerror(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smwarn(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x1

    .line 73
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_FONT_HINTING:Z

    .line 74
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_STROKED_UNDERLINES:Z

    .line 75
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PATH_OP:Z

    .line 76
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_FONT_FEATURE_SETTINGS:Z

    .line 77
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_LETTER_SPACING:Z

    .line 78
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    const/4 v3, 0x0

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    sput-boolean v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_FONT_VARIATION_SETTINGS:Z

    .line 79
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    sput-boolean v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_BLEND_MODE:Z

    .line 80
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v2, :cond_2

    const/4 v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    sput-boolean v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_WORD_SPACING:Z

    .line 81
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_SAVE_LAYER_FLAGLESS:Z

    .line 82
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_3

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    :goto_3
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

    .line 84
    const-string v0, "[\\n\\t]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_TABS_OR_LINE_BREAKS:Ljava/util/regex/Pattern;

    .line 85
    const-string v0, "\\t"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_TABS:Ljava/util/regex/Pattern;

    .line 86
    const-string v0, "\\n"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_LINE_BREAKS:Ljava/util/regex/Pattern;

    .line 87
    const-string v0, "^\\s+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_START_SPACES:Ljava/util/regex/Pattern;

    .line 88
    const-string v0, "\\s+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_END_SPACES:Ljava/util/regex/Pattern;

    .line 89
    const-string v0, "\\s{2,}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_DOUBLE_SPACES:Ljava/util/regex/Pattern;

    const/4 v0, 0x0

    .line 113
    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    return-void
.end method

.method constructor <init>(Landroid/graphics/Canvas;FLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V
    .locals 1

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 115
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->ruleMatchContext:Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;

    .line 220
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    .line 221
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->dpi:F

    .line 222
    iput-object p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-void
.end method

.method private addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;Landroid/graphics/Path;Landroid/graphics/Matrix;)V
    .locals 1

    .line 4316
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 4318
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 4320
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 4323
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_2

    .line 4324
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->transform:Landroid/graphics/Matrix;

    invoke-virtual {p3, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 4327
    :cond_2
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    if-eqz v0, :cond_3

    .line 4328
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    .line 4329
    :cond_3
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    if-eqz v0, :cond_4

    .line 4330
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    .line 4331
    :cond_4
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    if-eqz v0, :cond_5

    .line 4332
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    .line 4333
    :cond_5
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    if-eqz v0, :cond_7

    .line 4334
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Landroid/graphics/Path;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_6

    goto :goto_1

    .line 4341
    :cond_6
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 4343
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getClipRuleFromState()Landroid/graphics/Path$FillType;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 4344
    invoke-virtual {p2, v0, p3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    :cond_7
    :goto_1
    return-void
.end method

.method private addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;Landroid/graphics/Path;Landroid/graphics/Matrix;)V
    .locals 2

    .line 4291
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 4293
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 4295
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 4298
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_2

    .line 4299
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    invoke-virtual {p3, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 4301
    :cond_2
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->getPath()Landroid/graphics/Path;

    move-result-object v0

    .line 4303
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_3

    .line 4304
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4306
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 4309
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getClipRuleFromState()Landroid/graphics/Path$FillType;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 4310
    invoke-virtual {p2, v0, p3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    return-void
.end method

.method private addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;ZLandroid/graphics/Path;Landroid/graphics/Matrix;)V
    .locals 2

    .line 4231
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 4235
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clipStatePush()V

    .line 4237
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    .line 4239
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    invoke-direct {p0, p1, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    goto :goto_0

    .line 4241
    :cond_1
    const-string p1, "<use> elements inside a <clipPath> cannot reference another <use>"

    new-array p2, v1, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 4243
    :cond_2
    instance-of p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    if-eqz p2, :cond_3

    .line 4244
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    invoke-direct {p0, p1, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    goto :goto_0

    .line 4245
    :cond_3
    instance-of p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    if-eqz p2, :cond_4

    .line 4246
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    invoke-direct {p0, p1, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    goto :goto_0

    .line 4247
    :cond_4
    instance-of p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;

    if-eqz p2, :cond_5

    .line 4248
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;

    invoke-direct {p0, p1, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    goto :goto_0

    .line 4250
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v1

    const-string p1, "Invalid %s element found in clipPath definition"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4254
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clipStatePop()V

    return-void
.end method

.method private addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;Landroid/graphics/Path;Landroid/graphics/Matrix;)V
    .locals 9

    .line 4375
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 4377
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 4380
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_1

    .line 4381
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    invoke-virtual {p3, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 4384
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x0

    .line 4385
    :goto_1
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    if-eqz v3, :cond_5

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    goto :goto_3

    :cond_5
    :goto_2
    const/4 v3, 0x0

    .line 4386
    :goto_3
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    if-eqz v4, :cond_7

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_6

    goto :goto_4

    :cond_6
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    goto :goto_5

    :cond_7
    :goto_4
    const/4 v4, 0x0

    .line 4387
    :goto_5
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    if-eqz v5, :cond_9

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_8

    goto :goto_6

    :cond_8
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 4390
    :cond_9
    :goto_6
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-eq v1, v5, :cond_b

    .line 4391
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateTextWidth(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)F

    move-result v1

    .line 4392
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v5, v6, :cond_a

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v1, v5

    :cond_a
    sub-float/2addr v0, v1

    .line 4399
    :cond_b
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_c

    .line 4400
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;

    invoke-direct {v1, p0, v0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FF)V

    .line 4401
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    .line 4402
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v6, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v7, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-direct {v5, v6, v7, v8, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4404
    :cond_c
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 4406
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 4407
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;

    add-float/2addr v0, v4

    add-float/2addr v3, v2

    invoke-direct {v5, p0, v0, v3, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FFLandroid/graphics/Path;)V

    invoke-direct {p0, p1, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    .line 4409
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getClipRuleFromState()Landroid/graphics/Path$FillType;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 4410
    invoke-virtual {p2, v1, p3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    return-void
.end method

.method private addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;Landroid/graphics/Path;Landroid/graphics/Matrix;)V
    .locals 2

    .line 4350
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 4352
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 4354
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 4357
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_2

    .line 4358
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->transform:Landroid/graphics/Matrix;

    invoke-virtual {p3, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 4361
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 4363
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v1

    const-string p1, "Use reference \'%s\' not found"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 4367
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 4369
    invoke-direct {p0, v0, v1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;ZLandroid/graphics/Path;Landroid/graphics/Matrix;)V

    return-void
.end method

.method private static arcTo(FFFFFZZFFLcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V
    .locals 39

    move/from16 v0, p4

    move/from16 v1, p6

    move/from16 v2, p7

    move/from16 v3, p8

    move-object/from16 v4, p9

    cmpl-float v5, p0, v2

    if-nez v5, :cond_0

    cmpl-float v5, p1, v3

    if-nez v5, :cond_0

    goto/16 :goto_5

    :cond_0
    const/4 v5, 0x0

    cmpl-float v6, p2, v5

    if-eqz v6, :cond_b

    cmpl-float v5, p3, v5

    if-nez v5, :cond_1

    goto/16 :goto_6

    .line 2883
    :cond_1
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 2884
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    float-to-double v7, v0

    const-wide v9, 0x4076800000000000L    # 360.0

    rem-double/2addr v7, v9

    .line 2887
    invoke-static {v7, v8}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v7

    .line 2888
    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    .line 2889
    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    sub-float v11, p0, v2

    float-to-double v11, v11

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    div-double/2addr v11, v13

    sub-float v15, p1, v3

    move-wide/from16 p2, v13

    float-to-double v13, v15

    div-double v13, v13, p2

    mul-double v15, v9, v11

    mul-double v17, v7, v13

    move-wide/from16 v19, v9

    add-double v9, v15, v17

    move-wide v15, v11

    neg-double v11, v7

    mul-double v11, v11, v15

    mul-double v13, v13, v19

    add-double/2addr v11, v13

    mul-float v13, v5, v5

    float-to-double v13, v13

    mul-float v15, v6, v6

    move-wide/from16 v16, v7

    float-to-double v7, v15

    mul-double v21, v9, v9

    mul-double v23, v11, v11

    div-double v25, v21, v13

    div-double v27, v23, v7

    add-double v25, v25, v27

    const-wide v27, 0x3fefffeb074a771dL    # 0.99999

    cmpl-double v15, v25, v27

    if-lez v15, :cond_2

    .line 2914
    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    const-wide v13, 0x3ff0000a7c5ac472L    # 1.00001

    mul-double v7, v7, v13

    float-to-double v13, v5

    mul-double v13, v13, v7

    double-to-float v5, v13

    float-to-double v13, v6

    mul-double v7, v7, v13

    double-to-float v6, v7

    mul-float v7, v5, v5

    float-to-double v13, v7

    mul-float v7, v6, v6

    float-to-double v7, v7

    :cond_2
    const-wide/high16 v25, -0x4010000000000000L    # -1.0

    const-wide/high16 v27, 0x3ff0000000000000L    # 1.0

    move/from16 v15, p5

    if-ne v15, v1, :cond_3

    move-wide/from16 v29, v25

    goto :goto_0

    :cond_3
    move-wide/from16 v29, v27

    :goto_0
    mul-double v31, v13, v7

    mul-double v13, v13, v23

    sub-double v31, v31, v13

    mul-double v7, v7, v21

    sub-double v31, v31, v7

    add-double/2addr v13, v7

    div-double v31, v31, v13

    const-wide/16 v7, 0x0

    cmpg-double v13, v31, v7

    if-gez v13, :cond_4

    move-wide/from16 v31, v7

    .line 2925
    :cond_4
    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    mul-double v29, v29, v13

    float-to-double v13, v5

    mul-double v21, v13, v11

    move-wide/from16 v23, v7

    float-to-double v7, v6

    div-double v21, v21, v7

    mul-double v21, v21, v29

    mul-double v31, v7, v9

    move-wide/from16 v33, v7

    div-double v7, v31, v13

    neg-double v7, v7

    mul-double v29, v29, v7

    add-float v7, p0, v2

    float-to-double v7, v7

    div-double v7, v7, p2

    add-float v15, p1, v3

    move-wide/from16 v31, v7

    float-to-double v7, v15

    div-double v7, v7, p2

    mul-double v35, v19, v21

    mul-double v37, v16, v29

    sub-double v35, v35, v37

    move-wide/from16 p0, v7

    add-double v7, v31, v35

    mul-double v15, v16, v21

    mul-double v17, v19, v29

    add-double v15, v15, v17

    move-wide/from16 v17, v13

    add-double v13, p0, v15

    sub-double v15, v9, v21

    div-double v15, v15, v17

    sub-double v19, v11, v29

    div-double v19, v19, v33

    neg-double v9, v9

    sub-double v9, v9, v21

    div-double v9, v9, v17

    neg-double v11, v11

    sub-double v11, v11, v29

    div-double v11, v11, v33

    mul-double v17, v15, v15

    mul-double v21, v19, v19

    add-double v17, v17, v21

    .line 2949
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v21

    cmpg-double v29, v19, v23

    if-gez v29, :cond_5

    move-wide/from16 v29, v25

    goto :goto_1

    :cond_5
    move-wide/from16 v29, v27

    :goto_1
    div-double v21, v15, v21

    .line 2952
    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->acos(D)D

    move-result-wide v21

    mul-double v29, v29, v21

    mul-double v21, v9, v9

    mul-double v31, v11, v11

    add-double v21, v21, v31

    mul-double v17, v17, v21

    .line 2955
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v17

    mul-double v21, v15, v9

    mul-double v31, v19, v11

    add-double v21, v21, v31

    mul-double v15, v15, v11

    mul-double v19, v19, v9

    sub-double v15, v15, v19

    cmpg-double v9, v15, v23

    if-gez v9, :cond_6

    goto :goto_2

    :cond_6
    move-wide/from16 v25, v27

    :goto_2
    div-double v21, v21, v17

    .line 2958
    invoke-static/range {v21 .. v22}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkedArcCos(D)D

    move-result-wide v9

    mul-double v25, v25, v9

    cmpl-double v9, v25, v23

    if-nez v9, :cond_7

    .line 2962
    invoke-interface {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->lineTo(FF)V

    return-void

    :cond_7
    const-wide v10, 0x401921fb54442d18L    # 6.283185307179586

    if-nez v1, :cond_8

    if-lez v9, :cond_8

    sub-double v25, v25, v10

    goto :goto_3

    :cond_8
    if-eqz v1, :cond_9

    cmpg-double v1, v25, v23

    if-gez v1, :cond_9

    add-double v25, v25, v10

    :cond_9
    :goto_3
    move-wide/from16 p0, v10

    rem-double v10, v25, p0

    rem-double v1, v29, p0

    .line 2978
    invoke-static {v1, v2, v10, v11}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->arcToBeziers(DD)[F

    move-result-object v1

    .line 2981
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 2982
    invoke-virtual {v2, v5, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 2983
    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    double-to-float v0, v7

    double-to-float v5, v13

    .line 2984
    invoke-virtual {v2, v0, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 2985
    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 2991
    array-length v0, v1

    add-int/lit8 v0, v0, -0x2

    aput p7, v1, v0

    .line 2992
    array-length v0, v1

    add-int/lit8 v0, v0, -0x1

    aput v3, v1, v0

    const/4 v0, 0x0

    .line 2995
    :goto_4
    array-length v2, v1

    if-ge v0, v2, :cond_a

    .line 2997
    aget v2, v1, v0

    add-int/lit8 v3, v0, 0x1

    aget v3, v1, v3

    add-int/lit8 v5, v0, 0x2

    aget v5, v1, v5

    add-int/lit8 v6, v0, 0x3

    aget v6, v1, v6

    add-int/lit8 v7, v0, 0x4

    aget v7, v1, v7

    add-int/lit8 v8, v0, 0x5

    aget v8, v1, v8

    move/from16 p1, v2

    move/from16 p2, v3

    move-object/from16 p0, v4

    move/from16 p3, v5

    move/from16 p4, v6

    move/from16 p5, v7

    move/from16 p6, v8

    invoke-interface/range {p0 .. p6}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->cubicTo(FFFFFF)V

    add-int/lit8 v0, v0, 0x6

    goto :goto_4

    :cond_a
    :goto_5
    return-void

    :cond_b
    move/from16 v2, p7

    .line 2878
    :goto_6
    invoke-interface {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->lineTo(FF)V

    return-void
.end method

.method private static arcToBeziers(DD)[F
    .locals 18

    .line 3026
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    mul-double v0, v0, v2

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    int-to-double v4, v0

    div-double v4, p2, v4

    div-double v1, v4, v2

    .line 3031
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    const-wide v8, 0x3ff5555555555555L    # 1.3333333333333333

    mul-double v6, v6, v8

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    add-double/2addr v1, v8

    div-double/2addr v6, v1

    mul-int/lit8 v1, v0, 0x6

    .line 3033
    new-array v1, v1, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    int-to-double v8, v2

    mul-double v8, v8, v4

    add-double v8, p0, v8

    .line 3040
    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    .line 3041
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    add-int/lit8 v14, v3, 0x1

    mul-double v15, v6, v12

    move/from16 v17, v0

    move-object/from16 p2, v1

    sub-double v0, v10, v15

    double-to-float v0, v0

    .line 3043
    aput v0, p2, v3

    add-int/lit8 v0, v3, 0x2

    mul-double v10, v10, v6

    add-double/2addr v12, v10

    double-to-float v1, v12

    .line 3044
    aput v1, p2, v14

    add-double/2addr v8, v4

    .line 3047
    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    .line 3048
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    add-int/lit8 v1, v3, 0x3

    mul-double v12, v6, v8

    add-double/2addr v12, v10

    double-to-float v12, v12

    .line 3049
    aput v12, p2, v0

    add-int/lit8 v0, v3, 0x4

    mul-double v12, v6, v10

    sub-double v12, v8, v12

    double-to-float v12, v12

    .line 3050
    aput v12, p2, v1

    add-int/lit8 v1, v3, 0x5

    double-to-float v10, v10

    .line 3052
    aput v10, p2, v0

    add-int/lit8 v3, v3, 0x6

    double-to-float v0, v8

    .line 3053
    aput v0, p2, v1

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v1, p2

    move/from16 v0, v17

    goto :goto_0

    :cond_0
    move-object/from16 p2, v1

    return-object p2
.end method

.method private calculateClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)Landroid/graphics/Path;
    .locals 5

    .line 3989
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    .line 3991
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    new-array p2, v2, [Ljava/lang/Object;

    aput-object p1, p2, v1

    const-string p1, "ClipPath reference \'%s\' not found"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    .line 3997
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->getNodeName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "clipPath"

    if-eq v3, v4, :cond_1

    return-object v0

    .line 4000
    :cond_1
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;

    .line 4003
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-virtual {v0, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4007
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 4009
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->clipPathUnitsAreUser:Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->clipPathUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const/4 v1, 0x1

    .line 4010
    :cond_3
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    if-nez v1, :cond_4

    .line 4013
    iget v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 4014
    iget v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {v0, v1, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 4016
    :cond_4
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->transform:Landroid/graphics/Matrix;

    if-eqz p2, :cond_5

    .line 4018
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 4021
    :cond_5
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    .line 4022
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->children:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 4024
    instance-of v4, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    if-nez v4, :cond_7

    goto :goto_0

    .line 4026
    :cond_7
    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    invoke-direct {p0, v3, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->objectToPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Z)Landroid/graphics/Path;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 4028
    sget-object v4, Landroid/graphics/Path$Op;->UNION:Landroid/graphics/Path$Op;

    invoke-virtual {p2, v3, v4}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    goto :goto_0

    .line 4032
    :cond_8
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 4034
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_9

    .line 4035
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4036
    :cond_9
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)Landroid/graphics/Path;

    move-result-object p1

    if-eqz p1, :cond_a

    .line 4038
    sget-object v1, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    invoke-virtual {p2, p1, v1}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 4041
    :cond_a
    invoke-virtual {p2, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 4044
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-object p2
.end method

.method private calculateMarkerPositions(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;",
            ")",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;",
            ">;"
        }
    .end annotation

    .line 1358
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1359
    :goto_0
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v2, :cond_1

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 1360
    :goto_1
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v3, :cond_2

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    .line 1361
    :goto_2
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v4, :cond_3

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    .line 1363
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    const/4 v4, 0x2

    invoke-direct {p1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1364
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    sub-float v5, v3, v0

    sub-float v6, v1, v2

    invoke-direct {v4, v0, v2, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1365
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-direct {v0, v3, v1, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method private calculateMarkerPositions(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;",
            ")",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;",
            ">;"
        }
    .end annotation

    .line 1418
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    array-length v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 1422
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1423
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v5, v5, v1

    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    const/4 v7, 0x1

    aget v6, v6, v7

    const/4 v8, 0x0

    invoke-direct {v4, v5, v6, v8, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    const/4 v5, 0x0

    :goto_1
    if-ge v2, v0, :cond_2

    .line 1427
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v8, v5, v2

    .line 1428
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    add-int/lit8 v6, v2, 0x1

    aget v5, v5, v6

    .line 1429
    invoke-virtual {v4, v8, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(FF)V

    .line 1430
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1431
    new-instance v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v9, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    sub-float v9, v8, v9

    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    sub-float v4, v5, v4

    invoke-direct {v6, v8, v5, v9, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    add-int/lit8 v2, v2, 0x2

    move-object v4, v6

    goto :goto_1

    .line 1435
    :cond_2
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;

    if-eqz v0, :cond_4

    .line 1436
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v0, v0, v1

    cmpl-float v0, v8, v0

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v0, v0, v7

    cmpl-float v0, v5, v0

    if-eqz v0, :cond_3

    .line 1437
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v0, v0, v1

    .line 1438
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget p1, p1, v7

    .line 1439
    invoke-virtual {v4, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(FF)V

    .line 1440
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1443
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v5, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    sub-float v5, v0, v5

    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    sub-float v4, p1, v4

    invoke-direct {v2, v0, p1, v5, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    .line 1444
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-virtual {v2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V

    .line 1445
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1446
    invoke-interface {v3, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_3
    return-object v3

    .line 1449
    :cond_4
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v3
.end method

.method private calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;
    .locals 4

    .line 1198
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    const/4 v1, 0x1

    .line 1199
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 1200
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-direct {p1, v1, v2, v3, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    return-object p1
.end method

.method private calculateTextWidth(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)F
    .locals 2

    .line 1886
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V

    .line 1887
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    .line 1888
    iget p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;->x:F

    return p1
.end method

.method private calculateViewBoxTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Landroid/graphics/Matrix;
    .locals 8

    .line 2202
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    if-eqz p3, :cond_5

    .line 2204
    invoke-virtual {p3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getAlignment()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object v1

    if-nez v1, :cond_0

    goto/16 :goto_5

    .line 2207
    :cond_0
    iget v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget v2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    div-float/2addr v1, v2

    .line 2208
    iget v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    div-float/2addr v2, v3

    .line 2209
    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    neg-float v3, v3

    .line 2210
    iget v4, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    neg-float v4, v4

    .line 2213
    sget-object v5, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->STRETCH:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    invoke-virtual {p3, v5}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2215
    iget p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {v0, p2, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 2216
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 2217
    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    return-object v0

    .line 2223
    :cond_1
    invoke-virtual {p3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getScale()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    move-result-object v5

    sget-object v6, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    if-ne v5, v6, :cond_2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_0

    :cond_2
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 2225
    :goto_0
    iget v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    div-float/2addr v2, v1

    .line 2226
    iget v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    div-float/2addr v5, v1

    .line 2228
    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    invoke-virtual {p3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getAlignment()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object v7

    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v7

    aget v6, v6, v7

    const/high16 v7, 0x40000000    # 2.0f

    packed-switch v6, :pswitch_data_0

    goto :goto_2

    .line 2238
    :pswitch_0
    iget v6, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    sub-float/2addr v6, v2

    goto :goto_1

    .line 2233
    :pswitch_1
    iget v6, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    sub-float/2addr v6, v2

    div-float/2addr v6, v7

    :goto_1
    sub-float/2addr v3, v6

    .line 2245
    :goto_2
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    invoke-virtual {p3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getAlignment()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object p3

    invoke-virtual {p3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result p3

    aget p3, v2, p3

    const/4 v2, 0x2

    if-eq p3, v2, :cond_4

    const/4 v2, 0x3

    if-eq p3, v2, :cond_3

    const/4 v2, 0x5

    if-eq p3, v2, :cond_4

    const/4 v2, 0x6

    if-eq p3, v2, :cond_3

    const/4 v2, 0x7

    if-eq p3, v2, :cond_4

    const/16 v2, 0x8

    if-eq p3, v2, :cond_3

    goto :goto_4

    .line 2255
    :cond_3
    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    sub-float/2addr p2, v5

    goto :goto_3

    .line 2250
    :cond_4
    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    sub-float/2addr p2, v5

    div-float/2addr p2, v7

    :goto_3
    sub-float/2addr v4, p2

    .line 2262
    :goto_4
    iget p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {v0, p2, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 2263
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 2264
    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_5
    :goto_5
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private canvasSaveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 1

    .line 447
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_SAVE_LAYER_FLAGLESS:Z

    if-eqz v0, :cond_0

    .line 449
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;)I

    return-void

    .line 452
    :cond_0
    sget v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->ALL_SAVE_FLAG:I

    invoke-static {p1, p2, p3, v0}, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->saveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;I)V

    return-void
.end method

.method private checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V
    .locals 1

    .line 3957
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    return-void
.end method

.method private checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V
    .locals 1

    .line 3963
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_0

    .line 3966
    :cond_0
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PATH_OP:Z

    if-eqz v0, :cond_2

    .line 3969
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)Landroid/graphics/Path;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 3971
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    :cond_1
    :goto_0
    return-void

    .line 3975
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath_OldStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    return-void
.end method

.method private checkForClipPath_OldStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V
    .locals 5

    .line 4172
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 4174
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "ClipPath reference \'%s\' not found"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 4180
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->getNodeName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "clipPath"

    if-eq v3, v4, :cond_1

    return-void

    .line 4183
    :cond_1
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;

    .line 4186
    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 4187
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p1, v2, v2, v2, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    return-void

    .line 4191
    :cond_2
    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->clipPathUnitsAreUser:Ljava/lang/Boolean;

    if-eqz v3, :cond_4

    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->clipPathUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v3, 0x1

    .line 4193
    :goto_1
    instance-of v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;

    if-eqz v4, :cond_5

    if-nez v3, :cond_5

    .line 4194
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->getNodeName()Ljava/lang/String;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "<clipPath clipPathUnits=\"objectBoundingBox\"> is not supported when referenced from container elements (like %s)"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 4198
    :cond_5
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clipStatePush()V

    if-nez v3, :cond_6

    .line 4202
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 4203
    iget v2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 4204
    iget v2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {p1, v2, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 4205
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 4207
    :cond_6
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->transform:Landroid/graphics/Matrix;

    if-eqz p1, :cond_7

    .line 4209
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->transform:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 4214
    :cond_7
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 4216
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 4218
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 4219
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->children:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 4221
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->addObjectToClip(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;ZLandroid/graphics/Path;Landroid/graphics/Matrix;)V

    goto :goto_2

    .line 4223
    :cond_8
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 4225
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clipStatePop()V

    return-void
.end method

.method private checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V
    .locals 3

    .line 3539
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    if-eqz v0, :cond_0

    .line 3540
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    const/4 v2, 0x1

    invoke-direct {p0, v2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->decodePaintReference(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;)V

    .line 3542
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    if-eqz v0, :cond_1

    .line 3543
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->decodePaintReference(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;)V

    :cond_1
    return-void
.end method

.method private checkForImageDataURL(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4

    .line 2152
    const-string v0, "data:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 2154
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xe

    if-ge v0, v2, :cond_1

    return-object v1

    :cond_1
    const/16 v0, 0x2c

    .line 2157
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v2, 0xc

    if-ge v0, v2, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v2, v0, -0x7

    .line 2160
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v3, ";base64"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    return-object v1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 2163
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    .line 2164
    array-length v2, p1

    invoke-static {p1, v0, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 2166
    const-string v0, "SVGAndroidRenderer"

    const-string v2, "Could not decode bad Data URL"

    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method private checkGenericFont(Ljava/lang/String;Ljava/lang/Float;Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;)Landroid/graphics/Typeface;
    .locals 5

    .line 2699
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->italic:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p3, v0, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 2700
    :goto_0
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    const/high16 v0, 0x442f0000    # 700.0f

    const/4 v3, 0x3

    const/4 v4, 0x2

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_2

    if-eqz p3, :cond_1

    const/4 p2, 0x3

    goto :goto_1

    :cond_1
    const/4 p2, 0x1

    goto :goto_1

    :cond_2
    if-eqz p3, :cond_3

    const/4 p2, 0x2

    goto :goto_1

    :cond_3
    const/4 p2, 0x0

    .line 2703
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p3

    const/4 v0, -0x1

    sparse-switch p3, :sswitch_data_0

    :goto_2
    const/4 v1, -0x1

    goto :goto_3

    :sswitch_0
    const-string p3, "cursive"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_2

    :cond_4
    const/4 v1, 0x4

    goto :goto_3

    :sswitch_1
    const-string p3, "serif"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_2

    :cond_5
    const/4 v1, 0x3

    goto :goto_3

    :sswitch_2
    const-string p3, "fantasy"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_2

    :cond_6
    const/4 v1, 0x2

    goto :goto_3

    :sswitch_3
    const-string p3, "monospace"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_2

    :sswitch_4
    const-string p3, "sans-serif"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_2

    :cond_7
    const/4 v1, 0x0

    :cond_8
    :goto_3
    packed-switch v1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    .line 2705
    :pswitch_0
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1

    .line 2711
    :pswitch_1
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1

    .line 2709
    :pswitch_2
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x5b97f43d -> :sswitch_4
        -0x5559f3fd -> :sswitch_3
        -0x407a00da -> :sswitch_2
        0x684317d -> :sswitch_1
        0x432c41c5 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private checkXMLSpaceAttribute(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .locals 1

    .line 508
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    if-nez v0, :cond_0

    goto :goto_0

    .line 511
    :cond_0
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    .line 512
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->spacePreserve:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 513
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->spacePreserve:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->spacePreserve:Z

    :cond_1
    :goto_0
    return-void
.end method

.method private static checkedArcCos(D)D
    .locals 3

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    cmpg-double v2, p0, v0

    if-gez v2, :cond_0

    const-wide p0, 0x400921fb54442d18L    # Math.PI

    return-wide p0

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p0, v0

    if-lez v2, :cond_1

    const-wide/16 p0, 0x0

    return-wide p0

    .line 3006
    :cond_1
    invoke-static {p0, p1}, Ljava/lang/Math;->acos(D)D

    move-result-wide p0

    return-wide p0
.end method

.method private static clamp255(F)I
    .locals 1

    const/high16 v0, 0x43800000    # 256.0f

    mul-float p0, p0, v0

    float-to-int p0, p0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/16 v0, 0xff

    .line 2721
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    return p0
.end method

.method private clipStatePop()V
    .locals 1

    .line 4274
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 4276
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-void
.end method

.method private clipStatePush()V
    .locals 2

    .line 4264
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    sget v1, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->MATRIX_SAVE_FLAG:I

    invoke-static {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->save(Landroid/graphics/Canvas;I)V

    .line 4266
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4267
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-void
.end method

.method private static colourWithOpacity(IF)I
    .locals 2

    shr-int/lit8 v0, p0, 0x18

    const/16 v1, 0xff

    and-int/2addr v0, v1

    int-to-float v0, v0

    mul-float v0, v0, p1

    .line 2728
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 2729
    :cond_0
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_0
    shl-int/lit8 p1, p1, 0x18

    const v0, 0xffffff

    and-int/2addr p0, v0

    or-int/2addr p0, p1

    return p0
.end method

.method private static varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method private decodePaintReference(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;)V
    .locals 3

    .line 3553
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v1, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->href:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    if-nez v0, :cond_3

    if-eqz p1, :cond_0

    .line 3556
    const-string p2, "Fill"

    goto :goto_0

    :cond_0
    const-string p2, "Stroke"

    :goto_0
    iget-object v0, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->href:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object v0, v1, p2

    const-string p2, "%s reference \'%s\' not found"

    invoke-static {p2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 3557
    iget-object p2, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->fallback:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz p2, :cond_1

    .line 3558
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->fallback:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    invoke-direct {p0, p2, p1, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setPaintColour(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    return-void

    :cond_1
    if-eqz p1, :cond_2

    .line 3561
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-boolean v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    return-void

    .line 3563
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-boolean v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    return-void

    .line 3567
    :cond_3
    instance-of p3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;

    if-eqz p3, :cond_4

    .line 3568
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;

    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makeLinearGradient(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;)V

    return-void

    .line 3569
    :cond_4
    instance-of p3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;

    if-eqz p3, :cond_5

    .line 3570
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;

    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makeRadialGradient(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;)V

    return-void

    .line 3571
    :cond_5
    instance-of p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;

    if-eqz p2, :cond_6

    .line 3572
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setSolidColor(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;)V

    :cond_6
    return-void
.end method

.method private display()Z
    .locals 1

    .line 2174
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 2175
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V
    .locals 2

    .line 523
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    if-eqz v0, :cond_0

    .line 525
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->href:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    .line 526
    instance-of v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;

    if-eqz v1, :cond_0

    .line 527
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;

    .line 528
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillWithPattern(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;)V

    return-void

    .line 534
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method private doStroke(Landroid/graphics/Path;)V
    .locals 5

    .line 542
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->NonScalingStroke:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    if-ne v0, v1, :cond_2

    .line 548
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 550
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 551
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 553
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 556
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object p1

    .line 557
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    if-eqz p1, :cond_0

    .line 559
    invoke-virtual {p1, v2}, Landroid/graphics/Shader;->getLocalMatrix(Landroid/graphics/Matrix;)Z

    .line 560
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 561
    invoke-virtual {v3, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 562
    invoke-virtual {p1, v3}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 566
    :cond_0
    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v1, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 569
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    if-eqz p1, :cond_1

    .line 572
    invoke-virtual {p1, v2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_1
    return-void

    .line 576
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method private dotProduct(FFFF)F
    .locals 0

    mul-float p1, p1, p3

    mul-float p2, p2, p4

    add-float/2addr p1, p2

    return p1
.end method

.method private enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V
    .locals 4

    .line 1664
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 1667
    :cond_0
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;->children:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x1

    .line 1670
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1672
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 1674
    instance-of v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    if-eqz v3, :cond_1

    .line 1675
    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->text:Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    xor-int/2addr v3, v0

    invoke-direct {p0, v2, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->textXMLSpaceTransform(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;->processText(Ljava/lang/String;)V

    goto :goto_1

    .line 1677
    :cond_1
    invoke-direct {p0, v2, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->processTextChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    :goto_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    :goto_2
    return-void
.end method

.method private static varargs error(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 592
    const-string v0, "SVGAndroidRenderer"

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private extractRawText(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Ljava/lang/StringBuilder;)V
    .locals 4

    .line 1989
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;->children:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x1

    .line 1992
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1994
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 1996
    instance-of v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    if-eqz v3, :cond_0

    .line 1997
    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    invoke-direct {p0, v2, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->extractRawText(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 1998
    :cond_0
    instance-of v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    if-eqz v3, :cond_1

    .line 1999
    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->text:Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    xor-int/2addr v3, v0

    invoke-direct {p0, v2, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->textXMLSpaceTransform(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :goto_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    return-void
.end method

.method private fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Ljava/lang/String;)V
    .locals 4

    .line 3832
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 3835
    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v2

    const-string p2, "Gradient reference \'%s\' not found"

    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 3838
    :cond_0
    instance-of v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;

    if-nez v3, :cond_1

    .line 3839
    const-string p1, "Gradient href attributes must point to other gradient elements"

    new-array p2, v2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1
    if-ne v0, p1, :cond_2

    .line 3843
    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v2

    const-string p2, "Circular reference in gradient href attribute \'%s\'"

    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 3847
    :cond_2
    move-object p2, v0

    check-cast p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;

    .line 3849
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientUnitsAreUser:Ljava/lang/Boolean;

    if-nez v1, :cond_3

    .line 3850
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientUnitsAreUser:Ljava/lang/Boolean;

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientUnitsAreUser:Ljava/lang/Boolean;

    .line 3851
    :cond_3
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientTransform:Landroid/graphics/Matrix;

    if-nez v1, :cond_4

    .line 3852
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientTransform:Landroid/graphics/Matrix;

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientTransform:Landroid/graphics/Matrix;

    .line 3853
    :cond_4
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-nez v1, :cond_5

    .line 3854
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    .line 3855
    :cond_5
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->children:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 3856
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->children:Ljava/util/List;

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->children:Ljava/util/List;

    .line 3860
    :cond_6
    :try_start_0
    instance-of v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;

    if-eqz v1, :cond_7

    .line 3861
    move-object v1, p1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;)V

    goto :goto_0

    .line 3863
    :cond_7
    move-object v1, p1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 3868
    :goto_0
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->href:Ljava/lang/String;

    if-eqz v0, :cond_8

    .line 3869
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->href:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Ljava/lang/String;)V

    :cond_8
    return-void
.end method

.method private fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;)V
    .locals 1

    .line 3875
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_0

    .line 3876
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3877
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_1

    .line 3878
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3879
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_2

    .line 3880
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3881
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_3

    .line 3882
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :cond_3
    return-void
.end method

.method private fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;)V
    .locals 1

    .line 3888
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_0

    .line 3889
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3890
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_1

    .line 3891
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3892
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_2

    .line 3893
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3894
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_3

    .line 3895
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3896
    :cond_3
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_4

    .line 3897
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 3898
    :cond_4
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v0, :cond_5

    .line 3899
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :cond_5
    return-void
.end method

.method private fillInChainedPatternFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;Ljava/lang/String;)V
    .locals 4

    .line 4816
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 4819
    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v2

    const-string p2, "Pattern reference \'%s\' not found"

    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 4822
    :cond_0
    instance-of v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;

    if-nez v3, :cond_1

    .line 4823
    const-string p1, "Pattern href attributes must point to other pattern elements"

    new-array p2, v2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1
    if-ne v0, p1, :cond_2

    .line 4827
    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v2

    const-string p2, "Circular reference in pattern href attribute \'%s\'"

    invoke-static {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 4831
    :cond_2
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;

    .line 4833
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    if-nez p2, :cond_3

    .line 4834
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    .line 4835
    :cond_3
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    if-nez p2, :cond_4

    .line 4836
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    .line 4837
    :cond_4
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    if-nez p2, :cond_5

    .line 4838
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    .line 4839
    :cond_5
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez p2, :cond_6

    .line 4840
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 4841
    :cond_6
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez p2, :cond_7

    .line 4842
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 4843
    :cond_7
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez p2, :cond_8

    .line 4844
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 4845
    :cond_8
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez p2, :cond_9

    .line 4846
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 4848
    :cond_9
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->children:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_a

    .line 4849
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->children:Ljava/util/List;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->children:Ljava/util/List;

    .line 4850
    :cond_a
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez p2, :cond_b

    .line 4851
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4852
    :cond_b
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-nez p2, :cond_c

    .line 4853
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 4856
    :cond_c
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->href:Ljava/lang/String;

    if-eqz p2, :cond_d

    .line 4857
    iget-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->href:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedPatternFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;Ljava/lang/String;)V

    :cond_d
    return-void
.end method

.method private fillWithPattern(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;)V
    .locals 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    .line 4676
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 4679
    :goto_0
    iget-object v6, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    .line 4681
    iget-object v7, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->href:Ljava/lang/String;

    if-eqz v7, :cond_1

    .line 4682
    iget-object v7, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->href:Ljava/lang/String;

    invoke-direct {v0, v2, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedPatternFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;Ljava/lang/String;)V

    :cond_1
    const/4 v7, 0x0

    if-eqz v3, :cond_6

    .line 4686
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v3, :cond_2

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    .line 4687
    :goto_1
    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v8, :cond_3

    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v8, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v8

    goto :goto_2

    :cond_3
    const/4 v8, 0x0

    .line 4688
    :goto_2
    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v9, :cond_4

    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v9, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v9

    goto :goto_3

    :cond_4
    const/4 v9, 0x0

    .line 4689
    :goto_3
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v10, :cond_5

    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v10, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v10

    goto :goto_8

    :cond_5
    const/4 v10, 0x0

    goto :goto_8

    .line 4694
    :cond_6
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v3, :cond_7

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, v0, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v3

    goto :goto_4

    :cond_7
    const/4 v3, 0x0

    .line 4695
    :goto_4
    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v9, :cond_8

    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v9, v0, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v9

    goto :goto_5

    :cond_8
    const/4 v9, 0x0

    .line 4696
    :goto_5
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v10, :cond_9

    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v10, v0, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v10

    goto :goto_6

    :cond_9
    const/4 v10, 0x0

    .line 4697
    :goto_6
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v11, :cond_a

    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v11, v0, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v8

    goto :goto_7

    :cond_a
    const/4 v8, 0x0

    .line 4698
    :goto_7
    iget-object v11, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v11, v11, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v12, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v12, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    mul-float v3, v3, v12

    add-float/2addr v3, v11

    .line 4699
    iget-object v11, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v11, v11, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v12, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v12, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float v9, v9, v12

    add-float/2addr v9, v11

    .line 4700
    iget-object v11, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v11, v11, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    mul-float v10, v10, v11

    .line 4701
    iget-object v11, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v11, v11, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float v8, v8, v11

    move/from16 v20, v10

    move v10, v8

    move v8, v9

    move/from16 v9, v20

    :goto_8
    cmpl-float v11, v9, v7

    if-eqz v11, :cond_1c

    cmpl-float v11, v10, v7

    if-nez v11, :cond_b

    goto/16 :goto_13

    .line 4707
    :cond_b
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-eqz v11, :cond_c

    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_9

    :cond_c
    sget-object v11, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 4710
    :goto_9
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 4712
    iget-object v12, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v13, p2

    invoke-virtual {v12, v13}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 4715
    new-instance v12, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v12}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>()V

    .line 4716
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style;->getDefaultStyle()Lcom/flyersoft/components/androidsvg/utils/Style;

    move-result-object v13

    invoke-direct {v0, v12, v13}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V

    .line 4717
    iget-object v13, v12, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iput-object v14, v13, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    .line 4720
    invoke-direct {v0, v2, v12}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v12

    iput-object v12, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 4723
    iget-object v12, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4725
    iget-object v13, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    if-eqz v13, :cond_12

    .line 4727
    iget-object v13, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v14, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    invoke-virtual {v13, v14}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 4731
    new-instance v13, Landroid/graphics/Matrix;

    invoke-direct {v13}, Landroid/graphics/Matrix;-><init>()V

    .line 4732
    iget-object v14, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    invoke-virtual {v14, v13}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    move-result v14

    if-eqz v14, :cond_12

    .line 4733
    iget-object v12, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v12, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v14, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v14, v14, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v15, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4734
    invoke-virtual {v15}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxX()F

    move-result v15

    const/16 v16, 0x1

    iget-object v4, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    const/16 v17, 0x0

    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4735
    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxX()F

    move-result v5

    iget-object v7, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxY()F

    move-result v7

    move/from16 v18, v3

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    move/from16 p2, v3

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4736
    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxY()F

    move-result v3

    move/from16 v19, v3

    const/16 v3, 0x8

    new-array v3, v3, [F

    aput v12, v3, v17

    aput v14, v3, v16

    const/4 v12, 0x2

    aput v15, v3, v12

    const/4 v14, 0x3

    aput v4, v3, v14

    const/4 v4, 0x4

    aput v5, v3, v4

    const/4 v4, 0x5

    aput v7, v3, v4

    const/4 v4, 0x6

    aput p2, v3, v4

    const/4 v5, 0x7

    aput v19, v3, v5

    .line 4737
    invoke-virtual {v13, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 4739
    new-instance v5, Landroid/graphics/RectF;

    aget v7, v3, v17

    aget v13, v3, v16

    invoke-direct {v5, v7, v13, v7, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    :goto_a
    if-gt v12, v4, :cond_11

    .line 4741
    aget v7, v3, v12

    iget v13, v5, Landroid/graphics/RectF;->left:F

    cmpg-float v7, v7, v13

    if-gez v7, :cond_d

    aget v7, v3, v12

    iput v7, v5, Landroid/graphics/RectF;->left:F

    .line 4742
    :cond_d
    aget v7, v3, v12

    iget v13, v5, Landroid/graphics/RectF;->right:F

    cmpl-float v7, v7, v13

    if-lez v7, :cond_e

    aget v7, v3, v12

    iput v7, v5, Landroid/graphics/RectF;->right:F

    :cond_e
    add-int/lit8 v7, v12, 0x1

    .line 4743
    aget v13, v3, v7

    iget v14, v5, Landroid/graphics/RectF;->top:F

    cmpg-float v13, v13, v14

    if-gez v13, :cond_f

    aget v13, v3, v7

    iput v13, v5, Landroid/graphics/RectF;->top:F

    .line 4744
    :cond_f
    aget v13, v3, v7

    iget v14, v5, Landroid/graphics/RectF;->bottom:F

    cmpl-float v13, v13, v14

    if-lez v13, :cond_10

    aget v7, v3, v7

    iput v7, v5, Landroid/graphics/RectF;->bottom:F

    :cond_10
    add-int/lit8 v12, v12, 0x2

    goto :goto_a

    .line 4746
    :cond_11
    new-instance v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v3, v5, Landroid/graphics/RectF;->left:F

    iget v4, v5, Landroid/graphics/RectF;->top:F

    iget v7, v5, Landroid/graphics/RectF;->right:F

    iget v13, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v7, v13

    iget v13, v5, Landroid/graphics/RectF;->bottom:F

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v13, v5

    invoke-direct {v12, v3, v4, v7, v13}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    goto :goto_b

    :cond_12
    move/from16 v18, v3

    const/16 v16, 0x1

    const/16 v17, 0x0

    .line 4751
    :goto_b
    iget v3, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    sub-float v3, v3, v18

    div-float/2addr v3, v9

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, v9

    add-float v3, v18, v3

    .line 4752
    iget v4, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    sub-float/2addr v4, v8

    div-float/2addr v4, v10

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v4, v4, v10

    add-float/2addr v8, v4

    .line 4755
    invoke-virtual {v12}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxX()F

    move-result v4

    .line 4756
    invoke-virtual {v12}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxY()F

    move-result v5

    .line 4757
    new-instance v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    const/4 v12, 0x0

    invoke-direct {v7, v12, v12, v9, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    .line 4759
    invoke-direct {v0, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer(F)Z

    move-result v6

    :goto_c
    cmpg-float v12, v8, v5

    if-gez v12, :cond_1a

    move v12, v3

    :goto_d
    cmpg-float v13, v12, v4

    if-gez v13, :cond_19

    .line 4765
    iput v12, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    .line 4766
    iput v8, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    .line 4769
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 4772
    iget-object v13, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v13, v13, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v13, v13, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-nez v13, :cond_13

    .line 4773
    iget v13, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget v14, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget v15, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    move/from16 p2, v3

    iget v3, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-direct {v0, v13, v14, v15, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setClipRect(FFFF)V

    goto :goto_e

    :cond_13
    move/from16 p2, v3

    .line 4776
    :goto_e
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v3, :cond_14

    .line 4778
    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v13, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v0, v7, v13, v11}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateViewBoxTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Landroid/graphics/Matrix;

    move-result-object v13

    invoke-virtual {v3, v13}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    goto :goto_11

    .line 4782
    :cond_14
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    if-eqz v3, :cond_16

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_15

    goto :goto_f

    :cond_15
    const/4 v3, 0x0

    goto :goto_10

    :cond_16
    :goto_f
    const/4 v3, 0x1

    .line 4784
    :goto_10
    iget-object v13, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v13, v12, v8}, Landroid/graphics/Canvas;->translate(FF)V

    if-nez v3, :cond_17

    .line 4786
    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v13, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v13, v13, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget-object v14, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v14, v14, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {v3, v13, v14}, Landroid/graphics/Canvas;->scale(FF)V

    .line 4792
    :cond_17
    :goto_11
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_12
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_18

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 4793
    invoke-direct {v0, v13}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    goto :goto_12

    .line 4797
    :cond_18
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    add-float/2addr v12, v9

    move/from16 v3, p2

    goto :goto_d

    :cond_19
    move/from16 p2, v3

    add-float/2addr v8, v10

    goto/16 :goto_c

    :cond_1a
    if-eqz v6, :cond_1b

    .line 4802
    invoke-direct {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 4805
    :cond_1b
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    :cond_1c
    :goto_13
    return-void
.end method

.method private findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;
    .locals 2

    .line 3495
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>()V

    .line 3496
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style;->getDefaultStyle()Lcom/flyersoft/components/androidsvg/utils/Style;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V

    .line 3497
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object p1

    return-object p1
.end method

.method private findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;
    .locals 3

    .line 3503
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3507
    :goto_0
    instance-of v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 3508
    move-object v2, p1

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 3510
    :cond_0
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-nez v1, :cond_2

    .line 3516
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    .line 3517
    invoke-direct {p0, p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    goto :goto_1

    .line 3520
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 3521
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-object p2

    .line 3512
    :cond_2
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    goto :goto_0
.end method

.method private getAnchorPosition()Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;
    .locals 2

    .line 1602
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->direction:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->LTR:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1606
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->End:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object v0

    :cond_1
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object v0

    .line 1603
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object v0
.end method

.method private getClipRuleFromState()Landroid/graphics/Path$FillType;
    .locals 2

    .line 4282
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;->EvenOdd:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    if-ne v0, v1, :cond_0

    .line 4283
    sget-object v0, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    return-object v0

    .line 4285
    :cond_0
    sget-object v0, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    return-object v0
.end method

.method private getFillTypeFromState()Landroid/graphics/Path$FillType;
    .locals 2

    .line 2736
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;->EvenOdd:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    if-ne v0, v1, :cond_0

    .line 2737
    sget-object v0, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    return-object v0

    .line 2739
    :cond_0
    sget-object v0, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    return-object v0
.end method

.method private static declared-synchronized initialiseSupportedFeaturesMap()V
    .locals 3

    const-class v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    monitor-enter v0

    .line 1005
    :try_start_0
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sput-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    .line 1024
    const-string v2, "Structure"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1025
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "BasicStructure"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1027
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "ConditionalProcessing"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1028
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Image"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1029
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Style"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1030
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "ViewportAttribute"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1031
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Shape"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1033
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "BasicText"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1034
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "PaintAttribute"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1035
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "BasicPaintAttribute"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1036
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "OpacityAttribute"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1038
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "BasicGraphicsAttribute"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1039
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Marker"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1041
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Gradient"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1042
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Pattern"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1043
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Clip"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1044
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "BasicClip"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1045
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "Mask"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1055
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    const-string v2, "View"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1074
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z
    .locals 2

    .line 2271
    iget-wide v0, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    and-long/2addr p2, v0

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private makeLinearGradient(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    .line 3579
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->href:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 3580
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->href:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Ljava/lang/String;)V

    .line 3582
    :cond_0
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->gradientUnitsAreUser:Ljava/lang/Boolean;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_1

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->gradientUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 3583
    :goto_0
    iget-object v6, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    if-eqz p1, :cond_2

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    goto :goto_1

    :cond_2
    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    :goto_1
    if-eqz v3, :cond_7

    .line 3588
    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v8, :cond_3

    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v8, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v8

    goto :goto_2

    :cond_3
    const/4 v8, 0x0

    .line 3589
    :goto_2
    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v9, :cond_4

    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v9, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v9

    goto :goto_3

    :cond_4
    const/4 v9, 0x0

    .line 3590
    :goto_3
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v10, :cond_5

    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_4

    :cond_5
    sget-object v10, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->PERCENT_100:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :goto_4
    invoke-virtual {v10, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v10

    .line 3591
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v11, :cond_6

    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v11, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v11

    goto :goto_5

    :cond_6
    const/4 v11, 0x0

    :goto_5
    move v14, v9

    move v15, v10

    move/from16 v16, v11

    goto :goto_a

    .line 3595
    :cond_7
    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v9, 0x3f800000    # 1.0f

    if-eqz v8, :cond_8

    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v8, v0, v9}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v8

    goto :goto_6

    :cond_8
    const/4 v8, 0x0

    .line 3596
    :goto_6
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v10, :cond_9

    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v10, v0, v9}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v10

    goto :goto_7

    :cond_9
    const/4 v10, 0x0

    .line 3597
    :goto_7
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v11, :cond_a

    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v11, v0, v9}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v11

    goto :goto_8

    :cond_a
    const/high16 v11, 0x3f800000    # 1.0f

    .line 3598
    :goto_8
    iget-object v12, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v12, :cond_b

    iget-object v12, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v12, v0, v9}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v9

    goto :goto_9

    :cond_b
    const/4 v9, 0x0

    :goto_9
    move/from16 v16, v9

    move v14, v10

    move v15, v11

    :goto_a
    move v13, v8

    .line 3602
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 3605
    invoke-direct {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v8

    iput-object v8, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 3608
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    if-nez v3, :cond_c

    .line 3611
    iget v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget v9, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {v8, v3, v9}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 3612
    iget v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {v8, v3, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 3614
    :cond_c
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->gradientTransform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_d

    .line 3616
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->gradientTransform:Landroid/graphics/Matrix;

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 3620
    :cond_d
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->children:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_f

    .line 3623
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    if-eqz p1, :cond_e

    .line 3625
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-boolean v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    return-void

    .line 3627
    :cond_e
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-boolean v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    return-void

    .line 3631
    :cond_f
    new-array v3, v1, [I

    .line 3632
    new-array v9, v1, [F

    .line 3635
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->children:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const/high16 v11, -0x40800000    # -1.0f

    :goto_b
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_14

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 3637
    check-cast v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;

    .line 3638
    iget-object v7, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->offset:Ljava/lang/Float;

    if-eqz v7, :cond_10

    iget-object v7, v12, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->offset:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    goto :goto_c

    :cond_10
    const/4 v7, 0x0

    :goto_c
    if-eqz v5, :cond_12

    cmpl-float v18, v7, v11

    if-ltz v18, :cond_11

    goto :goto_d

    .line 3645
    :cond_11
    aput v11, v9, v5

    goto :goto_e

    .line 3640
    :cond_12
    :goto_d
    aput v7, v9, v5

    move v11, v7

    .line 3648
    :goto_e
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 3650
    iget-object v7, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v0, v7, v12}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 3651
    iget-object v7, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    check-cast v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    if-nez v7, :cond_13

    .line 3653
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    .line 3654
    :cond_13
    iget v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    iget-object v12, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v12, v12, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v12, v12, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    invoke-static {v7, v12}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->colourWithOpacity(IF)I

    move-result v7

    aput v7, v3, v5

    add-int/lit8 v5, v5, 0x1

    .line 3657
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    goto :goto_b

    :cond_14
    cmpl-float v5, v13, v15

    if-nez v5, :cond_15

    cmpl-float v5, v14, v16

    if-eqz v5, :cond_16

    :cond_15
    if-ne v1, v4, :cond_17

    .line 3662
    :cond_16
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    sub-int/2addr v1, v4

    .line 3663
    aget v1, v3, v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void

    .line 3668
    :cond_17
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 3669
    iget-object v4, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-eqz v4, :cond_19

    .line 3671
    iget-object v4, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->reflect:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-ne v4, v5, :cond_18

    .line 3672
    sget-object v1, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    goto :goto_f

    .line 3673
    :cond_18
    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->repeat:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-ne v2, v4, :cond_19

    .line 3674
    sget-object v1, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    :cond_19
    :goto_f
    move-object/from16 v19, v1

    .line 3677
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    .line 3680
    new-instance v12, Landroid/graphics/LinearGradient;

    move-object/from16 v17, v3

    move-object/from16 v18, v9

    invoke-direct/range {v12 .. v19}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 3681
    invoke-virtual {v12, v8}, Landroid/graphics/LinearGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 3682
    invoke-virtual {v6, v12}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 3683
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clamp255(F)I

    move-result v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method private makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;)Landroid/graphics/Path;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 4545
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    move v9, v2

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    .line 4546
    :goto_0
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    move/from16 v16, v3

    goto :goto_1

    :cond_1
    const/16 v16, 0x0

    .line 4547
    :goto_1
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    sub-float v3, v9, v2

    sub-float v8, v16, v2

    add-float v5, v9, v2

    add-float v4, v16, v2

    .line 4554
    iget-object v6, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v6, :cond_2

    .line 4555
    new-instance v6, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    const/high16 v7, 0x40000000    # 2.0f

    mul-float v7, v7, v2

    invoke-direct {v6, v3, v8, v7, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v6, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    :cond_2
    const v1, 0x3f0d6289

    mul-float v2, v2, v1

    .line 4560
    new-instance v10, Landroid/graphics/Path;

    invoke-direct {v10}, Landroid/graphics/Path;-><init>()V

    .line 4561
    invoke-virtual {v10, v9, v8}, Landroid/graphics/Path;->moveTo(FF)V

    add-float v7, v9, v2

    sub-float v14, v16, v2

    move v15, v5

    move v13, v5

    move v11, v7

    move v12, v8

    .line 4562
    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v1, v12

    move/from16 v17, v14

    add-float v14, v16, v2

    move v8, v4

    move-object v4, v10

    move v10, v8

    move v6, v14

    .line 4563
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    sub-float v7, v9, v2

    move v15, v3

    move v13, v3

    move-object v10, v4

    move v11, v7

    move v12, v8

    .line 4564
    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v5, v13

    move v10, v1

    move v8, v1

    move/from16 v6, v17

    .line 4565
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 4566
    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    return-object v4
.end method

.method private makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;)Landroid/graphics/Path;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 4573
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    move v9, v2

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    .line 4574
    :goto_0
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    move/from16 v16, v3

    goto :goto_1

    :cond_1
    const/16 v16, 0x0

    .line 4575
    :goto_1
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 4576
    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    sub-float v4, v9, v2

    sub-float v8, v16, v3

    add-float v5, v9, v2

    add-float v6, v16, v3

    .line 4583
    iget-object v7, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v7, :cond_2

    .line 4584
    new-instance v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    const/high16 v10, 0x40000000    # 2.0f

    mul-float v11, v2, v10

    mul-float v10, v10, v3

    invoke-direct {v7, v4, v8, v11, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v7, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    :cond_2
    const v1, 0x3f0d6289

    mul-float v2, v2, v1

    mul-float v3, v3, v1

    .line 4590
    new-instance v10, Landroid/graphics/Path;

    invoke-direct {v10}, Landroid/graphics/Path;-><init>()V

    .line 4591
    invoke-virtual {v10, v9, v8}, Landroid/graphics/Path;->moveTo(FF)V

    add-float v7, v9, v2

    sub-float v14, v16, v3

    move v15, v5

    move v13, v5

    move v11, v7

    move v12, v8

    .line 4592
    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v1, v12

    move/from16 v17, v14

    add-float v14, v16, v3

    move v13, v4

    move-object v4, v10

    move v10, v6

    move v8, v6

    move v6, v14

    .line 4593
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    sub-float v7, v9, v2

    move v15, v13

    move-object v10, v4

    move v11, v7

    move v12, v8

    .line 4594
    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v10, v1

    move v8, v1

    move v5, v13

    move/from16 v6, v17

    .line 4595
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 4596
    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    return-object v4
.end method

.method private makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;)Landroid/graphics/Path;
    .locals 9

    .line 4465
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    .line 4466
    :goto_0
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 4467
    :goto_1
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v3, :cond_2

    const/4 v3, 0x0

    goto :goto_2

    :cond_2
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    .line 4468
    :goto_2
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v4, :cond_3

    goto :goto_3

    :cond_3
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    .line 4470
    :goto_3
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v4, :cond_4

    .line 4471
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v6

    sub-float v7, v3, v0

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v8, v1, v2

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4474
    :cond_4
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 4475
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 4476
    invoke-virtual {p1, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    return-object p1
.end method

.method private makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Landroid/graphics/Path;
    .locals 6

    .line 4603
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4605
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    array-length v1, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 4607
    :goto_0
    rem-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    if-lez v1, :cond_4

    :goto_1
    const/4 v3, 0x2

    if-lt v1, v3, :cond_3

    if-nez v2, :cond_2

    .line 4616
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v3, v3, v2

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    add-int/lit8 v5, v2, 0x1

    aget v4, v4, v5

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_2

    .line 4618
    :cond_2
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    aget v3, v3, v2

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    add-int/lit8 v5, v2, 0x1

    aget v4, v4, v5

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_2
    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v1, v1, -0x2

    goto :goto_1

    .line 4622
    :cond_3
    instance-of v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;

    if-eqz v1, :cond_4

    .line 4623
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 4626
    :cond_4
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_5

    .line 4627
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    :cond_5
    return-object v0
.end method

.method private makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;)Landroid/graphics/Path;
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 4485
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    const/4 v4, 0x0

    goto :goto_1

    .line 4488
    :cond_0
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v2, :cond_1

    .line 4489
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    :goto_0
    move v4, v2

    goto :goto_1

    .line 4490
    :cond_1
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v2, :cond_2

    .line 4491
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    goto :goto_0

    .line 4493
    :cond_2
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 4494
    iget-object v4, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    .line 4496
    :goto_1
    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    invoke-static {v2, v5}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 4497
    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    div-float/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 4498
    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v5, :cond_3

    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    move v7, v5

    goto :goto_2

    :cond_3
    const/4 v7, 0x0

    .line 4499
    :goto_2
    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v5, :cond_4

    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    move v10, v5

    goto :goto_3

    :cond_4
    const/4 v10, 0x0

    .line 4500
    :goto_3
    iget-object v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    .line 4501
    iget-object v6, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v6, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v6

    .line 4503
    iget-object v8, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v8, :cond_5

    .line 4504
    new-instance v8, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v8, v7, v10, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v8, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    :cond_5
    add-float/2addr v5, v7

    add-float v15, v10, v6

    .line 4510
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    cmpl-float v1, v2, v3

    if-eqz v1, :cond_7

    cmpl-float v1, v4, v3

    if-nez v1, :cond_6

    goto :goto_4

    :cond_6
    const v1, 0x3f0d6289

    mul-float v3, v2, v1

    mul-float v1, v1, v4

    add-float v14, v10, v4

    .line 4528
    invoke-virtual {v6, v7, v14}, Landroid/graphics/Path;->moveTo(FF)V

    sub-float v8, v14, v1

    add-float v11, v7, v2

    sub-float v9, v11, v3

    move v12, v10

    .line 4529
    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move/from16 v18, v9

    sub-float v2, v5, v2

    .line 4530
    invoke-virtual {v6, v2, v10}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v9, v2, v3

    move v13, v5

    move v12, v8

    move v3, v11

    move v11, v5

    move-object v8, v6

    .line 4531
    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v5, v14

    move v14, v9

    sub-float v4, v15, v4

    .line 4532
    invoke-virtual {v6, v11, v4}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v10, v4, v1

    move/from16 v17, v15

    move/from16 v16, v2

    move v13, v10

    move v12, v11

    move-object v11, v6

    .line 4533
    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 4534
    invoke-virtual {v6, v3, v15}, Landroid/graphics/Path;->lineTo(FF)V

    move v11, v7

    move v12, v4

    move v9, v7

    move v8, v15

    move/from16 v7, v18

    .line 4535
    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move v7, v9

    .line 4536
    invoke-virtual {v6, v7, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_5

    :cond_7
    :goto_4
    move v11, v5

    .line 4514
    invoke-virtual {v6, v7, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 4515
    invoke-virtual {v6, v11, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 4516
    invoke-virtual {v6, v11, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 4517
    invoke-virtual {v6, v7, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 4518
    invoke-virtual {v6, v7, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 4538
    :goto_5
    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    return-object v6
.end method

.method private makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;)Landroid/graphics/Path;
    .locals 9

    .line 4636
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 4637
    :goto_1
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    if-eqz v3, :cond_3

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v3, 0x0

    .line 4638
    :goto_3
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    if-eqz v4, :cond_5

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_4

    goto :goto_4

    :cond_4
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    goto :goto_5

    :cond_5
    :goto_4
    const/4 v4, 0x0

    .line 4639
    :goto_5
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    if-eqz v5, :cond_7

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_6

    goto :goto_6

    :cond_6
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 4642
    :cond_7
    :goto_6
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-eq v1, v5, :cond_9

    .line 4643
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateTextWidth(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)F

    move-result v1

    .line 4644
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v5, v6, :cond_8

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v1, v5

    :cond_8
    sub-float/2addr v0, v1

    .line 4651
    :cond_9
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_a

    .line 4652
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;

    invoke-direct {v1, p0, v0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FF)V

    .line 4653
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    .line 4654
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v6, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v7, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-direct {v5, v6, v7, v8, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4657
    :cond_a
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 4658
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;

    add-float/2addr v0, v4

    add-float/2addr v3, v2

    invoke-direct {v5, p0, v0, v3, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FFLandroid/graphics/Path;)V

    invoke-direct {p0, p1, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    return-object v1
.end method

.method private makeRadialGradient(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;)V
    .locals 23

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    .line 3689
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->href:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 3690
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->href:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->fillInChainedGradientFields(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Ljava/lang/String;)V

    .line 3692
    :cond_0
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->gradientUnitsAreUser:Ljava/lang/Boolean;

    const/4 v5, 0x0

    if-eqz v3, :cond_1

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->gradientUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 3693
    :goto_0
    iget-object v6, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    if-eqz p1, :cond_2

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    goto :goto_1

    :cond_2
    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    :goto_1
    if-eqz v3, :cond_a

    .line 3699
    new-instance v8, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v9, 0x42480000    # 50.0f

    sget-object v10, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v8, v9, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    .line 3700
    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v9, :cond_3

    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v9, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v9

    goto :goto_2

    :cond_3
    invoke-virtual {v8, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v9

    .line 3701
    :goto_2
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v10, :cond_4

    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v10, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v10

    goto :goto_3

    :cond_4
    invoke-virtual {v8, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v10

    .line 3702
    :goto_3
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v11, :cond_5

    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :cond_5
    invoke-virtual {v8, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v8

    .line 3704
    sget-boolean v11, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

    if-eqz v11, :cond_8

    .line 3705
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v11, :cond_6

    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v11, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v11

    goto :goto_4

    :cond_6
    move v11, v9

    .line 3706
    :goto_4
    iget-object v12, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v12, :cond_7

    iget-object v12, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v12, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v12

    goto :goto_5

    :cond_7
    move v12, v10

    .line 3707
    :goto_5
    iget-object v13, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v13, :cond_9

    iget-object v13, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v13, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v13

    goto :goto_6

    :cond_8
    const/4 v11, 0x0

    const/4 v12, 0x0

    :cond_9
    const/4 v13, 0x0

    :goto_6
    move/from16 v17, v8

    move v15, v9

    move/from16 v16, v10

    move v14, v11

    goto/16 :goto_c

    .line 3712
    :cond_a
    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v9, 0x3f000000    # 0.5f

    const/high16 v10, 0x3f800000    # 1.0f

    if-eqz v8, :cond_b

    iget-object v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v8, v0, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v8

    goto :goto_7

    :cond_b
    const/high16 v8, 0x3f000000    # 0.5f

    .line 3713
    :goto_7
    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v11, :cond_c

    iget-object v11, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v11, v0, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v11

    goto :goto_8

    :cond_c
    const/high16 v11, 0x3f000000    # 0.5f

    .line 3714
    :goto_8
    iget-object v12, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v12, :cond_d

    iget-object v12, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v12, v0, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v12

    goto :goto_9

    :cond_d
    const/high16 v12, 0x3f000000    # 0.5f

    .line 3716
    :goto_9
    sget-boolean v13, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

    if-eqz v13, :cond_11

    .line 3717
    iget-object v13, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v13, :cond_e

    iget-object v13, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v13, v0, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v13

    goto :goto_a

    :cond_e
    const/high16 v13, 0x3f000000    # 0.5f

    .line 3718
    :goto_a
    iget-object v14, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v14, :cond_f

    iget-object v9, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v9, v0, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v9

    .line 3719
    :cond_f
    iget-object v14, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v14, :cond_10

    iget-object v14, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v14, v0, v10}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v10

    goto :goto_b

    :cond_10
    const/4 v10, 0x0

    :goto_b
    move v15, v8

    move/from16 v16, v11

    move/from16 v17, v12

    move v14, v13

    move v12, v9

    move v13, v10

    goto :goto_c

    :cond_11
    move v15, v8

    move/from16 v16, v11

    move/from16 v17, v12

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    .line 3726
    :goto_c
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 3729
    invoke-direct {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v8

    iput-object v8, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 3732
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    if-nez v3, :cond_12

    .line 3735
    iget v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget v9, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {v8, v3, v9}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 3736
    iget v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {v8, v3, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 3738
    :cond_12
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->gradientTransform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_13

    .line 3740
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->gradientTransform:Landroid/graphics/Matrix;

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 3744
    :cond_13
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->children:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_15

    .line 3747
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    if-eqz p1, :cond_14

    .line 3749
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-boolean v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    return-void

    .line 3751
    :cond_14
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-boolean v5, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    return-void

    .line 3759
    :cond_15
    sget-boolean v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

    const/4 v9, 0x0

    if-eqz v3, :cond_16

    .line 3760
    new-array v3, v1, [J

    move-object/from16 v20, v3

    goto :goto_d

    .line 3762
    :cond_16
    new-array v3, v1, [I

    move-object/from16 v20, v9

    move-object v9, v3

    .line 3765
    :goto_d
    new-array v3, v1, [F

    .line 3768
    iget-object v10, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->children:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const/high16 v11, -0x40800000    # -1.0f

    :goto_e
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_1c

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    const/16 v19, 0x0

    .line 3770
    move-object/from16 v7, v18

    check-cast v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;

    .line 3771
    iget-object v4, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->offset:Ljava/lang/Float;

    if-eqz v4, :cond_17

    iget-object v4, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->offset:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    goto :goto_f

    :cond_17
    const/4 v4, 0x0

    :goto_f
    if-eqz v5, :cond_19

    cmpl-float v21, v4, v11

    if-ltz v21, :cond_18

    goto :goto_10

    .line 3778
    :cond_18
    aput v11, v3, v5

    goto :goto_11

    .line 3773
    :cond_19
    :goto_10
    aput v4, v3, v5

    move v11, v4

    .line 3781
    :goto_11
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 3783
    iget-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v0, v4, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 3784
    iget-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    if-nez v4, :cond_1a

    .line 3786
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    .line 3787
    :cond_1a
    sget-boolean v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

    if-eqz v7, :cond_1b

    .line 3788
    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    iget-object v7, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-static {v4, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->colourWithOpacity(IF)I

    move-result v4

    invoke-static {v4}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(I)J

    move-result-wide v21

    aput-wide v21, v20, v5

    goto :goto_12

    .line 3790
    :cond_1b
    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    iget-object v7, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-static {v4, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->colourWithOpacity(IF)I

    move-result v4

    aput v4, v9, v5

    :goto_12
    add-int/lit8 v5, v5, 0x1

    .line 3794
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    goto :goto_e

    :cond_1c
    const/16 v19, 0x0

    cmpl-float v4, v17, v19

    if-eqz v4, :cond_21

    const/4 v4, 0x1

    if-ne v1, v4, :cond_1d

    goto :goto_15

    .line 3805
    :cond_1d
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 3806
    iget-object v4, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-eqz v4, :cond_1f

    .line 3808
    iget-object v4, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->reflect:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-ne v4, v5, :cond_1e

    .line 3809
    sget-object v1, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    goto :goto_13

    .line 3810
    :cond_1e
    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->repeat:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    if-ne v2, v4, :cond_1f

    .line 3811
    sget-object v1, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    :cond_1f
    :goto_13
    move-object/from16 v22, v1

    .line 3814
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    .line 3817
    sget-boolean v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_RADIAL_GRADIENT_WITH_FOCUS:Z

    if-eqz v1, :cond_20

    move-object/from16 v21, v3

    move/from16 v18, v16

    move/from16 v19, v17

    move/from16 v16, v13

    move/from16 v17, v15

    move v15, v12

    invoke-static/range {v14 .. v22}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(FFFFFF[J[FLandroid/graphics/Shader$TileMode;)Landroid/graphics/RadialGradient;

    move-result-object v1

    goto :goto_14

    :cond_20
    move-object/from16 v19, v3

    move-object/from16 v20, v22

    .line 3818
    new-instance v14, Landroid/graphics/RadialGradient;

    move-object/from16 v18, v9

    invoke-direct/range {v14 .. v20}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    move-object v1, v14

    .line 3819
    :goto_14
    invoke-virtual {v1, v8}, Landroid/graphics/RadialGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 3820
    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 3821
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clamp255(F)I

    move-result v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void

    :cond_21
    :goto_15
    move-object v3, v9

    .line 3799
    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    const/16 v18, 0x1

    add-int/lit8 v1, v1, -0x1

    .line 3800
    aget v1, v3, v1

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method private makeViewPort(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;
    .locals 1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 683
    invoke-virtual {p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p2, :cond_1

    .line 684
    invoke-virtual {p2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    .line 686
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getEffectiveViewPortInUserUnits()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object p2

    if-eqz p3, :cond_2

    .line 687
    invoke-virtual {p3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p3

    goto :goto_1

    :cond_2
    iget p3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    :goto_1
    if-eqz p4, :cond_3

    .line 688
    invoke-virtual {p4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p2

    goto :goto_2

    :cond_3
    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    .line 690
    :goto_2
    new-instance p4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p4, p1, v0, p3, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    return-object p4
.end method

.method private measureText(Ljava/lang/String;Landroid/graphics/Paint;)F
    .locals 3

    .line 1910
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    new-array v1, v0, [F

    .line 1911
    invoke-virtual {p2, p1, v1}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_0
    if-ge p2, v0, :cond_0

    .line 1914
    aget v2, v1, p2

    add-float/2addr p1, v2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return p1
.end method

.method private objectToPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Z)Landroid/graphics/Path;
    .locals 5

    .line 4057
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4058
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 4060
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 4062
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 4069
    :cond_0
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_6

    if-nez p2, :cond_1

    .line 4072
    const-string p2, "<use> elements inside a <clipPath> cannot reference another <use>"

    new-array v0, v3, [Ljava/lang/Object;

    invoke-static {p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4076
    :cond_1
    move-object p2, p1

    check-cast p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    .line 4077
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    if-nez v0, :cond_2

    .line 4079
    iget-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    new-array p2, v2, [Ljava/lang/Object;

    aput-object p1, p2, v3

    const-string p1, "Use reference \'%s\' not found"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4080
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-object v1

    .line 4083
    :cond_2
    instance-of v2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    if-nez v2, :cond_3

    .line 4084
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-object v1

    .line 4088
    :cond_3
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    invoke-direct {p0, v0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->objectToPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Z)Landroid/graphics/Path;

    move-result-object v0

    if-nez v0, :cond_4

    return-object v1

    .line 4092
    :cond_4
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_5

    .line 4093
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4096
    :cond_5
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->transform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_12

    .line 4097
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    goto/16 :goto_1

    .line 4099
    :cond_6
    instance-of p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;

    if-eqz p2, :cond_10

    .line 4101
    move-object p2, p1

    check-cast p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;

    .line 4103
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    if-eqz v0, :cond_7

    .line 4105
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    .line 4106
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->getPath()Landroid/graphics/Path;

    move-result-object v0

    .line 4107
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v2, :cond_c

    .line 4108
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    goto :goto_0

    .line 4110
    :cond_7
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    if-eqz v0, :cond_8

    .line 4111
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    .line 4112
    :cond_8
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    if-eqz v0, :cond_9

    .line 4113
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    .line 4114
    :cond_9
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    if-eqz v0, :cond_a

    .line 4115
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    .line 4116
    :cond_a
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    if-eqz v0, :cond_b

    .line 4117
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Landroid/graphics/Path;

    move-result-object v0

    goto :goto_0

    :cond_b
    move-object v0, v1

    :cond_c
    :goto_0
    if-nez v0, :cond_d

    return-object v1

    .line 4122
    :cond_d
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_e

    .line 4123
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 4126
    :cond_e
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->transform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_f

    .line 4127
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 4129
    :cond_f
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getClipRuleFromState()Landroid/graphics/Path$FillType;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    goto :goto_1

    .line 4131
    :cond_10
    instance-of p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    if-eqz p2, :cond_14

    .line 4133
    move-object p2, p1

    check-cast p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    .line 4134
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;)Landroid/graphics/Path;

    move-result-object v0

    .line 4136
    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_11

    .line 4137
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 4139
    :cond_11
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getClipRuleFromState()Landroid/graphics/Path$FillType;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 4147
    :cond_12
    :goto_1
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    if-eqz p2, :cond_13

    .line 4149
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)Landroid/graphics/Path;

    move-result-object p1

    if-eqz p1, :cond_13

    .line 4151
    sget-object p2, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 4155
    :cond_13
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-object v0

    .line 4142
    :cond_14
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->getNodeName()Ljava/lang/String;

    move-result-object p1

    new-array p2, v2, [Ljava/lang/Object;

    aput-object p1, p2, v3

    const-string p1, "Invalid %s element found in clipPath definition"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    .line 4063
    :cond_15
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-object v1
.end method

.method private parentPop()V
    .locals 1

    .line 469
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 470
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->matrixStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    return-void
.end method

.method private parentPush(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;)V
    .locals 1

    .line 462
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentStack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->matrixStack:Ljava/util/Stack;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V
    .locals 1

    .line 818
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    return-void
.end method

.method private popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V
    .locals 5

    .line 829
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 836
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 837
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 838
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvasSaveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 841
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 843
    new-instance v1, Landroid/graphics/ColorMatrix;

    const/16 v3, 0x14

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    invoke-direct {v1, v3}, Landroid/graphics/ColorMatrix;-><init>([F)V

    .line 847
    new-instance v3, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v3, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 848
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-direct {p0, v1, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvasSaveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 851
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    .line 852
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;

    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMask(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    .line 855
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 858
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 859
    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 860
    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-direct {p0, v3, v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvasSaveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 863
    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMask(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    .line 866
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 869
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 872
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x3e59ce07    # 0.2127f
        0x3f3710cb    # 0.7151f
        0x3d93dd98    # 0.0722f
        0x0
        0x0
    .end array-data
.end method

.method private processTextChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V
    .locals 8

    .line 1687
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;->doTextContainer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_9

    .line 1690
    :cond_0
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;

    if-eqz v0, :cond_1

    .line 1693
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 1695
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderTextPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;)V

    .line 1698
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    return-void

    .line 1700
    :cond_1
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_f

    .line 1702
    const-string v0, "TSpan render"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1705
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 1707
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;

    .line 1709
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1711
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1713
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->selectTypefaceAndFontStyling()V

    .line 1717
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->x:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 1718
    :goto_0
    instance-of v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;

    const/4 v3, 0x0

    if-eqz v0, :cond_a

    if-nez v1, :cond_3

    .line 1719
    move-object v4, p2

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;

    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    goto :goto_1

    :cond_3
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->x:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    .line 1720
    :goto_1
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->y:Ljava/util/List;

    if-eqz v5, :cond_5

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->y:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_4

    goto :goto_2

    :cond_4
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->y:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    goto :goto_3

    :cond_5
    :goto_2
    move-object v5, p2

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;

    iget v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->y:F

    .line 1721
    :goto_3
    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->dx:Ljava/util/List;

    if-eqz v6, :cond_7

    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->dx:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_6

    goto :goto_4

    :cond_6
    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->dx:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v6, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v6

    goto :goto_5

    :cond_7
    :goto_4
    const/4 v6, 0x0

    .line 1722
    :goto_5
    iget-object v7, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->dy:Ljava/util/List;

    if-eqz v7, :cond_9

    iget-object v7, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->dy:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_8

    goto :goto_6

    :cond_8
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->dy:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    move v3, v2

    :cond_9
    :goto_6
    move v2, v3

    move v3, v4

    goto :goto_7

    :cond_a
    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_7
    if-eqz v1, :cond_c

    .line 1727
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getAnchorPosition()Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    move-result-object v1

    .line 1728
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-eq v1, v4, :cond_c

    .line 1729
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateTextWidth(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)F

    move-result v4

    .line 1730
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v1, v7, :cond_b

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v4, v1

    :cond_b
    sub-float/2addr v3, v4

    .line 1738
    :cond_c
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    if-eqz v0, :cond_d

    .line 1741
    move-object v0, p2

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;

    add-float/2addr v3, v6

    iput v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    add-float/2addr v5, v2

    .line 1742
    iput v5, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->y:F

    .line 1745
    :cond_d
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v0

    .line 1747
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    if-eqz v0, :cond_e

    .line 1750
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1754
    :cond_e
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    return-void

    .line 1756
    :cond_f
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;

    if-eqz v0, :cond_12

    .line 1759
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 1761
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;

    .line 1763
    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v3, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1765
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v3

    if-eqz v3, :cond_11

    .line 1767
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    invoke-direct {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1770
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->href:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object p1

    .line 1771
    instance-of v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    if-eqz v3, :cond_10

    .line 1773
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1774
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->extractRawText(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Ljava/lang/StringBuilder;)V

    .line 1775
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_11

    .line 1776
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;->processText(Ljava/lang/String;)V

    goto :goto_8

    .line 1781
    :cond_10
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->href:Ljava/lang/String;

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "Tref reference \'%s\' not found"

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1786
    :cond_11
    :goto_8
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    :cond_12
    :goto_9
    return-void
.end method

.method private pushLayer()Z
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 774
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer(F)Z

    move-result v0

    return v0
.end method

.method private pushLayer(F)Z
    .locals 4

    .line 783
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->requiresCompositing()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return v1

    .line 787
    :cond_0
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 788
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    mul-float v2, v2, p1

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->clamp255(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 789
    sget-boolean p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_BLEND_MODE:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    if-eq p1, v2, :cond_1

    .line 790
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setBlendMode(Landroid/graphics/Paint;)V

    .line 792
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvasSaveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 795
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-virtual {p1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 798
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    .line 799
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object p1

    .line 801
    instance-of p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;

    if-nez p1, :cond_2

    .line 803
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    new-array v3, v0, [Ljava/lang/Object;

    aput-object p1, v3, v1

    const-string p1, "Mask reference \'%s\' not found"

    invoke-static {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 804
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    :cond_2
    return v0
.end method

.method private realignMarkerMid(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;
    .locals 4

    .line 3328
    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    iget v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    iget v2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    iget v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    sub-float/2addr v2, v3

    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    sub-float/2addr v3, p1

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->dotProduct(FFFF)F

    move-result p1

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    .line 3331
    iget p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    iget v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    iget v2, p3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    sub-float/2addr v2, v3

    iget p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    iget v3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    sub-float/2addr p3, v3

    invoke-direct {p0, p1, v1, v2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->dotProduct(FFFF)F

    move-result p1

    :cond_0
    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    goto :goto_0

    :cond_1
    if-nez p1, :cond_3

    .line 3338
    iget p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    cmpl-float p1, p1, v0

    if-gtz p1, :cond_2

    iget p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_3

    :cond_2
    :goto_0
    return-object p2

    .line 3342
    :cond_3
    iget p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    neg-float p1, p1

    iput p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    .line 3343
    iget p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    neg-float p1, p1

    iput p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    return-object p2
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;)V
    .locals 3

    const/4 v0, 0x0

    .line 1248
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Circle render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1250
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1253
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1255
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1257
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 1260
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_3

    .line 1261
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1263
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;)Landroid/graphics/Path;

    move-result-object v0

    .line 1264
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1266
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1267
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1269
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1271
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v2, :cond_4

    .line 1272
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V

    .line 1273
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v2, :cond_5

    .line 1274
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    :cond_5
    if-eqz v1, :cond_6

    .line 1277
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_6
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;)V
    .locals 3

    const/4 v0, 0x0

    .line 1286
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Ellipse render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1288
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1291
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1293
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1295
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 1298
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_3

    .line 1299
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1301
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;)Landroid/graphics/Path;

    move-result-object v0

    .line 1302
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1304
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1305
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1307
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1309
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v2, :cond_4

    .line 1310
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V

    .line 1311
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v2, :cond_5

    .line 1312
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    :cond_5
    if-eqz v1, :cond_6

    .line 1315
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_6
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;)V
    .locals 2

    .line 700
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " render"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 702
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 704
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 707
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_1

    .line 708
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 711
    :cond_1
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 713
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v0

    const/4 v1, 0x1

    .line 715
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderChildren(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Z)V

    if-eqz v0, :cond_2

    .line 718
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 720
    :cond_2
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;)V
    .locals 11

    const/4 v0, 0x0

    .line 2071
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "Image render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2073
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_d

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v1

    if-nez v1, :cond_d

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_d

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2074
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_4

    .line 2077
    :cond_0
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->href:Ljava/lang/String;

    if-nez v1, :cond_1

    goto/16 :goto_4

    .line 2081
    :cond_1
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 2084
    :goto_0
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->href:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForImageDataURL(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_4

    .line 2087
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    if-nez v2, :cond_3

    goto/16 :goto_4

    .line 2090
    :cond_3
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->href:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;->resolveImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    :cond_4
    if-nez v2, :cond_5

    .line 2093
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->href:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    const-string p1, "Could not locate image \'%s\'"

    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 2096
    :cond_5
    new-instance v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    const/4 v6, 0x0

    invoke-direct {v3, v6, v6, v4, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    .line 2098
    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v4, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 2100
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v4

    if-nez v4, :cond_6

    goto/16 :goto_4

    .line 2102
    :cond_6
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v4

    if-nez v4, :cond_7

    goto/16 :goto_4

    .line 2105
    :cond_7
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->transform:Landroid/graphics/Matrix;

    if-eqz v4, :cond_8

    .line 2106
    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v4, v5}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 2109
    :cond_8
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v4, :cond_9

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    goto :goto_1

    :cond_9
    const/4 v4, 0x0

    .line 2110
    :goto_1
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v5, :cond_a

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v5, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v5

    goto :goto_2

    :cond_a
    const/4 v5, 0x0

    .line 2111
    :goto_2
    iget-object v7, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v7, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v7

    .line 2112
    iget-object v8, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v8, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v8

    .line 2113
    iget-object v9, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    new-instance v10, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v10, v4, v5, v7, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v10, v9, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 2115
    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_b

    .line 2116
    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v7, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget-object v8, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v8, v8, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v8, v8, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-direct {p0, v4, v5, v7, v8}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setClipRect(FFFF)V

    .line 2119
    :cond_b
    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 2120
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 2122
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 2124
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v4

    .line 2126
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->viewportFill()V

    .line 2128
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v5}, Landroid/graphics/Canvas;->save()I

    .line 2131
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v7, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, v7, v3, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateViewBoxTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 2133
    new-instance v1, Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/Style;->imageRendering:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeSpeed:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    if-ne v3, v5, :cond_c

    goto :goto_3

    :cond_c
    const/4 v0, 0x2

    :goto_3
    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 2134
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v2, v6, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 2136
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    if-eqz v4, :cond_d

    .line 2139
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_d
    :goto_4
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;)V
    .locals 2

    const/4 v0, 0x0

    .line 1324
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Line render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1326
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1328
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1330
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1332
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-nez v0, :cond_2

    goto :goto_0

    .line 1335
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_3

    .line 1336
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1338
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;)Landroid/graphics/Path;

    move-result-object v0

    .line 1339
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1341
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1342
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1344
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1346
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    .line 1348
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarkers(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;)V

    if-eqz v1, :cond_4

    .line 1351
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_4
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;)V
    .locals 3

    const/4 v0, 0x0

    .line 1153
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Path render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1155
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 1158
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1160
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1162
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 1164
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-nez v0, :cond_3

    goto :goto_0

    .line 1167
    :cond_3
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_4

    .line 1168
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1170
    :cond_4
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->getPath()Landroid/graphics/Path;

    move-result-object v0

    .line 1172
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_5

    .line 1173
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculatePathBounds(Landroid/graphics/Path;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 1175
    :cond_5
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1177
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1178
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1180
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1182
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v2, :cond_6

    .line 1183
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getFillTypeFromState()Landroid/graphics/Path$FillType;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 1184
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V

    .line 1186
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v2, :cond_7

    .line 1187
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    .line 1189
    :cond_7
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarkers(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;)V

    if-eqz v1, :cond_8

    .line 1192
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_8
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)V
    .locals 3

    const/4 v0, 0x0

    .line 1375
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "PolyLine render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1377
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1379
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1381
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 1383
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-nez v1, :cond_2

    goto :goto_0

    .line 1386
    :cond_2
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->transform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_3

    .line 1387
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1389
    :cond_3
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    if-eqz v1, :cond_4

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    array-length v0, v0

    :cond_4
    const/4 v1, 0x2

    if-lt v0, v1, :cond_8

    .line 1390
    rem-int/2addr v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    goto :goto_0

    .line 1394
    :cond_5
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Landroid/graphics/Path;

    move-result-object v0

    .line 1395
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1397
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getFillTypeFromState()Landroid/graphics/Path$FillType;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 1399
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1400
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1402
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1404
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v2, :cond_6

    .line 1405
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V

    .line 1406
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v2, :cond_7

    .line 1407
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    .line 1409
    :cond_7
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarkers(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;)V

    if-eqz v1, :cond_8

    .line 1412
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_8
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;)V
    .locals 3

    const/4 v0, 0x0

    .line 1460
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "Polygon render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1462
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1464
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1466
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 1468
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-nez v1, :cond_2

    goto :goto_0

    .line 1471
    :cond_2
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;->transform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_3

    .line 1472
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1474
    :cond_3
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;->points:[F

    if-eqz v1, :cond_4

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;->points:[F

    array-length v0, v0

    :cond_4
    const/4 v1, 0x2

    if-ge v0, v1, :cond_5

    goto :goto_0

    .line 1478
    :cond_5
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Landroid/graphics/Path;

    move-result-object v0

    .line 1479
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1481
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1482
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1484
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1486
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v2, :cond_6

    .line 1487
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V

    .line 1488
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v2, :cond_7

    .line 1489
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    .line 1491
    :cond_7
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarkers(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;)V

    if-eqz v1, :cond_8

    .line 1494
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_8
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;)V
    .locals 3

    const/4 v0, 0x0

    .line 1209
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Rect render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1211
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1214
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1216
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1218
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 1221
    :cond_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_3

    .line 1222
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1224
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makePathAndBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;)Landroid/graphics/Path;

    move-result-object v0

    .line 1225
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1227
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1228
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1230
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1232
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v2, :cond_4

    .line 1233
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doFilledPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Landroid/graphics/Path;)V

    .line 1234
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v2, :cond_5

    .line 1235
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->doStroke(Landroid/graphics/Path;)V

    :cond_5
    if-eqz v1, :cond_6

    .line 1239
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_6
    :goto_0
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;)V
    .locals 4

    .line 618
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makeViewPort(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v0

    .line 620
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V

    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V
    .locals 2

    .line 627
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V

    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V
    .locals 3

    const/4 v0, 0x0

    .line 636
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Svg render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 638
    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_7

    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    if-nez p4, :cond_2

    .line 643
    iget-object p4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-eqz p4, :cond_1

    iget-object p4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_0

    :cond_1
    sget-object p4, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 645
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 647
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_2

    .line 650
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 652
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_4

    .line 653
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-direct {p0, p2, v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setClipRect(FFFF)V

    .line 656
    :cond_4
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    if-eqz p3, :cond_5

    .line 659
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, v0, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateViewBoxTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Landroid/graphics/Matrix;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 660
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object p3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    goto :goto_1

    .line 662
    :cond_5
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object p4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p4, p4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget p4, p4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {p2, p3, p4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 663
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    const/4 p3, 0x0

    iput-object p3, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 666
    :goto_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result p2

    .line 669
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->viewportFill()V

    const/4 p3, 0x1

    .line 671
    invoke-direct {p0, p1, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderChildren(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Z)V

    if-eqz p2, :cond_6

    .line 674
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 676
    :cond_6
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_7
    :goto_2
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .locals 1

    .line 348
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$NotDirectlyRendered;

    if-eqz v0, :cond_0

    return-void

    .line 352
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 354
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkXMLSpaceAttribute(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 356
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_1

    .line 357
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;)V

    goto/16 :goto_0

    .line 358
    :cond_1
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    if-eqz v0, :cond_2

    .line 359
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;)V

    goto/16 :goto_0

    .line 360
    :cond_2
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;

    if-eqz v0, :cond_3

    .line 361
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;)V

    goto/16 :goto_0

    .line 362
    :cond_3
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;

    if-eqz v0, :cond_4

    .line 363
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;)V

    goto :goto_0

    .line 364
    :cond_4
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;

    if-eqz v0, :cond_5

    .line 365
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;)V

    goto :goto_0

    .line 366
    :cond_5
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    if-eqz v0, :cond_6

    .line 367
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;)V

    goto :goto_0

    .line 368
    :cond_6
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    if-eqz v0, :cond_7

    .line 369
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;)V

    goto :goto_0

    .line 370
    :cond_7
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    if-eqz v0, :cond_8

    .line 371
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;)V

    goto :goto_0

    .line 372
    :cond_8
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    if-eqz v0, :cond_9

    .line 373
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;)V

    goto :goto_0

    .line 374
    :cond_9
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;

    if-eqz v0, :cond_a

    .line 375
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;)V

    goto :goto_0

    .line 376
    :cond_a
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;

    if-eqz v0, :cond_b

    .line 377
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;)V

    goto :goto_0

    .line 378
    :cond_b
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    if-eqz v0, :cond_c

    .line 379
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)V

    goto :goto_0

    .line 380
    :cond_c
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    if-eqz v0, :cond_d

    .line 381
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;)V

    .line 385
    :cond_d
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;)V
    .locals 2

    const/4 v0, 0x0

    .line 920
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Switch render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 922
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 924
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 927
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_1

    .line 928
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 931
    :cond_1
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 933
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v0

    .line 935
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderSwitchChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;)V

    if-eqz v0, :cond_2

    .line 938
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 940
    :cond_2
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V
    .locals 4

    const/4 v0, 0x0

    .line 2031
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Symbol render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2033
    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_5

    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 2037
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 2039
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 2041
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object p2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 2043
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_2

    .line 2044
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-direct {p0, p2, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setClipRect(FFFF)V

    .line 2047
    :cond_2
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz p2, :cond_3

    .line 2048
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p0, v1, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateViewBoxTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 2049
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    goto :goto_1

    .line 2051
    :cond_3
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2052
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    const/4 v0, 0x0

    iput-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 2055
    :goto_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result p2

    const/4 v0, 0x1

    .line 2057
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderChildren(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Z)V

    if-eqz p2, :cond_4

    .line 2060
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 2062
    :cond_4
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_5
    :goto_2
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;)V
    .locals 9

    const/4 v0, 0x0

    .line 1503
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "Text render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1505
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1507
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_7

    .line 1510
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->selectTypefaceAndFontStyling()V

    .line 1512
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    if-eqz v1, :cond_1

    .line 1513
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1516
    :cond_1
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->x:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v1, 0x0

    .line 1517
    :goto_1
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    if-eqz v3, :cond_5

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->y:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    goto :goto_3

    :cond_5
    :goto_2
    const/4 v3, 0x0

    .line 1518
    :goto_3
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    if-eqz v4, :cond_7

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_6

    goto :goto_4

    :cond_6
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dx:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    goto :goto_5

    :cond_7
    :goto_4
    const/4 v4, 0x0

    .line 1519
    :goto_5
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    if-eqz v5, :cond_9

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_8

    goto :goto_6

    :cond_8
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->dy:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 1522
    :cond_9
    :goto_6
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getAnchorPosition()Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    move-result-object v0

    .line 1523
    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-eq v0, v5, :cond_b

    .line 1524
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateTextWidth(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)F

    move-result v5

    .line 1525
    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v0, v6, :cond_a

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v5, v0

    :cond_a
    sub-float/2addr v1, v5

    .line 1532
    :cond_b
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v0, :cond_c

    .line 1533
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;

    invoke-direct {v0, p0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FF)V

    .line 1534
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    .line 1535
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v6, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v7, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-direct {v5, v6, v7, v8, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 1537
    :cond_c
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1539
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1540
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1542
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v0

    .line 1544
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;

    add-float/2addr v1, v4

    add-float/2addr v3, v2

    invoke-direct {v5, p0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FF)V

    invoke-direct {p0, p1, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    if-eqz v0, :cond_d

    .line 1547
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_d
    :goto_7
    return-void
.end method

.method private render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;)V
    .locals 7

    const/4 v0, 0x0

    .line 1082
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "Use render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1084
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1085
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 1088
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1090
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    :goto_0
    return-void

    .line 1094
    :cond_3
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v1

    if-nez v1, :cond_4

    .line 1096
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    const-string p1, "Use reference \'%s\' not found"

    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 1100
    :cond_4
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->transform:Landroid/graphics/Matrix;

    if-eqz v0, :cond_5

    .line 1101
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1105
    :cond_5
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v2, 0x0

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    .line 1106
    :goto_1
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v3, :cond_7

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    .line 1107
    :cond_7
    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1109
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1111
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v0

    .line 1113
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentPush(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;)V

    .line 1115
    instance-of v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    const/4 v3, 0x0

    if-eqz v2, :cond_8

    .line 1117
    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    .line 1118
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {p0, v3, v3, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makeViewPort(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v2

    .line 1120
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 1121
    invoke-direct {p0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    .line 1122
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    goto :goto_4

    .line 1124
    :cond_8
    instance-of v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;

    if-eqz v2, :cond_b

    .line 1126
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v4, 0x42c80000    # 100.0f

    if-eqz v2, :cond_9

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_2

    :cond_9
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v2, v4, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    .line 1127
    :goto_2
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v5, :cond_a

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_3

    :cond_a
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v5, v4, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    move-object v4, v5

    .line 1128
    :goto_3
    invoke-direct {p0, v3, v3, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->makeViewPort(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v2

    .line 1130
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 1131
    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;

    invoke-direct {p0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    .line 1132
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    goto :goto_4

    .line 1136
    :cond_b
    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1139
    :goto_4
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentPop()V

    if-eqz v0, :cond_c

    .line 1142
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1144
    :cond_c
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    return-void
.end method

.method private renderChildren(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Z)V
    .locals 1

    if-eqz p2, :cond_0

    .line 395
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentPush(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;)V

    .line 398
    :cond_0
    invoke-interface {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 399
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 403
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentPop()V

    :cond_2
    return-void
.end method

.method private renderMarker(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V
    .locals 10

    .line 3365
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 3368
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->orient:Ljava/lang/Float;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 3370
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->orient:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3372
    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2

    .line 3373
    :cond_0
    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    float-to-double v2, v0

    iget v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    float-to-double v4, v0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v2

    double-to-float v0, v2

    goto :goto_0

    .line 3376
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->orient:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 3380
    :goto_0
    iget-boolean v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerUnitsAreUser:Z

    if-eqz v2, :cond_3

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->dpi:F

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v2

    .line 3384
    :goto_1
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v3

    iput-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 3386
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 3387
    iget v4, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    invoke-virtual {v3, v4, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 3388
    invoke-virtual {v3, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 3389
    invoke-virtual {v3, v2, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 3391
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->refX:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz p2, :cond_4

    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->refX:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {p2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p2

    goto :goto_2

    :cond_4
    const/4 p2, 0x0

    .line 3392
    :goto_2
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->refY:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v0, :cond_5

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->refY:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    goto :goto_3

    :cond_5
    const/4 v0, 0x0

    .line 3393
    :goto_3
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v4, 0x40400000    # 3.0f

    if-eqz v2, :cond_6

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v2

    goto :goto_4

    :cond_6
    const/high16 v2, 0x40400000    # 3.0f

    .line 3394
    :goto_4
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerHeight:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v5, :cond_7

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerHeight:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v4

    .line 3396
    :cond_7
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v5, :cond_e

    .line 3403
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    div-float v5, v2, v5

    .line 3404
    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    div-float v6, v4, v6

    .line 3407
    iget-object v7, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-eqz v7, :cond_8

    iget-object v7, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_5

    :cond_8
    sget-object v7, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 3408
    :goto_5
    sget-object v8, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->STRETCH:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    invoke-virtual {v7, v8}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a

    .line 3410
    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getScale()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    move-result-object v8

    sget-object v9, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    if-ne v8, v9, :cond_9

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    goto :goto_6

    :cond_9
    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    :goto_6
    move v6, v5

    :cond_a
    neg-float p2, p2

    mul-float p2, p2, v5

    neg-float v0, v0

    mul-float v0, v0, v6

    .line 3415
    invoke-virtual {v3, p2, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 3416
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p2, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 3420
    iget-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    mul-float p2, p2, v5

    .line 3421
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float v0, v0, v6

    .line 3424
    sget-object v8, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getAlignment()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object v9

    invoke-virtual {v9}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v9

    aget v8, v8, v9

    const/high16 v9, 0x40000000    # 2.0f

    packed-switch v8, :pswitch_data_0

    const/4 p2, 0x0

    goto :goto_8

    :pswitch_0
    sub-float p2, v2, p2

    goto :goto_7

    :pswitch_1
    sub-float p2, v2, p2

    div-float/2addr p2, v9

    :goto_7
    sub-float p2, v1, p2

    .line 3441
    :goto_8
    sget-object v8, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->getAlignment()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object v7

    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v7

    aget v7, v8, v7

    const/4 v8, 0x2

    if-eq v7, v8, :cond_c

    const/4 v8, 0x3

    if-eq v7, v8, :cond_b

    const/4 v8, 0x5

    if-eq v7, v8, :cond_c

    const/4 v8, 0x6

    if-eq v7, v8, :cond_b

    const/4 v8, 0x7

    if-eq v7, v8, :cond_c

    const/16 v8, 0x8

    if-eq v7, v8, :cond_b

    goto :goto_a

    :cond_b
    sub-float v0, v4, v0

    goto :goto_9

    :cond_c
    sub-float v0, v4, v0

    div-float/2addr v0, v9

    :goto_9
    sub-float/2addr v1, v0

    .line 3458
    :goto_a
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_d

    .line 3459
    invoke-direct {p0, p2, v1, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setClipRect(FFFF)V

    .line 3462
    :cond_d
    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 3463
    invoke-virtual {v3, v5, v6}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 3464
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p2, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    goto :goto_b

    :cond_e
    neg-float p2, p2

    neg-float v0, v0

    .line 3470
    invoke-virtual {v3, p2, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 3471
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p2, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 3473
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_f

    .line 3474
    invoke-direct {p0, v1, v1, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setClipRect(FFFF)V

    .line 3478
    :cond_f
    :goto_b
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result p2

    const/4 v0, 0x0

    .line 3480
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderChildren(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Z)V

    if-eqz p2, :cond_10

    .line 3483
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 3485
    :cond_10
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private renderMarkers(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;)V
    .locals 10

    .line 3248
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    if-nez v0, :cond_0

    goto/16 :goto_6

    .line 3255
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    const-string v1, "Marker reference \'%s\' not found"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_2

    .line 3256
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3258
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;

    goto :goto_0

    .line 3260
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    new-array v5, v4, [Ljava/lang/Object;

    aput-object v0, v5, v3

    invoke-static {v1, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_2
    move-object v0, v2

    .line 3263
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 3264
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 3266
    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;

    goto :goto_1

    .line 3268
    :cond_3
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    new-array v6, v4, [Ljava/lang/Object;

    aput-object v5, v6, v3

    invoke-static {v1, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_4
    move-object v5, v2

    .line 3271
    :goto_1
    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 3272
    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v7, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 3274
    check-cast v6, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;

    goto :goto_2

    .line 3276
    :cond_5
    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    new-array v7, v4, [Ljava/lang/Object;

    aput-object v6, v7, v3

    invoke-static {v1, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_6
    move-object v6, v2

    .line 3280
    :goto_2
    instance-of v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    if-eqz v1, :cond_7

    .line 3281
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->getMarkers()Ljava/util/List;

    move-result-object p1

    goto :goto_3

    .line 3282
    :cond_7
    instance-of v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;

    if-eqz v1, :cond_8

    .line 3283
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateMarkerPositions(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;)Ljava/util/List;

    move-result-object p1

    goto :goto_3

    .line 3285
    :cond_8
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateMarkerPositions(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;)Ljava/util/List;

    move-result-object p1

    :goto_3
    if-nez p1, :cond_9

    goto :goto_6

    .line 3290
    :cond_9
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_a

    goto :goto_6

    .line 3295
    :cond_a
    iget-object v7, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v8, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v8, v8, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v9, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v9, v9, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iput-object v2, v9, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    iput-object v2, v8, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    iput-object v2, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 3298
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-direct {p0, v0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarker(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V

    :cond_b
    if-eqz v5, :cond_d

    .line 3300
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x2

    if-le v0, v2, :cond_d

    .line 3302
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    .line 3303
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    const/4 v3, 0x1

    :goto_4
    add-int/lit8 v7, v1, -0x1

    if-ge v3, v7, :cond_d

    add-int/lit8 v3, v3, 0x1

    .line 3307
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    .line 3308
    iget-boolean v8, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->isAmbiguous:Z

    if-eqz v8, :cond_c

    .line 3309
    invoke-direct {p0, v0, v2, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->realignMarkerMid(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    move-result-object v0

    goto :goto_5

    :cond_c
    move-object v0, v2

    .line 3310
    :goto_5
    invoke-direct {p0, v5, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarker(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V

    move-object v2, v7

    goto :goto_4

    :cond_d
    if-eqz v6, :cond_e

    sub-int/2addr v1, v4

    .line 3317
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-direct {p0, v6, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderMarker(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V

    :cond_e
    :goto_6
    return-void
.end method

.method private renderMask(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V
    .locals 5

    const/4 v0, 0x0

    .line 4871
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "Mask render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4873
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskUnitsAreUser:Ljava/lang/Boolean;

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4878
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    goto :goto_0

    :cond_0
    iget v1, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    .line 4879
    :goto_0
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v3, :cond_1

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    goto :goto_2

    :cond_1
    iget v3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    goto :goto_2

    .line 4888
    :cond_2
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v3, 0x3f99999a    # 1.2f

    if-eqz v1, :cond_3

    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v1

    goto :goto_1

    :cond_3
    const v1, 0x3f99999a    # 1.2f

    .line 4889
    :goto_1
    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v4, :cond_4

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v3

    .line 4892
    :cond_4
    iget v4, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    mul-float v1, v1, v4

    .line 4893
    iget v4, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float v3, v3, v4

    :goto_2
    const/4 v4, 0x0

    cmpl-float v1, v1, v4

    if-eqz v1, :cond_9

    cmpl-float v1, v3, v4

    if-nez v1, :cond_5

    goto :goto_4

    .line 4899
    :cond_5
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush()V

    .line 4901
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->findInheritFromAncestorState(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 4904
    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    .line 4907
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 4910
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 4912
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskContentUnitsAreUser:Ljava/lang/Boolean;

    if-eqz v2, :cond_7

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskContentUnitsAreUser:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_3

    .line 4914
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget v3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget v4, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 4915
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    iget v3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget v4, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 4919
    :cond_7
    :goto_3
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderChildren(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Z)V

    .line 4922
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    if-eqz v1, :cond_8

    .line 4925
    invoke-direct {p0, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    .line 4928
    :cond_8
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    :cond_9
    :goto_4
    return-void
.end method

.method private renderSwitchChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;)V
    .locals 8

    .line 946
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 949
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;->getChildren()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 952
    instance-of v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;

    if-nez v2, :cond_1

    goto :goto_0

    .line 955
    :cond_1
    move-object v2, v1

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;

    .line 958
    invoke-interface {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->getRequiredExtensions()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 962
    :cond_2
    invoke-interface {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->getSystemLanguage()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 963
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    .line 967
    :cond_3
    invoke-interface {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->getRequiredFeatures()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 969
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    if-nez v4, :cond_4

    .line 970
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->initialiseSupportedFeaturesMap()V

    .line 971
    :cond_4
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->supportedFeatures:Ljava/util/HashSet;

    invoke-virtual {v4, v3}, Ljava/util/HashSet;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_0

    .line 976
    :cond_5
    invoke-interface {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->getRequiredFormats()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_8

    .line 978
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    if-nez v4, :cond_6

    goto :goto_0

    .line 980
    :cond_6
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 981
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;->isFormatSupported(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_0

    .line 986
    :cond_8
    invoke-interface {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->getRequiredFonts()Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 988
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    if-nez v3, :cond_9

    goto/16 :goto_0

    .line 990
    :cond_9
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 991
    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v4, v3, v5, v6, v7}, Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;->resolveFont(Ljava/lang/String;FLjava/lang/String;F)Landroid/graphics/Typeface;

    move-result-object v3

    if-nez v3, :cond_a

    goto/16 :goto_0

    .line 997
    :cond_b
    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    :cond_c
    return-void
.end method

.method private renderTextPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;)V
    .locals 6

    const/4 v0, 0x0

    .line 1796
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "TextPath render"

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1798
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V

    .line 1800
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->display()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_1

    .line 1802
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->visible()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 1805
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->selectTypefaceAndFontStyling()V

    .line 1807
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->href:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object v1

    if-nez v1, :cond_2

    .line 1810
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->href:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    const-string p1, "TextPath reference \'%s\' not found"

    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 1814
    :cond_2
    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    .line 1815
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->getPath()Landroid/graphics/Path;

    move-result-object v2

    .line 1817
    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    if-eqz v3, :cond_3

    .line 1818
    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v2, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 1820
    :cond_3
    new-instance v1, Landroid/graphics/PathMeasure;

    invoke-direct {v1, v2, v0}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 1822
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->startOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v3, 0x0

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->startOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v1

    invoke-virtual {v0, p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v0

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    .line 1825
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getAnchorPosition()Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    move-result-object v1

    .line 1826
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-eq v1, v4, :cond_6

    .line 1827
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->calculateTextWidth(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)F

    move-result v4

    .line 1828
    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    if-ne v1, v5, :cond_5

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v4, v1

    :cond_5
    sub-float/2addr v0, v4

    .line 1835
    :cond_6
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkForGradientsAndPatterns(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    .line 1837
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->pushLayer()Z

    move-result v1

    .line 1839
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;

    invoke-direct {v4, p0, v2, v0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Landroid/graphics/Path;FF)V

    invoke-direct {p0, p1, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->enumerateTextSpans(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;)V

    if-eqz v1, :cond_7

    .line 1842
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->popLayer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V

    :cond_7
    :goto_1
    return-void
.end method

.method private requiresCompositing()Z
    .locals 2

    .line 878
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;->isolate:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    if-eq v0, v1, :cond_1

    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_BLEND_MODE:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private resetState()V
    .locals 3

    .line 190
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    .line 191
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    .line 194
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style;->getDefaultStyle()Lcom/flyersoft/components/androidsvg/utils/Style;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V

    .line 196
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 198
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->spacePreserve:Z

    .line 201
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->matrixStack:Ljava/util/Stack;

    .line 206
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentStack:Ljava/util/Stack;

    return-void
.end method

.method private selectTypefaceAndFontStyling()V
    .locals 6

    .line 1555
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    if-eqz v0, :cond_2

    .line 1556
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1557
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    invoke-direct {p0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkGenericFont(Ljava/lang/String;Ljava/lang/Float;Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;)Landroid/graphics/Typeface;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1558
    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    if-eqz v3, :cond_1

    .line 1559
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v3, v1, v2, v4, v5}, Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;->resolveFont(Ljava/lang/String;FLjava/lang/String;F)Landroid/graphics/Typeface;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    if-eqz v1, :cond_0

    :cond_2
    if-nez v1, :cond_3

    .line 1567
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const-string v2, "serif"

    invoke-direct {p0, v2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkGenericFont(Ljava/lang/String;Ljava/lang/Float;Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 1569
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 1570
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 1574
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_FONT_VARIATION_SETTINGS:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 1575
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const-string v3, "wght"

    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->addSetting(Ljava/lang/String;F)V

    .line 1576
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->italic:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    const-string v3, "slnt"

    if-ne v0, v2, :cond_4

    .line 1577
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->VARIATION_ITALIC_VALUE_ON:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const-string v4, "ital"

    invoke-virtual {v0, v4, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->addSetting(Ljava/lang/String;F)V

    .line 1579
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->VARIATION_OBLIQUE_VALUE_ON:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->addSetting(Ljava/lang/String;F)V

    goto :goto_1

    .line 1581
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->oblique:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    if-ne v0, v2, :cond_5

    .line 1582
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->VARIATION_OBLIQUE_VALUE_ON:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->addSetting(Ljava/lang/String;F)V

    .line 1583
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const-string v3, "wdth"

    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->addSetting(Ljava/lang/String;F)V

    .line 1585
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1586
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "fontVariationSettings = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1587
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-static {v2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Ljava/lang/String;)Z

    .line 1588
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-static {v2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Ljava/lang/String;)Z

    .line 1591
    :cond_6
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_FONT_FEATURE_SETTINGS:Z

    if-eqz v0, :cond_7

    .line 1592
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1593
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "fontFeatureSettings = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1594
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 1595
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setFontFeatureSettings(Ljava/lang/String;)V

    :cond_7
    return-void
.end method

.method private setBlendMode(Landroid/graphics/Paint;)V
    .locals 2

    .line 888
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Setting blend mode to "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 889
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    .line 907
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 905
    :pswitch_0
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$10()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 904
    :pswitch_1
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$9()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 903
    :pswitch_2
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$8()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 902
    :pswitch_3
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$7()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 901
    :pswitch_4
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$6()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 900
    :pswitch_5
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$5()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 899
    :pswitch_6
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$4()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 898
    :pswitch_7
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$3()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 897
    :pswitch_8
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 896
    :pswitch_9
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 895
    :pswitch_a
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$14()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 894
    :pswitch_b
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$13()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 893
    :pswitch_c
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$12()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 892
    :pswitch_d
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$11()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    .line 891
    :pswitch_e
    invoke-static {}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m()Landroid/graphics/BlendMode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;Landroid/graphics/BlendMode;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
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

.method private setClipRect(FFFF)V
    .locals 1

    add-float/2addr p3, p1

    add-float/2addr p4, p2

    .line 2750
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    if-eqz v0, :cond_0

    .line 2751
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->left:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    add-float/2addr p1, v0

    .line 2752
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->top:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    add-float/2addr p2, v0

    .line 2753
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->right:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    sub-float/2addr p3, v0

    .line 2754
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->bottom:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    sub-float/2addr p4, v0

    .line 2757
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    return-void
.end method

.method private setPaintColour(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V
    .locals 2

    .line 2677
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    if-eqz p2, :cond_0

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    goto :goto_0

    :cond_0
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeOpacity:Ljava/lang/Float;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 2679
    instance-of v1, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    if-eqz v1, :cond_1

    .line 2680
    check-cast p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iget p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    goto :goto_1

    .line 2681
    :cond_1
    instance-of p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    if-eqz p3, :cond_3

    .line 2682
    iget-object p3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object p3, p3, Lcom/flyersoft/components/androidsvg/utils/Style;->color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iget p3, p3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    .line 2686
    :goto_1
    invoke-static {p3, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->colourWithOpacity(IF)I

    move-result p3

    if-eqz p2, :cond_2

    .line 2688
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    return-void

    .line 2690
    :cond_2
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    :cond_3
    return-void
.end method

.method private setSolidColor(ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;)V
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide v2, 0x180000000L

    const-wide v4, 0x100000000L

    const-wide v6, 0x80000000L

    if-eqz p1, :cond_3

    .line 3908
    iget-object v8, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, v8, v6, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 3910
    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    iput-object v7, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 3911
    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz v7, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    .line 3914
    :cond_1
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, v0, v4, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3916
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->solidOpacity:Ljava/lang/Float;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    .line 3920
    :cond_2
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, p2, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 3923
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    invoke-direct {p0, p2, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setPaintColour(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    return-void

    .line 3928
    :cond_3
    iget-object v8, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, v8, v6, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 3930
    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v6, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    iput-object v7, v6, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 3931
    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v7, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v7, v7, Lcom/flyersoft/components/androidsvg/utils/Style;->solidColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz v7, :cond_4

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    .line 3934
    :cond_5
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, v0, v4, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 3936
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->solidOpacity:Ljava/lang/Float;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeOpacity:Ljava/lang/Float;

    .line 3940
    :cond_6
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, p2, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 3943
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    invoke-direct {p0, p2, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setPaintColour(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    :cond_7
    return-void
.end method

.method private statePop()V
    .locals 1

    .line 434
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 436
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-void
.end method

.method private statePush()V
    .locals 1

    const/4 v0, 0x0

    .line 413
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush(Z)V

    return-void
.end method

.method private statePush(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 421
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvasSaveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 423
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 426
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->stateStack:Ljava/util/Stack;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-virtual {p1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;)V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    return-void
.end method

.method private textXMLSpaceTransform(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 3

    .line 2011
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-boolean v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->spacePreserve:Z

    const-string v1, " "

    if-eqz v0, :cond_0

    .line 2012
    sget-object p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_TABS_OR_LINE_BREAKS:Ljava/util/regex/Pattern;

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 2015
    :cond_0
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_TABS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2016
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_LINE_BREAKS:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p2, :cond_1

    .line 2019
    sget-object p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_START_SPACES:Ljava/util/regex/Pattern;

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_1
    if-eqz p3, :cond_2

    .line 2021
    sget-object p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_END_SPACES:Ljava/util/regex/Pattern;

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2022
    :cond_2
    sget-object p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->PATTERN_DOUBLE_SPACES:Ljava/util/regex/Pattern;

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private updateParentBoundingBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;)V
    .locals 10

    .line 735
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 737
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v0, :cond_1

    goto/16 :goto_1

    .line 741
    :cond_1
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 743
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->matrixStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 744
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 745
    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxX()F

    move-result v3

    iget-object v4, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minY:F

    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 746
    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxX()F

    move-result v5

    iget-object v6, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-virtual {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxY()F

    move-result v6

    iget-object v7, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v7, v7, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->minX:F

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 747
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxY()F

    move-result p1

    const/16 v8, 0x8

    new-array v8, v8, [F

    const/4 v9, 0x0

    aput v1, v8, v9

    const/4 v1, 0x1

    aput v2, v8, v1

    const/4 v2, 0x2

    aput v3, v8, v2

    const/4 v3, 0x3

    aput v4, v8, v3

    const/4 v3, 0x4

    aput v5, v8, v3

    const/4 v3, 0x5

    aput v6, v8, v3

    const/4 v3, 0x6

    aput v7, v8, v3

    const/4 v4, 0x7

    aput p1, v8, v4

    .line 749
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 750
    invoke-virtual {v0, v8}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 752
    new-instance p1, Landroid/graphics/RectF;

    aget v0, v8, v9

    aget v1, v8, v1

    invoke-direct {p1, v0, v1, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    :goto_0
    if-gt v2, v3, :cond_6

    .line 754
    aget v0, v8, v2

    iget v1, p1, Landroid/graphics/RectF;->left:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    aget v0, v8, v2

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 755
    :cond_2
    aget v0, v8, v2

    iget v1, p1, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    aget v0, v8, v2

    iput v0, p1, Landroid/graphics/RectF;->right:F

    :cond_3
    add-int/lit8 v0, v2, 0x1

    .line 756
    aget v1, v8, v0

    iget v4, p1, Landroid/graphics/RectF;->top:F

    cmpg-float v1, v1, v4

    if-gez v1, :cond_4

    aget v1, v8, v0

    iput v1, p1, Landroid/graphics/RectF;->top:F

    .line 757
    :cond_4
    aget v1, v8, v0

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, v1, v4

    if-lez v1, :cond_5

    aget v0, v8, v0

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    :cond_5
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 760
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->parentStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;

    .line 761
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v1, :cond_7

    .line 762
    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1, v2, v3, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->fromLimits(FFFF)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-void

    .line 764
    :cond_7
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    iget v3, p1, Landroid/graphics/RectF;->right:F

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1, v2, v3, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->fromLimits(FFFF)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->union(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    :cond_8
    :goto_1
    return-void
.end method

.method private updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V
    .locals 11

    const-wide/16 v0, 0x1000

    .line 2282
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2284
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    :cond_0
    const-wide/16 v0, 0x800

    .line 2287
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2289
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->opacity:Ljava/lang/Float;

    :cond_1
    const-wide/16 v0, 0x1

    .line 2292
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 2294
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 2295
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz v0, :cond_2

    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->TRANSPARENT:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    if-eq v0, v3, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    :cond_3
    const-wide/16 v3, 0x4

    .line 2298
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2300
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillOpacity:Ljava/lang/Float;

    :cond_4
    const-wide/16 v3, 0x1805

    .line 2304
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2306
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    invoke-direct {p0, p1, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setPaintColour(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    :cond_5
    const-wide/16 v3, 0x2

    .line 2309
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2311
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fillRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    :cond_6
    const-wide/16 v3, 0x8

    .line 2315
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 2317
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    .line 2318
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    if-eqz v0, :cond_7

    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->TRANSPARENT:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    if-eq v0, v3, :cond_7

    const/4 v0, 0x1

    goto :goto_1

    :cond_7
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    :cond_8
    const-wide/16 v3, 0x10

    .line 2321
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2323
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeOpacity:Ljava/lang/Float;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeOpacity:Ljava/lang/Float;

    :cond_9
    const-wide/16 v3, 0x1818

    .line 2326
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 2328
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stroke:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    invoke-direct {p0, p1, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->setPaintColour(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;ZLcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    :cond_a
    const-wide v3, 0x800000000L

    .line 2331
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2333
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->vectorEffect:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    :cond_b
    const-wide/16 v3, 0x20

    .line 2336
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 2338
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2339
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v3

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_c
    const-wide/16 v3, 0x40

    .line 2342
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eqz v0, :cond_10

    .line 2344
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineCap:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    iput-object v5, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineCap:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    .line 2345
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineCap:[I

    iget-object v5, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineCap:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->ordinal()I

    move-result v5

    aget v0, v0, v5

    if-eq v0, v2, :cond_f

    if-eq v0, v4, :cond_e

    if-eq v0, v3, :cond_d

    goto :goto_2

    .line 2354
    :cond_d
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    goto :goto_2

    .line 2351
    :cond_e
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    goto :goto_2

    .line 2348
    :cond_f
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    :cond_10
    :goto_2
    const-wide/16 v5, 0x80

    .line 2361
    invoke-direct {p0, p2, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 2363
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v5, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineJoin:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    iput-object v5, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineJoin:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    .line 2364
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineJoin:[I

    iget-object v5, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeLineJoin:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->ordinal()I

    move-result v5

    aget v0, v0, v5

    if-eq v0, v2, :cond_13

    if-eq v0, v4, :cond_12

    if-eq v0, v3, :cond_11

    goto :goto_3

    .line 2373
    :cond_11
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    goto :goto_3

    .line 2370
    :cond_12
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    goto :goto_3

    .line 2367
    :cond_13
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    :cond_14
    :goto_3
    const-wide/16 v3, 0x100

    .line 2380
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2383
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeMiterLimit:Ljava/lang/Float;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeMiterLimit:Ljava/lang/Float;

    .line 2384
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeMiterLimit:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    :cond_15
    const-wide/16 v3, 0x200

    .line 2387
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 2389
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :cond_16
    const-wide/16 v3, 0x400

    .line 2392
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 2394
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :cond_17
    const-wide/16 v3, 0x600

    .line 2397
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 2400
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v3, 0x0

    if-nez v0, :cond_18

    .line 2402
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    goto :goto_6

    .line 2407
    :cond_18
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    array-length v0, v0

    .line 2410
    rem-int/lit8 v4, v0, 0x2

    if-nez v4, :cond_19

    move v4, v0

    goto :goto_4

    :cond_19
    mul-int/lit8 v4, v0, 0x2

    .line 2411
    :goto_4
    new-array v5, v4, [F

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_5
    if-ge v7, v4, :cond_1a

    .line 2413
    iget-object v9, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v9, v9, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashArray:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    rem-int v10, v7, v0

    aget-object v9, v9, v10

    invoke-virtual {v9, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v9

    aput v9, v5, v7

    add-float/2addr v8, v9

    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    :cond_1a
    cmpl-float v0, v8, v6

    if-nez v0, :cond_1b

    .line 2417
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    goto :goto_6

    .line 2419
    :cond_1b
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->strokeDashOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    cmpg-float v3, v0, v6

    if-gez v3, :cond_1c

    rem-float/2addr v0, v8

    add-float/2addr v0, v8

    .line 2425
    :cond_1c
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/DashPathEffect;

    invoke-direct {v4, v5, v0}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    :cond_1d
    :goto_6
    const-wide/16 v3, 0x4000

    .line 2430
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 2432
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getCurrentFontSize()F

    move-result v0

    .line 2433
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v4, v3, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2434
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 2435
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v4, p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v0

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_1e
    const-wide/16 v3, 0x2000

    .line 2438
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2440
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    :cond_1f
    const-wide/32 v3, 0x8000

    .line 2443
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 2447
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v3, 0x1

    const/high16 v4, 0x442f0000    # 700.0f

    const/high16 v5, 0x43c80000    # 400.0f

    const v6, 0x44098000    # 550.0f

    cmpl-float v0, v0, v3

    if-nez v0, :cond_22

    .line 2449
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v7, v0, v3

    if-ltz v7, :cond_20

    cmpg-float v7, v0, v6

    if-gez v7, :cond_20

    .line 2451
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    goto/16 :goto_7

    :cond_20
    const v3, 0x443b8000    # 750.0f

    cmpl-float v6, v0, v6

    if-ltz v6, :cond_21

    cmpg-float v6, v0, v3

    if-gez v6, :cond_21

    .line 2453
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    goto :goto_7

    :cond_21
    cmpl-float v0, v0, v3

    if-ltz v0, :cond_26

    .line 2455
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    goto :goto_7

    .line 2457
    :cond_22
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const v3, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v0, v0, v3

    if-nez v0, :cond_25

    .line 2459
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v3, 0x43af0000    # 350.0f

    cmpg-float v7, v0, v3

    if-gez v7, :cond_23

    .line 2461
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    goto :goto_7

    :cond_23
    cmpl-float v3, v0, v3

    if-ltz v3, :cond_24

    cmpg-float v3, v0, v6

    if-gez v3, :cond_24

    .line 2463
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    goto :goto_7

    :cond_24
    cmpl-float v3, v0, v6

    if-ltz v3, :cond_26

    const/high16 v3, 0x44610000    # 900.0f

    cmpg-float v0, v0, v3

    if-gez v0, :cond_26

    .line 2465
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    goto :goto_7

    .line 2468
    :cond_25
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    :cond_26
    :goto_7
    const-wide/32 v3, 0x10000

    .line 2471
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 2473
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    :cond_27
    const-wide/high16 v3, 0x8000000000000L

    .line 2476
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 2479
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    :cond_28
    const-wide/32 v3, 0x20000

    .line 2482
    invoke-direct {p0, p2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 2484
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    iput-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 2485
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->LineThrough:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    if-ne v3, v4, :cond_29

    const/4 v3, 0x1

    goto :goto_8

    :cond_29
    const/4 v3, 0x0

    :goto_8
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrikeThruText(Z)V

    .line 2486
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Underline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    if-ne v3, v4, :cond_2a

    const/4 v3, 0x1

    goto :goto_9

    :cond_2a
    const/4 v3, 0x0

    :goto_9
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 2489
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_STROKED_UNDERLINES:Z

    if-eqz v0, :cond_2d

    .line 2490
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->LineThrough:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    if-ne v3, v4, :cond_2b

    const/4 v3, 0x1

    goto :goto_a

    :cond_2b
    const/4 v3, 0x0

    :goto_a
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrikeThruText(Z)V

    .line 2491
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object v3, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textDecoration:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Underline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    if-ne v3, v4, :cond_2c

    const/4 v1, 0x1

    :cond_2c
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    :cond_2d
    const-wide v0, 0x1000000000L

    .line 2495
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 2497
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->direction:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->direction:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    :cond_2e
    const-wide/32 v0, 0x40000

    .line 2500
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 2502
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textAnchor:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    :cond_2f
    const-wide/32 v0, 0x80000

    .line 2505
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 2507
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->overflow:Ljava/lang/Boolean;

    :cond_30
    const-wide/32 v0, 0x200000

    .line 2510
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 2512
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerStart:Ljava/lang/String;

    :cond_31
    const-wide/32 v0, 0x400000

    .line 2515
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 2517
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerMid:Ljava/lang/String;

    :cond_32
    const-wide/32 v0, 0x800000

    .line 2520
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 2522
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->markerEnd:Ljava/lang/String;

    :cond_33
    const-wide/32 v0, 0x1000000

    .line 2525
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 2527
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->display:Ljava/lang/Boolean;

    :cond_34
    const-wide/32 v0, 0x2000000

    .line 2530
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 2532
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->visibility:Ljava/lang/Boolean;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->visibility:Ljava/lang/Boolean;

    :cond_35
    const-wide/32 v0, 0x100000

    .line 2535
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 2537
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clip:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    :cond_36
    const-wide/32 v0, 0x10000000

    .line 2540
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 2542
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipPath:Ljava/lang/String;

    :cond_37
    const-wide/32 v0, 0x20000000

    .line 2545
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 2547
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->clipRule:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    :cond_38
    const-wide/32 v0, 0x40000000

    .line 2550
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 2552
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mask:Ljava/lang/String;

    :cond_39
    const-wide/32 v0, 0x4000000

    .line 2555
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 2557
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopColor:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    :cond_3a
    const-wide/32 v0, 0x8000000

    .line 2560
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 2562
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->stopOpacity:Ljava/lang/Float;

    :cond_3b
    const-wide v0, 0x200000000L

    .line 2565
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 2567
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    :cond_3c
    const-wide v0, 0x400000000L

    .line 2570
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 2572
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    :cond_3d
    const-wide v0, 0x2000000000L

    .line 2575
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 2577
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->imageRendering:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->imageRendering:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    :cond_3e
    const-wide v0, 0x4000000000L

    .line 2580
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 2582
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->isolation:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    :cond_3f
    const-wide v0, 0x8000000000L

    .line 2585
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 2587
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->mixBlendMode:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    :cond_40
    const-wide/high16 v0, 0x2000000000000L

    .line 2590
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 2592
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    .line 2593
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applyKerning(Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;)V

    :cond_41
    const-wide v0, 0x200000000000L

    .line 2596
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 2598
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 2599
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    :cond_42
    const-wide v0, 0x10000000000L

    .line 2602
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 2604
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 2605
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    :cond_43
    const-wide v0, 0x20000000000L

    .line 2608
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 2610
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 2611
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    :cond_44
    const-wide v0, 0x40000000000L

    .line 2614
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 2616
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 2617
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    :cond_45
    const-wide v0, 0x80000000000L

    .line 2620
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 2622
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 2623
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    :cond_46
    const-wide v0, 0x100000000000L

    .line 2626
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 2628
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 2629
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontFeatureSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;)V

    .line 2632
    :cond_47
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_FONT_VARIATION_SETTINGS:Z

    if-eqz v0, :cond_48

    const-wide/high16 v0, 0x4000000000000L

    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 2634
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    .line 2635
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fontVariationSet:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;->applySettings(Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;)V

    :cond_48
    const-wide v0, 0x400000000000L

    .line 2638
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 2640
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->writingMode:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->writingMode:Lcom/flyersoft/components/androidsvg/utils/Style$WritingMode;

    :cond_49
    const-wide v0, 0x800000000000L

    .line 2643
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 2645
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->glyphOrientationVertical:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->glyphOrientationVertical:Lcom/flyersoft/components/androidsvg/utils/Style$GlypOrientationVertical;

    :cond_4a
    const-wide/high16 v0, 0x1000000000000L

    .line 2648
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 2650
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->textOrientation:Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->textOrientation:Lcom/flyersoft/components/androidsvg/utils/Style$TextOrientation;

    :cond_4b
    const-wide/high16 v0, 0x10000000000000L

    .line 2653
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 2655
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2656
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_LETTER_SPACING:Z

    if-eqz v0, :cond_4c

    .line 2658
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getCurrentFontSize()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    .line 2659
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getCurrentFontSize()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    :cond_4c
    const-wide/high16 v0, 0x20000000000000L

    .line 2663
    invoke-direct {p0, p2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->isSpecified(Lcom/flyersoft/components/androidsvg/utils/Style;J)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 2665
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2666
    sget-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->SUPPORTS_PAINT_WORD_SPACING:Z

    if-eqz v0, :cond_4d

    .line 2667
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;F)V

    .line 2668
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/Style;->wordSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {p2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Paint;F)V

    :cond_4d
    return-void
.end method

.method private updateStyleForElement(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)V
    .locals 4

    .line 479
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 480
    :goto_0
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/Style;->resetNonInheritingProperties(Z)V

    .line 483
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    if-eqz v0, :cond_1

    .line 484
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V

    .line 487
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->hasCSSRules()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 489
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getCSSRules()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;

    .line 491
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->ruleMatchContext:Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->selector:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    invoke-static {v2, v3, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 492
    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V

    goto :goto_1

    .line 498
    :cond_3
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    if-eqz v0, :cond_4

    .line 499
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->updateStyle(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;Lcom/flyersoft/components/androidsvg/utils/Style;)V

    :cond_4
    return-void
.end method

.method private viewportFill()V
    .locals 2

    .line 2767
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    if-eqz v0, :cond_0

    .line 2768
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    goto :goto_0

    .line 2769
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFill:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    if-eqz v0, :cond_2

    .line 2770
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->color:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    .line 2774
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    if-eqz v1, :cond_1

    .line 2775
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/Style;->viewportFillOpacity:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->colourWithOpacity(IF)I

    move-result v0

    .line 2777
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_2
    return-void
.end method

.method private visible()Z
    .locals 1

    .line 2182
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->visibility:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 2183
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->visibility:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private static varargs warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 586
    const-string v0, "SVGAndroidRenderer"

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method getCurrentFontSize()F
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    return v0
.end method

.method getCurrentFontXHeight()F
    .locals 2

    .line 241
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    return v0
.end method

.method getDPI()F
    .locals 1

    .line 228
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->dpi:F

    return v0
.end method

.method getEffectiveViewPortInUserUnits()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-object v0

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->state:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-object v0
.end method

.method renderDocument(Lcom/flyersoft/components/androidsvg/utils/SVGBase;Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V
    .locals 7

    if-eqz p2, :cond_c

    .line 267
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 269
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getRootElement()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 272
    const-string p1, "Nothing to render. Document is empty."

    new-array p2, v1, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 279
    :cond_0
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasView()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    .line 281
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementById(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    move-result-object v2

    .line 282
    instance-of v4, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;

    const-string v5, "SVGAndroidRenderer"

    if-nez v4, :cond_1

    .line 283
    iget-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v1

    const-string p1, "View element with id \"%s\" not found."

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 286
    :cond_1
    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;

    .line 288
    iget-object v4, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v4, :cond_2

    .line 289
    iget-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    new-array p2, v3, [Ljava/lang/Object;

    aput-object p1, p2, v1

    const-string p1, "View element with id \"%s\" is missing a viewBox attribute."

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 292
    :cond_2
    iget-object v1, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 293
    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_1

    .line 297
    :cond_3
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasViewBox()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    goto :goto_0

    .line 298
    :cond_4
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 299
    :goto_0
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasPreserveAspectRatio()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    goto :goto_1

    .line 300
    :cond_5
    iget-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 303
    :goto_1
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasCss()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 304
    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 305
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;->RenderOptions:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    iget-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {v4, v5, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    .line 306
    iget-object v5, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parse(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->addCSSRules(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V

    goto :goto_2

    .line 307
    :cond_6
    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    if-eqz v4, :cond_7

    .line 308
    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    invoke-virtual {p1, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->addCSSRules(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V

    .line 311
    :cond_7
    :goto_2
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasTarget()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 312
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;

    invoke-direct {v4}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;-><init>()V

    iput-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->ruleMatchContext:Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;

    .line 313
    iget-object v5, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    invoke-virtual {p1, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementById(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;->targetElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    .line 317
    :cond_8
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->resetState()V

    .line 319
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->checkXMLSpaceAttribute(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 322
    invoke-direct {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePush(Z)V

    .line 324
    new-instance v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;)V

    .line 326
    iget-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v4, :cond_9

    .line 327
    iget-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v5, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    invoke-virtual {v4, p0, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v4

    iput v4, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    .line 328
    :cond_9
    iget-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v4, :cond_a

    .line 329
    iget-object v4, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v5, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    invoke-virtual {v4, p0, v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F

    move-result v4

    iput v4, v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    .line 332
    :cond_a
    invoke-direct {p0, v0, v3, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->render(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V

    .line 335
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->statePop()V

    .line 337
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasCss()Z

    move-result p2

    if-eqz p2, :cond_b

    .line 338
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->clearRenderCSSRules()V

    :cond_b
    return-void

    .line 265
    :cond_c
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "renderOptions shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
