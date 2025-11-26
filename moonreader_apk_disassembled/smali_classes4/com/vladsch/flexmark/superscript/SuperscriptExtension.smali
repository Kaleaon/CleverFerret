.class public Lcom/vladsch/flexmark/superscript/SuperscriptExtension;
.super Ljava/lang/Object;
.source "SuperscriptExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;


# static fields
.field public static final SUPERSCRIPT_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPERSCRIPT_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    const-string v2, "SUPERSCRIPT_STYLE_HTML_OPEN"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;->SUPERSCRIPT_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 21
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "SUPERSCRIPT_STYLE_HTML_CLOSE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;->SUPERSCRIPT_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 47
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 48
    new-instance p2, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 49
    :cond_0
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 50
    new-instance p2, Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    :cond_1
    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 42
    new-instance v0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptDelimiterProcessor;

    invoke-direct {v0}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptDelimiterProcessor;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->customDelimiterProcessor(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;)Lcom/vladsch/flexmark/parser/Parser$Builder;

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
