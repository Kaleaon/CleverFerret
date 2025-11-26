.class public Lcom/flyersoft/books/chmlib/ChunkPMGL;
.super Lcom/flyersoft/books/chmlib/ChunkListing;
.source "ChunkPMGL.java"


# static fields
.field public static final TAG:[B


# instance fields
.field public chunkNumberNext:I

.field public chunkNumberPrevios:I

.field public directoryEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/DirectoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field public endOffset:J

.field public freeSpaces:[B

.field public lengthOfFreeSpace:I

.field public unknow_0:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-string v0, "PMGL"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->TAG:[B

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 6

    .line 26
    invoke-direct {p0}, Lcom/flyersoft/books/chmlib/ChunkListing;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->directoryEntries:Ljava/util/List;

    .line 31
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->lengthOfFreeSpace:I

    .line 32
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->unknow_0:I

    .line 33
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->chunkNumberPrevios:I

    .line 34
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->chunkNumberNext:I

    .line 36
    :goto_0
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getRemainSize()J

    move-result-wide v0

    iget v2, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->lengthOfFreeSpace:I

    int-to-long v3, v2

    cmp-long v5, v0, v3

    if-lez v5, :cond_0

    .line 37
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->directoryEntries:Ljava/util/List;

    new-instance v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;

    invoke-direct {v1, p1}, Lcom/flyersoft/books/chmlib/DirectoryEntry;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->skip(I)V

    .line 41
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->endOffset:J

    return-void
.end method


# virtual methods
.method public find(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;
    .locals 3

    .line 46
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->directoryEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;

    .line 47
    iget-object v2, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
