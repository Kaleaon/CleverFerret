.class public Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
.super Ljava/lang/Object;
.source "BitIntegerSet.java"

# interfaces
.implements Ljava/util/Set;
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Set<",
        "Ljava/lang/Integer;",
        ">;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final myBits:Ljava/util/BitSet;

.field private final myReversed:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0, p1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;)V
    .locals 1

    .line 34
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->isReversed()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;Z)V

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;Z)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    .line 39
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/BitSet;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p1}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    const/4 p1, 0x0

    .line 30
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

    return-void
.end method

.method public static valueOf(Ljava/nio/ByteBuffer;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 244
    new-instance v0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    invoke-static {p0}, Ljava/util/BitSet;->valueOf(Ljava/nio/ByteBuffer;)Ljava/util/BitSet;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method

.method public static valueOf(Ljava/nio/LongBuffer;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 242
    new-instance v0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    invoke-static {p0}, Ljava/util/BitSet;->valueOf(Ljava/nio/LongBuffer;)Ljava/util/BitSet;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method

.method public static valueOf([B)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 243
    new-instance v0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    invoke-static {p0}, Ljava/util/BitSet;->valueOf([B)Ljava/util/BitSet;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method

.method public static valueOf([J)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 241
    new-instance v0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    invoke-static {p0}, Ljava/util/BitSet;->valueOf([J)Ljava/util/BitSet;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Integer;)Z
    .locals 2

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    .line 125
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/util/BitSet;->set(I)V

    return v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 0

    .line 15
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->add(Ljava/lang/Integer;)Z

    move-result p1

    return p1
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 154
    instance-of v0, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 155
    check-cast p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    .line 156
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/BitSet;

    .line 157
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v2, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 158
    invoke-virtual {v0, v0}, Ljava/util/BitSet;->xor(Ljava/util/BitSet;)V

    .line 159
    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    return p1

    .line 163
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 164
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->add(Ljava/lang/Integer;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public and(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public and(Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public andNot(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public andNot(Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public bitSet()Ljava/util/BitSet;
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    return-object v0
.end method

.method public cardinality()I
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->cardinality()I

    move-result v0

    return v0
.end method

.method public cardinality(I)I
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->cardinality(II)I

    move-result p1

    return p1
.end method

.method public cardinality(II)I
    .locals 10

    const/4 v0, 0x0

    if-ltz p1, :cond_5

    if-lez p2, :cond_5

    if-ge p1, p2, :cond_5

    .line 53
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v1

    .line 54
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v2}, Ljava/util/BitSet;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->previousSetBit(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    if-ge p1, v1, :cond_0

    move p1, v1

    :cond_0
    if-le p2, v2, :cond_1

    move p2, v2

    :cond_1
    if-gt p1, p2, :cond_5

    .line 58
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->length()I

    move-result v1

    if-lez v1, :cond_5

    shr-int/lit8 v1, p1, 0x6

    shr-int/lit8 v2, p2, 0x6

    and-int/lit8 p1, p1, 0x3f

    const-wide/16 v3, -0x1

    shl-long v5, v3, p1

    and-int/lit8 p1, p2, 0x3f

    shl-long p1, v3, p1

    not-long p1, p1

    const-wide/16 v7, 0x0

    cmp-long v9, p1, v7

    if-nez v9, :cond_2

    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_2
    move-wide v3, p1

    .line 69
    :goto_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/util/BitSet;->toLongArray()[J

    move-result-object p1

    move p2, v1

    :goto_1
    if-gt p2, v2, :cond_5

    .line 71
    aget-wide v7, p1, p2

    if-ne p2, v1, :cond_3

    and-long/2addr v7, v5

    :cond_3
    if-ne p2, v2, :cond_4

    and-long/2addr v7, v3

    .line 75
    :cond_4
    invoke-static {v7, v8}, Ljava/lang/Long;->bitCount(J)I

    move-result v7

    add-int/2addr v0, v7

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_5
    return v0
.end method

.method public clear(I)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->clear(I)V

    return-object p0
.end method

.method public clear(II)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 256
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1, p2}, Ljava/util/BitSet;->clear(II)V

    return-object p0
.end method

.method public clear()V
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1

    .line 85
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 138
    instance-of v0, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    if-eqz v0, :cond_0

    .line 139
    check-cast p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/BitSet;

    .line 141
    invoke-virtual {v0, p1}, Ljava/util/BitSet;->xor(Ljava/util/BitSet;)V

    .line 142
    invoke-virtual {v0, p1}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 143
    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result p1

    return p1

    .line 146
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public flip(I)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->flip(I)V

    return-object p0
.end method

.method public flip(II)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1, p2}, Ljava/util/BitSet;->flip(II)V

    return-object p0
.end method

.method public forEach(Lcom/vladsch/flexmark/util/IntConsumer;)V
    .locals 2

    .line 218
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    :goto_0
    if-ltz v0, :cond_0

    .line 220
    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/IntConsumer;->accept(I)V

    .line 221
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public forEach(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 210
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    :goto_0
    if-ltz v0, :cond_0

    .line 212
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    .line 213
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public get(II)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 2

    .line 269
    new-instance v0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v1, p1, p2}, Ljava/util/BitSet;->get(II)Ljava/util/BitSet;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method

.method public get(I)Z
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    return p1
.end method

.method public intersects(Ljava/util/BitSet;)Z
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->intersects(Ljava/util/BitSet;)Z

    move-result p1

    return p1
.end method

.method public isEmpty()Z
    .locals 1

    .line 232
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    .line 292
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

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

    .line 282
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v0

    return-object v0
.end method

.method public nextClearBit(I)I
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->nextClearBit(I)I

    move-result p1

    return p1
.end method

.method public nextSetBit(I)I
    .locals 1

    .line 271
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result p1

    return p1
.end method

.method public or(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public or(Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public previousClearBit(I)I
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->previousClearBit(I)I

    move-result p1

    return p1
.end method

.method public previousSetBit(I)I
    .locals 1

    .line 273
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->previousSetBit(I)I

    move-result p1

    return p1
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 2

    .line 131
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->clear(I)V

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 191
    instance-of v0, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 192
    check-cast p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    .line 193
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/BitSet;

    .line 194
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v2, p1}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    .line 195
    invoke-virtual {v0, v0}, Ljava/util/BitSet;->xor(Ljava/util/BitSet;)V

    .line 196
    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    return p1

    .line 200
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 201
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 202
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/BitSet;->clear(I)V

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 172
    instance-of v0, p1, Ljava/util/BitSet;

    if-nez v0, :cond_1

    .line 173
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 174
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 175
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 176
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    goto :goto_0

    .line 180
    :cond_1
    move-object v0, p1

    check-cast v0, Ljava/util/BitSet;

    .line 183
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    .line 184
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 185
    invoke-virtual {p1, p1}, Ljava/util/BitSet;->xor(Ljava/util/BitSet;)V

    .line 186
    invoke-virtual {p1}, Ljava/util/BitSet;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 287
    new-instance v0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;-><init>(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;Z)V

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

    .line 297
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myReversed:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method

.method public set(I)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->set(I)V

    return-object p0
.end method

.method public set(II)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 253
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1, p2}, Ljava/util/BitSet;->set(II)V

    return-object p0
.end method

.method public set(IIZ)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/BitSet;->set(IIZ)V

    return-object p0
.end method

.method public set(IZ)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1, p2}, Ljava/util/BitSet;->set(IZ)V

    return-object p0
.end method

.method public size()I
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->length()I

    move-result v0

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 5

    .line 90
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->cardinality()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    .line 92
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    add-int/lit8 v4, v2, 0x1

    .line 93
    aput-object v3, v0, v2

    move v2, v4

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->cardinality()I

    move-result v0

    .line 103
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 107
    array-length v1, p1

    if-ge v1, v0, :cond_1

    .line 108
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, [Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    new-array v0, v0, [Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    goto :goto_0

    :cond_1
    move-object v0, p1

    .line 112
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    add-int/lit8 v4, v2, 0x1

    .line 113
    aput-object v3, p1, v2

    move v2, v4

    goto :goto_1

    .line 116
    :cond_2
    array-length p1, v0

    add-int/lit8 v2, v2, 0x1

    if-le p1, v2, :cond_3

    const/4 p1, 0x0

    .line 117
    aput-object p1, v0, v2

    .line 119
    :cond_3
    check-cast v0, [Ljava/lang/Object;

    return-object v0

    .line 104
    :cond_4
    new-instance v0, Ljava/lang/ArrayStoreException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cannot store Integer in array of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/ArrayStoreException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toByteArray()[B
    .locals 1

    .line 246
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public toLongArray()[J
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->toLongArray()[J

    move-result-object v0

    return-object v0
.end method

.method public xor(Lcom/vladsch/flexmark/util/collection/BitIntegerSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 264
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->xor(Ljava/util/BitSet;)V

    return-object p0
.end method

.method public xor(Ljava/util/BitSet;)Lcom/vladsch/flexmark/util/collection/BitIntegerSet;
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/BitIntegerSet;->myBits:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->xor(Ljava/util/BitSet;)V

    return-object p0
.end method
