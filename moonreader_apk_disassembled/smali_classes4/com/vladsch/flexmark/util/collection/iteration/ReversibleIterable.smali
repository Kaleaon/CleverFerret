.class public interface abstract Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
.super Ljava/lang/Object;
.source "ReversibleIterable.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TE;>;"
    }
.end annotation


# virtual methods
.method public abstract isReversed()Z
.end method

.method public abstract iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "TE;>;"
        }
    .end annotation
.end method

.method public abstract reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TE;>;"
        }
    .end annotation
.end method

.method public abstract reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "TE;>;"
        }
    .end annotation
.end method
