.class public Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;
.super Ljava/lang/Object;
.source "IndexedIterable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "S:",
        "Ljava/lang/Object;",
        "I::",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
        "Ljava/lang/Integer;",
        ">;>",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterable<",
        "TR;>;"
    }
.end annotation


# instance fields
.field private final myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TS;>;"
        }
    .end annotation
.end field

.field private final myIterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TS;>;TI;)V"
        }
    .end annotation

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    .line 9
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myIterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    return-void
.end method


# virtual methods
.method public isReversed()Z
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myIterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->isReversed()Z

    move-result v0

    return v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TR;>;"
        }
    .end annotation

    .line 19
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myIterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public bridge synthetic iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterable<",
            "TR;>;"
        }
    .end annotation

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myIterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public bridge synthetic reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterable;

    move-result-object v0

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TR;>;"
        }
    .end annotation

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->myIterable:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public bridge synthetic reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method
