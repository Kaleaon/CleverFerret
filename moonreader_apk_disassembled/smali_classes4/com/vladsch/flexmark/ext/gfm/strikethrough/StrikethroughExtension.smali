.class public Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughExtension;
.super Ljava/lang/Object;
.source "StrikethroughExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;


# static fields
.field public static final STRIKETHROUGH_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRIKETHROUGH_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;
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
    .locals 1

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->STRIKETHROUGH_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughExtension;->STRIKETHROUGH_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->STRIKETHROUGH_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughExtension;->STRIKETHROUGH_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 48
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 49
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 50
    :cond_0
    const-string p2, "YOUTRACK"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 51
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughYouTrackRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughYouTrackRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 52
    :cond_1
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 53
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughJiraRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughJiraRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    :cond_2
    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 43
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughDelimiterProcessor;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughDelimiterProcessor;-><init>()V

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
