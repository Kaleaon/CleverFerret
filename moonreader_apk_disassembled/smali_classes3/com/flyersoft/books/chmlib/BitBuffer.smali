.class public Lcom/flyersoft/books/chmlib/BitBuffer;
.super Ljava/lang/Object;
.source "BitBuffer.java"


# instance fields
.field public bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

.field private currentWord:I

.field private mask:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 14
    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 15
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    return-void
.end method


# virtual methods
.method public align16Bits()V
    .locals 1

    const/4 v0, 0x1

    .line 66
    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    return-void
.end method

.method public decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I
    .locals 3

    .line 78
    :goto_0
    iget-object v0, p1, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    if-eqz v0, :cond_2

    .line 79
    iget v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const v0, 0x8000

    .line 80
    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 81
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->currentWord:I

    goto :goto_1

    :cond_0
    shr-int/lit8 v0, v0, 0x1

    .line 83
    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 85
    :goto_1
    iget v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->currentWord:I

    iget v1, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->right:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    goto :goto_0

    :cond_1
    iget-object p1, p1, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->left:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    goto :goto_0

    .line 88
    :cond_2
    iget p1, p1, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->value:I

    return p1
.end method

.method public offset()J
    .locals 5

    const/4 v0, 0x0

    const v1, 0x8000

    .line 95
    :goto_0
    iget v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    if-eq v1, v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    shr-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getOffset()J

    move-result-wide v1

    const-wide/16 v3, 0x2

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x8

    mul-long v1, v1, v3

    int-to-long v3, v0

    add-long/2addr v1, v3

    return-wide v1
.end method

.method public read(I)I
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_2

    shl-int/lit8 v1, v1, 0x1

    .line 51
    iget v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    const v2, 0x8000

    .line 52
    iput v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 53
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    iget-object v3, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v3

    shl-int/lit8 v3, v3, 0x8

    const v4, 0xff00

    and-int/2addr v3, v4

    add-int/2addr v2, v3

    iput v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->currentWord:I

    goto :goto_1

    :cond_0
    shr-int/lit8 v2, v2, 0x1

    .line 55
    iput v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 57
    :goto_1
    iget v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->currentWord:I

    iget v3, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    and-int/2addr v2, v3

    if-eqz v2, :cond_1

    or-int/lit8 v1, v1, 0x1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public read()Z
    .locals 4

    .line 30
    iget v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const v0, 0x8000

    .line 31
    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 32
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    const v3, 0xff00

    and-int/2addr v2, v3

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->currentWord:I

    goto :goto_0

    :cond_0
    shr-int/2addr v0, v1

    .line 34
    iput v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    .line 36
    :goto_0
    iget v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->currentWord:I

    iget v2, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->mask:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public readByte()B
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readByte()B

    move-result v0

    return v0
.end method
