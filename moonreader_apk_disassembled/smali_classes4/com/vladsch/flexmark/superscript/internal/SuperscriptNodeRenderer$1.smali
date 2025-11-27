.class Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$1;
.super Ljava/lang/Object;
.source "SuperscriptNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/CustomNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->getNodeRenderingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "Lcom/vladsch/flexmark/superscript/Superscript;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$1;->this$0:Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$1;->this$0:Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;->access$000(Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer;Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 29
    check-cast p1, Lcom/vladsch/flexmark/superscript/Superscript;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/superscript/internal/SuperscriptNodeRenderer$1;->render(Lcom/vladsch/flexmark/superscript/Superscript;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
