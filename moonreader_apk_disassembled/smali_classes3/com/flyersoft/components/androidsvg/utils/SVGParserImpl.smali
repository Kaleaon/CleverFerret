.class Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;
.super Ljava/lang/Object;
.source "SVGParserImpl.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$XPPAttributesWrapper;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$ColourKeywords;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontWeightKeywords;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontStretchKeywords;,
        Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontSizeKeywords;
    }
.end annotation


# static fields
.field static final CURRENTCOLOR:Ljava/lang/String; = "currentColor"

.field public static final ENTITY_WATCH_BUFFER_SIZE:I = 0x1000

.field private static final FEATURE_STRING_PREFIX:Ljava/lang/String; = "http://www.w3.org/TR/SVG11/feature#"

.field private static final FORCE_SAX_ON_EARLY_ANDROIDS:Z

.field static final NONE:Ljava/lang/String; = "none"

.field private static final PATTERN_BLOCK_COMMENTS:Ljava/util/regex/Pattern;

.field private static final SVG_NAMESPACE:Ljava/lang/String; = "http://www.w3.org/2000/svg"

.field private static final TAG:Ljava/lang/String; = "SVGParser"

.field static final VALID_DISPLAY_VALUES:Ljava/lang/String; = "|inline|block|list-item|run-in|compact|marker|table|inline-table|table-row-group|table-header-group|table-footer-group|table-row|table-column-group|table-column|table-cell|table-caption|none|"

.field static final VALID_VISIBILITY_VALUES:Ljava/lang/String; = "|visible|hidden|collapse|"

.field private static final XLINK_NAMESPACE:Ljava/lang/String; = "http://www.w3.org/1999/xlink"

.field public static final XML_STYLESHEET_ATTR_ALTERNATE:Ljava/lang/String; = "alternate"

.field public static final XML_STYLESHEET_ATTR_ALTERNATE_NO:Ljava/lang/String; = "no"

.field public static final XML_STYLESHEET_ATTR_HREF:Ljava/lang/String; = "href"

.field public static final XML_STYLESHEET_ATTR_MEDIA:Ljava/lang/String; = "media"

.field public static final XML_STYLESHEET_ATTR_MEDIA_ALL:Ljava/lang/String; = "all"

.field public static final XML_STYLESHEET_ATTR_TYPE:Ljava/lang/String; = "type"

.field private static final XML_STYLESHEET_PROCESSING_INSTRUCTION:Ljava/lang/String; = "xml-stylesheet"


# instance fields
.field private currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

.field private enableInternalEntities:Z

.field private externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

.field private ignoreDepth:I

.field private ignoring:Z

.field private inMetadataElement:Z

.field private inStyleElement:Z

.field private metadataElementContents:Ljava/lang/StringBuilder;

.field private metadataTag:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

.field private styleElementContents:Ljava/lang/StringBuilder;

.field private svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;


