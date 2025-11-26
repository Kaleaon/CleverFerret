.class public Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.super Ljava/lang/Object;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassTarget;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNot;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassEmpty;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassRoot;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;,
        Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;
    }
.end annotation


# static fields
.field static final CLASS:Ljava/lang/String; = "class"

.field static final CSS_MIME_TYPE:Ljava/lang/String; = "text/css"

.field static final ID:Ljava/lang/String; = "id"

.field private static final SPECIFICITY_ATTRIBUTE_OR_PSEUDOCLASS:I = 0x3e8

.field private static final SPECIFICITY_ELEMENT_OR_PSEUDOELEMENT:I = 0x1

.field private static final SPECIFICITY_ID_ATTRIBUTE:I = 0xf4240

.field private static final TAG:Ljava/lang/String; = "CSSParser"


# instance fields
.field private deviceMediaType:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field private externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

.field private inMediaRule:Z

.field private source:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;


# direct methods
.method constructor <init>()V
    .locals 3

    .line 389
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;->Document:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V
    .locals 1

    .line 400
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->inMediaRule:Z

    .line 401
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->deviceMediaType:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 402
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->source:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    .line 403
    iput-object p3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V
    .locals 1

    .line 395
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    invoke-direct {p0, v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    return-void
.end method

.method private static getChildPosition(Ljava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;",
            ">;I",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;",
            ")I"
        }
    .end annotation

    const/4 v0, 0x0

    if-gez p1, :cond_0

    return v0

    .line 790
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    iget-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    const/4 v1, -0x1

    if-eq p0, p1, :cond_1

    return v1

    .line 793
    :cond_1
    iget-object p0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    if-ne p1, p2, :cond_2

    return v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method static mediaMatches(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;)Z
    .locals 1

    .line 418
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;-><init>(Ljava/lang/String;)V

    .line 419
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 420
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseMediaList(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Ljava/util/List;

    move-result-object p0

    .line 421
    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->mediaMatches(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;)Z

    move-result p0

    return p0
.end method

.method private static mediaMatches(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;",
            ">;",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;",
            ")Z"
        }
    .end annotation

    .line 455
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 457
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 458
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->all:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    if-eq v0, v2, :cond_2

    if-ne v0, p1, :cond_1

    :cond_2
    return v1

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method private parseAtRule(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 487
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 488
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    if-eqz v0, :cond_b

    .line 491
    iget-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->inMediaRule:Z

    const-string v2, "Invalid @media rule: expected \'}\' at end of rule set"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_3

    const-string v1, "media"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 493
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseMediaList(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x7b

    .line 494
    invoke-virtual {p2, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 497
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 498
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->deviceMediaType:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    invoke-static {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->mediaMatches(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 499
    iput-boolean v4, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->inMediaRule:Z

    .line 500
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseRuleset(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->addAll(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V

    .line 501
    iput-boolean v3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->inMediaRule:Z

    goto :goto_0

    .line 503
    :cond_0
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseRuleset(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    .line 506
    :goto_0
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result p1

    if-nez p1, :cond_a

    const/16 p1, 0x7d

    invoke-virtual {p2, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result p1

    if-eqz p1, :cond_1

    goto/16 :goto_2

    .line 507
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    invoke-direct {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 495
    :cond_2
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string p2, "Invalid @media rule: missing rule set"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 510
    :cond_3
    iget-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->inMediaRule:Z

    if-nez v1, :cond_9

    const-string v1, "import"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 512
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextURL()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    .line 514
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextCSSString()Ljava/lang/String;

    move-result-object v0

    :cond_4
    if-eqz v0, :cond_8

    .line 518
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 519
    invoke-static {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseMediaList(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Ljava/util/List;

    move-result-object v1

    .line 521
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v3

    if-nez v3, :cond_6

    const/16 v3, 0x3b

    invoke-virtual {p2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_1

    .line 522
    :cond_5
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    invoke-direct {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 524
    :cond_6
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->deviceMediaType:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    invoke-static {v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->mediaMatches(Ljava/util/List;Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 525
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->externalFileResolver:Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;->resolveCSSStyleSheet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 528
    :cond_7
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parse(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->addAll(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;)V

    goto :goto_2

    .line 516
    :cond_8
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string p2, "Invalid @import rule: expected string or url()"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 535
    :cond_9
    new-array p1, v4, [Ljava/lang/Object;

    aput-object v0, p1, v3

    const-string v0, "Ignoring @%s rule"

    invoke-static {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 536
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->skipAtRule(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)V

    .line 538
    :cond_a
    :goto_2
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    return-void

    .line 490
    :cond_b
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string p2, "Invalid \'@\' rule"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static parseClassAttribute(Ljava/lang/String;)Ljava/util/List;
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

    .line 654
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 657
    :goto_0
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 659
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    if-nez p0, :cond_1

    .line 663
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 664
    :cond_1
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 665
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_2
    return-object p0
.end method

.method private parseDeclarations(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Lcom/flyersoft/components/androidsvg/utils/Style;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 619
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/Style;-><init>()V

    .line 621
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 622
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    const/16 v2, 0x3a

    .line 623
    invoke-virtual {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 625
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 626
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextPropertyValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 630
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    const/16 v3, 0x21

    .line 631
    invoke-virtual {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 632
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 633
    const-string v3, "important"

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 637
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    goto :goto_0

    .line 634
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string v0, "Malformed rule set: found unexpected \'!\'"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    const/16 v3, 0x3b

    .line 639
    invoke-virtual {p1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    const/4 v3, 0x0

    .line 641
    invoke-static {v0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/Style;->processStyleProperty(Lcom/flyersoft/components/androidsvg/utils/Style;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 642
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 643
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_3

    const/16 v1, 0x7d

    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_3
    return-object v0

    .line 628
    :cond_4
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string v0, "Expected property value"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 624
    :cond_5
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string v0, "Expected \':\'"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static parseMediaList(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;",
            ")",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;",
            ">;"
        }
    .end annotation

    .line 467
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 468
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 469
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextWord()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 473
    :cond_1
    :try_start_0
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 478
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipCommaWhitespace()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    :goto_1
    return-object v0
.end method

.method private parseRule(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 596
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextSelectorGroup()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 597
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v1, 0x7b

    .line 599
    invoke-virtual {p2, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 601
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 602
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseDeclarations(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Lcom/flyersoft/components/androidsvg/utils/Style;

    move-result-object v1

    .line 603
    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 604
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    .line 605
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->source:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    invoke-direct {v2, v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;Lcom/flyersoft/components/androidsvg/utils/Style;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;)V

    invoke-virtual {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;->add(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 600
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string p2, "Malformed rule block: expected \'{\'"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private parseRuleset(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;
    .locals 2

    .line 563
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;-><init>()V

    .line 566
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 568
    const-string v1, "<!--"

    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 570
    :cond_0
    const-string v1, "-->"

    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/16 v1, 0x40

    .line 573
    invoke-virtual {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 574
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseAtRule(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)V

    goto :goto_0

    .line 577
    :cond_2
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseRule(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Z

    move-result v1
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/utils/CSSParseException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_3

    goto :goto_0

    :catch_0
    :cond_3
    return-object v0
.end method

.method private static ruleMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;",
            "I",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;",
            ">;I",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;",
            ")Z"
        }
    .end annotation

    .line 719
    invoke-virtual/range {p1 .. p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->get(I)Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    move-result-object v4

    .line 720
    invoke-static {p0, v4, p5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->selectorMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_0

    return v6

    .line 724
    :cond_0
    iget-object v5, v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->DESCENDANT:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const/4 v8, 0x1

    if-ne v5, v7, :cond_4

    if-nez p2, :cond_1

    return v8

    :cond_1
    move v2, p4

    :goto_0
    if-ltz v2, :cond_3

    add-int/lit8 v4, p2, -0x1

    .line 730
    invoke-static {p0, p1, v4, p3, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatchOnAncestors(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;I)Z

    move-result v4

    if-eqz v4, :cond_2

    return v8

    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_3
    return v6

    .line 736
    :cond_4
    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    if-ne v4, v5, :cond_5

    add-int/lit8 v2, p2, -0x1

    .line 738
    invoke-static {p0, p1, v2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatchOnAncestors(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;I)Z

    move-result v0

    return v0

    .line 742
    :cond_5
    invoke-static/range {p3 .. p5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->getChildPosition(Ljava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)I

    move-result v5

    if-gtz v5, :cond_6

    return v6

    .line 745
    :cond_6
    iget-object v2, p5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object v2

    sub-int/2addr v5, v8

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    add-int/lit8 v2, p2, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    .line 746
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result v0

    return v0
.end method

.method static ruleMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 6

    .line 696
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 697
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->get(I)Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->selectorMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result p0

    return p0

    .line 700
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 701
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    :goto_0
    if-eqz v0, :cond_1

    .line 703
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 704
    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    goto :goto_0

    .line 707
    :cond_1
    invoke-static {v3}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 711
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->size()I

    move-result v0

    add-int/lit8 v2, v0, -0x1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v4, v0, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result p0

    return p0
.end method

.method private static ruleMatchOnAncestors(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;I)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;",
            "I",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;",
            ">;I)Z"
        }
    .end annotation

    .line 753
    invoke-virtual/range {p1 .. p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->get(I)Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    move-result-object v2

    .line 754
    invoke-interface/range {p3 .. p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    .line 756
    invoke-static {p0, v2, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->selectorMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result v6

    const/4 v7, 0x0

    if-nez v6, :cond_0

    return v7

    .line 760
    :cond_0
    iget-object v6, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v8, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->DESCENDANT:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const/4 v9, 0x1

    if-ne v6, v8, :cond_4

    if-nez p2, :cond_1

    return v9

    :cond_1
    move v4, p4

    :cond_2
    if-lez v4, :cond_3

    add-int/lit8 v2, p2, -0x1

    add-int/lit8 v4, v4, -0x1

    .line 766
    invoke-static {p0, p1, v2, p3, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatchOnAncestors(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;I)Z

    move-result v2

    if-eqz v2, :cond_2

    return v9

    :cond_3
    return v7

    .line 771
    :cond_4
    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    if-ne v2, v6, :cond_5

    add-int/lit8 v2, p2, -0x1

    add-int/lit8 v4, p4, -0x1

    .line 773
    invoke-static {p0, p1, v2, p3, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatchOnAncestors(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;I)Z

    move-result v0

    return v0

    .line 777
    :cond_5
    invoke-static {p3, p4, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->getChildPosition(Ljava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)I

    move-result v2

    if-gtz v2, :cond_6

    return v7

    .line 780
    :cond_6
    iget-object v5, v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object v5

    sub-int/2addr v2, v9

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    add-int/lit8 v2, p2, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    .line 781
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->ruleMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;ILjava/util/List;ILcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result v0

    return v0
.end method

.method private static selectorMatch(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 6

    .line 806
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->getNodeName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 812
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    if-eqz v0, :cond_5

    .line 814
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_5

    .line 817
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;

    .line 818
    iget-object v4, v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->name:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    const-string v5, "id"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "class"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    return v1

    .line 824
    :cond_1
    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->classNames:Ljava/util/List;

    if-nez v4, :cond_2

    return v1

    .line 826
    :cond_2
    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->classNames:Ljava/util/List;

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->value:Ljava/lang/String;

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v1

    .line 820
    :cond_3
    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->value:Ljava/lang/String;

    iget-object v4, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v1

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 837
    :cond_5
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    if-eqz v0, :cond_7

    .line 838
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_7

    .line 840
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;

    .line 841
    invoke-interface {v3, p0, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;->matches(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z

    move-result v3

    if-nez v3, :cond_6

    return v1

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_7
    const/4 p0, 0x1

    return p0
.end method

.method private skipAtRule(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)V
    .locals 3

    const/4 v0, 0x0

    .line 546
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 548
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x3b

    if-ne v1, v2, :cond_1

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    const/16 v2, 0x7b

    if-ne v1, v2, :cond_2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/16 v2, 0x7d

    if-ne v1, v2, :cond_0

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    if-nez v0, :cond_0

    :cond_3
    :goto_1
    return-void
.end method

.method private static varargs warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 430
    const-string v0, "CSSParser"

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method parse(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;
    .locals 1

    .line 409
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;

    invoke-direct {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;-><init>(Ljava/lang/String;)V

    .line 410
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 412
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parseRuleset(Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    move-result-object p1

    return-object p1
.end method
