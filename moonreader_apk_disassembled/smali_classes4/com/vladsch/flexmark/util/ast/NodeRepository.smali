.class public abstract Lcom/vladsch/flexmark/util/ast/NodeRepository;
.super Ljava/lang/Object;
.source "NodeRepository.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected final keepType:Lcom/vladsch/flexmark/util/KeepType;

.field protected final nodeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected final nodeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/KeepType;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeList:Ljava/util/ArrayList;

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    if-nez p1, :cond_0

    .line 37
    sget-object p1, Lcom/vladsch/flexmark/util/KeepType;->LOCKED:Lcom/vladsch/flexmark/util/KeepType;

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    return-void
.end method

.method public static transferReferences(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ast/NodeRepository;Z)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
            "TT;>;Z)Z"
        }
    .end annotation

    .line 59
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    if-eqz p2, :cond_1

    .line 60
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 61
    :cond_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->LOCKED:Lcom/vladsch/flexmark/util/KeepType;

    if-eq v0, v1, :cond_0

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void

    .line 103
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not allowed to modify LOCKED repository"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public abstract getDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
            "TT;>;>;"
        }
    .end annotation
.end method

.method public getFromRaw(Ljava/lang/CharSequence;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public abstract getKeepDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getReferencedElements(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ")",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation
.end method

.method public getValues()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    .line 41
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 9
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->LOCKED:Lcom/vladsch/flexmark/util/KeepType;

    if-eq v0, v1, :cond_2

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->LAST:Lcom/vladsch/flexmark/util/KeepType;

    if-eq v0, v1, :cond_1

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 76
    iget-object p2, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->FAIL:Lcom/vladsch/flexmark/util/KeepType;

    if-eq p2, v1, :cond_0

    return-object v0

    :cond_0
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Duplicate key "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 72
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Not allowed to modify LOCKED repository"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+",
            "Ljava/lang/String;",
            "+TT;>;)V"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->LOCKED:Lcom/vladsch/flexmark/util/KeepType;

    if-eq v0, v1, :cond_2

    .line 86
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->LAST:Lcom/vladsch/flexmark/util/KeepType;

    if-eq v0, v1, :cond_1

    .line 87
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 88
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void

    .line 91
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-void

    .line 85
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Not allowed to modify LOCKED repository"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public putRawKey(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "TT;)TT;"
        }
    .end annotation

    .line 49
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->keepType:Lcom/vladsch/flexmark/util/KeepType;

    sget-object v1, Lcom/vladsch/flexmark/util/KeepType;->LOCKED:Lcom/vladsch/flexmark/util/KeepType;

    if-eq v0, v1, :cond_0

    .line 98
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 97
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Not allowed to modify LOCKED repository"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public size()I
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->values()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository;->nodeList:Ljava/util/ArrayList;

    return-object v0
.end method

.method protected varargs visitNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ValueRunnable;[Ljava/lang/Class;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Lcom/vladsch/flexmark/util/ValueRunnable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;[",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    array-length v1, p3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p3, v2

    .line 23
    new-instance v4, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v5, Lcom/vladsch/flexmark/util/ast/NodeRepository$1;

    invoke-direct {v5, p0, p2}, Lcom/vladsch/flexmark/util/ast/NodeRepository$1;-><init>(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ValueRunnable;)V

    invoke-direct {v4, v3, v5}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 32
    :cond_0
    new-instance p2, Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-direct {p2, v0}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>(Ljava/util/Collection;)V

    .line 33
    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
