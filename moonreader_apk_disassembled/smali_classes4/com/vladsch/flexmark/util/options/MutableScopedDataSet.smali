.class public Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;
.super Lcom/vladsch/flexmark/util/options/MutableDataSet;
.source "MutableScopedDataSet.java"


# instance fields
.field protected final parent:Lcom/vladsch/flexmark/util/options/DataHolder;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    .line 17
    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 18
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    return-void
.end method


# virtual methods
.method public contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z
    .locals 1

    .line 65
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/options/DataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    if-eqz v0, :cond_1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/options/DataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 71
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAll()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    if-eqz v0, :cond_2

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 30
    invoke-super {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 32
    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->keySet()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 33
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 34
    iget-object v3, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {v3, v2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0

    .line 40
    :cond_2
    invoke-super {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->getAll()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    return-object v0
.end method

.method public keySet()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    if-eqz v0, :cond_2

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    invoke-super {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->keySet()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 51
    iget-object v1, p0, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->parent:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->keySet()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 52
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/options/MutableScopedDataSet;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 53
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0

    .line 59
    :cond_2
    invoke-super {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->keySet()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
