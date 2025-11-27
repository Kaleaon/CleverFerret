.class public Lcom/vladsch/flexmark/util/collection/OrderedMap;
.super Ljava/lang/Object;
.source "OrderedMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "TK;TV;>;",
        "Ljava/lang/Iterable<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private final host:Lcom/vladsch/flexmark/util/collection/CollectionHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TK;>;"
        }
    .end annotation
.end field

.field private inUpdate:Z

.field private final keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TK;>;"
        }
    .end annotation
.end field

.field private myIndexedEntryProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field private myIndexedValueProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TV;>;"
        }
    .end annotation
.end field

.field private final valueList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 18
    invoke-direct {p0, v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TK;>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    .line 31
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    const/4 p2, 0x0

    .line 32
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->myIndexedEntryProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    .line 33
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->myIndexedValueProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    .line 34
    new-instance p2, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V

    invoke-direct {p2, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TK;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Z
    .locals 0

    .line 9
    iget-boolean p0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->inUpdate:Z

    return p0
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/util/collection/OrderedMap;I)Ljava/util/Map$Entry;
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getEntry(I)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object p0
.end method

.method private getEntry(I)Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 133
    new-instance v0, Lcom/vladsch/flexmark/util/collection/MapEntry;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/vladsch/flexmark/util/collection/MapEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public addAll(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/Map$Entry<",
            "+TK;+TV;>;>;)V"
        }
    .end annotation

    .line 247
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 248
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public addNull()V
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->addNulls(I)V

    return-void
.end method

.method public addNulls(I)V
    .locals 3

    .line 198
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 200
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt v0, p1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void

    .line 199
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "addNulls("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ") called when valueList size is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    if-eqz p3, :cond_1

    .line 142
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 146
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 141
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method addingNull(I)V
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->addingNulls(I)V

    .line 153
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->addNulls(I)V

    return-void
.end method

.method public clear()V
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->clear()V

    return-void
.end method

.method clearing()V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->clearing()V

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public computeIfMissing(Ljava/lang/Object;Lcom/vladsch/flexmark/util/Function;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/vladsch/flexmark/util/Function<",
            "-TK;+TV;>;)TV;"
        }
    .end annotation

    .line 223
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 225
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 226
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-object p2

    .line 230
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    .line 190
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result p1

    return p1
.end method

.method public entries()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 304
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 305
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->entryIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v1

    .line 306
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 307
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public entryIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 362
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedEntryProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public entryIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 334
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedEntryProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 289
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->inUpdate:Z

    .line 290
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    new-instance v2, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;Lcom/vladsch/flexmark/util/collection/OrderedMap$1;)V

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    .line 291
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->entryIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v1

    .line 292
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 293
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 297
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->inUpdate:Z

    return-object v0
.end method

.method public bridge synthetic entrySet()Ljava/util/Set;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 392
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 394
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/collection/OrderedMap;

    .line 396
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->size()I

    move-result v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    return v1

    .line 397
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    :cond_3
    return v0

    :cond_4
    :goto_0
    return v1
.end method

.method public forEach(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 383
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    .line 384
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 205
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 206
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getIndexedEntryProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->myIndexedEntryProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    if-eqz v0, :cond_0

    return-object v0

    .line 70
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->myIndexedEntryProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    return-object v0
.end method

.method public getIndexedValueProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TV;>;"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->myIndexedValueProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    if-eqz v0, :cond_0

    return-object v0

    .line 102
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->myIndexedValueProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 277
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 278
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getModificationCount()I
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public getValue(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 282
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 283
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 403
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 404
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 379
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->entryIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public keyIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TK;>;"
        }
    .end annotation

    .line 354
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v0

    return-object v0
.end method

.method public keyIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TK;>;"
        }
    .end annotation

    .line 326
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TK;>;"
        }
    .end annotation

    .line 259
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public keys()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TK;>;"
        }
    .end annotation

    .line 314
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->values()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;Ljava/lang/Object;)Z

    const/4 p1, 0x0

    return-object p1

    .line 217
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    .line 218
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 241
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 242
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 236
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeHosted(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->host:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 160
    :cond_0
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public reversedEntryIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 366
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedEntryProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public reversedEntryIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 338
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedEntryProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public reversedIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 370
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->reversedEntryIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v0

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 342
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->reversedEntryIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversedKeyIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TK;>;"
        }
    .end annotation

    .line 358
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v0

    return-object v0
.end method

.method public reversedKeyIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TK;>;"
        }
    .end annotation

    .line 330
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversedValueIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TV;>;"
        }
    .end annotation

    .line 350
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedValueProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public reversedValueIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TV;>;"
        }
    .end annotation

    .line 322
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedValueProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v0

    return v0
.end method

.method public valueIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TV;>;"
        }
    .end annotation

    .line 346
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedValueProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public valueIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TV;>;"
        }
    .end annotation

    .line 318
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedValueProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 264
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isSparse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    return-object v0

    .line 268
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 269
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->keySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v1

    .line 270
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 271
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap;->valueList:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method
