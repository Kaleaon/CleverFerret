.class public Lcom/vladsch/flexmark/util/collection/ClassificationBag;
.super Ljava/lang/Object;
.source "ClassificationBag.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private final myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TV;>;"
        }
    .end annotation
.end field

.field private final myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/vladsch/flexmark/util/Computable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TV;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(ILcom/vladsch/flexmark/util/Computable;Lcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(ILcom/vladsch/flexmark/util/Computable;Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TV;>;",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TV;>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p3, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    .line 31
    new-instance p3, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    new-instance v0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;-><init>(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)V

    invoke-direct {p3, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    iput-object p3, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    .line 68
    new-instance p1, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    invoke-direct {p1, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;-><init>(Lcom/vladsch/flexmark/util/Computable;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/Computable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TV;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(ILcom/vladsch/flexmark/util/Computable;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/Computable;Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TV;>;",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TV;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(ILcom/vladsch/flexmark/util/Computable;Lcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    return-object p0
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    return-object p0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final categoriesBitSet(Ljava/util/Collection;)Ljava/util/BitSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TK;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 155
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 156
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 157
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->containsCategory(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 158
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/BitSet;

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public final varargs categoriesBitSet([Ljava/lang/Object;)Ljava/util/BitSet;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TK;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 145
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 146
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 147
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->containsCategory(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 148
    iget-object v4, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    invoke-virtual {v4, v3}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/BitSet;

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public clear()V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsCategory(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    if-eqz p1, :cond_0

    .line 98
    invoke-virtual {p1}, Ljava/util/BitSet;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getCategoryCount(Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)I"
        }
    .end annotation

    .line 107
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 108
    :cond_0
    invoke-virtual {p1}, Ljava/util/BitSet;->cardinality()I

    move-result p1

    return p1
.end method

.method public final getCategoryItems(Ljava/lang/Class;Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;",
            "Ljava/util/BitSet;",
            ")",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 128
    new-instance p1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object p1
.end method

.method public final getCategoryItems(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;",
            "Ljava/util/Collection<",
            "+TK;>;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 124
    new-instance p1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->categoriesBitSet(Ljava/util/Collection;)Ljava/util/BitSet;

    move-result-object p2

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object p1
.end method

.method public final varargs getCategoryItems(Ljava/lang/Class;[Ljava/lang/Object;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;[TK;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 120
    new-instance p1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->categoriesBitSet([Ljava/lang/Object;)Ljava/util/BitSet;

    move-result-object p2

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object p1
.end method

.method public final getCategoryItemsReversed(Ljava/lang/Class;Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;",
            "Ljava/util/BitSet;",
            ")",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 140
    new-instance p1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    const/4 v2, 0x1

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object p1
.end method

.method public final getCategoryItemsReversed(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;",
            "Ljava/util/Collection<",
            "+TK;>;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 136
    new-instance p1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->categoriesBitSet(Ljava/util/Collection;)Ljava/util/BitSet;

    move-result-object p2

    const/4 v2, 0x1

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object p1
.end method

.method public final varargs getCategoryItemsReversed(Ljava/lang/Class;[Ljava/lang/Object;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TX;>;[TK;)",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TX;>;"
        }
    .end annotation

    .line 132
    new-instance p1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->categoriesBitSet([Ljava/lang/Object;)Ljava/util/BitSet;

    move-result-object p2

    const/4 v2, 0x1

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object p1
.end method

.method public getCategoryMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/BitSet;",
            ">;"
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    return-object v0
.end method

.method public getCategorySet(Ljava/lang/Object;)Ljava/util/BitSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myBag:Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    return-object p1
.end method

.method public getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TV;>;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0
.end method

.method public getModificationCount()I
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public remove(I)Z
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndex(I)Z

    move-result p1

    return p1
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->myItems:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->remove(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
