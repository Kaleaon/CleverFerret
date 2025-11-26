.class public abstract Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.super Ljava/lang/Object;
.source "DependencyHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D::",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "TD;>;S:",
        "Ljava/lang/Object;",
        "R:",
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "TS;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TS;>;)TR;"
        }
    .end annotation
.end method

.method protected abstract createStage(Ljava/util/List;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TD;>;)TS;"
        }
    .end annotation
.end method

.method protected abstract getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)",
            "Ljava/lang/Class;"
        }
    .end annotation
.end method

.method protected prioritize(Lcom/vladsch/flexmark/util/dependency/DependentItemMap;)Lcom/vladsch/flexmark/util/dependency/DependentItemMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/dependency/DependentItemMap<",
            "TD;>;)",
            "Lcom/vladsch/flexmark/util/dependency/DependentItemMap<",
            "TD;>;"
        }
    .end annotation

    return-object p1
.end method

.method public resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TD;>;)TR;"
        }
    .end annotation

    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 17
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p1

    return-object p1

    .line 18
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 20
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/dependency/Dependent;

    .line 21
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->createStage(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p1

    return-object p1

    .line 25
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 26
    new-instance v1, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;-><init>(I)V

    .line 28
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/dependency/Dependent;

    .line 29
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;

    move-result-object v3

    .line 30
    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 33
    new-instance v4, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->size()I

    move-result v5

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/dependency/Dependent;->affectsGlobalScope()Z

    move-result v7

    invoke-direct {v4, v5, v0, v6, v7}, Lcom/vladsch/flexmark/util/dependency/DependentItem;-><init>(ILjava/lang/Object;Ljava/lang/Class;Z)V

    .line 34
    invoke-virtual {v1, v3, v4}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 31
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Dependent class "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " is duplicated. Only one instance can be present in the list"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 37
    :cond_3
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object p1

    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 38
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    .line 39
    iget-object v3, v0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependent:Ljava/lang/Object;

    check-cast v3, Lcom/vladsch/flexmark/util/dependency/Dependent;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/dependency/Dependent;->getAfterDependents()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 41
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    if-lez v4, :cond_6

    .line 42
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 43
    invoke-virtual {v1, v4}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    if-eqz v4, :cond_5

    .line 45
    invoke-virtual {v0, v4}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->addDependency(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V

    .line 46
    invoke-virtual {v4, v0}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->addDependent(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V

    goto :goto_1

    .line 51
    :cond_6
    iget-object v3, v0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependent:Ljava/lang/Object;

    check-cast v3, Lcom/vladsch/flexmark/util/dependency/Dependent;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/dependency/Dependent;->getBeforeDependents()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 52
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 53
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 54
    invoke-virtual {v1, v4}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    if-eqz v4, :cond_7

    .line 56
    invoke-virtual {v4, v0}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->addDependency(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V

    .line 57
    invoke-virtual {v0, v4}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->addDependent(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V

    goto :goto_2

    .line 63
    :cond_8
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->prioritize(Lcom/vladsch/flexmark/util/dependency/DependentItemMap;)Lcom/vladsch/flexmark/util/dependency/DependentItemMap;

    move-result-object p1

    .line 64
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->size()I

    move-result v0

    .line 66
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v0}, Ljava/util/BitSet;-><init>(I)V

    .line 67
    new-instance v3, Lcom/vladsch/flexmark/util/Ref;

    invoke-direct {v3, v1}, Lcom/vladsch/flexmark/util/Ref;-><init>(Ljava/lang/Object;)V

    .line 68
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->valueIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v4

    .line 69
    :cond_9
    :goto_3
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 70
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    .line 71
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->hasDependencies()Z

    move-result v6

    if-nez v6, :cond_9

    .line 72
    iget-object v6, v3, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast v6, Ljava/util/BitSet;

    iget v5, v5, Lcom/vladsch/flexmark/util/dependency/DependentItem;->index:I

    invoke-virtual {v6, v5}, Ljava/util/BitSet;->set(I)V

    goto :goto_3

    .line 76
    :cond_a
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v0}, Ljava/util/BitSet;-><init>(I)V

    .line 77
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->size()I

    move-result v0

    invoke-virtual {v3, v2, v0}, Ljava/util/BitSet;->set(II)V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    :goto_4
    invoke-virtual {v1, v2}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_11

    .line 83
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 84
    new-instance v6, Ljava/util/BitSet;

    invoke-direct {v6}, Ljava/util/BitSet;-><init>()V

    .line 88
    :cond_b
    :goto_5
    invoke-virtual {v1, v2}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v5

    if-gez v5, :cond_c

    goto :goto_7

    .line 91
    :cond_c
    invoke-virtual {v1, v5}, Ljava/util/BitSet;->clear(I)V

    .line 92
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->getValue(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    .line 94
    iget-object v8, v7, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependent:Ljava/lang/Object;

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    invoke-virtual {v3, v5}, Ljava/util/BitSet;->clear(I)V

    .line 98
    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->hasDependents()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 100
    :cond_d
    :goto_6
    iget-object v5, v7, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    invoke-virtual {v5, v2}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v5

    if-gez v5, :cond_e

    goto :goto_5

    .line 103
    :cond_e
    iget-object v8, v7, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    invoke-virtual {v8, v5}, Ljava/util/BitSet;->clear(I)V

    .line 104
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->getValue(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    .line 106
    invoke-virtual {v8, v7}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->removeDependency(Lcom/vladsch/flexmark/util/dependency/DependentItem;)Z

    move-result v8

    if-nez v8, :cond_d

    .line 107
    iget-boolean v8, v7, Lcom/vladsch/flexmark/util/dependency/DependentItem;->isGlobalScope:Z

    if-eqz v8, :cond_f

    .line 108
    invoke-virtual {v6, v5}, Ljava/util/BitSet;->set(I)V

    goto :goto_6

    .line 110
    :cond_f
    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    goto :goto_6

    .line 114
    :cond_10
    iget-boolean v5, v7, Lcom/vladsch/flexmark/util/dependency/DependentItem;->isGlobalScope:Z

    if-eqz v5, :cond_b

    .line 116
    invoke-virtual {v6, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 123
    :goto_7
    invoke-virtual {p0, v4}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->createStage(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v1, v6

    goto :goto_4

    .line 126
    :cond_11
    invoke-virtual {v3, v2}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result p1

    if-ne p1, v5, :cond_12

    .line 130
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p1

    return-object p1

    .line 127
    :cond_12
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "have dependents with dependency cycles"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
