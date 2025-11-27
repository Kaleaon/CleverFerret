.class public interface abstract Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
.super Ljava/lang/Object;
.source "ReversiblePeekingIterable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
        "TE;>;"
    }
.end annotation


# virtual methods
.method public abstract iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "TE;>;"
        }
    .end annotation
.end method

.method public abstract reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "TE;>;"
        }
    .end annotation
.end method

.method public abstract reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "TE;>;"
        }
    .end annotation
.end method
