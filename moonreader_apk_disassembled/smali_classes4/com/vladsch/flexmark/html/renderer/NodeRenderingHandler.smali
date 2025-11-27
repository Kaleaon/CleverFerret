.class public Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;
.source "NodeRenderingHandler.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/CustomNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler<",
        "TN;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "TN;>;>;",
        "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+TN;>;",
            "Lcom/vladsch/flexmark/html/CustomNodeRenderer<",
            "TN;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;)V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    check-cast v0, Lcom/vladsch/flexmark/html/CustomNodeRenderer;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/html/CustomNodeRenderer;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method
