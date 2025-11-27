.class Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$2;
.super Ljava/lang/Object;
.source "AttributesNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/CustomNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;->getNodeRenderingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "Lcom/vladsch/flexmark/ast/TextBase;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$2;->this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ast/TextBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 35
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$2;->this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;

    invoke-static {p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;->access$000(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;)Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    move-result-object p1

    iget-boolean p1, p1, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->assignTextAttributes:Z

    if-eqz p1, :cond_0

    .line 36
    sget-object p1, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const/4 v0, 0x0

    invoke-interface {p2, p1, v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->extendRenderingNodeAttributes(Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/html/Attributes;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->setAttributes(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    const-string v0, "span"

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 40
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->delegateRender()V

    .line 41
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 45
    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->delegateRender()V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$2;->render(Lcom/vladsch/flexmark/ast/TextBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
