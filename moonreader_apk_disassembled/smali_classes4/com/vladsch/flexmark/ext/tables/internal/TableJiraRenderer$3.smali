.class Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$3;
.super Ljava/lang/Object;
.source "TableJiraRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/CustomNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->getNodeRenderingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "Lcom/vladsch/flexmark/ext/tables/TableSeparator;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->access$200(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$3;->render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
