.class public Lcom/flyersoft/books/chmlib/HeaderITSF;
.super Ljava/lang/Object;
.source "HeaderITSF.java"


# static fields
.field public static final TAG:[B


# instance fields
.field public GUID_1:[B

.field public GUID_2:[B

.field public headLength:I

.field public languageId:I

.field public lengthDirectorySection:J

.field public lengthHead0:J

.field public offsetContentSection:J

.field public offsetDirectorySection:J

.field public offsetHead0:J

.field public timestamp:I

.field public unknow_1:I

.field public versionNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    const-string v0, "ITSF"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/HeaderITSF;->TAG:[B

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 5

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    sget-object v0, Lcom/flyersoft/books/chmlib/HeaderITSF;->TAG:[B

    array-length v1, v0

    invoke-virtual {p1, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/books/chmlib/ChmUtil;->assertEqual([B[B)V

    .line 32
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->versionNumber:I

    .line 33
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->headLength:I

    .line 34
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->unknow_1:I

    .line 35
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->timestamp:I

    .line 36
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->languageId:I

    const/16 v0, 0x10

    .line 37
    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->GUID_1:[B

    .line 38
    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->GUID_2:[B

    .line 39
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->offsetHead0:J

    .line 40
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->lengthHead0:J

    .line 41
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->offsetDirectorySection:J

    .line 42
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->lengthDirectorySection:J

    .line 43
    iget v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->headLength:I

    int-to-long v0, v0

    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getAbsoluteOffset()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 44
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readQWORD()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->offsetContentSection:J

    :cond_0
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/lang/String;
    .locals 3

    .line 49
    iget v0, p0, Lcom/flyersoft/books/chmlib/HeaderITSF;->languageId:I

    const/16 v1, 0x401

    if-eq v0, v1, :cond_9

    const/16 v1, 0x408

    if-eq v0, v1, :cond_8

    const/16 v1, 0x40d

    if-eq v0, v1, :cond_7

    const/16 v1, 0x419

    if-eq v0, v1, :cond_6

    const/16 v1, 0x41f

    if-eq v0, v1, :cond_5

    const/16 v1, 0x804

    if-eq v0, v1, :cond_4

    const/16 v1, 0xc04

    const-string v2, "Big5"

    if-eq v0, v1, :cond_3

    const/16 v1, 0x404

    if-eq v0, v1, :cond_3

    const/16 v1, 0x405

    if-eq v0, v1, :cond_2

    const/16 v1, 0x411

    if-eq v0, v1, :cond_1

    const/16 v1, 0x412

    if-eq v0, v1, :cond_0

    .line 61
    const-string v0, "CP1252"

    return-object v0

    .line 58
    :cond_0
    const-string v0, "eucKR"

    return-object v0

    .line 57
    :cond_1
    const-string v0, "Shift-JIS"

    return-object v0

    .line 54
    :cond_2
    const-string v0, "CP1250"

    return-object v0

    :cond_3
    return-object v2

    .line 50
    :cond_4
    const-string v0, "GB2312"

    return-object v0

    .line 60
    :cond_5
    const-string v0, "CP1254"

    return-object v0

    .line 59
    :cond_6
    const-string v0, "CP1251"

    return-object v0

    .line 56
    :cond_7
    const-string v0, "CP1255"

    return-object v0

    .line 55
    :cond_8
    const-string v0, "CP1253"

    return-object v0

    .line 53
    :cond_9
    const-string v0, "CP1256"

    return-object v0
.end method
