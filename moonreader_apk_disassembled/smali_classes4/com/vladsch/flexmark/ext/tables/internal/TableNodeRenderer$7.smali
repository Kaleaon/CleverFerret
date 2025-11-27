.class Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$7;
.super Ljava/lang/Object;
.source "TableNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/CustomNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->getNodeRenderingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "Lcom/vladsch/flexmark/ext/tables/TableCaption;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$7;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$7;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->access$600(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 64
    check-cast p1, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$7;->render(Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
