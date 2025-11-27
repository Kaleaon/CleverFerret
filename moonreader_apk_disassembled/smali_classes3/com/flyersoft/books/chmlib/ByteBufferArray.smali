.class public Lcom/flyersoft/books/chmlib/ByteBufferArray;
.super Lcom/flyersoft/books/chmlib/ByteBuffer;
.source "ByteBufferArray.java"


# instance fields
.field private absoluteOffset:I

.field public bytes:[B


# direct methods
.method public constructor <init>([B)V
    .locals 2

    const/4 v0, 0x0

    .line 7
    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([BII)V

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->bytes:[B

    int-to-long p1, p2

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->seekAbsolute(J)V

    int-to-long p1, p3

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->resetSize(J)V

    return-void
.end method


# virtual methods
.method public getAbsoluteOffset()J
    .locals 2

    .line 16
    iget v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getFullSize()J
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->bytes:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public readByte()B
    .locals 3

    .line 21
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->bytes:[B

    iget v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public readBytes([BII)I
    .locals 5

    int-to-long v0, p3

    .line 35
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->getRemainSize()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 36
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->getRemainSize()J

    move-result-wide v0

    long-to-int p3, v0

    :cond_0
    if-nez p3, :cond_1

    const/4 p1, 0x0

    return p1

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->bytes:[B

    iget v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    iget p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    return p3
.end method

.method public seekAbsolute(J)V
    .locals 0

    long-to-int p2, p1

    .line 50
    iput p2, p0, Lcom/flyersoft/books/chmlib/ByteBufferArray;->absoluteOffset:I

    return-void
.end method
