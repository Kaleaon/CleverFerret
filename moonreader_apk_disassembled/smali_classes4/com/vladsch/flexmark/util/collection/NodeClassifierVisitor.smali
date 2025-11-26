.class public Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;
.super Lcom/vladsch/flexmark/util/ast/NodeVisitorBase;
.source "NodeClassifierVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/NodeTracker;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final EMPTY_SET:Ljava/util/BitSet;


# instance fields
.field private myClassificationDone:Z

.field private final myClassifyingNodeTracker:Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

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

.field private final myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef<",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation
.end field

.field private final myNodeAncestryBitSetStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation
.end field

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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->EMPTY_SET:Ljava/util/BitSet;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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

    .line 26
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/NodeVisitorBase;-><init>()V

    .line 15
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSetStack:Ljava/util/Stack;

    .line 16
    new-instance v0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1}, Ljava/util/BitSet;-><init>()V

    new-instance v2, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor$1;

    invoke-direct {v2, p0}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor$1;-><init>(Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;)V

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;-><init>(Ljava/lang/Object;Lcom/vladsch/flexmark/util/Computable;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassificationDone:Z

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    invoke-direct {v0, p0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;-><init>(Lcom/vladsch/flexmark/util/NodeTracker;Ljava/util/Map;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassifyingNodeTracker:Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    .line 28
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getExclusionMap()Lcom/vladsch/flexmark/util/collection/OrderedMap;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionMap:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    .line 29
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getNodeAncestryMap()Ljava/util/HashMap;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryMap:Ljava/util/HashMap;

    .line 30
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getExclusionSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-void
.end method


# virtual methods
.method public classify(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;
    .locals 0

    .line 36
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassificationDone:Z

    .line 38
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassifyingNodeTracker:Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    return-object p1
.end method

.method public nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 56
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassificationDone:Z

    if-eqz v0, :cond_3

    .line 57
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 61
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/util/ast/Document;

    if-nez v0, :cond_1

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassifyingNodeTracker:Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryMap:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/BitSet;

    .line 68
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->setValue(Ljava/lang/Object;)V

    goto :goto_0

    .line 64
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Parent node: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not tracked, some post processor forgot to call tracker.nodeAdded()."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSetStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 73
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void

    .line 58
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Node must be inserted into the document before calling node tracker nodeAdded functions"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    return-void
.end method

.method public nodeAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 50
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public nodeAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 51
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    return-void
.end method

.method public nodeRemovedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    return-void
.end method

.method public nodeRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    return-void
.end method

.method popNodeAncestry()V
    .locals 2

    .line 84
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSetStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method pushNodeAncestry()V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionMap:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSetStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->getImmutable()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method updateNodeAncestry(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef<",
            "Ljava/util/BitSet;",
            ">;)Z"
        }
    .end annotation

    .line 88
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionMap:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_4

    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Document;

    if-nez v0, :cond_4

    .line 91
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->getPeek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/BitSet;

    .line 94
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassifyingNodeTracker:Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 99
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 100
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 102
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 103
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 104
    invoke-virtual {v4, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 106
    iget-object v5, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myExclusionSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v5, v4}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v4

    .line 108
    invoke-virtual {v0, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->isMutable()Z

    move-result v5

    if-nez v5, :cond_0

    .line 109
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->getMutable()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/BitSet;

    .line 110
    invoke-virtual {v0, v4}, Ljava/util/BitSet;->set(I)V

    goto :goto_0

    .line 116
    :cond_1
    iget-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassificationDone:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSetStack:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->size()I

    move-result p1

    if-le p1, v1, :cond_2

    .line 119
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    if-eqz p1, :cond_2

    .line 120
    invoke-virtual {p1, v0}, Ljava/util/BitSet;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    return p1

    .line 126
    :cond_2
    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4

    .line 127
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->getImmutable()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 96
    :cond_3
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Node: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not tracked, some post processor forgot to call tracker.nodeAdded()."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_4
    :goto_1
    return v1
.end method

.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 43
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassificationDone:Z

    if-nez v0, :cond_0

    .line 143
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Document;

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myClassifyingNodeTracker:Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 150
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 151
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->pushNodeAncestry()V

    .line 152
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->updateNodeAncestry(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitorBase;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 155
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->popNodeAncestry()V

    return-void

    .line 157
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->myNodeAncestryBitSet:Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->updateNodeAncestry(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;)Z

    return-void
.end method
