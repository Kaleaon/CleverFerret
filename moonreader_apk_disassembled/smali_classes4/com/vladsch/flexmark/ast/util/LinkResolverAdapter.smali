.class public Lcom/vladsch/flexmark/ast/util/LinkResolverAdapter;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
.source "LinkResolverAdapter.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor<",
        "Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler<",
        "*>;>;",
        "Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler<",
            "*>;>;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler<",
            "*>;)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V

    return-void
.end method

.method public varargs constructor <init>([[Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[",
            "Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler<",
            "*>;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>([[Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V

    return-void
.end method


# virtual methods
.method public resolveLink(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 2

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LinkResolverAdapter;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler;

    if-eqz v0, :cond_0

    .line 27
    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ast/util/LinkResolvingHandler;->resolveLink(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p3
.end method
