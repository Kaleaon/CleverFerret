.class public Lcom/flyersoft/books/chmlib/LZXCoder;
.super Ljava/lang/Object;
.source "LZXCoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;
    }
.end annotation


# static fields
.field public static final ALIGNED_OFFSET_TREE_BITS:I = 0x3

.field public static EXTRA_BITS:[I = null

.field public static final MIN_MATCH:I = 0x2

.field public static final NUM_ALIGNED_OFFSET:I = 0x8

.field public static final NUM_CHARS:I = 0x100

.field public static final NUM_LENGTH_FOOT_VALUE:I = 0xf9

.field public static final NUM_PRIMARY_LENGTHS:I = 0x7

.field public static POSITION_BASE:[I = null

.field public static final PRE_TREE_BITS:I = 0x4

.field public static final PRE_TREE_ENTRIES:I = 0x14


# instance fields
.field public alignOffsetTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

.field private bits:Lcom/flyersoft/books/chmlib/BitBuffer;

.field public blockSize:I

.field public blockType:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

.field private curpos:I

.field private endpos:I

.field public fileTranslationSize:J

.field public headerBit:Z

.field public lengthTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

.field public lengthTreeLen:[I

.field public mainTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

.field public mainTreeElements:I

.field public mainTreeLen:[I

.field public numOfUncompressedBytes:I

.field public numPositionSlots:I

.field private offset:I

.field r0:I

.field r1:I

.field r2:I

.field public winSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x33

    .line 23
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/flyersoft/books/chmlib/LZXCoder;->EXTRA_BITS:[I

    .line 30
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/flyersoft/books/chmlib/LZXCoder;->POSITION_BASE:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x1
        0x1
        0x2
        0x2
        0x3
        0x3
        0x4
        0x4
        0x5
        0x5
        0x6
        0x6
        0x7
        0x7
        0x8
        0x8
        0x9
        0x9
        0xa
        0xa
        0xb
        0xb
        0xc
        0xc
        0xd
        0xd
        0xe
        0xe
        0xf
        0xf
        0x10
        0x10
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
        0x11
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x6
        0x8
        0xc
        0x10
        0x18
        0x20
        0x30
        0x40
        0x60
        0x80
        0xc0
        0x100
        0x180
        0x200
        0x300
        0x400
        0x600
        0x800
        0xc00
        0x1000
        0x1800
        0x2000
        0x3000
        0x4000
        0x6000
        0x8000
        0xc000
        0x10000
        0x18000
        0x20000
        0x30000
        0x40000
        0x60000
        0x80000
        0xa0000
        0xc0000
        0xe0000
        0x100000
        0x120000
        0x140000
        0x160000
        0x180000
        0x1a0000
        0x1c0000
        0x1e0000
        0x200000
    .end array-data
.end method

.method public constructor <init>(IJ)V
    .locals 2

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->winSize:I

    .line 67
    :goto_0
    iget p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->winSize:I

    sget-object v0, Lcom/flyersoft/books/chmlib/LZXCoder;->POSITION_BASE:[I

    iget v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->numPositionSlots:I

    aget v0, v0, v1

    if-le p1, v0, :cond_0

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->numPositionSlots:I

    goto :goto_0

    :cond_0
    mul-int/lit8 v1, v1, 0x8

    add-int/lit16 v1, v1, 0x100

    .line 68
    iput v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTreeElements:I

    long-to-int p1, p2

    .line 69
    iput p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->blockSize:I

    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 1

    .line 273
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method private readAlignOffsetTree()V
    .locals 5

    const/16 v0, 0x8

    .line 267
    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 269
    iget-object v3, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 270
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->build([I)Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->alignOffsetTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    return-void
.end method

.method private readLengthTree()V
    .locals 4

    .line 219
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readPreTree()Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    .line 220
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->lengthTreeLen:[I

    const/4 v2, 0x0

    const/16 v3, 0xf9

    invoke-direct {p0, v1, v2, v3, v0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readTreeLenTable([IIILcom/flyersoft/books/chmlib/HuffmanTreeNode;)V

    .line 221
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->lengthTreeLen:[I

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->build([I)Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->lengthTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    return-void
.end method

.method private readMainTree()V
    .locals 4

    .line 207
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readPreTree()Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    .line 208
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTreeLen:[I

    const/4 v2, 0x0

    const/16 v3, 0x100

    invoke-direct {p0, v1, v2, v3, v0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readTreeLenTable([IIILcom/flyersoft/books/chmlib/HuffmanTreeNode;)V

    .line 211
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readPreTree()Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    .line 212
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTreeLen:[I

    array-length v2, v1

    sub-int/2addr v2, v3

    invoke-direct {p0, v1, v3, v2, v0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readTreeLenTable([IIILcom/flyersoft/books/chmlib/HuffmanTreeNode;)V

    .line 214
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTreeLen:[I

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->build([I)Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    return-void
.end method

.method private readPreTree()Lcom/flyersoft/books/chmlib/HuffmanTreeNode;
    .locals 5

    const/16 v0, 0x14

    .line 259
    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 261
    iget-object v3, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 262
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/books/chmlib/HuffmanTreeNode;->build([I)Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    move-result-object v0

    return-object v0
.end method

.method private readTreeLenTable([IIILcom/flyersoft/books/chmlib/HuffmanTreeNode;)V
    .locals 8

    move v0, p2

    :cond_0
    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_4

    .line 227
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v1, p4}, Lcom/flyersoft/books/chmlib/BitBuffer;->decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I

    move-result v1

    const/16 v2, 0x11

    if-ge v1, v2, :cond_1

    .line 229
    aget v3, p1, v0

    add-int/2addr v3, v2

    sub-int/2addr v3, v1

    rem-int/2addr v3, v2

    aput v3, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x4

    const/4 v4, 0x0

    if-ne v1, v2, :cond_2

    .line 235
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v1, v3}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v1

    add-int/2addr v1, v3

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_0

    add-int/lit8 v3, v0, 0x1

    .line 237
    aput v4, p1, v0

    add-int/lit8 v2, v2, 0x1

    move v0, v3

    goto :goto_1

    :cond_2
    const/16 v5, 0x12

    if-ne v1, v5, :cond_3

    .line 242
    iget-object v5, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/4 v6, 0x5

    invoke-virtual {v5, v6}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x14

    const/4 v6, 0x0

    :goto_2
    if-ge v6, v5, :cond_3

    add-int/lit8 v7, v0, 0x1

    .line 244
    aput v4, p1, v0

    add-int/lit8 v6, v6, 0x1

    move v0, v7

    goto :goto_2

    :cond_3
    const/16 v5, 0x13

    if-ne v1, v5, :cond_0

    .line 248
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v1

    add-int/2addr v1, v3

    .line 249
    iget-object v3, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v3, p4}, Lcom/flyersoft/books/chmlib/BitBuffer;->decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I

    move-result v3

    .line 250
    aget v5, p1, v0

    add-int/2addr v5, v2

    sub-int/2addr v5, v3

    rem-int/2addr v5, v2

    :goto_3
    if-ge v4, v1, :cond_0

    add-int/lit8 v2, v0, 0x1

    .line 252
    aput v5, p1, v0

    add-int/lit8 v4, v4, 0x1

    move v0, v2

    goto :goto_3

    :cond_4
    return-void
.end method


# virtual methods
.method public decompress([BI[BII)V
    .locals 2

    .line 77
    new-instance v0, Lcom/flyersoft/books/chmlib/BitBuffer;

    new-instance v1, Lcom/flyersoft/books/chmlib/ByteBufferArray;

    invoke-direct {v1, p1}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([B)V

    invoke-direct {v0, v1}, Lcom/flyersoft/books/chmlib/BitBuffer;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    .line 78
    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/BitBuffer;->read()Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->headerBit:Z

    if-eqz p1, :cond_0

    .line 80
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->fileTranslationSize:J

    .line 83
    :cond_0
    iget p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTreeElements:I

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTreeLen:[I

    const/16 p1, 0xf9

    .line 84
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->lengthTreeLen:[I

    const/4 p1, 0x1

    .line 85
    iput p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    iput p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r1:I

    iput p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r2:I

    .line 87
    iput p4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->offset:I

    iput p4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    add-int/2addr p4, p5

    .line 88
    iput p4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->endpos:I

    .line 89
    :goto_0
    iget p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    iget p4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->endpos:I

    if-ge p1, p4, :cond_1

    int-to-long p4, p2

    iget-object p1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/BitBuffer;->bytes:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getOffset()J

    move-result-wide v0

    sub-long/2addr p4, v0

    const-wide/16 v0, 0x1

    cmp-long p1, p4, v0

    if-lez p1, :cond_1

    .line 90
    invoke-virtual {p0, p3}, Lcom/flyersoft/books/chmlib/LZXCoder;->decompressBlock([B)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public decompressBlock([B)V
    .locals 10

    .line 96
    invoke-static {}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->values()[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->blockType:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    .line 97
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->numOfUncompressedBytes:I

    .line 99
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->blockType:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->ordinal()I

    move-result v0

    const/4 v1, 0x2

    const/4 v3, 0x1

    if-eq v0, v3, :cond_1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readAlignOffsetTree()V

    .line 106
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readMainTree()V

    .line 108
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/LZXCoder;->readLengthTree()V

    .line 118
    :goto_0
    iget v0, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    iget v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->numOfUncompressedBytes:I

    add-int/2addr v0, v4

    .line 119
    iget-object v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->blockType:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    sget-object v5, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->uncompressed:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    if-ne v4, v5, :cond_2

    .line 121
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/BitBuffer;->align16Bits()V

    .line 122
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v1

    iput v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    .line 123
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v1

    iput v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r1:I

    .line 124
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v1

    iput v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r2:I

    .line 125
    :goto_1
    iget v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    if-ge v1, v0, :cond_f

    .line 126
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/BitBuffer;->readByte()B

    move-result v2

    aput-byte v2, p1, v1

    .line 125
    iget v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    goto :goto_1

    .line 131
    :cond_2
    :goto_2
    iget v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    if-ge v4, v0, :cond_f

    .line 136
    iget v5, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->offset:I

    if-le v4, v5, :cond_3

    sub-int/2addr v4, v5

    iget v5, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->blockSize:I

    rem-int/2addr v4, v5

    if-nez v4, :cond_3

    .line 137
    iget-object v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v4}, Lcom/flyersoft/books/chmlib/BitBuffer;->align16Bits()V

    .line 141
    :cond_3
    iget-object v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    iget-object v5, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->mainTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    invoke-virtual {v4, v5}, Lcom/flyersoft/books/chmlib/BitBuffer;->decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I

    move-result v4

    const/16 v5, 0x100

    if-ge v4, v5, :cond_4

    .line 145
    iget v5, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    int-to-byte v4, v4

    aput-byte v4, p1, v5

    goto :goto_2

    :cond_4
    add-int/lit16 v4, v4, -0x100

    and-int/lit8 v5, v4, 0x7

    const/4 v6, 0x7

    if-ne v5, v6, :cond_5

    .line 158
    iget-object v6, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    iget-object v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->lengthTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    invoke-virtual {v6, v7}, Lcom/flyersoft/books/chmlib/BitBuffer;->decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I

    move-result v6

    add-int/2addr v5, v6

    :cond_5
    add-int/2addr v5, v1

    shr-int/lit8 v4, v4, 0x3

    const/4 v6, 0x0

    if-nez v4, :cond_6

    .line 167
    iget v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    goto/16 :goto_7

    :cond_6
    if-ne v4, v3, :cond_7

    .line 169
    iget v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r1:I

    iget v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    iput v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r1:I

    iput v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    goto :goto_7

    :cond_7
    if-ne v4, v1, :cond_8

    .line 171
    iget v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r2:I

    iget v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    iput v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r2:I

    iput v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    goto :goto_7

    .line 173
    :cond_8
    sget-object v7, Lcom/flyersoft/books/chmlib/LZXCoder;->EXTRA_BITS:[I

    aget v7, v7, v4

    .line 174
    iget-object v8, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->blockType:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    sget-object v9, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->verbatim:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    if-ne v8, v9, :cond_a

    if-nez v7, :cond_9

    const/4 v7, 0x0

    goto :goto_3

    .line 175
    :cond_9
    iget-object v8, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v8, v7}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v7

    .line 176
    :goto_3
    sget-object v8, Lcom/flyersoft/books/chmlib/LZXCoder;->POSITION_BASE:[I

    aget v4, v8, v4

    add-int/2addr v4, v7

    goto :goto_6

    :cond_a
    if-le v7, v2, :cond_b

    .line 179
    iget-object v8, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    add-int/lit8 v7, v7, -0x3

    invoke-virtual {v8, v7}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v7

    shl-int/2addr v7, v2

    .line 180
    iget-object v8, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    iget-object v9, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->alignOffsetTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    invoke-virtual {v8, v9}, Lcom/flyersoft/books/chmlib/BitBuffer;->decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I

    move-result v8

    goto :goto_5

    :cond_b
    if-ne v7, v2, :cond_c

    .line 182
    iget-object v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    iget-object v8, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->alignOffsetTree:Lcom/flyersoft/books/chmlib/HuffmanTreeNode;

    invoke-virtual {v7, v8}, Lcom/flyersoft/books/chmlib/BitBuffer;->decode(Lcom/flyersoft/books/chmlib/HuffmanTreeNode;)I

    move-result v8

    const/4 v7, 0x0

    goto :goto_5

    :cond_c
    if-lez v7, :cond_d

    .line 184
    iget-object v8, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->bits:Lcom/flyersoft/books/chmlib/BitBuffer;

    invoke-virtual {v8, v7}, Lcom/flyersoft/books/chmlib/BitBuffer;->read(I)I

    move-result v7

    goto :goto_4

    :cond_d
    const/4 v7, 0x0

    :goto_4
    const/4 v8, 0x0

    .line 187
    :goto_5
    sget-object v9, Lcom/flyersoft/books/chmlib/LZXCoder;->POSITION_BASE:[I

    aget v4, v9, v4

    add-int/2addr v4, v7

    add-int/2addr v4, v8

    :goto_6
    sub-int/2addr v4, v1

    .line 189
    iget v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r1:I

    iput v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r2:I

    iget v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    iput v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r1:I

    iput v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->r0:I

    :goto_7
    if-ge v6, v5, :cond_e

    .line 194
    iget v7, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    add-int v8, v7, v6

    add-int/2addr v7, v6

    sub-int/2addr v7, v4

    aget-byte v7, p1, v7

    aput-byte v7, p1, v8

    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 196
    :cond_e
    iget v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/flyersoft/books/chmlib/LZXCoder;->curpos:I

    goto/16 :goto_2

    :cond_f
    return-void
.end method
