.class public Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;
.super Ljava/lang/Object;
.source "BitSetIterator.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final myBitSet:Ljava/util/BitSet;

.field private final myIsReversed:Z

.field private myLast:I

.field private myNext:I


# direct methods
.method public constructor <init>(Ljava/util/BitSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/util/BitSet;Z)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myBitSet:Ljava/util/BitSet;

    .line 20
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myIsReversed:Z

    if-eqz p2, :cond_0

    .line 21
    invoke-virtual {p1}, Ljava/util/BitSet;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/util/BitSet;->previousSetBit(I)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result p1

    :goto_0
    iput p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myNext:I

    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myLast:I

    return-void
.end method


# virtual methods
.method public forEachRemaining(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 56
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->next()Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public hasNext()Z
    .locals 2

    .line 32
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myNext:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    .line 27
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myIsReversed:Z

    return v0
.end method

.method public next()Ljava/lang/Integer;
    .locals 3

    .line 37
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myNext:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 41
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myLast:I

    .line 42
    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myIsReversed:Z

    if-eqz v2, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myBitSet:Ljava/util/BitSet;

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->previousSetBit(I)I

    move-result v1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myBitSet:Ljava/util/BitSet;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v1

    :goto_0
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myNext:I

    .line 43
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myLast:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 38
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->next()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 48
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myLast:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;->myBitSet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->clear(I)V

    return-void

    .line 49
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method
