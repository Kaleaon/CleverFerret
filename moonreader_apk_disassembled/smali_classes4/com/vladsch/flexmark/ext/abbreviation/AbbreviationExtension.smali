.class public Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;
.super Ljava/lang/Object;
.source "AbbreviationExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;
.implements Lcom/vladsch/flexmark/parser/Parser$ReferenceHoldingExtension;
.implements Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;


# static fields
.field public static final ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;",
            ">;"
        }
    .end annotation
.end field

.field public static final ABBREVIATIONS_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation
.end field

.field public static final ABBREVIATIONS_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ElementPlacement;",
            ">;"
        }
    .end annotation
.end field

.field public static final ABBREVIATIONS_SORT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECOMPUTE_ABBREVIATIONS_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final USE_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "ABBREVIATIONS_KEEP"

    sget-object v2, Lcom/vladsch/flexmark/util/KeepType;->FIRST:Lcom/vladsch/flexmark/util/KeepType;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 32
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension$1;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension$1;-><init>()V

    const-string v2, "ABBREVIATIONS"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 42
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "USE_LINKS"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->USE_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "ABBREVIATIONS_PLACEMENT"

    sget-object v3, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-direct {v0, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 46
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "ABBREVIATIONS_SORT"

    sget-object v3, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    invoke-direct {v0, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS_SORT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 48
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "RECOMPUTE_ABBREVIATIONS_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->RECOMPUTE_ABBREVIATIONS_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 51
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 1

    .line 56
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactory(Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 90
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 91
    new-instance p2, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 92
    :cond_0
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 83
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->customBlockParserFactory(Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    .line 85
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactory(Lcom/vladsch/flexmark/parser/PostProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

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
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
