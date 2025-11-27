.class public Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;
.super Ljava/lang/Object;
.source "ItemFactoryMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "P:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "TI;TP;>;TI;>;"
    }
.end annotation


# instance fields
.field protected final itemMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;TI;>;"
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

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;-><init>(Ljava/lang/Object;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;I)V"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    .line 20
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->param:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

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
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;TI;>;>;"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TI;"
        }
    .end annotation

    .line 34
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ComputableFactory;

    if-eqz v0, :cond_0

    .line 35
    check-cast p1, Lcom/vladsch/flexmark/util/ComputableFactory;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->getItem(Lcom/vladsch/flexmark/util/ComputableFactory;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItem(Lcom/vladsch/flexmark/util/ComputableFactory;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;)TI;"
        }
    .end annotation

    .line 24
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->param:Ljava/lang/Object;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/ComputableFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

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
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;>;"
        }
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/vladsch/flexmark/util/ComputableFactory;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;TI;)TI;"
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/vladsch/flexmark/util/ComputableFactory;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->put(Lcom/vladsch/flexmark/util/ComputableFactory;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+",
            "Lcom/vladsch/flexmark/util/ComputableFactory<",
            "TI;TP;>;+TI;>;)V"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TI;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public size()I
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

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
            "TI;>;"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ItemFactoryMap;->itemMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
