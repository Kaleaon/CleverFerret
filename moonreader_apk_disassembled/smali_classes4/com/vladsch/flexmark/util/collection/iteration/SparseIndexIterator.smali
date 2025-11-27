.class public Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;
.super Ljava/lang/Object;
.source "SparseIndexIterator.java"

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
.field private final myEnds:[I

.field private myIndex:I

.field private final myIsReversed:Z

.field private myLast:I

.field private myNext:I

.field private final myStarts:[I


# direct methods
.method public constructor <init>([I[IZ)V
    .locals 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myStarts:[I

    .line 20
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myEnds:[I

    .line 21
    iput-boolean p3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIsReversed:Z

    if-eqz p3, :cond_0

    .line 22
    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIndex:I

    const/4 v1, -0x1

    if-gez v0, :cond_1

    .line 23
    array-length v2, p2

    if-lt v0, v2, :cond_1

    const/4 p1, -0x1

    goto :goto_1

    :cond_1
    if-eqz p3, :cond_2

    aget p1, p2, v0

    goto :goto_1

    :cond_2
    aget p1, p1, v0

    :goto_1
    iput p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

    .line 24
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myLast:I

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

    .line 70
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->next()Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public hasNext()Z
    .locals 2

    .line 34
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

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

    .line 29
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIsReversed:Z

    return v0
.end method

.method public next()Ljava/lang/Integer;
    .locals 5

    .line 39
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_5

    .line 43
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myLast:I

    .line 44
    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIsReversed:Z

    if-eqz v2, :cond_2

    .line 45
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myStarts:[I

    iget v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIndex:I

    aget v2, v2, v3

    if-ne v0, v2, :cond_1

    add-int/lit8 v3, v3, -0x1

    .line 47
    iput v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIndex:I

    if-ltz v3, :cond_0

    .line 48
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myEnds:[I

    aget v1, v1, v3

    :cond_0
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v0, -0x1

    .line 50
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

    goto :goto_0

    .line 53
    :cond_2
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myEnds:[I

    iget v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIndex:I

    aget v2, v2, v3

    if-ne v0, v2, :cond_4

    add-int/lit8 v3, v3, 0x1

    .line 55
    iput v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myIndex:I

    .line 56
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myStarts:[I

    array-length v4, v2

    if-ge v3, v4, :cond_3

    aget v1, v2, v3

    :cond_3
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

    goto :goto_0

    :cond_4
    add-int/lit8 v1, v0, 0x1

    .line 58
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->myNext:I

    .line 61
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 40
    :cond_5
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 10
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/SparseIndexIterator;->next()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 66
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
