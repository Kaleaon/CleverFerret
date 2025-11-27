.class public Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;
.super Ljava/lang/Object;
.source "BitSetIterable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final myBitSet:Ljava/util/BitSet;

.field private final myIsReversed:Z


# direct methods
.method public constructor <init>(Ljava/util/BitSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/util/BitSet;Z)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myBitSet:Ljava/util/BitSet;

    .line 15
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myIsReversed:Z

    return-void
.end method


# virtual methods
.method public isReversed()Z
    .locals 1

    .line 20
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myIsReversed:Z

    return v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myBitSet:Ljava/util/BitSet;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myIsReversed:Z

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myBitSet:Ljava/util/BitSet;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myIsReversed:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myBitSet:Ljava/util/BitSet;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;->myIsReversed:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method
