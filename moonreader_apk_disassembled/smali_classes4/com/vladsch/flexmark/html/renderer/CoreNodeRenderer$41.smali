.class Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$node:Lcom/vladsch/flexmark/ast/Paragraph;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ast/Paragraph;)V
    .locals 0

    .line 444
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iput-object p3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;->val$node:Lcom/vladsch/flexmark/ast/Paragraph;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 447
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;->val$node:Lcom/vladsch/flexmark/ast/Paragraph;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
