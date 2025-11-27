.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;
.super Ljava/lang/Object;
.source "AbbreviationNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$Factory;
    }
.end annotation


# instance fields
.field private final options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;->render(Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;->render(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 3

    .line 49
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p2

    .line 50
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getAbbreviation()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;->useLinks:Z

    if-eqz v1, :cond_0

    .line 54
    const-string v1, "href"

    const-string v2, "#"

    invoke-virtual {p3, v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 55
    const-string v1, "a"

    goto :goto_0

    .line 57
    :cond_0
    const-string v1, "abbr"

    .line 60
    :goto_0
    const-string v2, "title"

    invoke-virtual {p3, v2, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 61
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 62
    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 63
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public getNodeRenderingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 28
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    new-instance v4, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
