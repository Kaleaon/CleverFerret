.class public Lcom/flyersoft/books/chmlib/ByteBufferFileCache;
.super Lcom/flyersoft/books/chmlib/ByteBuffer;
.source "ByteBufferFileCache.java"


# static fields
.field private static final CACHE_SIZE:I = 0x2000


# instance fields
.field private absoluteOffset:J

.field private cache:[B

.field private cacheAvailable:Z

.field private cacheOffset:I

.field private cacheStartOffset:J

.field private file:Ljava/io/RandomAccessFile;

.field private fullSize:J


# direct methods
.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 2

    .line 28
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;-><init>()V

    const/16 v0, 0x2000

    .line 15
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cache:[B

    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    .line 29
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->file:Ljava/io/RandomAccessFile;

    .line 31
    :try_start_0
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->fullSize:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->resetSize()V

    return-void

    :catch_0
    move-exception p1

    .line 33
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;-><init>(Ljava/io/RandomAccessFile;)V

    return-void
.end method

.method private loadCache()V
    .locals 6

    const-string v0, "EOF: file.length()="

    .line 75
    :try_start_0
    iget-wide v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    iget-object v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    .line 77
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->file:Ljava/io/RandomAccessFile;

    iget-wide v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 78
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->file:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cache:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->read([B)I

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheAvailable:Z

    return-void

    .line 76
    :cond_0
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "; cacheStartOffset= "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 81
    new-instance v1, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 143
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 144
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    return-void
.end method

.method public getAbsoluteOffset()J
    .locals 2

    .line 44
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->absoluteOffset:J

    return-wide v0
.end method

.method public getFullSize()J
    .locals 2

    .line 40
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->fullSize:J

    return-wide v0
.end method

.method public readByte()B
    .locals 7

    .line 90
    iget-boolean v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheAvailable:Z

    if-nez v0, :cond_0

    .line 91
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->loadCache()V

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cache:[B

    iget v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    aget-byte v0, v0, v1

    .line 94
    iget-wide v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->absoluteOffset:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->absoluteOffset:J

    const/16 v1, 0x2000

    if-ne v2, v1, :cond_1

    const/4 v1, 0x0

    .line 96
    iput v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    .line 97
    iget-wide v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    const-wide/16 v4, 0x2000

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    .line 98
    iput-boolean v1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheAvailable:Z

    :cond_1
    return v0
.end method

.method public readBytes([BII)I
    .locals 7

    int-to-long v0, p3

    .line 110
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->getRemainSize()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 111
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->getRemainSize()J

    move-result-wide v0

    long-to-int p3, v0

    :cond_0
    const/4 v0, 0x0

    if-nez p3, :cond_1

    return v0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_0
    if-ge v1, p3, :cond_5

    .line 119
    iget-boolean v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheAvailable:Z

    if-nez v2, :cond_3

    .line 120
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->loadCache()V

    :cond_3
    sub-int v2, p3, v1

    .line 123
    iget v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    rsub-int v4, v3, 0x2000

    if-le v2, v4, :cond_4

    rsub-int v2, v3, 0x2000

    .line 126
    :cond_4
    iget-object v4, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cache:[B

    add-int v5, p2, v1

    invoke-static {v4, v3, p1, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v1, v2

    .line 128
    iget-wide v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->absoluteOffset:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->absoluteOffset:J

    .line 129
    iget v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    const/16 v2, 0x2000

    if-ne v3, v2, :cond_2

    .line 131
    iput-boolean v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheAvailable:Z

    .line 132
    iget-wide v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    const-wide/16 v4, 0x2000

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    .line 133
    iput v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    goto :goto_0

    :cond_5
    return p3
.end method

.method public seekAbsolute(J)V
    .locals 4

    .line 55
    iput-wide p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->absoluteOffset:J

    const-wide/16 v0, 0x2000

    .line 57
    rem-long v2, p1, v0

    long-to-int v3, v2

    iput v3, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheOffset:I

    .line 59
    div-long/2addr p1, v0

    long-to-int p2, p1

    mul-int/lit16 p2, p2, 0x2000

    int-to-long p1, p2

    .line 60
    iget-wide v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    .line 61
    iput-wide p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheStartOffset:J

    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;->cacheAvailable:Z

    :cond_0
    return-void
.end method
