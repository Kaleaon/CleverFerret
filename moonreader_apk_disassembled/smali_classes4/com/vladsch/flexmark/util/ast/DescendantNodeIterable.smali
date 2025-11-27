.class public Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;
.super Ljava/lang/Object;
.source "DescendantNodeIterable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# instance fields
.field private iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;

    if-eqz v0, :cond_0

    .line 16
    check-cast p1, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-void

    .line 18
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-void
.end method


# virtual methods
.method public isReversed()Z
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->isReversed()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;)V

    return-object v0
.end method

.method public bridge synthetic reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterable;->iterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;)V

    return-object v0
.end method
