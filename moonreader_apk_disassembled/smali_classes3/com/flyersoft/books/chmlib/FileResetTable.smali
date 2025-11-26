.class public Lcom/flyersoft/books/chmlib/FileResetTable;
.super Ljava/lang/Object;
.source "FileResetTable.java"


# instance fields
.field public blockSize:J

.field public compressedLength:J

.field public lengthOfHeader:I

.field public locations:[J

.field public numOfEntries:I

.field public sizeOfEntry:I

.field public uncomperssedLength:J

.field public unknow:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 4

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->unknow:I

    .line 15
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->numOfEntries:I

    .line 16
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->sizeOfEntry:I

    .line 17
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->lengthOfHeader:I

    .line 18
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->uncomperssedLength:J

    .line 19
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->compressedLength:J

    .line 20
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->blockSize:J

    .line 21
    iget v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->numOfEntries:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->locations:[J

    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileResetTable;->locations:[J

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 23
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v2

    aput-wide v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
