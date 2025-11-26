.class Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;
.super Ljava/lang/Object;
.source "TableNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$node:Lcom/vladsch/flexmark/ext/tables/TableBody;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ext/tables/TableBody;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iput-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;->val$node:Lcom/vladsch/flexmark/ext/tables/TableBody;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;->val$node:Lcom/vladsch/flexmark/ext/tables/TableBody;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
