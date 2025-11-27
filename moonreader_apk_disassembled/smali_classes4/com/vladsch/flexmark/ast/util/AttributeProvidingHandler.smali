.class public Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;
.source "AttributeProvidingHandler.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler<",
        "TN;",
        "Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor<",
        "TN;>;>;",
        "Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor<",
        "TN;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+TN;>;",
            "Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor<",
            "TN;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;)V

    return-void
.end method


# virtual methods
.method public setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    check-cast v0, Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor;->setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V

    return-void
.end method
