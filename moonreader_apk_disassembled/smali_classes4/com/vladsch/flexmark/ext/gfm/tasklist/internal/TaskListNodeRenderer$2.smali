.class Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;
.super Ljava/lang/Object;
.source "TaskListNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->render(Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

.field final synthetic val$node:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput-object p3, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$node:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    iput-object p4, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$node:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isItemDoneMarker()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

    iget-object v1, v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->doneMarker:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

    iget-object v1, v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->notDoneMarker:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;->val$node:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
