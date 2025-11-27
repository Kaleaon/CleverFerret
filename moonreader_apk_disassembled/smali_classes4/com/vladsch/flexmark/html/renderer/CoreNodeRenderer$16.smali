.class Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$16;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/CustomNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->getNodeRenderingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "Lcom/vladsch/flexmark/ast/HtmlInline;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$16;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$16;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->render(Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 164
    check-cast p1, Lcom/vladsch/flexmark/ast/HtmlInline;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$16;->render(Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
