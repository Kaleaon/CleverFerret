.class public Lcom/vladsch/flexmark/util/collection/SubClassingBag;
.super Ljava/lang/Object;
.source "SubClassingBag.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/ClassificationBag<",
            "Ljava/lang/Class;",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mySubClassMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class;",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/ClassificationBag;Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/ClassificationBag<",
            "Ljava/lang/Class;",
            "TT;>;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Class;",
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;>;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    .line 16
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    .line 18
    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 19
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 20
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->categoriesBitSet(Ljava/util/Collection;)Ljava/util/BitSet;

    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/util/BitSet;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 22
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsType(Ljava/lang/Class;)Z
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->containsCategory(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TT;>;"
        }
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public getTypeCount(Ljava/lang/Class;)I
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 45
    :cond_0
    invoke-virtual {p1}, Ljava/util/BitSet;->cardinality()I

    move-result p1

    return p1
.end method

.method public getTypeSet(Ljava/lang/Class;)Ljava/util/BitSet;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    return-object p1
.end method

.method public final itemsOfType(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TX;>;",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->typeBitSet(Ljava/lang/Class;Ljava/util/Collection;)Ljava/util/BitSet;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItems(Ljava/lang/Class;Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public final varargs itemsOfType(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TX;>;[",
            "Ljava/lang/Class;",
            ")",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->typeBitSet(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/BitSet;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItems(Ljava/lang/Class;Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public final reversedItemsOfType(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TX;>;",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->typeBitSet(Ljava/lang/Class;Ljava/util/Collection;)Ljava/util/BitSet;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItemsReversed(Ljava/lang/Class;Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public final varargs reversedItemsOfType(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TX;>;[",
            "Ljava/lang/Class;",
            ")",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->myItems:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->typeBitSet(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/BitSet;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItemsReversed(Ljava/lang/Class;Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public final typeBitSet(Ljava/lang/Class;Ljava/util/Collection;)Ljava/util/BitSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 77
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 78
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 79
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 80
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/BitSet;

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public final varargs typeBitSet(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/BitSet;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 66
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 67
    array-length v1, p2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p2, v2

    .line 68
    invoke-virtual {p1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 69
    iget-object v4, p0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/BitSet;

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method
