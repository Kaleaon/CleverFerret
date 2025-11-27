.class Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$1;
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
        "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$1;->this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 26
    check-cast p1, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$1;->render(Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
