.class public Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;
.super Ljava/lang/Object;
.source "SuperscriptNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$Factory;
    }
.end annotation


# instance fields
.field private final superscriptStyleHtmlClose:Ljava/lang/String;

.field private final superscriptStyleHtmlOpen:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;->SUPERSCRIPT_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->superscriptStyleHtmlOpen:Ljava/lang/String;

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/superscript/SuperscriptExtension;->SUPERSCRIPT_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->superscriptStyleHtmlClose:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->render(Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->superscriptStyleHtmlOpen:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->superscriptStyleHtmlClose:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 45
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 46
    iget-object p1, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->superscriptStyleHtmlClose:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 36
    :cond_1
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v1, "sup"

    if-eqz v0, :cond_2

    .line 37
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 39
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/superscript/Superscript;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 41
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 42
    const-string p1, "/sup"

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

    .line 27
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 29
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/superscript/Superscript;

    new-instance v3, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
