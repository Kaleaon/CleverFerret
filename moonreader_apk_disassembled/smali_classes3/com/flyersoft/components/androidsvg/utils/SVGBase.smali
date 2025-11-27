.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.super Ljava/lang/Object;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Defs;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$NotDirectlyRendered;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;,
        Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;
    }
.end annotation


# static fields
.field private static final DEFAULT_PICTURE_HEIGHT:I = 0x200

.field private static final DEFAULT_PICTURE_WIDTH:I = 0x200

.field private static final SQRT2:D = 1.414213562373095

.field private static enableInternalEntitiesSingleton:Z = true

.field private static externalFileResolverSingleton:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;


# instance fields
.field private final cssRules:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

.field private desc:Ljava/lang/String;

.field private final enableInternalEntities:Z

.field private final externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

.field private final idToElementMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;",
            ">;"
        }
    .end annotation
.end field

.field private renderDPI:F

.field private rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(ZLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V
    .locals 1

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 101
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->title:Ljava/lang/String;

    .line 105
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->desc:Ljava/lang/String;

    const/high16 v0, 0x42c00000    # 96.0f

    .line 108
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    .line 111
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->cssRules:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->idToElementMap:Ljava/util/Map;

    .line 143
    iput-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->enableInternalEntities:Z

    .line 144
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-void
.end method

.method protected static createParser()Lcom/flyersoft/components/androidsvg/utils/SVGParser;
    .locals 2

    .line 981
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;-><init>()V

    sget-boolean v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->enableInternalEntitiesSingleton:Z

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->setInternalEntitiesEnabled(Z)Lcom/flyersoft/components/androidsvg/utils/SVGParser;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolverSingleton:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    .line 982
    invoke-interface {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParser;->setExternalFileResolver(Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)Lcom/flyersoft/components/androidsvg/utils/SVGParser;

    move-result-object v0

    return-object v0
.end method

.method private cssQuotedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1017
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1020
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\\""

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 1022
    :cond_0
    const-string v0, "\'"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1025
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\\'"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1028
    :cond_1
    :goto_0
    const-string v0, "\\\n"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\\A"

    const-string v1, "\n"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static deregisterExternalFileResolver()V
    .locals 1

    const/4 v0, 0x0

    .line 353
    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolverSingleton:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-void
.end method

.method private getDocumentDimensions(F)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;
    .locals 5

    .line 1034
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1035
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v2, -0x40800000    # -1.0f

    if-eqz v0, :cond_5

    .line 1037
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v3, v4, :cond_5

    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->em:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v3, v4, :cond_5

    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->ex:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-ne v3, v4, :cond_0

    goto :goto_2

    .line 1040
    :cond_0
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v0

    if-eqz v1, :cond_3

    .line 1044
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v3, v4, :cond_2

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->em:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v3, v4, :cond_2

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->ex:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-ne v3, v4, :cond_1

    goto :goto_0

    .line 1047
    :cond_1
    invoke-virtual {v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result p1

    goto :goto_1

    .line 1045
    :cond_2
    :goto_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p1, v2, v2, v2, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    return-object p1

    .line 1051
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz p1, :cond_4

    .line 1052
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float p1, p1, v0

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    div-float/2addr p1, v1

    goto :goto_1

    :cond_4
    move p1, v0

    .line 1057
    :goto_1
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    return-object v1

    .line 1038
    :cond_5
    :goto_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {p1, v2, v2, v2, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    return-object p1
.end method

.method private getElementById(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;
    .locals 3

    .line 2153
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    .line 2154
    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->id:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 2156
    :cond_0
    invoke-interface {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 2158
    instance-of v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    if-nez v1, :cond_2

    goto :goto_0

    .line 2160
    :cond_2
    move-object v1, v0

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    .line 2161
    iget-object v2, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->id:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    return-object v1

    .line 2163
    :cond_3
    instance-of v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v1, :cond_1

    .line 2165
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-direct {p0, v0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementById(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method

.method private getElementsByTagName(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;",
            ">;"
        }
    .end annotation

    .line 2176
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2179
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    invoke-direct {p0, v0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementsByTagName(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Ljava/lang/String;)V

    return-object v0
.end method

.method private getElementsByTagName(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;",
            ">;",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 2187
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2188
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2190
    :cond_0
    instance-of v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_1

    .line 2192
    check-cast p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 2193
    invoke-direct {p0, p1, v0, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementsByTagName(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static getFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 232
    :try_start_0
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->createParser()Lcom/flyersoft/components/androidsvg/utils/SVGParser;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParser;->parseStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-object p1

    :catchall_0
    move-exception p1

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 239
    :catch_1
    throw p1
.end method

.method public static getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 158
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->createParser()Lcom/flyersoft/components/androidsvg/utils/SVGParser;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParser;->parseStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    return-object p0
.end method

.method public static getFromResource(Landroid/content/Context;I)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 187
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getFromResource(Landroid/content/res/Resources;I)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    return-object p0
.end method

.method public static getFromResource(Landroid/content/res/Resources;I)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 203
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0

    .line 206
    :try_start_0
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->createParser()Lcom/flyersoft/components/androidsvg/utils/SVGParser;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParser;->parseStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-object p1

    :catchall_0
    move-exception p1

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 213
    :catch_1
    throw p1
.end method

.method public static getFromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 172
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->createParser()Lcom/flyersoft/components/androidsvg/utils/SVGParser;

    move-result-object v0

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-interface {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParser;->parseStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    return-object p0
.end method

.method public static parsePath(Ljava/lang/String;)Landroid/graphics/Path;
    .locals 1

    .line 271
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parsePath(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    move-result-object p0

    .line 272
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    .line 273
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->getPath()Landroid/graphics/Path;

    move-result-object p0

    return-object p0
.end method

.method public static registerExternalFileResolver(Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V
    .locals 0

    .line 341
    sput-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolverSingleton:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-void
.end method

.method public static setInternalEntitiesEnabled(Z)V
    .locals 0

    .line 304
    sput-boolean p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->enableInternalEntitiesSingleton:Z

    return-void
.end method


# virtual methods
.method addCSSRules(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V
    .locals 1

    .line 1067
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->cssRules:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->addAll(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V

    return-void
.end method

.method clearRenderCSSRules()V
    .locals 2

    .line 1085
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->cssRules:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;->RenderOptions:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->removeFromSource(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;)V

    return-void
.end method

.method getCSSRules()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;",
            ">;"
        }
    .end annotation

    .line 1073
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->cssRules:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->getRules()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentAspectRatio()F
    .locals 5

    .line 951
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_4

    .line 954
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 955
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v2, -0x40800000    # -1.0f

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 958
    iget-object v3, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v3, v4, :cond_2

    iget-object v3, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v3, v4, :cond_2

    .line 960
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isZero()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 962
    :cond_0
    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v0

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v1

    :goto_0
    div-float/2addr v0, v1

    return v0

    :cond_1
    :goto_1
    return v2

    .line 966
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3

    .line 967
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    goto :goto_0

    :cond_3
    return v2

    .line 952
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentDescription()Ljava/lang/String;
    .locals 2

    .line 685
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 688
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->desc:Ljava/lang/String;

    return-object v0

    .line 686
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentHeight()F
    .locals 2

    .line 809
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 812
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentDimensions(F)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v0

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    return v0

    .line 810
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentPreserveAspectRatio()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
    .locals 2

    .line 927
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_1

    .line 930
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 933
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    return-object v0

    .line 928
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentSVGVersion()Ljava/lang/String;
    .locals 2

    .line 701
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 704
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->version:Ljava/lang/String;

    return-object v0

    .line 702
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentTitle()Ljava/lang/String;
    .locals 2

    .line 669
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 672
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->title:Ljava/lang/String;

    return-object v0

    .line 670
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentViewBox()Landroid/graphics/RectF;
    .locals 2

    .line 888
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_1

    .line 891
    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 894
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->toRectF()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 889
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocumentWidth()F
    .locals 2

    .line 752
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 755
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentDimensions(F)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v0

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    return v0

    .line 753
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getElementById(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;
    .locals 2

    if-eqz p1, :cond_3

    .line 2136
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2138
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2139
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    return-object p1

    .line 2141
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->idToElementMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2142
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->idToElementMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    return-object p1

    .line 2145
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementById(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    move-result-object v0

    .line 2146
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->idToElementMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_3
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getExternalFileResolver()Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;
    .locals 1

    .line 368
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-object v0
.end method

.method public getRenderDPI()F
    .locals 1

    .line 395
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    return v0
.end method

.method public getRootElement()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;
    .locals 1

    .line 991
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    return-object v0
.end method

.method public getViewList()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 719
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_2

    .line 722
    const-string v0, "view"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementsByTagName(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 724
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 725
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 727
    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;

    .line 728
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->id:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 729
    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->id:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 731
    :cond_0
    const-string v2, "AndroidSVG"

    const-string v3, "getViewList(): found a <view> without an id attribute"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    return-object v1

    .line 720
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG document is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method hasCSSRules()Z
    .locals 1

    .line 1079
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->cssRules:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isInternalEntitiesEnabled()Z
    .locals 1

    .line 321
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->enableInternalEntities:Z

    return v0
.end method

.method public renderToCanvas(Landroid/graphics/Canvas;)V
    .locals 2

    const/4 v0, 0x0

    .line 559
    move-object v1, v0

    check-cast v1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V

    return-void
.end method

.method public renderToCanvas(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 4

    .line 572
    new-instance v0, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    if-eqz p2, :cond_0

    .line 575
    iget v1, p2, Landroid/graphics/RectF;->left:F

    iget v2, p2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p2

    invoke-virtual {v0, v1, v2, v3, p2}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    goto :goto_0

    .line 577
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, p2, v1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 580
    :goto_0
    new-instance p2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {p2, p1, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;-><init>(Landroid/graphics/Canvas;FLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    .line 582
    invoke-virtual {p2, p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderDocument(Lcom/flyersoft/components/androidsvg/utils/SVGBase;Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V

    return-void
.end method

.method public renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V
    .locals 3

    if-nez p2, :cond_0

    .line 597
    new-instance p2, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {p2}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    .line 599
    :cond_0
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/RenderOptions;->hasViewPort()Z

    move-result v0

    if-nez v0, :cond_1

    .line 600
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {p2, v2, v2, v0, v1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 603
    :cond_1
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {v0, p1, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;-><init>(Landroid/graphics/Canvas;FLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    .line 605
    invoke-virtual {v0, p0, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderDocument(Lcom/flyersoft/components/androidsvg/utils/SVGBase;Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V

    return-void
.end method

.method public renderToPicture()Landroid/graphics/Picture;
    .locals 1

    const/4 v0, 0x0

    .line 414
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object v0

    return-object v0
.end method

.method public renderToPicture(II)Landroid/graphics/Picture;
    .locals 1

    const/4 v0, 0x0

    .line 428
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1
.end method

.method public renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;
    .locals 3

    .line 494
    new-instance v0, Landroid/graphics/Picture;

    invoke-direct {v0}, Landroid/graphics/Picture;-><init>()V

    .line 495
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    move-result-object v1

    if-eqz p3, :cond_0

    .line 497
    iget-object v2, p3, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez v2, :cond_2

    :cond_0
    if-nez p3, :cond_1

    .line 498
    new-instance p3, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    invoke-direct {p3}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;-><init>()V

    goto :goto_0

    :cond_1
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    invoke-direct {v2, p3}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;-><init>(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V

    move-object p3, v2

    :goto_0
    int-to-float p1, p1

    int-to-float p2, p2

    const/4 v2, 0x0

    .line 499
    invoke-virtual {p3, v2, v2, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    .line 502
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    iget p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {p1, v1, p2, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;-><init>(Landroid/graphics/Canvas;FLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    .line 504
    invoke-virtual {p1, p0, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderDocument(Lcom/flyersoft/components/androidsvg/utils/SVGBase;Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V

    .line 506
    invoke-virtual {v0}, Landroid/graphics/Picture;->endRecording()V

    return-object v0
.end method

.method public renderToPicture(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;
    .locals 4

    if-eqz p1, :cond_0

    .line 443
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasViewBox()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    goto :goto_0

    .line 444
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    :goto_0
    if-eqz p1, :cond_1

    .line 447
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasViewPort()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 449
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxX()F

    move-result v0

    .line 450
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->maxY()F

    move-result v1

    float-to-double v2, v0

    .line 451
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1

    .line 453
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-eq v1, v2, :cond_2

    .line 456
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v0

    .line 457
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v1

    float-to-double v2, v0

    .line 458
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1

    .line 460
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    .line 464
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v1

    .line 465
    iget v2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float v2, v2, v1

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    div-float/2addr v2, v0

    float-to-double v0, v1

    .line 466
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    float-to-double v1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1

    .line 468
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-eqz v1, :cond_4

    if-eqz v0, :cond_4

    .line 471
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(F)F

    move-result v1

    .line 472
    iget v2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    mul-float v2, v2, v1

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    div-float/2addr v2, v0

    float-to-double v2, v2

    .line 473
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1

    :cond_4
    const/16 v0, 0x200

    .line 477
    invoke-virtual {p0, v0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1
.end method

.method public renderViewToCanvas(Ljava/lang/String;Landroid/graphics/Canvas;)V
    .locals 1

    .line 625
    invoke-static {}, Lcom/flyersoft/components/androidsvg/RenderOptions;->create()Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V

    return-void
.end method

.method public renderViewToCanvas(Ljava/lang/String;Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 3

    .line 646
    invoke-static {}, Lcom/flyersoft/components/androidsvg/RenderOptions;->create()Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    if-eqz p3, :cond_0

    .line 649
    iget v0, p3, Landroid/graphics/RectF;->left:F

    iget v1, p3, Landroid/graphics/RectF;->top:F

    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result p3

    invoke-virtual {p1, v0, v1, v2, p3}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 652
    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V

    return-void
.end method

.method public renderViewToPicture(Ljava/lang/String;II)Landroid/graphics/Picture;
    .locals 4

    .line 528
    new-instance v0, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    .line 529
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    int-to-float v1, p2

    int-to-float v2, p3

    const/4 v3, 0x0

    .line 530
    invoke-virtual {p1, v3, v3, v1, v2}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 533
    new-instance p1, Landroid/graphics/Picture;

    invoke-direct {p1}, Landroid/graphics/Picture;-><init>()V

    .line 534
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    move-result-object p2

    .line 536
    new-instance p3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {p3, p2, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;-><init>(Landroid/graphics/Canvas;FLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    .line 538
    invoke-virtual {p3, p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->renderDocument(Lcom/flyersoft/components/androidsvg/utils/SVGBase;Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V

    .line 540
    invoke-virtual {p1}, Landroid/graphics/Picture;->endRecording()V

    return-object p1
.end method

.method resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1006
    :cond_0
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->cssQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1007
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    const-string v1, "#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1009
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getElementById(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v0
.end method

.method setDesc(Ljava/lang/String;)V
    .locals 0

    .line 1964
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->desc:Ljava/lang/String;

    return-void
.end method

.method public setDocumentHeight(F)V
    .locals 2

    .line 826
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 829
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(F)V

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-void

    .line 827
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SVG document is empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDocumentHeight(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 844
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 847
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-void

    .line 845
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SVG document is empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDocumentPreserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V
    .locals 1

    .line 910
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 913
    iput-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    return-void

    .line 911
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SVG document is empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDocumentViewBox(FFFF)V
    .locals 2

    .line 872
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 875
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-void

    .line 873
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "SVG document is empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDocumentWidth(F)V
    .locals 2

    .line 769
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 772
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(F)V

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-void

    .line 770
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SVG document is empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDocumentWidth(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 787
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    if-eqz v0, :cond_0

    .line 790
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-void

    .line 788
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SVG document is empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setRenderDPI(F)V
    .locals 0

    .line 384
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderDPI:F

    return-void
.end method

.method setRootElement(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;)V
    .locals 0

    .line 997
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->rootElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    return-void
.end method

.method setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1958
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->title:Ljava/lang/String;

    return-void
.end method
