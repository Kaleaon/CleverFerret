.class Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

.field final synthetic val$node:Lcom/vladsch/flexmark/ast/ListItem;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V
    .locals 0

    .line 410
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput-object p3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$node:Lcom/vladsch/flexmark/ast/ListItem;

    iput-object p4, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 413
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$node:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/ListItem;->getMarkerSuffix()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 414
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;->val$node:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
