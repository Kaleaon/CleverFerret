.class public Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;
.super Ljava/lang/Object;
.source "ClassifyingBlockTracker.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/BlockTracker;
.implements Lcom/vladsch/flexmark/parser/block/BlockParserTracker;


# instance fields
.field protected final allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedMultiMap<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;"
        }
    .end annotation
.end field

.field protected final nodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;
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
.method public constructor <init>()V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    sget-object v1, Lcom/vladsch/flexmark/util/mappers/NodeClassifier;->INSTANCE:Lcom/vladsch/flexmark/util/mappers/NodeClassifier;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(Lcom/vladsch/flexmark/util/Computable;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->nodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    .line 18
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    new-instance v1, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;

    invoke-direct {v1, p0}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;-><init>(Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;)V

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;-><init>(Lcom/vladsch/flexmark/util/collection/CollectionHost;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    return-void
.end method

.method private addBlocks(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 118
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 119
    instance-of v1, v0, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Block;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putValueKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private removeBlocks(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 152
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 153
    instance-of v1, v0, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v1, :cond_0

    .line 154
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 92
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 93
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

    .line 126
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 127
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
.method public allBlockParsers()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public allBlocks()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->valueSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public blockAdded(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 2

    .line 99
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putValueKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public blockAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 2

    .line 105
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 106
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putValueKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Block;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->addBlocks(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-void
.end method

.method public blockAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 2

    .line 112
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->validateLinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 113
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putValueKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Block;->getDescendants()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->addBlocks(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-void
.end method

.method public blockParserAdded(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public blockParserRemoved(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeKey(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public blockRemoved(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 133
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->validateUnlinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 134
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeValue(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public blockRemovedWithChildren(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 139
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->validateUnlinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Block;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->removeBlocks(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-void
.end method

.method public blockRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 146
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->validateUnlinked(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 147
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Block;->getDescendants()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->removeBlocks(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-void
.end method

.method public containsKey(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->containsValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getKey(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/parser/block/BlockParser;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getValueKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/parser/block/BlockParser;

    return-object p1
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

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->nodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    return-object v0
.end method

.method public getValue(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getKeyValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/ast/Block;

    return-object p1
.end method
