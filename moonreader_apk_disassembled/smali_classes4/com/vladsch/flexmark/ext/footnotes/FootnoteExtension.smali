.class public Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;
.super Ljava/lang/Object;
.source "FootnoteExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;
.implements Lcom/vladsch/flexmark/parser/Parser$ReferenceHoldingExtension;
.implements Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;


# static fields
.field public static final FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_BACK_LINK_REF_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_BACK_REF_STRING:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_LINK_REF_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ElementPlacement;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_REF_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_REF_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOOTNOTE_SORT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTES_KEEP"

    sget-object v2, Lcom/vladsch/flexmark/util/KeepType;->FIRST:Lcom/vladsch/flexmark/util/KeepType;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension$1;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension$1;-><init>()V

    const-string v2, "FOOTNOTES"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 33
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_REF_PREFIX"

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_REF_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_REF_SUFFIX"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_REF_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_BACK_REF_STRING"

    const-string v2, "&#8617;"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_BACK_REF_STRING:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_LINK_REF_CLASS"

    const-string v2, "footnote-ref"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_LINK_REF_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 37
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_BACK_LINK_REF_CLASS"

    const-string v2, "footnote-backref"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_BACK_LINK_REF_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 40
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_PLACEMENT"

    sget-object v2, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 41
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FOOTNOTE_SORT"

    sget-object v2, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_SORT:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 47
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 1

    .line 52
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactory(Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 81
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 82
    new-instance p2, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 83
    :cond_0
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 75
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->customBlockParserFactory(Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    .line 76
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessorFactory(Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    return-void
.end method

.method public parserOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    return-void
.end method

.method public rendererOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    return-void
.end method

.method public transferReferences(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Lcom/vladsch/flexmark/util/options/DataHolder;)Z
    .locals 3

    .line 67
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lcom/vladsch/flexmark/util/KeepType;->FIRST:Lcom/vladsch/flexmark/util/KeepType;

    if-ne p1, v0, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-static {v1, p2, v2}, Lcom/vladsch/flexmark/parser/Parser;->transferReferences(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ast/NodeRepository;Z)Z

    move-result p1

    return p1

    :cond_1
    return v2
.end method
