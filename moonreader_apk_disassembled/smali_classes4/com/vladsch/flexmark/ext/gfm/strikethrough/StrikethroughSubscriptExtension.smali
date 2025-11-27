.class public Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;
.super Ljava/lang/Object;
.source "StrikethroughSubscriptExtension.java"

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

.field public static final SUBSCRIPT_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUBSCRIPT_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;
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

    .line 21
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    const-string v2, "STRIKETHROUGH_STYLE_HTML_OPEN"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->STRIKETHROUGH_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 22
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "STRIKETHROUGH_STYLE_HTML_CLOSE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->STRIKETHROUGH_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "SUBSCRIPT_STYLE_HTML_OPEN"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->SUBSCRIPT_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "SUBSCRIPT_STYLE_HTML_CLOSE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->SUBSCRIPT_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 50
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 51
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 52
    :cond_0
    const-string p2, "YOUTRACK"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 53
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughYouTrackRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughYouTrackRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 54
    :cond_1
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 55
    new-instance p2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughJiraRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughJiraRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    :cond_2
    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughSubscriptDelimiterProcessor;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughSubscriptDelimiterProcessor;-><init>()V

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
