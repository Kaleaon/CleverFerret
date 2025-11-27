.class public Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;
.super Ljava/lang/Object;
.source "AttributesExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/RendererExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;
.implements Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;


# static fields
.field public static final ASSIGN_TEXT_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ATTRIBUTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation
.end field

.field public static final NODE_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;",
            ">;"
        }
    .end annotation
.end field

.field public static final USE_EMPTY_IMPLICIT_AS_SPAN_DELIMITER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final WRAP_NON_ATTRIBUTE_TEXT:Lcom/vladsch/flexmark/util/options/DataKey;
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
    .locals 3

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension$1;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension$1;-><init>()V

    const-string v2, "NODE_ATTRIBUTES"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->NODE_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 33
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "ATTRIBUTES_KEEP"

    sget-object v2, Lcom/vladsch/flexmark/util/KeepType;->FIRST:Lcom/vladsch/flexmark/util/KeepType;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->ATTRIBUTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "ASSIGN_TEXT_ATTRIBUTES"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->ASSIGN_TEXT_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "WRAP_NON_ATTRIBUTE_TEXT"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->WRAP_NON_ATTRIBUTE_TEXT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "USE_EMPTY_IMPLICIT_AS_SPAN_DELIMITER"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->USE_EMPTY_IMPLICIT_AS_SPAN_DELIMITER:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 42
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 1

    .line 58
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactory(Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 68
    sget-object p2, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->ASSIGN_TEXT_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 69
    new-instance p2, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    .line 71
    :cond_0
    new-instance p2, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactory(Lcom/vladsch/flexmark/html/AttributeProviderFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/html/RendererBuilder;Ljava/lang/String;)V
    .locals 0

    .line 77
    new-instance p2, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;-><init>()V

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/html/RendererBuilder;->attributeProviderFactory(Lcom/vladsch/flexmark/html/AttributeProviderFactory;)Lcom/vladsch/flexmark/html/RendererBuilder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 52
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactory(Lcom/vladsch/flexmark/parser/PostProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    .line 53
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->customInlineParserExtensionFactory(Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

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
