.class public final Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;
.super Ljava/lang/Object;
.source "SpscLinkedArrayQueue.java"

# interfaces
.implements Lio/reactivex/rxjava3/operators/SimplePlainQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/operators/SimplePlainQueue<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final HAS_NEXT:Ljava/lang/Object;

.field static final MAX_LOOK_AHEAD_STEP:I


# instance fields
.field consumerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

.field final consumerMask:I

.field producerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

.field producerLookAhead:J

.field producerLookAheadStep:I

.field final producerMask:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 33
    const-string v0, "jctools.spsc.max.lookahead.step"

    const/16 v1, 0x1000

    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sput v0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->MAX_LOOK_AHEAD_STEP:I

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->HAS_NEXT:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "bufferSize"
        }
    .end annotation

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    .line 44
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    const/16 v0, 0x8

    .line 54
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {p1}, Lio/reactivex/rxjava3/internal/util/Pow2;->roundToPowerOfTwo(I)I

    move-result p1

    add-int/lit8 v0, p1, -0x1

    .line 56
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    add-int/lit8 v2, p1, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 57
    iput-object v1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 58
    iput v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerMask:I

    .line 59
    invoke-direct {p0, p1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->adjustLookAheadStep(I)V

    .line 60
    iput-object v1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 61
    iput v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerMask:I

    add-int/lit8 p1, p1, -0x2

    int-to-long v0, p1

    .line 62
    iput-wide v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerLookAhead:J

    const-wide/16 v0, 0x0

    .line 63
    invoke-direct {p0, v0, v1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soProducerIndex(J)V

    return-void
.end method

.method private adjustLookAheadStep(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "capacity"
        }
    .end annotation

    .line 228
    div-int/lit8 p1, p1, 0x4

    sget v0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->MAX_LOOK_AHEAD_STEP:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerLookAheadStep:I

    return-void
.end method

.method private static calcDirectOffset(I)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    return p0
.end method

.method private static calcWrappedOffset(JI)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "mask"
        }
    .end annotation

    long-to-int p1, p0

    and-int p0, p1, p2

    .line 256
    invoke-static {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcDirectOffset(I)I

    move-result p0

    return p0
.end method

.method private lpConsumerIndex()J
    .locals 2

    .line 244
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method private lpProducerIndex()J
    .locals 2

    .line 240
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method private lvConsumerIndex()J
    .locals 2

    .line 236
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method private static lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "buffer",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;I)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 266
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private lvNextBufferAndUnlink(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "curr",
            "nextIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;I)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 124
    invoke-static {p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcDirectOffset(I)I

    move-result p2

    .line 125
    invoke-static {p1, p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/4 v1, 0x0

    .line 126
    invoke-static {p1, p2, v1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    return-object v0
.end method

.method private lvProducerIndex()J
    .locals 2

    .line 232
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method private newBufferPeek(Ljava/util/concurrent/atomic/AtomicReferenceArray;JI)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10
        }
        names = {
            "nextBuffer",
            "index",
            "mask"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;JI)TT;"
        }
    .end annotation

    .line 190
    iput-object p1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 191
    invoke-static {p2, p3, p4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result p2

    .line 192
    invoke-static {p1, p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private newBufferPoll(Ljava/util/concurrent/atomic/AtomicReferenceArray;JI)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10
        }
        names = {
            "nextBuffer",
            "index",
            "mask"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;JI)TT;"
        }
    .end annotation

    .line 158
    iput-object p1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 159
    invoke-static {p2, p3, p4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result p4

    .line 160
    invoke-static {p1, p4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 162
    invoke-static {p1, p4, v1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    const-wide/16 v1, 0x1

    add-long/2addr p2, v1

    .line 163
    invoke-direct {p0, p2, p3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soConsumerIndex(J)V

    :cond_0
    return-object v0
.end method

.method private resize(Ljava/util/concurrent/atomic/AtomicReferenceArray;JILjava/lang/Object;J)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            "oldBuffer",
            "currIndex",
            "offset",
            "e",
            "mask"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;JITT;J)V"
        }
    .end annotation

    .line 107
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    .line 108
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 109
    iput-object v1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    add-long/2addr p6, p2

    const-wide/16 v2, 0x1

    sub-long/2addr p6, v2

    .line 110
    iput-wide p6, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerLookAhead:J

    .line 111
    invoke-static {v1, p4, p5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    .line 112
    invoke-direct {p0, p1, v1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soNext(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/util/concurrent/atomic/AtomicReferenceArray;)V

    .line 113
    sget-object p5, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->HAS_NEXT:Ljava/lang/Object;

    invoke-static {p1, p4, p5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    add-long/2addr p2, v2

    .line 115
    invoke-direct {p0, p2, p3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soProducerIndex(J)V

    return-void
.end method

.method private soConsumerIndex(J)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 252
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->lazySet(J)V

    return-void
.end method

.method private static soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "buffer",
            "offset",
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;I",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 262
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->lazySet(ILjava/lang/Object;)V

    return-void
.end method

.method private soNext(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/util/concurrent/atomic/AtomicReferenceArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "curr",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 119
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcDirectOffset(I)I

    move-result v0

    invoke-static {p1, v0, p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    return-void
.end method

.method private soProducerIndex(J)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 248
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerIndex:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->lazySet(J)V

    return-void
.end method

.method private writeToQueue(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/lang/Object;JI)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            "buffer",
            "e",
            "index",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Ljava/lang/Object;",
            ">;TT;JI)Z"
        }
    .end annotation

    .line 100
    invoke-static {p1, p5, p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    const-wide/16 p1, 0x1

    add-long/2addr p3, p1

    .line 101
    invoke-direct {p0, p3, p4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soProducerIndex(J)V

    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 197
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public isEmpty()Z
    .locals 5

    .line 224
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvProducerIndex()J

    move-result-wide v0

    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvConsumerIndex()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 77
    iget-object v1, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 78
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lpProducerIndex()J

    move-result-wide v3

    .line 79
    iget v6, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerMask:I

    .line 80
    invoke-static {v3, v4, v6}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result v5

    .line 81
    iget-wide v7, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerLookAhead:J

    cmp-long v0, v3, v7

    if-gez v0, :cond_0

    move-object v0, p0

    move-object v2, p1

    .line 82
    invoke-direct/range {v0 .. v5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->writeToQueue(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/lang/Object;JI)Z

    move-result p1

    return p1

    :cond_0
    move-object v0, p0

    move-object v2, p1

    .line 84
    iget p1, v0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerLookAheadStep:I

    int-to-long v7, p1

    add-long/2addr v7, v3

    .line 86
    invoke-static {v7, v8, v6}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result p1

    .line 87
    invoke-static {v1, p1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object p1

    const-wide/16 v9, 0x1

    if-nez p1, :cond_1

    sub-long/2addr v7, v9

    .line 88
    iput-wide v7, v0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerLookAhead:J

    .line 89
    invoke-direct/range {v0 .. v5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->writeToQueue(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/lang/Object;JI)Z

    move-result p1

    return p1

    :cond_1
    add-long v7, v3, v9

    .line 90
    invoke-static {v7, v8, v6}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result p1

    invoke-static {v1, p1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    move-object v0, p0

    .line 91
    invoke-direct/range {v0 .. v5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->writeToQueue(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/lang/Object;JI)Z

    move-result p1

    return p1

    :cond_2
    int-to-long v6, v6

    move v0, v5

    move-object v5, v2

    move-wide v2, v3

    move v4, v0

    move-object v0, p0

    .line 93
    invoke-direct/range {v0 .. v7}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->resize(Ljava/util/concurrent/atomic/AtomicReferenceArray;JILjava/lang/Object;J)V

    const/4 p1, 0x1

    return p1

    .line 74
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null is not a valid element"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public offer(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "first",
            "second"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 278
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 279
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvProducerIndex()J

    move-result-wide v1

    .line 280
    iget v3, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerMask:I

    const-wide/16 v4, 0x2

    add-long/2addr v4, v1

    .line 282
    invoke-static {v4, v5, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result v6

    .line 284
    invoke-static {v0, v6}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_0

    .line 285
    invoke-static {v1, v2, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 286
    invoke-static {v0, v2, p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    .line 287
    invoke-static {v0, v1, p1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    .line 288
    invoke-direct {p0, v4, v5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soProducerIndex(J)V

    goto :goto_0

    .line 290
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v6

    .line 291
    new-instance v7, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 292
    iput-object v7, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->producerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 294
    invoke-static {v1, v2, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 295
    invoke-static {v7, v2, p2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    .line 296
    invoke-static {v7, v1, p1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    .line 297
    invoke-direct {p0, v0, v7}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soNext(Ljava/util/concurrent/atomic/AtomicReferenceArray;Ljava/util/concurrent/atomic/AtomicReferenceArray;)V

    .line 299
    sget-object p1, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->HAS_NEXT:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    .line 301
    invoke-direct {p0, v4, v5}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soProducerIndex(J)V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public peek()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 177
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lpConsumerIndex()J

    move-result-wide v1

    .line 178
    iget v3, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerMask:I

    .line 179
    invoke-static {v1, v2, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result v4

    .line 180
    invoke-static {v0, v4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object v4

    .line 181
    sget-object v5, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->HAS_NEXT:Ljava/lang/Object;

    if-ne v4, v5, :cond_0

    add-int/lit8 v4, v3, 0x1

    .line 182
    invoke-direct {p0, v0, v4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvNextBufferAndUnlink(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-result-object v0

    invoke-direct {p0, v0, v1, v2, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->newBufferPeek(Ljava/util/concurrent/atomic/AtomicReferenceArray;JI)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v4
.end method

.method public poll()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 139
    iget-object v0, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerBuffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 140
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lpConsumerIndex()J

    move-result-wide v1

    .line 141
    iget v3, p0, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->consumerMask:I

    .line 142
    invoke-static {v1, v2, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->calcWrappedOffset(JI)I

    move-result v4

    .line 143
    invoke-static {v0, v4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/lang/Object;

    move-result-object v5

    .line 144
    sget-object v6, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->HAS_NEXT:Ljava/lang/Object;

    if-ne v5, v6, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    const/4 v7, 0x0

    if-eqz v5, :cond_1

    if-nez v6, :cond_1

    .line 146
    invoke-static {v0, v4, v7}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soElement(Ljava/util/concurrent/atomic/AtomicReferenceArray;ILjava/lang/Object;)V

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    .line 147
    invoke-direct {p0, v1, v2}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->soConsumerIndex(J)V

    return-object v5

    :cond_1
    if-eqz v6, :cond_2

    add-int/lit8 v4, v3, 0x1

    .line 150
    invoke-direct {p0, v0, v4}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvNextBufferAndUnlink(Ljava/util/concurrent/atomic/AtomicReferenceArray;I)Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-result-object v0

    invoke-direct {p0, v0, v1, v2, v3}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->newBufferPoll(Ljava/util/concurrent/atomic/AtomicReferenceArray;JI)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_2
    return-object v7
.end method

.method public size()I
    .locals 7

    .line 211
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvConsumerIndex()J

    move-result-wide v0

    .line 214
    :goto_0
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvProducerIndex()J

    move-result-wide v2

    .line 215
    invoke-direct {p0}, Lio/reactivex/rxjava3/operators/SpscLinkedArrayQueue;->lvConsumerIndex()J

    move-result-wide v4

    cmp-long v6, v0, v4

    if-nez v6, :cond_0

    sub-long/2addr v2, v4

    long-to-int v0, v2

    return v0

    :cond_0
    move-wide v0, v4

    goto :goto_0
.end method
