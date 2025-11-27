.class public interface abstract Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.super Ljava/lang/Object;
.source "MutableDataHolder.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/DataHolder;
.implements Lcom/vladsch/flexmark/util/options/MutableDataSetter;


# virtual methods
.method public abstract clear()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
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

.method public abstract getOrCompute(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)Ljava/lang/Object;
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
.end method

.method public abstract remove(Lcom/vladsch/flexmark/util/options/DataKey;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataHolder;"
        }
    .end annotation
.end method

.method public abstract set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+TT;>;TT;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataHolder;"
        }
    .end annotation
.end method

.method public abstract setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method

.method public abstract setFrom(Lcom/vladsch/flexmark/util/options/MutableDataSetter;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method

.method public abstract setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method