# direct methods
.method static bridge synthetic -$$Nest$mendDocument(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->endDocument()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mendElement(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleProcessingInstruction(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->handleProcessingInstruction(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mparseProcessingInstructionAttributes(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Ljava/util/Map;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseProcessingInstructionAttributes(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mstartDocument(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->startDocument()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstartElement(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mtext(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->text(Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 76
    sput-boolean v0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->FORCE_SAX_ON_EARLY_ANDROIDS:Z

    .line 78
    const-string v0, "/\\*.*?\\*/"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->PATTERN_BLOCK_COMMENTS:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 96
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    const/4 v1, 0x1

    .line 97
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->enableInternalEntities:Z

    .line 98
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    const/4 v1, 0x0

    .line 101
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    .line 105
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inMetadataElement:Z

    .line 106
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataTag:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    .line 107
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    .line 110
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inStyleElement:Z

    .line 111
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    return-void
.end method

.method private a(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1340
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<a>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1342
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1344
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;-><init>()V

    .line 1345
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1346
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1347
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1348
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1349
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1350
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1351
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesA(Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;Lorg/xml/sax/Attributes;)V

    .line 1352
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1353
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1343
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private appendToTextContainer(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1062
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;

    .line 1063
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->getChildren()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 1064
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 1065
    :goto_0
    instance-of v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    if-eqz v1, :cond_1

    .line 1067
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    iget-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->text:Ljava/lang/String;

    return-void

    .line 1070
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;

    invoke-direct {v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void
.end method

.method private circle(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1605
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<circle>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1607
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1609
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;-><init>()V

    .line 1610
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1611
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1612
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1613
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1614
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1615
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1616
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCircle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;Lorg/xml/sax/Attributes;)V

    .line 1617
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1608
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static clamp255(F)I
    .locals 1

    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-gez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/high16 v0, 0x437f0000    # 255.0f

    cmpl-float v0, p0, v0

    if-lez v0, :cond_1

    const/16 p0, 0xff

    return p0

    .line 3185
    :cond_1
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private clipPath(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2330
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<clipPath>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2332
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2334
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;-><init>()V

    .line 2335
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2336
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2337
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2338
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2339
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 2340
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2341
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;Lorg/xml/sax/Attributes;)V

    .line 2342
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2343
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2333
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method private defs(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1319
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<defs>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1321
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1323
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Defs;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Defs;-><init>()V

    .line 1324
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Defs;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1325
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Defs;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1326
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1327
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1328
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1329
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1330
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1322
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private dumpNode(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method private ellipse(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1652
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<ellipse>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1654
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1656
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;-><init>()V

    .line 1657
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1658
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1659
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1660
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1661
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1662
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1663
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesEllipse(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;Lorg/xml/sax/Attributes;)V

    .line 1664
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1655
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private endDocument()V
    .locals 0

    return-void
.end method

.method private endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1077
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 1078
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoreDepth:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoreDepth:I

    if-nez p1, :cond_6

    .line 1079
    iput-boolean v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    return-void

    .line 1084
    :cond_0
    const-string v0, "http://www.w3.org/2000/svg"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto/16 :goto_2

    .line 1088
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_2

    goto :goto_0

    :cond_2
    move-object p2, p3

    .line 1089
    :goto_0
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_2

    .line 1105
    :pswitch_1
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    if-eqz p1, :cond_6

    .line 1106
    iput-boolean v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inStyleElement:Z

    .line 1107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseCSSStyleSheet(Ljava/lang/String;)V

    .line 1108
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    return-void

    .line 1093
    :pswitch_2
    iput-boolean v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inMetadataElement:Z

    .line 1094
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    if-eqz p1, :cond_6

    .line 1096
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataTag:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    sget-object p2, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;->title:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    if-ne p1, p2, :cond_3

    .line 1097
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setTitle(Ljava/lang/String;)V

    goto :goto_1

    .line 1098
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataTag:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    sget-object p2, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;->desc:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    if-ne p1, p2, :cond_4

    .line 1099
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDesc(Ljava/lang/String;)V

    .line 1100
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    return-void

    .line 1133
    :pswitch_3
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz p1, :cond_5

    .line 1139
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1137
    :cond_5
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p2, p3, v2

    const-string p2, "Unbalanced end element </%s> found"

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private g(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1297
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<g>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1299
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1301
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;-><init>()V

    .line 1302
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1303
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1304
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1305
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1306
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1307
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1308
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1309
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1300
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private handleProcessingInstruction(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1159
    const-string v0, "xml-stylesheet"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    if-eqz p1, :cond_4

    .line 1162
    const-string p1, "type"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1163
    const-string v0, "text/css"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 1166
    :cond_0
    const-string p1, "alternate"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1167
    const-string v0, "no"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 1170
    :cond_1
    const-string p1, "href"

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_4

    .line 1173
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;->resolveCSSStyleSheet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 1177
    :cond_2
    const-string v0, "media"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_3

    .line 1178
    const-string v0, "all"

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1179
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "@media "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " { "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "}"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1182
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseCSSStyleSheet(Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method

.method private static hslToRgb(FFF)I
    .locals 3

    const/high16 v0, 0x43b40000    # 360.0f

    const/4 v1, 0x0

    cmpl-float v2, p0, v1

    rem-float/2addr p0, v0

    if-ltz v2, :cond_0

    goto :goto_0

    :cond_0
    add-float/2addr p0, v0

    :goto_0
    const/high16 v0, 0x42700000    # 60.0f

    div-float/2addr p0, v0

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    div-float/2addr p2, v0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v2, p1, v1

    if-gez v2, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    .line 3196
    :cond_1
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    :goto_1
    cmpg-float v2, p2, v1

    if-gez v2, :cond_2

    goto :goto_2

    .line 3197
    :cond_2
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v1

    :goto_2
    const/high16 p2, 0x3f000000    # 0.5f

    cmpg-float p2, v1, p2

    if-gtz p2, :cond_3

    add-float/2addr p1, v0

    mul-float p1, p1, v1

    goto :goto_3

    :cond_3
    add-float p2, v1, p1

    mul-float p1, p1, v1

    sub-float p1, p2, p1

    :goto_3
    const/high16 p2, 0x40000000    # 2.0f

    mul-float v1, v1, p2

    sub-float/2addr v1, p1

    add-float v0, p0, p2

    .line 3205
    invoke-static {v1, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->hueToRgb(FFF)F

    move-result v0

    .line 3206
    invoke-static {v1, p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->hueToRgb(FFF)F

    move-result v2

    sub-float/2addr p0, p2

    .line 3207
    invoke-static {v1, p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->hueToRgb(FFF)F

    move-result p0

    const/high16 p1, 0x43800000    # 256.0f

    mul-float v0, v0, p1

    .line 3208
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result p2

    shl-int/lit8 p2, p2, 0x10

    mul-float v2, v2, p1

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    or-int/2addr p2, v0

    mul-float p0, p0, p1

    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result p0

    or-int/2addr p0, p2

    return p0
.end method

.method private static hueToRgb(FFF)F
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x40c00000    # 6.0f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    add-float/2addr p2, v1

    :cond_0
    cmpl-float v0, p2, v1

    if-ltz v0, :cond_1

    sub-float/2addr p2, v1

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_2

    sub-float/2addr p1, p0

    mul-float p1, p1, p2

    :goto_0
    add-float/2addr p1, p0

    return p1

    :cond_2
    const/high16 v0, 0x40400000    # 3.0f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_3

    return p1

    :cond_3
    const/high16 v0, 0x40800000    # 4.0f

    cmpg-float v1, p2, v0

    if-gez v1, :cond_4

    sub-float/2addr p1, p0

    sub-float/2addr v0, p2

    mul-float p1, p1, v0

    goto :goto_0

    :cond_4
    return p0
.end method

.method private image(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1439
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<image>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1441
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1443
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;-><init>()V

    .line 1444
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1445
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1446
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1447
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1448
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1449
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1450
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesImage(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;Lorg/xml/sax/Attributes;)V

    .line 1451
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1452
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1442
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private line(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1704
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<line>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1706
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1708
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;-><init>()V

    .line 1709
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1710
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1711
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1712
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1713
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1714
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1715
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesLine(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;Lorg/xml/sax/Attributes;)V

    .line 1716
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1707
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private linearGradient(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2098
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<linearGradient>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2100
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2102
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;-><init>()V

    .line 2103
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2104
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2105
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2106
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2107
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Lorg/xml/sax/Attributes;)V

    .line 2108
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesLinearGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;Lorg/xml/sax/Attributes;)V

    .line 2109
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2110
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2101
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private marker(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2029
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<marker>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2031
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2033
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;-><init>()V

    .line 2034
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2035
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2036
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2037
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2038
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2039
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesViewBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;Lorg/xml/sax/Attributes;)V

    .line 2040
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesMarker(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;Lorg/xml/sax/Attributes;)V

    .line 2041
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2042
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2032
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private mask(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2523
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<mask>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2525
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2527
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;-><init>()V

    .line 2528
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2529
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2530
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2531
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2532
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2533
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesMask(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;Lorg/xml/sax/Attributes;)V

    .line 2534
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2535
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2526
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private parseAttributesA(Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;Lorg/xml/sax/Attributes;)V
    .locals 4

    const/4 v0, 0x0

    .line 1359
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 1361
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1363
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x26

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1366
    :cond_0
    const-string v2, ""

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1367
    :cond_1
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;->href:Ljava/lang/String;

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private parseAttributesCircle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1623
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 1625
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1626
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/4 v3, 0x6

    if-eq v2, v3, :cond_3

    const/4 v3, 0x7

    if-eq v2, v3, :cond_2

    const/16 v3, 0x40

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1635
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1636
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 1637
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <circle> element. r cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1632
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1629
    :cond_3
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Circle;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private parseAttributesClipPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;Lorg/xml/sax/Attributes;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2349
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 2351
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 2353
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_0

    goto :goto_1

    .line 2356
    :cond_0
    const-string v3, "objectBoundingBox"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2357
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->clipPathUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2358
    :cond_1
    const-string v3, "userSpaceOnUse"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    .line 2359
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;->clipPathUnitsAreUser:Ljava/lang/Boolean;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2361
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute clipPathUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    return-void
.end method

.method private parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1972
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1974
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 1975
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v3

    const/16 v4, 0x58

    if-eq v3, v4, :cond_1

    packed-switch v3, :pswitch_data_0

    goto :goto_2

    .line 1990
    :pswitch_0
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontFamily(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 1991
    new-instance v3, Ljava/util/HashSet;

    if-eqz v2, :cond_0

    invoke-direct {v3, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_1

    :cond_0
    invoke-direct {v3, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 1992
    :goto_1
    invoke-interface {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->setRequiredFonts(Ljava/util/Set;)V

    goto :goto_2

    .line 1987
    :pswitch_1
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseRequiredFormats(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->setRequiredFormats(Ljava/util/Set;)V

    goto :goto_2

    .line 1981
    :pswitch_2
    invoke-interface {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->setRequiredExtensions(Ljava/lang/String;)V

    goto :goto_2

    .line 1978
    :pswitch_3
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseRequiredFeatures(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->setRequiredFeatures(Ljava/util/Set;)V

    goto :goto_2

    .line 1984
    :cond_1
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseSystemLanguage(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;->setSystemLanguage(Ljava/util/Set;)V

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void

    :pswitch_data_0
    .packed-switch 0x43
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2594
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 2596
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v1

    .line 2597
    const-string v2, "id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "xml:id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 2602
    :cond_0
    const-string v2, "xml:space"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2603
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 2604
    const-string v0, "default"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2605
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->spacePreserve:Ljava/lang/Boolean;

    return-void

    .line 2606
    :cond_1
    const-string v0, "preserve"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2607
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->spacePreserve:Ljava/lang/Boolean;

    return-void

    .line 2609
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid value for \"xml:space\" attribute: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2599
    :cond_4
    :goto_1
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->id:Ljava/lang/String;

    :cond_5
    return-void
.end method

.method private parseAttributesEllipse(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1670
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 1672
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1673
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/4 v3, 0x6

    if-eq v2, v3, :cond_5

    const/4 v3, 0x7

    if-eq v2, v3, :cond_4

    const/16 v3, 0x47

    if-eq v2, v3, :cond_2

    const/16 v3, 0x48

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1687
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1688
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 1689
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <ellipse> element. ry cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1682
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1683
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    .line 1684
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <ellipse> element. rx cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1679
    :cond_4
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1676
    :cond_5
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Ellipse;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method private parseAttributesGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Lorg/xml/sax/Attributes;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2116
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_8

    .line 2118
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 2119
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v3

    const/16 v4, 0x23

    if-eq v3, v4, :cond_6

    const/16 v4, 0x24

    if-eq v3, v4, :cond_3

    const/16 v4, 0x26

    if-eq v3, v4, :cond_1

    const/16 v4, 0x4b

    if-eq v3, v4, :cond_0

    goto :goto_1

    .line 2136
    :cond_0
    :try_start_0
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    move-result-object v3

    iput-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 2140
    :catch_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Invalid spreadMethod attribute. \""

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\" is not a valid value."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2144
    :cond_1
    const-string v3, ""

    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 2145
    :cond_2
    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->href:Ljava/lang/String;

    goto :goto_1

    .line 2122
    :cond_3
    const-string v3, "objectBoundingBox"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2123
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2124
    :cond_4
    const-string v3, "userSpaceOnUse"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x1

    .line 2125
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2127
    :cond_5
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute gradientUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2131
    :cond_6
    invoke-direct {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseTransformList(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->gradientTransform:Landroid/graphics/Matrix;

    :cond_7
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_8
    return-void
.end method

.method private parseAttributesImage(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1458
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_a

    .line 1460
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1461
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x25

    if-eq v2, v3, :cond_7

    const/16 v3, 0x26

    if-eq v2, v3, :cond_5

    const/16 v3, 0x3f

    if-eq v2, v3, :cond_4

    const/16 v3, 0x61

    if-eq v2, v3, :cond_2

    const/16 v3, 0x64

    if-eq v2, v3, :cond_1

    const/16 v3, 0x65

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1467
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1464
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1470
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1471
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    .line 1472
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <use> element. width cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1484
    :cond_4
    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parsePreserveAspectRatio(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;Ljava/lang/String;)V

    goto :goto_1

    .line 1480
    :cond_5
    const-string v2, ""

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    const-string v2, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1481
    :cond_6
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->href:Ljava/lang/String;

    goto :goto_1

    .line 1475
    :cond_7
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1476
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_9

    :cond_8
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 1477
    :cond_9
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <use> element. height cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_a
    return-void
.end method

.method private parseAttributesLine(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;Lorg/xml/sax/Attributes;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1722
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1724
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1725
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 1737
    :pswitch_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1734
    :pswitch_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1731
    :pswitch_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1728
    :pswitch_3
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x66
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseAttributesLinearGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;Lorg/xml/sax/Attributes;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2156
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 2158
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2159
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 2171
    :pswitch_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2168
    :pswitch_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2165
    :pswitch_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2162
    :pswitch_3
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgLinearGradient;->x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x66
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseAttributesMarker(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;Lorg/xml/sax/Attributes;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2048
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_8

    .line 2050
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 2051
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v3

    const/16 v4, 0x38

    if-eq v3, v4, :cond_6

    const/16 v4, 0x41

    if-eq v3, v4, :cond_5

    const/16 v4, 0x42

    if-eq v3, v4, :cond_4

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_1

    .line 2060
    :pswitch_0
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2061
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 2062
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <marker> element. markerWidth cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2070
    :pswitch_1
    const-string v3, "strokeWidth"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2071
    iput-boolean v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerUnitsAreUser:Z

    goto :goto_1

    .line 2072
    :cond_1
    const-string v3, "userSpaceOnUse"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    .line 2073
    iput-boolean v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerUnitsAreUser:Z

    goto :goto_1

    .line 2075
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute markerUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2065
    :pswitch_2
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerHeight:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2066
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->markerHeight:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_1

    .line 2067
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <marker> element. markerHeight cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2057
    :cond_4
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->refY:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2054
    :cond_5
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->refX:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2079
    :cond_6
    const-string v3, "auto"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const/high16 v2, 0x7fc00000    # Float.NaN

    .line 2080
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->orient:Ljava/lang/Float;

    goto :goto_1

    .line 2082
    :cond_7
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;->orient:Ljava/lang/Float;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_8
    return-void

    :pswitch_data_0
    .packed-switch 0x2e
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseAttributesMask(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;Lorg/xml/sax/Attributes;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2557
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 2541
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_c

    .line 2543
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 2544
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v3

    const/16 v4, 0x25

    if-eq v3, v4, :cond_a

    const/16 v4, 0x61

    if-eq v3, v4, :cond_8

    const/16 v4, 0x32

    const-string v5, "userSpaceOnUse"

    const-string v6, "objectBoundingBox"

    const/4 v7, 0x1

    if-eq v3, v4, :cond_5

    const/16 v4, 0x33

    if-eq v3, v4, :cond_2

    const/16 v4, 0x64

    if-eq v3, v4, :cond_1

    const/16 v4, 0x65

    if-eq v3, v4, :cond_0

    goto/16 :goto_1

    .line 2568
    :cond_0
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2565
    :cond_1
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2547
    :cond_2
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2548
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2549
    :cond_3
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2550
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2552
    :cond_4
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute maskUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2556
    :cond_5
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 2557
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskContentUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2558
    :cond_6
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2559
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->maskContentUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2561
    :cond_7
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute maskContentUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2571
    :cond_8
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2572
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-nez v2, :cond_9

    goto :goto_1

    .line 2573
    :cond_9
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <mask> element. width cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2576
    :cond_a
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2577
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-nez v2, :cond_b

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 2578
    :cond_b
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <mask> element. height cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_c
    return-void
.end method

.method private parseAttributesPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1517
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 1519
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1520
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0xe

    if-eq v2, v3, :cond_2

    const/16 v3, 0x3a

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1526
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->pathLength:Ljava/lang/Float;

    .line 1527
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->pathLength:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_1

    goto :goto_1

    .line 1528
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <path> element. pathLength cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1523
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parsePath(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private parseAttributesPattern(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;Lorg/xml/sax/Attributes;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2459
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 2443
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_d

    .line 2445
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 2446
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v3

    const/16 v4, 0x25

    if-eq v3, v4, :cond_a

    const/16 v4, 0x26

    if-eq v3, v4, :cond_8

    const/16 v4, 0x61

    if-eq v3, v4, :cond_6

    const/16 v4, 0x64

    if-eq v3, v4, :cond_5

    const/16 v4, 0x65

    if-eq v3, v4, :cond_4

    const-string v4, "userSpaceOnUse"

    const-string v5, "objectBoundingBox"

    const/4 v6, 0x1

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_1

    .line 2449
    :pswitch_0
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2450
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    goto/16 :goto_1

    .line 2451
    :cond_0
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2452
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternUnitsAreUser:Ljava/lang/Boolean;

    goto/16 :goto_1

    .line 2454
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute patternUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2467
    :pswitch_1
    invoke-direct {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseTransformList(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternTransform:Landroid/graphics/Matrix;

    goto/16 :goto_1

    .line 2458
    :pswitch_2
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2459
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2460
    :cond_2
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2461
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->patternContentUnitsAreUser:Ljava/lang/Boolean;

    goto :goto_1

    .line 2463
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid value for attribute patternContentUnits"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2473
    :cond_4
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2470
    :cond_5
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2476
    :cond_6
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2477
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-nez v2, :cond_7

    goto :goto_1

    .line 2478
    :cond_7
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <pattern> element. width cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2486
    :cond_8
    const-string v3, ""

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 2487
    :cond_9
    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->href:Ljava/lang/String;

    goto :goto_1

    .line 2481
    :cond_a
    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2482
    iget-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-nez v2, :cond_c

    :cond_b
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 2483
    :cond_c
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <pattern> element. height cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_d
    return-void

    :pswitch_data_0
    .packed-switch 0x3b
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseAttributesPolyLine(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;Lorg/xml/sax/Attributes;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1773
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 1775
    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->points:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    if-ne v2, v3, :cond_3

    .line 1777
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 1778
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1779
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 1781
    :goto_1
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1782
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v4

    .line 1783
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    const-string v6, "Invalid <"

    if-nez v5, :cond_1

    .line 1785
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 1786
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v5

    .line 1787
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-nez v7, :cond_0

    .line 1789
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 1790
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1791
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1788
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "> points attribute. There should be an even number of coordinates."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1784
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "> points attribute. Non-coordinate content found in list."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1793
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [F

    iput-object v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    .line 1795
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 1796
    iget-object v5, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->points:[F

    add-int/lit8 v6, v3, 0x1

    aput v4, v5, v3

    move v3, v6

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_4
    return-void
.end method

.method private parseAttributesRadialGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2204
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 2206
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2207
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/4 v3, 0x6

    if-eq v2, v3, :cond_4

    const/4 v3, 0x7

    if-eq v2, v3, :cond_3

    const/16 v3, 0x40

    if-eq v2, v3, :cond_1

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 2227
    :pswitch_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2228
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fr:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 2229
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <radialGradient> element. fr cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2224
    :pswitch_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2221
    :pswitch_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->fx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2216
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 2217
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->r:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_1

    .line 2218
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <radialGradient> element. r cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2213
    :cond_3
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cy:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2210
    :cond_4
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->cx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    return-void

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseAttributesRect(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1561
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_a

    .line 1563
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1564
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x25

    if-eq v2, v3, :cond_8

    const/16 v3, 0x61

    if-eq v2, v3, :cond_6

    const/16 v3, 0x47

    if-eq v2, v3, :cond_4

    const/16 v3, 0x48

    if-eq v2, v3, :cond_2

    const/16 v3, 0x64

    if-eq v2, v3, :cond_1

    const/16 v3, 0x65

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1570
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1567
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1588
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1589
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    .line 1590
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <rect> element. ry cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1583
    :cond_4
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1584
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_1

    .line 1585
    :cond_5
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <rect> element. rx cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1573
    :cond_6
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1574
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_1

    .line 1575
    :cond_7
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <rect> element. width cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1578
    :cond_8
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1579
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_9

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 1580
    :cond_9
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <rect> element. height cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_a
    return-void
.end method

.method private parseAttributesSVG(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1260
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_7

    .line 1262
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1263
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x25

    if-eq v2, v3, :cond_5

    const/16 v3, 0x5f

    if-eq v2, v3, :cond_4

    const/16 v3, 0x61

    if-eq v2, v3, :cond_2

    const/16 v3, 0x64

    if-eq v2, v3, :cond_1

    const/16 v3, 0x65

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1269
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1266
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1272
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1273
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    .line 1274
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <svg> element. width cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1282
    :cond_4
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->version:Ljava/lang/String;

    goto :goto_1

    .line 1277
    :cond_5
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1278
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_6

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1279
    :cond_6
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <svg> element. height cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    return-void
.end method

.method private parseAttributesStop(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2263
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2265
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2267
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x36

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 2270
    :cond_0
    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseGradientOffset(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->offset:Ljava/lang/Float;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V
    .locals 5

    const/4 v0, 0x0

    .line 2622
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 2624
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2625
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 2630
    :cond_0
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    if-eqz v2, :cond_3

    const/16 v3, 0x57

    if-eq v2, v3, :cond_2

    .line 2641
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    if-nez v1, :cond_1

    .line 2642
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/Style;-><init>()V

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    .line 2643
    :cond_1
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/Style;->processStyleProperty(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_1

    .line 2633
    :cond_2
    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Ljava/lang/String;)V

    goto :goto_1

    .line 2637
    :cond_3
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseClassAttribute(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->classNames:Ljava/util/List;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private parseAttributesTRef(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;Lorg/xml/sax/Attributes;)V
    .locals 4

    const/4 v0, 0x0

    .line 1931
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 1933
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1935
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x26

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1938
    :cond_0
    const-string v2, ""

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1939
    :cond_1
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->href:Ljava/lang/String;

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private parseAttributesTextPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2399
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 2401
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2402
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x26

    if-eq v2, v3, :cond_1

    const/16 v3, 0x4c

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 2409
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->startOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 2405
    :cond_1
    const-string v2, ""

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2406
    :cond_2
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->href:Ljava/lang/String;

    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private parseAttributesTextPosition(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1850
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 1852
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1853
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x9

    if-eq v2, v3, :cond_3

    const/16 v3, 0xa

    if-eq v2, v3, :cond_2

    const/16 v3, 0x64

    if-eq v2, v3, :cond_1

    const/16 v3, 0x65

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1859
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;->y:Ljava/util/List;

    goto :goto_1

    .line 1856
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;->x:Ljava/util/List;

    goto :goto_1

    .line 1865
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;->dy:Ljava/util/List;

    goto :goto_1

    .line 1862
    :cond_3
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;->dx:Ljava/util/List;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2704
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2706
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->transform:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    if-ne v1, v2, :cond_0

    .line 2708
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseTransformList(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;->setTransform(Landroid/graphics/Matrix;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private parseAttributesUse(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1401
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_9

    .line 1403
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1404
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x25

    if-eq v2, v3, :cond_6

    const/16 v3, 0x26

    if-eq v2, v3, :cond_4

    const/16 v3, 0x61

    if-eq v2, v3, :cond_2

    const/16 v3, 0x64

    if-eq v2, v3, :cond_1

    const/16 v3, 0x65

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 1410
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1407
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    goto :goto_1

    .line 1413
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1414
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    .line 1415
    :cond_3
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <use> element. width cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1423
    :cond_4
    const-string v2, ""

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "http://www.w3.org/1999/xlink"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1424
    :cond_5
    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->href:Ljava/lang/String;

    goto :goto_1

    .line 1418
    :cond_6
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1419
    iget-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v1

    if-nez v1, :cond_8

    :cond_7
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1420
    :cond_8
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string p2, "Invalid <use> element. height cannot be negative"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_9
    return-void
.end method

.method private parseAttributesViewBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;Lorg/xml/sax/Attributes;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2684
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 2686
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2687
    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v2

    const/16 v3, 0x3f

    if-eq v2, v3, :cond_1

    const/16 v3, 0x60

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 2690
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseViewBox(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    goto :goto_1

    .line 2693
    :cond_1
    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parsePreserveAspectRatio(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;Ljava/lang/String;)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private parseCSSStyleSheet(Ljava/lang/String;)V
    .locals 4

    .line 4013
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;->Document:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {v0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    .line 4014
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parse(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->addCSSRules(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V

    return-void
.end method

.method static parseClip(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;
    .locals 6

    .line 3551
    const-string v0, "auto"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 3553
    :cond_0
    const-string v0, "rect("

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 3556
    :cond_1
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3557
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3559
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthOrAuto(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p0

    .line 3560
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 3561
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthOrAuto(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v2

    .line 3562
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 3563
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthOrAuto(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v3

    .line 3564
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 3565
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLengthOrAuto(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v4

    .line 3567
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    const/16 v5, 0x29

    .line 3568
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    if-nez v0, :cond_2

    return-object v1

    .line 3571
    :cond_2
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;

    invoke-direct {v0, p0, v2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;)V

    return-object v0
.end method

.method static parseColour(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;
    .locals 13

    const/4 v0, 0x0

    .line 3027
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x23

    const/4 v2, 0x5

    const/high16 v3, -0x1000000

    const/4 v4, 0x4

    if-ne v0, v1, :cond_5

    const/4 v0, 0x1

    .line 3029
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->parseHex(Ljava/lang/String;II)Lcom/flyersoft/components/androidsvg/utils/IntegerParser;

    move-result-object p0

    if-nez p0, :cond_0

    .line 3031
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    .line 3033
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->getEndPos()I

    move-result v0

    if-eq v0, v4, :cond_4

    if-eq v0, v2, :cond_3

    const/4 v1, 0x7

    if-eq v0, v1, :cond_2

    const/16 v1, 0x9

    if-eq v0, v1, :cond_1

    .line 3055
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    .line 3052
    :cond_1
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result p0

    ushr-int/lit8 p0, p0, 0x8

    or-int/2addr p0, v1

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0

    .line 3050
    :cond_2
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result p0

    or-int/2addr p0, v3

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0

    .line 3043
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result p0

    const v0, 0xf000

    and-int/2addr v0, p0

    and-int/lit16 v1, p0, 0xf00

    and-int/lit16 v2, p0, 0xf0

    and-int/lit8 p0, p0, 0xf

    .line 3048
    new-instance v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    shl-int/lit8 v5, p0, 0x1c

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v5

    shl-int/lit8 v5, v0, 0x8

    or-int/2addr p0, v5

    shl-int/2addr v0, v4

    or-int/2addr p0, v0

    shl-int/lit8 v0, v1, 0x4

    or-int/2addr p0, v0

    or-int/2addr p0, v1

    or-int/2addr p0, v2

    shr-int/lit8 v0, v2, 0x4

    or-int/2addr p0, v0

    invoke-direct {v3, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v3

    .line 3037
    :cond_4
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result p0

    and-int/lit16 v0, p0, 0xf00

    and-int/lit16 v1, p0, 0xf0

    and-int/lit8 p0, p0, 0xf

    .line 3041
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    shl-int/lit8 v5, v0, 0xc

    or-int/2addr v3, v5

    shl-int/lit8 v0, v0, 0x8

    or-int/2addr v0, v3

    shl-int/lit8 v3, v1, 0x8

    or-int/2addr v0, v3

    shl-int/2addr v1, v4

    or-int/2addr v0, v1

    shl-int/lit8 v1, p0, 0x4

    or-int/2addr v0, v1

    or-int/2addr p0, v0

    invoke-direct {v2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v2

    .line 3061
    :cond_5
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 3062
    const-string v1, "rgba("

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/16 v5, 0x29

    const/16 v6, 0x2f

    const/high16 v7, 0x7fc00000    # Float.NaN

    const/high16 v8, 0x43800000    # 256.0f

    const/16 v9, 0x25

    if-nez v1, :cond_11

    .line 3063
    const-string v10, "rgb("

    invoke-virtual {v0, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    goto/16 :goto_2

    .line 3121
    :cond_6
    const-string v1, "hsla("

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 3122
    const-string v10, "hsl("

    invoke-virtual {v0, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1c

    .line 3124
    :cond_7
    new-instance v10, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    if-eqz v1, :cond_8

    goto :goto_0

    :cond_8
    const/4 v2, 0x4

    :goto_0
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v10, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3125
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3127
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    .line 3128
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 3129
    const-string v1, "deg"

    invoke-virtual {v10, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(Ljava/lang/String;)Z

    .line 3133
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    move-result v1

    .line 3135
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v2

    .line 3136
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 3137
    invoke-virtual {v10, v9}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v4

    if-nez v4, :cond_9

    .line 3138
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    :cond_9
    if-eqz v1, :cond_a

    .line 3141
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    move-result v4

    if-nez v4, :cond_b

    .line 3142
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    .line 3144
    :cond_a
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3147
    :cond_b
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v4

    .line 3148
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v11

    if-nez v11, :cond_1c

    .line 3149
    invoke-virtual {v10, v9}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v0

    if-nez v0, :cond_c

    .line 3150
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    :cond_c
    if-eqz v1, :cond_d

    .line 3155
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 3156
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v7

    goto :goto_1

    .line 3158
    :cond_d
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3159
    invoke-virtual {v10, v6}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 3160
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3161
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v7

    .line 3164
    :cond_e
    :goto_1
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3165
    invoke-virtual {v10, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v0

    if-nez v0, :cond_f

    .line 3166
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    .line 3167
    :cond_f
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 3168
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    invoke-static {p0, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->hslToRgb(FFF)I

    move-result p0

    or-int/2addr p0, v3

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0

    .line 3170
    :cond_10
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    mul-float v7, v7, v8

    invoke-static {v7}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    invoke-static {p0, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->hslToRgb(FFF)I

    move-result p0

    or-int/2addr p0, v1

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0

    .line 3065
    :cond_11
    :goto_2
    new-instance v10, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    if-eqz v1, :cond_12

    goto :goto_3

    :cond_12
    const/4 v2, 0x4

    :goto_3
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v10, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3066
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3068
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    .line 3069
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 3070
    invoke-virtual {v10, v9}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v1

    const/high16 v2, 0x42c80000    # 100.0f

    if-eqz v1, :cond_13

    mul-float p0, p0, v8

    div-float/2addr p0, v2

    .line 3075
    :cond_13
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    move-result v1

    .line 3077
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v4

    .line 3078
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v11

    if-nez v11, :cond_1c

    .line 3079
    invoke-virtual {v10, v9}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v11

    if-eqz v11, :cond_14

    mul-float v4, v4, v8

    div-float/2addr v4, v2

    :cond_14
    if-eqz v1, :cond_15

    .line 3083
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    move-result v11

    if-nez v11, :cond_16

    .line 3084
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    .line 3086
    :cond_15
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3089
    :cond_16
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v11

    .line 3090
    invoke-static {v11}, Ljava/lang/Float;->isNaN(F)Z

    move-result v12

    if-nez v12, :cond_1c

    .line 3091
    invoke-virtual {v10, v9}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v0

    if-eqz v0, :cond_17

    mul-float v11, v11, v8

    div-float/2addr v11, v2

    :cond_17
    if-eqz v1, :cond_18

    .line 3097
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 3098
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v7

    goto :goto_4

    .line 3100
    :cond_18
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3101
    invoke-virtual {v10, v6}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 3102
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3103
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v7

    .line 3106
    :cond_19
    :goto_4
    invoke-virtual {v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3107
    invoke-virtual {v10, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 3108
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    .line 3109
    :cond_1a
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 3110
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result p0

    shl-int/lit8 p0, p0, 0x10

    or-int/2addr p0, v3

    invoke-static {v4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr p0, v1

    invoke-static {v11}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v1

    or-int/2addr p0, v1

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0

    .line 3112
    :cond_1b
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    mul-float v7, v7, v8

    invoke-static {v7}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result p0

    shl-int/lit8 p0, p0, 0x10

    or-int/2addr p0, v1

    invoke-static {v4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr p0, v1

    invoke-static {v11}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clamp255(F)I

    move-result v1

    or-int/2addr p0, v1

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0

    .line 3178
    :cond_1c
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColourKeyword(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    move-result-object p0

    return-object p0
.end method

.method private static parseColourKeyword(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;
    .locals 1

    .line 3225
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$ColourKeywords;->get(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    if-nez p0, :cond_0

    .line 3226
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0

    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    return-object v0
.end method

.method private static parseColourSpecifer(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;
    .locals 1

    .line 3011
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "currentColor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3017
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColour(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    move-result-object p0

    return-object p0

    .line 3015
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;->getInstance()Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    move-result-object p0

    return-object p0

    .line 3013
    :cond_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->TRANSPARENT:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-object p0
.end method

.method static parseFillRule(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;
    .locals 1

    .line 3444
    const-string v0, "nonzero"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3445
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;->NonZero:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    return-object p0

    .line 3446
    :cond_0
    const-string v0, "evenodd"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 3447
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;->EvenOdd:Lcom/flyersoft/components/androidsvg/utils/Style$FillRule;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseFloat(Ljava/lang/String;)F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2913
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 2916
    invoke-static {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;II)F

    move-result p0

    return p0

    .line 2915
    :cond_0
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid float value (empty string)"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static parseFloat(Ljava/lang/String;II)F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2921
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;-><init>()V

    .line 2922
    invoke-virtual {v0, p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;->parseNumber(Ljava/lang/String;II)F

    move-result p1

    .line 2923
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result p2

    if-nez p2, :cond_0

    return p1

    .line 2926
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Invalid float value: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static parseFont(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;)V
    .locals 8

    .line 3243
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "|caption|icon|menu|message-box|small-caption|status-bar|"

    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 3247
    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    move-object v1, p1

    move-object v2, v1

    move-object v3, v2

    move-object v4, v3

    :goto_0
    const/16 v5, 0x2f

    .line 3251
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken(C)Ljava/lang/String;

    move-result-object v6

    .line 3252
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    if-nez v6, :cond_1

    goto :goto_2

    :cond_1
    if-eqz v1, :cond_2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 3257
    :cond_2
    const-string v7, "normal"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    goto :goto_0

    :cond_3
    if-nez v1, :cond_4

    .line 3261
    invoke-static {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontWeightKeywords;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 3262
    invoke-static {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontWeightKeywords;->get(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    goto :goto_0

    :cond_4
    if-nez v2, :cond_5

    .line 3266
    invoke-static {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontStyle(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    move-result-object v2

    if-eqz v2, :cond_5

    goto :goto_0

    :cond_5
    if-nez v3, :cond_6

    .line 3271
    const-string v7, "small-caps"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/4 v3, 0x1

    .line 3272
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    :cond_6
    if-nez v4, :cond_7

    .line 3275
    invoke-static {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontStretchKeywords;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 3276
    invoke-static {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontStretchKeywords;->get(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    goto :goto_0

    .line 3284
    :cond_7
    :goto_1
    invoke-static {v6}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontSize(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v6

    .line 3287
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 3289
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3290
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_8

    .line 3293
    :try_start_0
    invoke-static {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    :goto_2
    return-void

    .line 3298
    :cond_8
    :goto_3
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3302
    :cond_9
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->restOfText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFontFamily(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFamily:Ljava/util/List;

    .line 3304
    iput-object v6, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontSize:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    if-nez v1, :cond_a

    const/high16 v0, 0x43c80000    # 400.0f

    goto :goto_4

    .line 3305
    :cond_a
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    :goto_4
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontWeight:Ljava/lang/Float;

    if-nez v2, :cond_b

    .line 3306
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    :cond_b
    iput-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStyle:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    if-nez v4, :cond_c

    const/high16 v0, 0x42c80000    # 100.0f

    goto :goto_5

    .line 3307
    :cond_c
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v0

    :goto_5
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontStretch:Ljava/lang/Float;

    .line 3308
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontKerning:Lcom/flyersoft/components/androidsvg/utils/Style$FontKerning;

    .line 3309
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->LIGATURES_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantLigatures:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3310
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->POSITION_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantPosition:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3311
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->CAPS_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3312
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v3, v0, :cond_d

    .line 3313
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->makeSmallCaps()Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantCaps:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3314
    :cond_d
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->NUMERIC_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantNumeric:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3315
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->EAST_ASIAN_ALL_OFF:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariantEastAsian:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3316
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;->FONT_FEATURE_SETTINGS_NORMAL:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontFeatureSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;

    .line 3317
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->fontVariationSettings:Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;

    .line 3319
    iget-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    const-wide v2, 0xe3f000001e000L

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flyersoft/components/androidsvg/utils/Style;->specifiedFlags:J

    return-void
.end method

.method static parseFontFamily(Ljava/lang/String;)Ljava/util/List;
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

    .line 3329
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 3332
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextQuotedString()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    const/16 v1, 0x2c

    .line 3334
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextTokenWithWhitespace(C)Ljava/lang/String;

    move-result-object v1

    :cond_1
    if-nez v1, :cond_2

    return-object p0

    :cond_2
    if-nez p0, :cond_3

    .line 3338
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 3339
    :cond_3
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3340
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 3341
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object p0
.end method

.method static parseFontSize(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 1

    .line 3352
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontSizeKeywords;->get(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object v0

    if-nez v0, :cond_0

    .line 3354
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p0
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_0
    return-object v0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseFontStretch(Ljava/lang/String;)Ljava/lang/Float;
    .locals 4

    .line 3383
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontStretchKeywords;->get(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    if-nez v0, :cond_3

    .line 3386
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3387
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/16 v2, 0x25

    .line 3388
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    return-object v3

    .line 3390
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3391
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    if-nez v0, :cond_1

    return-object v3

    .line 3393
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    cmpg-float p0, p0, v0

    if-gez p0, :cond_2

    return-object v3

    :cond_2
    return-object v1

    :cond_3
    return-object v0
.end method

.method static parseFontStyle(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;
    .locals 2

    .line 3404
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_1
    const-string v0, "italic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string v0, "oblique"

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

    .line 3407
    :pswitch_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    return-object p0

    .line 3406
    :pswitch_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->italic:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    return-object p0

    .line 3408
    :pswitch_2
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;->oblique:Lcom/flyersoft/components/androidsvg/utils/Style$FontStyle;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x62ce05cf -> :sswitch_2
        -0x4642c5d0 -> :sswitch_1
        -0x3df94319 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static parseFontWeight(Ljava/lang/String;)Ljava/lang/Float;
    .locals 3

    .line 3365
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontWeightKeywords;->get(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    if-nez v0, :cond_3

    .line 3368
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3369
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 3370
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3371
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    return-object v2

    .line 3373
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p0, v0

    if-ltz v0, :cond_2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v0, 0x447a0000    # 1000.0f

    cmpl-float p0, p0, v0

    if-lez p0, :cond_1

    goto :goto_0

    :cond_1
    return-object v1

    :cond_2
    :goto_0
    return-object v2

    :cond_3
    return-object v0
.end method

.method static parseFunctionalIRI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 3958
    const-string p1, "none"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return-object v0

    .line 3960
    :cond_0
    const-string p1, "url("

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    return-object v0

    .line 3962
    :cond_1
    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x4

    if-eqz p1, :cond_2

    .line 3963
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 3965
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private parseGradientOffset(Ljava/lang/String;)Ljava/lang/Float;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2281
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_4

    .line 2283
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 2286
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x25

    const/4 v4, 0x0

    if-ne v1, v3, :cond_0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 2292
    :goto_0
    :try_start_0
    invoke-static {p1, v4, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;II)F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    if-eqz v2, :cond_1

    div-float/2addr v0, v1

    :cond_1
    const/4 v2, 0x0

    cmpg-float v3, v0, v2

    if-gez v3, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    cmpl-float v2, v0, v1

    if-lez v2, :cond_3

    goto :goto_1

    :cond_3
    move v1, v0

    .line 2295
    :goto_1
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 2299
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid offset value in <stop>: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1

    .line 2282
    :cond_4
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid offset value in <stop> (empty string)"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static parseIsolation(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;
    .locals 1

    .line 3612
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v0, "auto"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "isolate"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3615
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;->isolate:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    return-object p0

    .line 3614
    :cond_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$Isolation;

    return-object p0
.end method

.method static parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2850
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    .line 2852
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 2853
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    add-int/lit8 v2, v0, -0x1

    .line 2854
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x25

    if-ne v2, v3, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 2858
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    if-le v0, v3, :cond_1

    .line 2859
    invoke-static {v2}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v0, v0, -0x2

    .line 2861
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 2863
    :try_start_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2865
    :catch_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid length unit specifier: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    const/4 v2, 0x0

    .line 2870
    :try_start_1
    invoke-static {p0, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;II)F

    move-result v0

    .line 2871
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {v2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v2

    :catch_1
    move-exception v0

    .line 2875
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid length value: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1

    .line 2851
    :cond_2
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid length value (empty string)"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static parseLengthList(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2885
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3

    .line 2888
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2890
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 2891
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2893
    :goto_0
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result p0

    if-nez p0, :cond_2

    .line 2895
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    .line 2896
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2898
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextUnit()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    move-result-object v2

    if-nez v2, :cond_0

    .line 2900
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    .line 2901
    :cond_0
    new-instance v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {v3, p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2902
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    goto :goto_0

    .line 2897
    :cond_1
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Invalid length list value: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->ahead()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    return-object v0

    .line 2886
    :cond_3
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid length list (empty string)"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static parseLengthOrAuto(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 1

    .line 3577
    const-string v0, "auto"

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3578
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-object p0

    .line 3580
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextLength()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p0

    return-object p0
.end method

.method static parseLetterOrWordSpacing(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 3

    .line 3623
    const-string v0, "normal"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3624
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-object p0

    :cond_0
    const/4 v0, 0x0

    .line 3627
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseLength(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p0

    .line 3629
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v1, v2, :cond_1

    return-object v0

    :cond_1
    return-object p0

    :catch_0
    return-object v0
.end method

.method static parseOpacity(Ljava/lang/String;)Ljava/lang/Float;
    .locals 2

    .line 2937
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseFloat(Ljava/lang/String;)F

    move-result p0

    const/4 v0, 0x0

    cmpg-float v1, p0, v0

    if-gez v1, :cond_0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2938
    invoke-static {p0, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    :goto_0
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseOverflow(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 3534
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "visible"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    goto :goto_0

    :sswitch_1
    const-string v0, "auto"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_2
    const-string v0, "scroll"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_3
    const-string v0, "hidden"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    packed-switch v1, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 3538
    :pswitch_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    .line 3541
    :pswitch_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x48916256 -> :sswitch_3
        -0x361a1933 -> :sswitch_2
        0x2dddaf -> :sswitch_1
        0x1bd1f072 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static parsePaintSpecifier(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;
    .locals 4

    .line 2986
    const-string v0, "url("

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2988
    const-string v0, ")"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x4

    if-eq v0, v1, :cond_1

    .line 2991
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    .line 2994
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 2995
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 2996
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColourSpecifer(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    move-result-object v2

    .line 2997
    :cond_0
    new-instance p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    invoke-direct {p0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;-><init>(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    return-object p0

    .line 3001
    :cond_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 3002
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;

    invoke-direct {v0, p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;-><init>(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V

    return-object v0

    .line 3005
    :cond_2
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseColourSpecifer(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    move-result-object p0

    return-object p0
.end method

.method protected static parsePath(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;
    .locals 19

    .line 3643
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3652
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;-><init>()V

    .line 3654
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_9

    .line 3657
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x4d

    const/16 v9, 0x6d

    if-eq v2, v3, :cond_1

    if-eq v2, v9, :cond_1

    goto/16 :goto_9

    :cond_1
    move v11, v2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    .line 3664
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    const/16 v6, 0x6c

    const/high16 v7, 0x40000000    # 2.0f

    .line 3666
    const-string v8, " path segment"

    const-string v14, "Bad path coords for "

    const-string v15, "SVGParser"

    sparse-switch v11, :sswitch_data_0

    goto/16 :goto_9

    .line 3764
    :sswitch_0
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->close()V

    move v2, v12

    move v3, v2

    move v4, v13

    :goto_1
    move v5, v4

    :goto_2
    const/16 p0, 0x0

    goto/16 :goto_7

    .line 3788
    :sswitch_1
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3789
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3790
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_2
    const/16 v5, 0x76

    if-ne v11, v5, :cond_3

    add-float/2addr v3, v4

    :cond_3
    move v4, v3

    .line 3796
    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->lineTo(FF)V

    move v3, v2

    goto :goto_1

    :sswitch_2
    mul-float v6, v2, v7

    sub-float/2addr v6, v3

    mul-float v7, v7, v4

    sub-float/2addr v7, v5

    .line 3830
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3831
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v5

    .line 3832
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 3833
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_4
    const/16 v8, 0x74

    if-ne v11, v8, :cond_5

    add-float/2addr v3, v2

    add-float/2addr v5, v4

    :cond_5
    move v2, v3

    move v4, v5

    .line 3840
    invoke-virtual {v1, v6, v7, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->quadTo(FFFF)V

    move v3, v6

    move v5, v7

    goto :goto_2

    :sswitch_3
    mul-float v6, v2, v7

    sub-float/2addr v6, v3

    mul-float v7, v7, v4

    sub-float v3, v7, v5

    .line 3740
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v5

    .line 3741
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v7

    const/16 p0, 0x0

    .line 3742
    invoke-virtual {v0, v7}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v10

    .line 3743
    invoke-virtual {v0, v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v16

    .line 3744
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 3745
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_6
    const/16 v8, 0x73

    if-ne v11, v8, :cond_7

    add-float/2addr v10, v2

    add-float v16, v16, v4

    add-float/2addr v5, v2

    add-float/2addr v7, v4

    :cond_7
    move v4, v5

    move v2, v6

    move v5, v7

    move v6, v10

    move/from16 v7, v16

    .line 3754
    invoke-virtual/range {v1 .. v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->cubicTo(FFFFFF)V

    goto/16 :goto_6

    :sswitch_4
    const/16 p0, 0x0

    .line 3804
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3805
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v5

    .line 3806
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v6

    .line 3807
    invoke-virtual {v0, v6}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v7

    .line 3808
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 3809
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_8
    const/16 v8, 0x71

    if-ne v11, v8, :cond_9

    add-float/2addr v6, v2

    add-float/2addr v7, v4

    add-float/2addr v3, v2

    add-float/2addr v5, v4

    :cond_9
    move v2, v3

    move v4, v5

    .line 3818
    invoke-virtual {v1, v2, v4, v6, v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->quadTo(FFFF)V

    move v3, v2

    move v5, v4

    move v2, v6

    move v4, v7

    goto/16 :goto_7

    :sswitch_5
    const/16 p0, 0x0

    .line 3671
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3672
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v5

    .line 3673
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 3674
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_a
    if-ne v11, v9, :cond_b

    .line 3678
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_b

    add-float/2addr v3, v2

    add-float/2addr v5, v4

    :cond_b
    move v2, v3

    move v4, v5

    .line 3682
    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->moveTo(FF)V

    if-ne v11, v9, :cond_c

    goto :goto_3

    :cond_c
    const/16 v6, 0x4c

    :goto_3
    move v3, v2

    move v12, v3

    move v5, v4

    move v13, v5

    move v11, v6

    goto/16 :goto_7

    :sswitch_6
    const/16 p0, 0x0

    .line 3692
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3693
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v5

    .line 3694
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 3695
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_d
    if-ne v11, v6, :cond_e

    add-float/2addr v3, v2

    add-float/2addr v5, v4

    :cond_e
    move v2, v3

    move v4, v5

    .line 3702
    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->lineTo(FF)V

    goto :goto_4

    :sswitch_7
    const/16 p0, 0x0

    .line 3772
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3773
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 3774
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_f
    const/16 v5, 0x68

    if-ne v11, v5, :cond_10

    add-float/2addr v3, v2

    :cond_10
    move v2, v3

    .line 3780
    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->lineTo(FF)V

    :goto_4
    move v3, v2

    :goto_5
    move v5, v4

    goto/16 :goto_7

    :sswitch_8
    const/16 p0, 0x0

    .line 3710
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 3711
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v5

    .line 3712
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v6

    .line 3713
    invoke-virtual {v0, v6}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v7

    .line 3714
    invoke-virtual {v0, v7}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v10

    .line 3715
    invoke-virtual {v0, v10}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v16

    .line 3716
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    move-result v17

    if-eqz v17, :cond_11

    .line 3717
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_11
    const/16 v8, 0x63

    if-ne v11, v8, :cond_12

    add-float/2addr v10, v2

    add-float v16, v16, v4

    add-float/2addr v3, v2

    add-float/2addr v5, v4

    add-float/2addr v6, v2

    add-float/2addr v7, v4

    :cond_12
    move v2, v3

    move v3, v5

    move v4, v6

    move v5, v7

    move v6, v10

    move/from16 v7, v16

    .line 3728
    invoke-virtual/range {v1 .. v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->cubicTo(FFFFFF)V

    :goto_6
    move v2, v4

    move v4, v5

    move v10, v6

    move/from16 v16, v7

    move v3, v2

    move v2, v10

    move/from16 v4, v16

    goto :goto_7

    :sswitch_9
    move v10, v2

    const/16 p0, 0x0

    .line 3850
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v2

    .line 3851
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v3

    move v5, v4

    .line 3852
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v4

    .line 3853
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFlag(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v6

    .line 3854
    invoke-virtual {v0, v6}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFlag(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v7

    .line 3855
    invoke-virtual {v0, v7}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(Ljava/lang/Boolean;)F

    move-result v9

    .line 3856
    invoke-virtual {v0, v9}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->checkedNextFloat(F)F

    move-result v17

    .line 3857
    invoke-static/range {v17 .. v17}, Ljava/lang/Float;->isNaN(F)Z

    move-result v18

    if-nez v18, :cond_17

    cmpg-float v18, v2, p0

    if-ltz v18, :cond_17

    cmpg-float v18, v3, p0

    if-gez v18, :cond_13

    goto :goto_8

    :cond_13
    const/16 v8, 0x61

    if-ne v11, v8, :cond_14

    add-float/2addr v9, v10

    add-float v17, v17, v5

    :cond_14
    move/from16 v8, v17

    .line 3865
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    move v7, v9

    invoke-virtual/range {v1 .. v8}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->arcTo(FFFZZFF)V

    move v2, v7

    move v3, v2

    move v4, v8

    goto/16 :goto_5

    .line 3874
    :goto_7
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 3875
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v6

    if-eqz v6, :cond_15

    goto :goto_9

    .line 3879
    :cond_15
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->hasLetter()Z

    move-result v6

    if-eqz v6, :cond_16

    .line 3881
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v11

    :cond_16
    const/16 v9, 0x6d

    goto/16 :goto_0

    .line 3858
    :cond_17
    :goto_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v11

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_9
    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_9
        0x43 -> :sswitch_8
        0x48 -> :sswitch_7
        0x4c -> :sswitch_6
        0x4d -> :sswitch_5
        0x51 -> :sswitch_4
        0x53 -> :sswitch_3
        0x54 -> :sswitch_2
        0x56 -> :sswitch_1
        0x5a -> :sswitch_0
        0x61 -> :sswitch_9
        0x63 -> :sswitch_8
        0x68 -> :sswitch_7
        0x6c -> :sswitch_6
        0x6d -> :sswitch_5
        0x71 -> :sswitch_4
        0x73 -> :sswitch_3
        0x74 -> :sswitch_2
        0x76 -> :sswitch_1
        0x7a -> :sswitch_0
    .end sparse-switch
.end method

.method private static parsePreserveAspectRatio(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2977
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->of(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    return-void
.end method

.method private parseProcessingInstructionAttributes(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/components/androidsvg/utils/TextScanner;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1191
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1193
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    const/16 v1, 0x3d

    .line 1194
    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken(C)Ljava/lang/String;

    move-result-object v2

    :goto_0
    if-eqz v2, :cond_0

    .line 1197
    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    .line 1198
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextQuotedString()Ljava/lang/String;

    move-result-object v3

    .line 1199
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1201
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 1202
    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken(C)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static parseRenderQuality(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;
    .locals 2

    .line 3599
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "optimizeSpeed"

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
    const-string v0, "optimizeQuality"

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

    .line 3603
    :pswitch_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeSpeed:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    return-object p0

    .line 3601
    :pswitch_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    return-object p0

    .line 3602
    :pswitch_2
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeQuality:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x379c7c9e -> :sswitch_2
        0x2dddaf -> :sswitch_1
        0x159eff6a -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static parseRequiredFeatures(Ljava/lang/String;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 3896
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3897
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 3899
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3901
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 3902
    const-string v2, "http://www.w3.org/TR/SVG11/feature#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x23

    .line 3903
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 3908
    :cond_0
    const-string v1, "UNSUPPORTED"

    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 3910
    :goto_1
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method private static parseRequiredFormats(Ljava/lang/String;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 3943
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3944
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 3946
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3948
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 3949
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 3950
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method static parseStrokeDashArray(Ljava/lang/String;)[Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 5

    .line 3481
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3482
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 3484
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result p0

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    return-object v1

    .line 3487
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextLength()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p0

    if-nez p0, :cond_1

    return-object v1

    .line 3490
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v1

    .line 3493
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue()F

    move-result v2

    .line 3495
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 3496
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3497
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result p0

    if-nez p0, :cond_5

    .line 3499
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 3500
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextLength()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    move-result-object p0

    if-nez p0, :cond_3

    return-object v1

    .line 3503
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->isNegative()Z

    move-result v4

    if-eqz v4, :cond_4

    return-object v1

    .line 3505
    :cond_4
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3506
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue()F

    move-result p0

    add-float/2addr v2, p0

    goto :goto_0

    :cond_5
    const/4 p0, 0x0

    cmpl-float p0, v2, p0

    if-nez p0, :cond_6

    return-object v1

    :cond_6
    const/4 p0, 0x0

    .line 3514
    new-array p0, p0, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-interface {v3, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-object p0
.end method

.method static parseStrokeLineCap(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;
    .locals 1

    .line 3455
    const-string v0, "butt"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3456
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Butt:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    return-object p0

    .line 3457
    :cond_0
    const-string v0, "round"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3458
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    return-object p0

    .line 3459
    :cond_1
    const-string v0, "square"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 3460
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Square:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static parseStrokeLineJoin(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;
    .locals 1

    .line 3468
    const-string v0, "miter"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3469
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Miter:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    return-object p0

    .line 3470
    :cond_0
    const-string v0, "round"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3471
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    return-object p0

    .line 3472
    :cond_1
    const-string v0, "bevel"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 3473
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Bevel:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static parseStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Ljava/lang/String;)V
    .locals 4

    .line 2655
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->PATTERN_BLOCK_COMMENTS:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const-string v1, ""

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;-><init>(Ljava/lang/String;)V

    .line 2657
    :cond_0
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result p1

    if-nez p1, :cond_6

    .line 2659
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 2660
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object p1

    .line 2661
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    const/16 v1, 0x3b

    .line 2662
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/16 v2, 0x3a

    .line 2664
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_1

    .line 2666
    :cond_2
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 2667
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextPropertyValue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_0

    .line 2670
    :cond_3
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 2671
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2673
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    if-nez v1, :cond_5

    .line 2674
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/Style;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    .line 2675
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    const/4 v3, 0x0

    invoke-static {v1, p1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/Style;->processStyleProperty(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2676
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_6
    :goto_1
    return-void
.end method

.method private static parseSystemLanguage(Ljava/lang/String;)Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 3920
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 3921
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 3923
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3925
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2d

    .line 3926
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    .line 3928
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 3931
    :cond_0
    new-instance v2, Ljava/util/Locale;

    const-string v3, ""

    invoke-direct {v2, v1, v3, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 3932
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 3933
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method static parseTextAnchor(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;
    .locals 2

    .line 3521
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "start"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_1
    const-string v0, "end"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string v0, "middle"

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

    .line 3523
    :pswitch_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object p0

    .line 3525
    :pswitch_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->End:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object p0

    .line 3524
    :pswitch_2
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x4009266b -> :sswitch_2
        0x188db -> :sswitch_1
        0x68ac462 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static parseTextDecoration(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;
    .locals 2

    .line 3417
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "overline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    goto :goto_0

    :sswitch_1
    const-string v0, "blink"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x3

    goto :goto_0

    :sswitch_2
    const-string v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_3
    const-string v0, "underline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_4
    const-string v0, "line-through"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    :goto_0
    packed-switch v1, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 3421
    :pswitch_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Overline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object p0

    .line 3423
    :pswitch_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Blink:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object p0

    .line 3419
    :pswitch_2
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->None:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object p0

    .line 3420
    :pswitch_3
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Underline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object p0

    .line 3422
    :pswitch_4
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->LineThrough:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x45d81614 -> :sswitch_4
        -0x3d363934 -> :sswitch_3
        0x33af38 -> :sswitch_2
        0x597af5c -> :sswitch_1
        0x1f9462c8 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static parseTextDirection(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;
    .locals 1

    .line 3432
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v0, "ltr"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "rtl"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3435
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->RTL:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    return-object p0

    .line 3434
    :cond_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;->LTR:Lcom/flyersoft/components/androidsvg/utils/Style$TextDirection;

    return-object p0
.end method

.method private parseTransformList(Ljava/lang/String;)Landroid/graphics/Matrix;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 2716
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 2718
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v2, v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 2719
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2721
    :goto_0
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v3

    if-nez v3, :cond_12

    .line 2723
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFunction()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_11

    .line 2728
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, 0x5

    const/4 v6, 0x4

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, -0x1

    sparse-switch v4, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v4, "translate"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    const/4 v11, 0x5

    goto :goto_1

    :sswitch_1
    const-string v4, "skewY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v11, 0x4

    goto :goto_1

    :sswitch_2
    const-string v4, "skewX"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    const/4 v11, 0x3

    goto :goto_1

    :sswitch_3
    const-string v4, "scale"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    const/4 v11, 0x2

    goto :goto_1

    :sswitch_4
    const-string v4, "rotate"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_1

    :cond_4
    const/4 v11, 0x1

    goto :goto_1

    :sswitch_5
    const-string v4, "matrix"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_1

    :cond_5
    const/4 v11, 0x0

    :goto_1
    const/4 v4, 0x0

    const/16 v12, 0x29

    .line 2827
    const-string v13, "Invalid transform list: "

    packed-switch v11, :pswitch_data_0

    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid transform list fn: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2753
    :pswitch_0
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2754
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 2755
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->possibleNextFloat()F

    move-result v5

    .line 2756
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2758
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_7

    invoke-virtual {v2, v12}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 2761
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2762
    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    goto/16 :goto_2

    .line 2764
    :cond_6
    invoke-virtual {v1, v3, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    goto/16 :goto_2

    .line 2759
    :cond_7
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2815
    :pswitch_1
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2816
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 2817
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2819
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_8

    invoke-virtual {v2, v12}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_8

    float-to-double v5, v3

    .line 2822
    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->tan(D)D

    move-result-wide v5

    double-to-float v3, v5

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Matrix;->preSkew(FF)Z

    goto/16 :goto_2

    .line 2820
    :cond_8
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2803
    :pswitch_2
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2804
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 2805
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2807
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_9

    invoke-virtual {v2, v12}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_9

    float-to-double v5, v3

    .line 2810
    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->tan(D)D

    move-result-wide v5

    double-to-float v3, v5

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->preSkew(FF)Z

    goto/16 :goto_2

    .line 2808
    :cond_9
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2768
    :pswitch_3
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2769
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 2770
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->possibleNextFloat()F

    move-result v4

    .line 2771
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2773
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_b

    invoke-virtual {v2, v12}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 2776
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 2777
    invoke-virtual {v1, v3, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto/16 :goto_2

    .line 2779
    :cond_a
    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto/16 :goto_2

    .line 2774
    :cond_b
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2783
    :pswitch_4
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2784
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 2785
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->possibleNextFloat()F

    move-result v4

    .line 2786
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->possibleNextFloat()F

    move-result v5

    .line 2787
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2789
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_e

    invoke-virtual {v2, v12}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 2792
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 2793
    invoke-virtual {v1, v3}, Landroid/graphics/Matrix;->preRotate(F)Z

    goto/16 :goto_2

    .line 2794
    :cond_c
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_d

    .line 2795
    invoke-virtual {v1, v3, v4, v5}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    goto/16 :goto_2

    .line 2797
    :cond_d
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2790
    :cond_e
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2730
    :pswitch_5
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2731
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v3

    .line 2732
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2733
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v11

    .line 2734
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2735
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v14

    .line 2736
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2737
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v15

    .line 2738
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2739
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v16

    .line 2740
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2741
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v17

    .line 2742
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2744
    invoke-static/range {v17 .. v17}, Ljava/lang/Float;->isNaN(F)Z

    move-result v18

    if-nez v18, :cond_10

    invoke-virtual {v2, v12}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->consume(C)Z

    move-result v12

    if-eqz v12, :cond_10

    .line 2747
    new-instance v12, Landroid/graphics/Matrix;

    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    const/16 v13, 0x9

    .line 2748
    new-array v13, v13, [F

    aput v3, v13, v10

    aput v14, v13, v9

    aput v16, v13, v8

    aput v11, v13, v7

    aput v15, v13, v6

    aput v17, v13, v5

    const/4 v3, 0x6

    aput v4, v13, v3

    const/4 v3, 0x7

    aput v4, v13, v3

    const/high16 v3, 0x3f800000    # 1.0f

    const/16 v4, 0x8

    aput v3, v13, v4

    invoke-virtual {v12, v13}, Landroid/graphics/Matrix;->setValues([F)V

    .line 2749
    invoke-virtual {v1, v12}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 2830
    :goto_2
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v3

    if-eqz v3, :cond_f

    goto :goto_3

    .line 2832
    :cond_f
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    goto/16 :goto_0

    .line 2745
    :cond_10
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2726
    :cond_11
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Bad transform function encountered in transform list: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_12
    :goto_3
    return-object v1

    :sswitch_data_0
    .sparse-switch
        -0x4072683f -> :sswitch_5
        -0x372522a5 -> :sswitch_4
        0x683094a -> :sswitch_3
        0x686bc8e -> :sswitch_2
        0x686bc8f -> :sswitch_1
        0x3ec0f14e -> :sswitch_0
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

.method private parseUsingSAX(Ljava/io/InputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 824
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    .line 826
    sget-boolean v1, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->FORCE_SAX_ON_EARLY_ANDROIDS:Z

    if-nez v1, :cond_0

    .line 828
    const-string v1, "http://xml.org/sax/features/external-general-entities"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 829
    const-string v1, "http://xml.org/sax/features/external-parameter-entities"

    invoke-virtual {v0, v1, v2}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 832
    :cond_0
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    .line 833
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    .line 835
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl-IA;)V

    .line 836
    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 837
    const-string v2, "http://xml.org/sax/properties/lexical-handler"

    invoke-interface {v0, v2, v1}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 839
    new-instance v1, Lorg/xml/sax/InputSource;

    invoke-direct {v1, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 851
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v1, "Stream error"

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0

    :catch_1
    move-exception p1

    .line 847
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v1, "SVG parse error"

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0

    :catch_2
    move-exception p1

    .line 843
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v1, "XML parser problem"

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0
.end method

.method private parseUsingXmlPullParser(Ljava/io/InputStream;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 745
    :try_start_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 746
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$XPPAttributesWrapper;

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$XPPAttributesWrapper;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 749
    const-string v2, "http://xmlpull.org/v1/doc/features.html#process-docdecl"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 750
    const-string v2, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v4, 0x1

    invoke-interface {v0, v2, v4}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    const/4 v2, 0x0

    .line 751
    invoke-interface {v0, p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 753
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result p1

    :goto_0
    if-eq p1, v4, :cond_9

    if-eqz p1, :cond_8

    const/16 v2, 0x8

    if-eq p1, v2, :cond_7

    const/16 v2, 0x3a

    const/4 v5, 0x2

    if-eq p1, v5, :cond_5

    const/4 v6, 0x3

    if-eq p1, v6, :cond_3

    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1

    const/4 v2, 0x6

    if-eq p1, v2, :cond_0

    goto/16 :goto_1

    .line 778
    :cond_0
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->text(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 781
    :cond_1
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->text(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 773
    :cond_2
    new-array p1, v5, [I

    .line 774
    invoke-interface {v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getTextCharacters([I)[C

    move-result-object v2

    .line 775
    aget v5, p1, v3

    aget p1, p1, v4

    invoke-direct {p0, v2, v5, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->text([CII)V

    goto :goto_1

    .line 767
    :cond_3
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    .line 768
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 769
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getPrefix()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 770
    :cond_4
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v2, v5, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 761
    :cond_5
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    .line 762
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 763
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getPrefix()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 764
    :cond_6
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v2, v5, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    goto :goto_1

    .line 793
    :cond_7
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 794
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 795
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseProcessingInstructionAttributes(Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, v2, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->handleProcessingInstruction(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    .line 758
    :cond_8
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->startDocument()V

    .line 798
    :goto_1
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextToken()I

    move-result p1

    goto/16 :goto_0

    .line 800
    :cond_9
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->endDocument()V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 809
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v1, "Stream error"

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0

    :catch_1
    move-exception p1

    .line 805
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v1, "XML parser problem"

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0
.end method

.method static parseVectorEffect(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;
    .locals 1

    .line 3587
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "non-scaling-stroke"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3590
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->NonScalingStroke:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    return-object p0

    .line 3589
    :cond_1
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;->None:Lcom/flyersoft/components/androidsvg/utils/Style$VectorEffect;

    return-object p0
.end method

.method private static parseViewBox(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 2950
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 2951
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 2953
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p0

    .line 2954
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2955
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v1

    .line 2956
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2957
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v2

    .line 2958
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 2959
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v0

    .line 2961
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x0

    cmpg-float v4, v2, v3

    if-ltz v4, :cond_1

    cmpg-float v3, v0, v3

    if-ltz v3, :cond_0

    .line 2968
    new-instance v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v3, p0, v1, v2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    return-object v3

    .line 2966
    :cond_0
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid viewBox. height cannot be negative"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2964
    :cond_1
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid viewBox. width cannot be negative"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2962
    :cond_2
    new-instance p0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid viewBox definition - should have four numbers"

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private path(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1499
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<path>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1501
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1503
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;-><init>()V

    .line 1504
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1505
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1506
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1507
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1508
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1509
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1510
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;Lorg/xml/sax/Attributes;)V

    .line 1511
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1502
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private pattern(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2424
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<pattern>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2426
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2428
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;-><init>()V

    .line 2429
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2430
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2431
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2432
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2433
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2434
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesViewBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;Lorg/xml/sax/Attributes;)V

    .line 2435
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesPattern(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;Lorg/xml/sax/Attributes;)V

    .line 2436
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2437
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2427
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private polygon(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1809
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<polygon>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1811
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1813
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;-><init>()V

    .line 1814
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1815
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1816
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1817
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1818
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1819
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1820
    const-string v1, "polygon"

    invoke-direct {p0, v0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesPolyLine(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;Lorg/xml/sax/Attributes;Ljava/lang/String;)V

    .line 1821
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1812
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private polyline(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1752
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<polyline>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1754
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1756
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;-><init>()V

    .line 1757
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1758
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1759
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1760
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1761
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1762
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1763
    const-string v1, "polyline"

    invoke-direct {p0, v0, p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesPolyLine(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;Lorg/xml/sax/Attributes;Ljava/lang/String;)V

    .line 1764
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1755
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private radialGradient(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2186
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<radialGradient>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2188
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2190
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;-><init>()V

    .line 2191
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2192
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2193
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2194
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2195
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;Lorg/xml/sax/Attributes;)V

    .line 2196
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesRadialGradient(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgRadialGradient;Lorg/xml/sax/Attributes;)V

    .line 2197
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2198
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2189
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private rect(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1543
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<rect>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1545
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1547
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;-><init>()V

    .line 1548
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1549
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1550
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1551
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1552
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1553
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1554
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesRect(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;Lorg/xml/sax/Attributes;)V

    .line 1555
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    return-void

    .line 1546
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private solidColor(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2310
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<solidColor>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2312
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2314
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;-><init>()V

    .line 2315
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2316
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2317
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2318
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2319
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2320
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2313
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private startDocument()V
    .locals 3

    .line 919
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->enableInternalEntities:Z

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;-><init>(ZLcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    return-void
.end method

.method private startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 925
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 926
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoreDepth:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoreDepth:I

    return-void

    .line 929
    :cond_0
    const-string v0, "http://www.w3.org/2000/svg"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    .line 933
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_2

    goto :goto_0

    :cond_2
    move-object p2, p3

    .line 935
    :goto_0
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    move-result-object p1

    .line 936
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;->ordinal()I

    move-result p2

    packed-switch p2, :pswitch_data_0

    .line 1002
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    .line 1003
    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoreDepth:I

    return-void

    .line 994
    :pswitch_0
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->view(Lorg/xml/sax/Attributes;)V

    return-void

    .line 947
    :pswitch_1
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->use(Lorg/xml/sax/Attributes;)V

    return-void

    .line 965
    :pswitch_2
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->tspan(Lorg/xml/sax/Attributes;)V

    return-void

    .line 967
    :pswitch_3
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->tref(Lorg/xml/sax/Attributes;)V

    return-void

    .line 988
    :pswitch_4
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->textPath(Lorg/xml/sax/Attributes;)V

    return-void

    .line 963
    :pswitch_5
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->text(Lorg/xml/sax/Attributes;)V

    return-void

    .line 971
    :pswitch_6
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->symbol(Lorg/xml/sax/Attributes;)V

    return-void

    .line 969
    :pswitch_7
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->zwitch(Lorg/xml/sax/Attributes;)V

    return-void

    .line 998
    :pswitch_8
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->style(Lorg/xml/sax/Attributes;)V

    return-void

    .line 979
    :pswitch_9
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->stop(Lorg/xml/sax/Attributes;)V

    return-void

    .line 1000
    :pswitch_a
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->solidColor(Lorg/xml/sax/Attributes;)V

    return-void

    .line 951
    :pswitch_b
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->rect(Lorg/xml/sax/Attributes;)V

    return-void

    .line 977
    :pswitch_c
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->radialGradient(Lorg/xml/sax/Attributes;)V

    return-void

    .line 959
    :pswitch_d
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->polyline(Lorg/xml/sax/Attributes;)V

    return-void

    .line 961
    :pswitch_e
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->polygon(Lorg/xml/sax/Attributes;)V

    return-void

    .line 990
    :pswitch_f
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->pattern(Lorg/xml/sax/Attributes;)V

    return-void

    .line 949
    :pswitch_10
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->path(Lorg/xml/sax/Attributes;)V

    return-void

    .line 996
    :pswitch_11
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->mask(Lorg/xml/sax/Attributes;)V

    return-void

    .line 973
    :pswitch_12
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->marker(Lorg/xml/sax/Attributes;)V

    return-void

    .line 975
    :pswitch_13
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->linearGradient(Lorg/xml/sax/Attributes;)V

    return-void

    .line 957
    :pswitch_14
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->line(Lorg/xml/sax/Attributes;)V

    return-void

    .line 992
    :pswitch_15
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->image(Lorg/xml/sax/Attributes;)V

    return-void

    .line 941
    :pswitch_16
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->g(Lorg/xml/sax/Attributes;)V

    return-void

    .line 955
    :pswitch_17
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ellipse(Lorg/xml/sax/Attributes;)V

    return-void

    .line 982
    :pswitch_18
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inMetadataElement:Z

    .line 983
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataTag:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGElem;

    return-void

    .line 943
    :pswitch_19
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->defs(Lorg/xml/sax/Attributes;)V

    return-void

    .line 986
    :pswitch_1a
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->clipPath(Lorg/xml/sax/Attributes;)V

    return-void

    .line 953
    :pswitch_1b
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->circle(Lorg/xml/sax/Attributes;)V

    return-void

    .line 945
    :pswitch_1c
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->a(Lorg/xml/sax/Attributes;)V

    return-void

    .line 939
    :pswitch_1d
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svg(Lorg/xml/sax/Attributes;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_18
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private stop(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2244
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<stop>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2246
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_1

    .line 2248
    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;

    if-eqz v0, :cond_0

    .line 2250
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;-><init>()V

    .line 2251
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2252
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2253
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2254
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2255
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStop(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;Lorg/xml/sax/Attributes;)V

    .line 2256
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2257
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2249
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. <stop> elements are only valid inside <linearGradient> or <radialGradient> elements."

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2247
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private style(Lorg/xml/sax/Attributes;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 3977
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "<style>"

    invoke-direct {p0, v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 3979
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v1, :cond_4

    const/4 v1, 0x1

    .line 3986
    const-string v2, "all"

    const/4 v3, 0x1

    :goto_0
    invoke-interface {p1}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 3988
    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 3989
    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;

    move-result-object v5

    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SVGAttr;->ordinal()I

    move-result v5

    const/16 v6, 0x34

    if-eq v5, v6, :cond_1

    const/16 v6, 0x5d

    if-eq v5, v6, :cond_0

    goto :goto_1

    .line 3992
    :cond_0
    const-string v3, "text/css"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_1

    :cond_1
    move-object v2, v4

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_3

    .line 4002
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    invoke-static {v2, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->mediaMatches(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 4003
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inStyleElement:Z

    return-void

    .line 4005
    :cond_3
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    .line 4006
    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoreDepth:I

    return-void

    .line 3980
    :cond_4
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private svg(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1239
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<svg>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1241
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;-><init>()V

    .line 1242
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1243
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1244
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1245
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1246
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1247
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesViewBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;Lorg/xml/sax/Attributes;)V

    .line 1248
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesSVG(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;Lorg/xml/sax/Attributes;)V

    .line 1249
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-nez p1, :cond_0

    .line 1250
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setRootElement(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;)V

    goto :goto_0

    .line 1252
    :cond_0
    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1254
    :goto_0
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void
.end method

.method private symbol(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2007
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<symbol>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2009
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2011
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;-><init>()V

    .line 2012
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2013
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2014
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2015
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2016
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2017
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesViewBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;Lorg/xml/sax/Attributes;)V

    .line 2018
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2019
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2010
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private text(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1011
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1014
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inMetadataElement:Z

    if-eqz v0, :cond_2

    .line 1016
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    if-nez v0, :cond_1

    .line 1017
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    .line 1018
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 1020
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inStyleElement:Z

    if-eqz v0, :cond_4

    .line 1022
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    if-nez v0, :cond_3

    .line 1023
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    .line 1024
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 1026
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    if-eqz v0, :cond_5

    .line 1028
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->appendToTextContainer(Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-void
.end method

.method private text(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1831
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<text>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1833
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1835
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;-><init>()V

    .line 1836
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1837
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1838
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1839
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1840
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1841
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1842
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTextPosition(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;Lorg/xml/sax/Attributes;)V

    .line 1843
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1844
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1834
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private text([CII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1035
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->ignoring:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1038
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inMetadataElement:Z

    if-eqz v0, :cond_2

    .line 1040
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    if-nez v0, :cond_1

    .line 1041
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    .line 1042
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->metadataElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    return-void

    .line 1044
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->inStyleElement:Z

    if-eqz v0, :cond_4

    .line 1046
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    if-nez v0, :cond_3

    .line 1047
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    .line 1048
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->styleElementContents:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    return-void

    .line 1050
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    if-eqz v0, :cond_5

    .line 1052
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->appendToTextContainer(Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-void
.end method

.method private textPath(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2377
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<textPath>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2379
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_1

    .line 2381
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;-><init>()V

    .line 2382
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2383
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2384
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2385
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2386
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2387
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTextPath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;Lorg/xml/sax/Attributes;)V

    .line 2388
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2389
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2390
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    instance-of p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    if-eqz p1, :cond_0

    .line 2391
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V

    return-void

    .line 2393
    :cond_0
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;

    invoke-interface {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;->getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V

    return-void

    .line 2380
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private tref(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1908
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<tref>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1910
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_2

    .line 1912
    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    if-eqz v0, :cond_1

    .line 1914
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;-><init>()V

    .line 1915
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1916
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1917
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1918
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1919
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1920
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTRef(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;Lorg/xml/sax/Attributes;)V

    .line 1921
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1922
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    instance-of p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    if-eqz p1, :cond_0

    .line 1923
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V

    return-void

    .line 1925
    :cond_0
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;

    invoke-interface {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;->getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V

    return-void

    .line 1913
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. <tref> elements are only valid inside <text> or <tspan> elements."

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1911
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private tspan(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1880
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<tspan>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1882
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_2

    .line 1884
    instance-of v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;

    if-eqz v0, :cond_1

    .line 1886
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;-><init>()V

    .line 1887
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1888
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1889
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1890
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1891
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1892
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTextPosition(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;Lorg/xml/sax/Attributes;)V

    .line 1893
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1894
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1895
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    instance-of p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    if-eqz p1, :cond_0

    .line 1896
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V

    return-void

    .line 1898
    :cond_0
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;

    invoke-interface {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;->getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TSpan;->setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V

    return-void

    .line 1885
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. <tspan> elements are only valid inside <text> or other <tspan> elements."

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1883
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private use(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1382
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<use>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1384
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1386
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;-><init>()V

    .line 1387
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1388
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1389
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1390
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1391
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1392
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1393
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesUse(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;Lorg/xml/sax/Attributes;)V

    .line 1394
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1395
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1385
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private view(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 2502
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<view>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2504
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 2506
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;-><init>()V

    .line 2507
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 2508
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$View;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 2509
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 2510
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 2511
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesViewBox(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;Lorg/xml/sax/Attributes;)V

    .line 2512
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 2513
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 2505
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private zwitch(Lorg/xml/sax/Attributes;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1954
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "<switch>"

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1956
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-eqz v0, :cond_0

    .line 1958
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;-><init>()V

    .line 1959
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    .line 1960
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    iput-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    .line 1961
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesCore(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1962
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesStyle(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;Lorg/xml/sax/Attributes;)V

    .line 1963
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesTransform(Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;Lorg/xml/sax/Attributes;)V

    .line 1964
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseAttributesConditional(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;Lorg/xml/sax/Attributes;)V

    .line 1965
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V

    .line 1966
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->currentElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    return-void

    .line 1957
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/SVGParseException;

    const-string v0, "Invalid document. Root element must be <svg>"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public parseStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 589
    const-string v0, "Exception thrown closing input stream"

    const-string v1, "SVGParser"

    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v2

    if-nez v2, :cond_0

    .line 591
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p1, v2

    :cond_0
    const/4 v2, 0x3

    .line 595
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->mark(I)V

    .line 596
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v2

    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v3

    shl-int/lit8 v3, v3, 0x8

    add-int/2addr v2, v3

    .line 597
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    const v3, 0x8b1f

    if-ne v2, v3, :cond_1

    .line 600
    new-instance v2, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v3, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p1, v2

    .line 610
    :catch_0
    :cond_1
    :try_start_1
    sget-boolean v2, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->FORCE_SAX_ON_EARLY_ANDROIDS:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 611
    const-string v2, "Forcing SAX parser for this version of Android"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-direct {p0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 612
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseUsingSAX(Ljava/io/InputStream;)V

    .line 613
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 650
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 652
    :catch_1
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-object v2

    .line 616
    :cond_2
    :try_start_3
    iget-boolean v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->enableInternalEntities:Z

    if-eqz v2, :cond_3

    const/16 v2, 0x1000

    .line 619
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->mark(I)V

    .line 621
    new-array v2, v2, [B

    .line 622
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 626
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v2, v3, v4}, Ljava/lang/String;-><init>([BII)V

    .line 628
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 629
    const-string v2, "<!ENTITY "

    invoke-virtual {v5, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 632
    const-string v2, "Switching to SAX parser to process entities"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-direct {p0, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 633
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseUsingSAX(Ljava/io/InputStream;)V

    .line 634
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 650
    :try_start_4
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 652
    :catch_2
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-object v2

    .line 639
    :cond_3
    :try_start_5
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseUsingXmlPullParser(Ljava/io/InputStream;)V

    .line 640
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 650
    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_2

    .line 652
    :catch_3
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-object v2

    :catchall_0
    move-exception v2

    goto :goto_4

    :catch_4
    move-exception v2

    .line 643
    :try_start_7
    const-string v3, "Error occurred while performing check for entities.  File may not be parsed correctly if it contains entity definitions."

    invoke-static {v1, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 644
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->parseUsingXmlPullParser(Ljava/io/InputStream;)V

    .line 645
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->svgDocument:Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 650
    :try_start_8
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_3

    .line 652
    :catch_5
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    return-object v2

    .line 650
    :goto_4
    :try_start_9
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    goto :goto_5

    .line 652
    :catch_6
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    :goto_5
    throw v2
.end method

.method public setExternalFileResolver(Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)Lcom/flyersoft/components/androidsvg/utils/SVGParser;
    .locals 0

    .line 669
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-object p0
.end method

.method public setInternalEntitiesEnabled(Z)Lcom/flyersoft/components/androidsvg/utils/SVGParser;
    .locals 0

    .line 663
    iput-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->enableInternalEntities:Z

    return-object p0
.end method
