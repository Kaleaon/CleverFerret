.class public Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;
.super Ljava/lang/Object;
.source "IndexedIterator.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "S:",
        "Ljava/lang/Object;",
        "I::",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
        "Ljava/lang/Integer;",
        ">;>",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
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

.field private final myIterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TI;"
        }
    .end annotation
.end field

.field private myLastIndex:I

.field private myModificationCount:I


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TS;>;TI;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    .line 16
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myIterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    const/4 p2, -0x1

    .line 17
    iput p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myLastIndex:I

    .line 18
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/Indexed;->modificationCount()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myModificationCount:I

    return-void
.end method


# virtual methods
.method public forEachRemaining(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-TR;>;)V"
        }
    .end annotation

    .line 65
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getIndex()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myLastIndex:I

    if-ltz v0, :cond_0

    return v0

    .line 59
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myIterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myIterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->isReversed()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .line 33
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myModificationCount:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/Indexed;->modificationCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myIterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myLastIndex:I

    .line 38
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/collection/iteration/Indexed;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 34
    :cond_0
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 3

    .line 43
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myLastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 47
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myModificationCount:I

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/collection/iteration/Indexed;->modificationCount()I

    move-result v2

    if-ne v0, v2, :cond_0

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    iget v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myLastIndex:I

    invoke-interface {v0, v2}, Lcom/vladsch/flexmark/util/collection/iteration/Indexed;->removeAt(I)V

    .line 52
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myLastIndex:I

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myItems:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/Indexed;->modificationCount()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;->myModificationCount:I

    return-void

    .line 48
    :cond_0
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    .line 44
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method
