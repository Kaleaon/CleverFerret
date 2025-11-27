.class public Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer;
.super Ljava/lang/Object;
.source "SuperscriptJiraRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer$Factory;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer;Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer;->render(Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 30
    const-string v0, "^"

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 31
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 32
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

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

    .line 22
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 24
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/superscript/Superscript;

    new-instance v3, Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer$1;-><init>(Lcom/vladsch/flexmark/superscript/internal/SuperscriptJiraRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
