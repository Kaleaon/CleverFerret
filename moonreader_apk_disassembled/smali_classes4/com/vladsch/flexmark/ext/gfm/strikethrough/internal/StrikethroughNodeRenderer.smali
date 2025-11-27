.class public Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;
.super Ljava/lang/Object;
.source "StrikethroughNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$Factory;
    }
.end annotation


# instance fields
.field private final strikethroughStyleHtmlClose:Ljava/lang/String;

.field private final strikethroughStyleHtmlOpen:Ljava/lang/String;

.field private final subscriptStyleHtmlClose:Ljava/lang/String;

.field private final subscriptStyleHtmlOpen:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->STRIKETHROUGH_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->strikethroughStyleHtmlOpen:Ljava/lang/String;

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->STRIKETHROUGH_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->strikethroughStyleHtmlClose:Ljava/lang/String;

    .line 27
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->SUBSCRIPT_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->subscriptStyleHtmlOpen:Ljava/lang/String;

    .line 28
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughSubscriptExtension;->SUBSCRIPT_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->subscriptStyleHtmlClose:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->render(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->render(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->strikethroughStyleHtmlOpen:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->strikethroughStyleHtmlClose:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 61
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 62
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->strikethroughStyleHtmlClose:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 52
    :cond_1
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v1, "del"

    if-eqz v0, :cond_2

    .line 53
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 55
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 57
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 58
    const-string p1, "/del"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->subscriptStyleHtmlOpen:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->subscriptStyleHtmlClose:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 77
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 78
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;->subscriptStyleHtmlClose:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 68
    :cond_1
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v1, "sub"

    if-eqz v0, :cond_2

    .line 69
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 71
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 73
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 74
    const-string p1, "/sub"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method


# virtual methods
.method public getNodeRenderingHandlers()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 34
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;

    new-instance v3, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;

    new-instance v3, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
