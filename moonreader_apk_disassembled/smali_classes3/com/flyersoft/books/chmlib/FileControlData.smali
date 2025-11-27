.class public Lcom/flyersoft/books/chmlib/FileControlData;
.super Ljava/lang/Object;
.source "FileControlData.java"


# static fields
.field public static final TAG_LZXC:[B


# instance fields
.field public cacheSize:I

.field public length:I

.field public lzxResetInterval:I

.field public tagLzxc:[B

.field public unknow_0:I

.field public version:I

.field public windowSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 6
    const-string v0, "LZXC"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/FileControlData;->TAG_LZXC:[B

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileControlData;->length:I

    .line 18
    sget-object v0, Lcom/flyersoft/books/chmlib/FileControlData;->TAG_LZXC:[B

    array-length v1, v0

    invoke-virtual {p1, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/books/chmlib/FileControlData;->tagLzxc:[B

    .line 19
    invoke-static {v1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 21
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileControlData;->version:I

    .line 22
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileControlData;->lzxResetInterval:I

    .line 23
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileControlData;->windowSize:I

    .line 24
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileControlData;->cacheSize:I

    .line 25
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/books/chmlib/FileControlData;->unknow_0:I

    .line 27
    iget p1, p0, Lcom/flyersoft/books/chmlib/FileControlData;->version:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 28
    iget p1, p0, Lcom/flyersoft/books/chmlib/FileControlData;->windowSize:I

    const v0, 0x8000

    mul-int p1, p1, v0

    iput p1, p0, Lcom/flyersoft/books/chmlib/FileControlData;->windowSize:I

    :cond_0
    return-void

    .line 20
    :cond_1
    new-instance p1, Lcom/flyersoft/books/chmlib/ChmParseException;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    const-string v0, "Unmatch tag: "

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
