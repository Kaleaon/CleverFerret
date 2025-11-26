.class public Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;
.super Ljava/lang/Object;
.source "KeyedItemFactoryMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "I:",
        "Ljava/lang/Object;",
        "P:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "TK;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "TI;TP;>;>;"
    }
.end annotation


# instance fields
.field protected final factoryMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TK;",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;>;"
        }
    .end annotation
.end field

.field protected final itemMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TK;TI;>;"
        }
    .end annotation
.end field

.field protected final param:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;-><init>(Ljava/lang/Object;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;I)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    .line 21
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->itemMap:Ljava/util/HashMap;

    .line 22
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->param:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

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
            "TK;",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;>;>;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/ComputableFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/ComputableFactory;

    return-object p1
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->get(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/ComputableFactory;

    move-result-object p1

    return-object p1
.end method

.method public getItem(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TI;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ComputableFactory;

    if-eqz v0, :cond_0

    .line 33
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->param:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/ComputableFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    .line 31
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Factory for key: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not defined"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Lcom/vladsch/flexmark/util/ComputableFactory;)Lcom/vladsch/flexmark/util/ComputableFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;)",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/ComputableFactory;

    return-object p1
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p2, Lcom/vladsch/flexmark/util/ComputableFactory;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->put(Ljava/lang/Object;Lcom/vladsch/flexmark/util/ComputableFactory;)Lcom/vladsch/flexmark/util/ComputableFactory;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;>;)V"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public remove(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/ComputableFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/ComputableFactory;

    return-object p1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->remove(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/ComputableFactory;

    move-result-object p1

    return-object p1
.end method

.method public size()I
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;>;"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/KeyedItemFactoryMap;->factoryMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
