.class public Lcom/vladsch/flexmark/ast/util/AttributeProviderAdapter;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
.source "AttributeProviderAdapter.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor<",
        "Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler<",
        "*>;>;",
        "Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor<",
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
            "Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler<",
            "*>;>;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler<",
            "*>;)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V

    return-void
.end method

.method public varargs constructor <init>([[Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[",
            "Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler<",
            "*>;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;-><init>([[Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V

    return-void
.end method


# virtual methods
.method public setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 2

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/AttributeProviderAdapter;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler;

    if-eqz v0, :cond_0

    .line 27
    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ast/util/AttributeProvidingHandler;->setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V

    :cond_0
    return-void
.end method
