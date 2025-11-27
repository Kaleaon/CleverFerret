.class Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

.field final synthetic val$node:Lcom/vladsch/flexmark/ast/Paragraph;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 502
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->val$node:Lcom/vladsch/flexmark/ast/Paragraph;

    iput-object p3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iput-object p4, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 505
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->val$node:Lcom/vladsch/flexmark/ast/Paragraph;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    return-void
.end method
