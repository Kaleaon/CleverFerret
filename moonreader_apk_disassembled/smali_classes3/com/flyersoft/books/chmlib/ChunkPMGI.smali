.class public Lcom/flyersoft/books/chmlib/ChunkPMGI;
.super Lcom/flyersoft/books/chmlib/ChunkListing;
.source "ChunkPMGI.java"


# static fields
.field public static final TAG:[B


# instance fields
.field public directoryIndexes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;",
            ">;"
        }
    .end annotation
.end field

.field public endOffset:J

.field public freeSpaces:[B

.field public lengthOfFreeSpace:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-string v0, "PMGI"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->TAG:[B

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 6

    .line 17
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ChunkListing;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->directoryIndexes:Ljava/util/List;

    .line 21
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->lengthOfFreeSpace:I

    .line 22
    :goto_0
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getRemainSize()J

    move-result-wide v0

    iget v2, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->lengthOfFreeSpace:I

    int-to-long v3, v2

    cmp-long v5, v0, v3

    if-lez v5, :cond_0

    .line 23
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->directoryIndexes:Ljava/util/List;

    new-instance v1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;

    invoke-direct {v1, p1}, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->skip(I)V

    .line 26
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->endOffset:J

    return-void
.end method


# virtual methods
.method public find(Ljava/lang/String;)I
    .locals 2

    const/4 v0, 0x0

    .line 31
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->directoryIndexes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 32
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->directoryIndexes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;

    .line 33
    iget-object v1, v1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_1

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->directoryIndexes:Ljava/util/List;

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;

    iget p1, p1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;->directoryListChunk:I

    return p1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 39
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChunkPMGI;->directoryIndexes:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;

    iget p1, p1, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;->directoryListChunk:I

    return p1
.end method
