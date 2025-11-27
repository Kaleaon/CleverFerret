.class public Lcom/flyersoft/books/chmlib/ByteBufferFile;
.super Lcom/flyersoft/books/chmlib/ByteBuffer;
.source "ByteBufferFile.java"


# instance fields
.field private file:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ByteBuffer;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    .line 20
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ByteBufferFile;->resetSize()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/flyersoft/books/chmlib/ByteBufferFile;-><init>(Ljava/io/RandomAccessFile;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 76
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 77
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    return-void
.end method

.method public getAbsoluteOffset()J
    .locals 2

    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    .line 37
    new-instance v1, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public getFullSize()J
    .locals 2

    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    .line 28
    new-instance v1, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public readByte()B
    .locals 2

    .line 56
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-byte v0, v0

    return v0

    :catch_0
    move-exception v0

    .line 58
    new-instance v1, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public readBytes([BII)I
    .locals 1

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 69
    new-instance p2, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {p2, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw p2
.end method

.method public seekAbsolute(J)V
    .locals 1

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ByteBufferFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 47
    new-instance p2, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {p2, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw p2
.end method
