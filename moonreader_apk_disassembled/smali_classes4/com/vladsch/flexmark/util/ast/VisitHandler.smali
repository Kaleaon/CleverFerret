.class public Lcom/vladsch/flexmark/util/ast/VisitHandler;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;
.source "VisitHandler.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler<",
        "TN;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "TN;>;>;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "TN;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+TN;>;",
            "Lcom/vladsch/flexmark/util/ast/Visitor<",
            "TN;>;)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;)V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/VisitHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Visitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/ast/Visitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
