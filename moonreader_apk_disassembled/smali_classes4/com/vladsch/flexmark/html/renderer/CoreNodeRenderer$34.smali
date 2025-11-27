.class Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->render(Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

.field final synthetic val$node:Lcom/vladsch/flexmark/ast/Heading;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V
    .locals 0

    .line 291
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput-object p3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$node:Lcom/vladsch/flexmark/ast/Heading;

    iput-object p4, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 294
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$node:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Heading;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "span"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 295
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$node:Lcom/vladsch/flexmark/ast/Heading;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 296
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string v1, "/span"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method
