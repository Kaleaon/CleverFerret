.class public Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;
.super Ljava/lang/Object;
.source "ClassifyingNodeTracker.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/NodeTracker;


# instance fields
.field private final myExclusionMap:Lcom/vladsch/flexmark/util/collection/OrderedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation
.end field

.field private final myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final myHost:Lcom/vladsch/flexmark/util/NodeTracker;

.field private final myNodeAncestryMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation
.end field

.field protected final myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/ClassificationBag<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/NodeTracker;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/NodeTracker;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myHost:Lcom/vladsch/flexmark/util/NodeTracker;

    .line 24
    new-instance p1, Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    sget-object v0, Lcom/vladsch/flexmark/util/mappers/NodeClassifier;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/NodeClassifier;

    invoke-direct {p1, v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(Lcom/vladsch/flexmark/util/Computable;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    .line 25
    new-instance p1, Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    invoke-direct {p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(I)V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myExclusionMap:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    .line 26
    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->putAll(Ljava/util/Map;)V

    .line 29
    new-instance p2, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-direct {p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>()V

    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    .line 31
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object p1

    .line 32
    :goto_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 33
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 35
    :cond_0
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeAncestryMap:Ljava/util/HashMap;

    return-void
.end method

.method private addNodes(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 84
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 85
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method private removeNodes(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 121
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 122
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method private validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 55
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 56
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Added block "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not linked into the AST"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method private validateUnlinked(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 90
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 91
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Removed block "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is still linked in the AST"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getCategoryItems(Ljava/lang/Class;Ljava/util/Set;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;",
            "Ljava/util/Set<",
            "+",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItems(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public getExclusionMap()Lcom/vladsch/flexmark/util/collection/OrderedMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myExclusionMap:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    return-object v0
.end method

.method public getExclusionSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0
.end method

.method public getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public getNodeAncestryMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeAncestryMap:Ljava/util/HashMap;

    return-object v0
.end method

.method public getNodeClassifier()Lcom/vladsch/flexmark/util/collection/ClassificationBag;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/ClassificationBag<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    return-object v0
.end method

.method public nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 62
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myHost:Lcom/vladsch/flexmark/util/NodeTracker;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method

.method public nodeAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 69
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 70
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    .line 71
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->addNodes(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myHost:Lcom/vladsch/flexmark/util/NodeTracker;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method

.method public nodeAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 77
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    .line 79
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDescendants()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->addNodes(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    .line 80
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myHost:Lcom/vladsch/flexmark/util/NodeTracker;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method

.method public nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 97
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->nodeRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public nodeRemovedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 105
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->nodeRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public nodeRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 114
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->validateUnlinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 115
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myNodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    .line 116
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDescendants()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->removeNodes(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->myHost:Lcom/vladsch/flexmark/util/NodeTracker;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method
