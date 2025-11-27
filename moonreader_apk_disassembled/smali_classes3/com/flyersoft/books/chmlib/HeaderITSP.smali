.class public Lcom/flyersoft/books/chmlib/HeaderITSP;
.super Ljava/lang/Object;
.source "HeaderITSP.java"


# static fields
.field public static final TAG:[B


# instance fields
.field public GUID:[B

.field public chunkNumberFirstPMGL:I

.field public chunkNumberLastPMGL:I

.field public chunkNumberOfDirectory:I

.field public chunkNumberRootIndex:I

.field public deepsOfIndexTree:I

.field public densityOfQuickRef:I

.field public dirChunkSize:I

.field public endOffset:J

.field public headLength:I

.field public length:I

.field public unknow_0:I

.field public unknow_1:I

.field public unknow_2:I

.field public unknow_3:I

.field public unknow_a:I

.field public versionNumber:I

.field public windowsLanguageId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 10
    const-string v0, "ITSP"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/HeaderITSP;->TAG:[B

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    sget-object v0, Lcom/flyersoft/books/chmlib/HeaderITSP;->TAG:[B

    array-length v1, v0

    invoke-virtual {p1, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/books/chmlib/ChmUtil;->assertEqual([B[B)V

    .line 40
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->versionNumber:I

    .line 41
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->headLength:I

    .line 42
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->unknow_a:I

    .line 43
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->dirChunkSize:I

    .line 44
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->densityOfQuickRef:I

    .line 45
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->deepsOfIndexTree:I

    .line 46
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberRootIndex:I

    .line 47
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberFirstPMGL:I

    .line 48
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberLastPMGL:I

    .line 49
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->unknow_0:I

    .line 50
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberOfDirectory:I

    .line 51
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->windowsLanguageId:I

    const/16 v0, 0x10

    .line 52
    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->GUID:[B

    .line 54
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->length:I

    .line 55
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->unknow_1:I

    .line 56
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->unknow_2:I

    .line 57
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->unknow_3:I

    .line 59
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->endOffset:J

    return-void
.end method


# virtual methods
.method public getRootChunkNum()I
    .locals 2

    .line 64
    iget v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberRootIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 66
    :cond_0
    iget v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberFirstPMGL:I

    return v0
.end method
