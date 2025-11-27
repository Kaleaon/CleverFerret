.class public Lcom/vladsch/flexmark/util/options/DataSet;
.super Ljava/lang/Object;
.source "DataSet.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/DataHolder;


# instance fields
.field protected final dataSet:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    .line 16
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/options/DataHolder;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public static varargs merge([Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/DataSet;
    .locals 5

    .line 44
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>()V

    .line 45
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    if-eqz v3, :cond_0

    .line 46
    iget-object v4, v0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

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
.method public contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

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

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/options/DataKey;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 39
    :cond_0
    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getDefaultValue(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAll()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    return-object v0
.end method

.method public keySet()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            ">;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataSet;->dataSet:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public toImmutable()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 0

    return-object p0
.end method

.method public toMutable()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 53
    new-instance v0, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method
