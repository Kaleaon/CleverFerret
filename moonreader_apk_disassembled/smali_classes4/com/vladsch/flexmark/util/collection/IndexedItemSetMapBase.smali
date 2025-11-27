.class public abstract Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;
.super Ljava/lang/Object;
.source "IndexedItemSetMapBase.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/IndexedItemSetMap;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "S:",
        "Ljava/lang/Object;",
        "M:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/IndexedItemSetMap<",
        "TK;TS;TM;>;"
    }
.end annotation


# instance fields
.field protected final myBag:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TK;TS;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public addItem(Ljava/lang/Object;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;I)Z"
        }
    .end annotation

    .line 32
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->mapKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->newSet()Ljava/lang/Object;

    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    :cond_0
    invoke-virtual {p0, v0, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->addSetItem(Ljava/lang/Object;I)Z

    move-result p1

    return p1
.end method

.method public abstract addSetItem(Ljava/lang/Object;I)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;I)Z"
        }
    .end annotation
.end method

.method public clear()V
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public containsItem(Ljava/lang/Object;I)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;I)Z"
        }
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->mapKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->containsSetItem(Ljava/lang/Object;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public abstract containsSetItem(Ljava/lang/Object;I)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;I)Z"
        }
    .end annotation
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

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
            "TK;TS;>;>;"
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

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
            ")TS;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public isEmpty()Z
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

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

    .line 102
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public abstract mapKey(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)TK;"
        }
    .end annotation
.end method

.method public abstract newSet()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TS;)TS;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TS;>;)V"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TS;"
        }
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeItem(Ljava/lang/Object;I)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;I)Z"
        }
    .end annotation

    .line 43
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->mapKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->removeSetItem(Ljava/lang/Object;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public abstract removeSetItem(Ljava/lang/Object;I)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;I)Z"
        }
    .end annotation
.end method

.method public size()I
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

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
            "TS;>;"
        }
    .end annotation

    .line 107
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;->myBag:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
