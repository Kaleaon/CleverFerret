.class public Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;
.source "LinkResolvingHandler.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler<",
        "TN;",
        "Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor<",
        "TN;>;>;",
        "Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor<",
        "TN;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+TN;>;",
            "Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor<",
            "TN;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;)V

    return-void
.end method


# virtual methods
.method public resolveLink(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    check-cast v0, Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor;->resolveLink(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p1

    return-object p1
.end method
