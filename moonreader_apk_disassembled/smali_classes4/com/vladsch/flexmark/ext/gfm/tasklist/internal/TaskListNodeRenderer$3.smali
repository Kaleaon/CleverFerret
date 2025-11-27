.class Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;
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

.field final synthetic val$sourceText:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput-object p3, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$sourceText:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p4, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$node:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    iput-object p5, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->paragraphClass:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;

    iget-object v1, v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->paragraphClass:Ljava/lang/String;

    const-string v2, "class"

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$sourceText:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;->val$sourceText:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->TASK_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3$1;

    invoke-direct {v1, p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3$1;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;)V

    const-string v2, "p"

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method
