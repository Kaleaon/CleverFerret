.class public interface abstract Lcom/vladsch/flexmark/util/options/DataHolder;
.super Ljava/lang/Object;
.source "DataHolder.java"


# virtual methods
.method public abstract contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z
.end method

.method public abstract get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract getAll()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract keySet()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            ">;"
        }
    .end annotation
.end method

.method public abstract toImmutable()Lcom/vladsch/flexmark/util/options/DataHolder;
.end method

.method public abstract toMutable()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method
