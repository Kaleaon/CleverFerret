.class public Lcom/vladsch/flexmark/util/options/MutableDataSet;
.super Lcom/vladsch/flexmark/util/options/DataSet;
.source "MutableDataSet.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataHolder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public static varargs merge([Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 5

    .line 62
    new-instance v0, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    .line 63
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    if-eqz v3, :cond_0

    .line 64
    iget-object v4, v0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/options/DataHolder;->getAll()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public clear()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-object p0
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

    .line 41
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFactory()Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->getOrCompute(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getOrCompute(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iget-object p2, p0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 55
    :cond_0
    invoke-interface {p2, p0}, Lcom/vladsch/flexmark/util/collection/DataValueFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method public bridge synthetic remove(Lcom/vladsch/flexmark/util/options/DataKey;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->remove(Lcom/vladsch/flexmark/util/options/DataKey;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public remove(Lcom/vladsch/flexmark/util/options/DataKey;)Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataSet;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public bridge synthetic set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+TT;>;TT;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataSet;"
        }
    .end annotation

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/MutableDataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public bridge synthetic setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 3

    .line 27
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/options/DataHolder;->keySet()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 28
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public setFrom(Lcom/vladsch/flexmark/util/options/MutableDataSetter;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 0

    .line 22
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/util/options/MutableDataSetter;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    return-object p1
.end method

.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 0

    .line 35
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1
.end method

.method public toImmutable()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 76
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public bridge synthetic toMutable()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->toMutable()Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object v0

    return-object v0
.end method

.method public toMutable()Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 0

    return-object p0
.end method
