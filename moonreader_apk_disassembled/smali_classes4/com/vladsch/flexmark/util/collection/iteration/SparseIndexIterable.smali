.class public Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;
.super Ljava/lang/Object;
.source "SparseIndexIterable.java"

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
.field private final myEnds:[I

.field private final myIsReversed:Z

.field private final myStarts:[I


# direct methods
.method public constructor <init>(Ljava/util/BitSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;-><init>(Ljava/util/BitSet;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/util/BitSet;Z)V
    .locals 4

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1, v1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v1

    if-gez v1, :cond_1

    .line 29
    new-array v1, v2, [I

    iput-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myStarts:[I

    .line 30
    new-array v1, v2, [I

    iput-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myEnds:[I

    const/4 v1, 0x0

    .line 35
    :goto_1
    invoke-virtual {p1, v0}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    if-gez v0, :cond_0

    .line 44
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myIsReversed:Z

    return-void

    .line 37
    :cond_0
    invoke-virtual {p1, v0}, Ljava/util/BitSet;->nextClearBit(I)I

    move-result v2

    .line 38
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myStarts:[I

    aput v0, v3, v1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myEnds:[I

    add-int/lit8 v3, v2, -0x1

    aput v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    move v0, v2

    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/BitSet;->nextClearBit(I)I

    move-result v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public constructor <init>([I[IZ)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myStarts:[I

    .line 49
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myEnds:[I

    .line 50
    iput-boolean p3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myIsReversed:Z

    .line 51
    array-length p1, p1

    array-length p2, p2

    if-ne p1, p2, :cond_0

    return-void

    .line 52
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "starts and ends arrays must be the same size"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public isReversed()Z
    .locals 1

    .line 57
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myIsReversed:Z

    return v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myStarts:[I

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myEnds:[I

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myIsReversed:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;-><init>([I[IZ)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 67
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myStarts:[I

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myEnds:[I

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myIsReversed:Z

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;-><init>([I[IZ)V

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 72
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myStarts:[I

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myEnds:[I

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterable;->myIsReversed:Z

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;-><init>([I[IZ)V

    return-object v0
.end method
