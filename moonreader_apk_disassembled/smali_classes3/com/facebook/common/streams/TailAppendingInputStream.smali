.class public Lcom/facebook/common/streams/TailAppendingInputStream;
.super Ljava/io/FilterInputStream;
.source "TailAppendingInputStream.java"


# instance fields
.field private mMarkedTailOffset:I

.field private final mTail:[B

.field private mTailOffset:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;[B)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    iput-object p2, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mTail:[B

    return-void
.end method

.method private readNextTailByte()I
    .locals 3

    .line 91
    iget v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mTailOffset:I

    iget-object v1, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mTail:[B

    array-length v2, v1

    if-lt v0, v2, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    add-int/lit8 v2, v0, 0x1

    .line 94
    iput v2, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mTailOffset:I

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method


# virtual methods
.method public mark(I)V
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    invoke-super {p0, p1}, Ljava/io/FilterInputStream;->mark(I)V

    .line 86
    iget p1, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mTailOffset:I

    iput p1, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mMarkedTailOffset:I

    :cond_0
    return-void
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 41
    :cond_0
    invoke-direct {p0}, Lcom/facebook/common/streams/TailAppendingInputStream;->readNextTailByte()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 46
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/common/streams/TailAppendingInputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    const/4 v0, 0x0

    if-nez p3, :cond_1

    return v0

    :cond_1
    :goto_0
    if-ge v0, p3, :cond_3

    .line 62
    invoke-direct {p0}, Lcom/facebook/common/streams/TailAppendingInputStream;->readNextTailByte()I

    move-result v2

    if-ne v2, v1, :cond_2

    goto :goto_1

    :cond_2
    add-int v3, p2, v0

    int-to-byte v2, v2

    .line 66
    aput-byte v2, p1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    if-lez v0, :cond_4

    return v0

    :cond_4
    return v1
.end method

.method public reset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 76
    iget v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mMarkedTailOffset:I

    iput v0, p0, Lcom/facebook/common/streams/TailAppendingInputStream;->mTailOffset:I

    return-void

    .line 78
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "mark is not supported"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
