.class public Lcom/vladsch/flexmark/util/ast/NodeVisitor;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
.source "NodeVisitor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor<",
        "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
        "*>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;>;)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V

    return-void
.end method

.method public varargs constructor <init>([[Lcom/vladsch/flexmark/util/ast/VisitHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>([[Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    if-eqz v0, :cond_0

    .line 38
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/VisitHandler;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void

    .line 40
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 25
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 29
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 30
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public visitNodeOnly(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/VisitHandler;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method
