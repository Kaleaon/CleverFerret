.class public Lcom/flyersoft/books/Mobi;
.super Lcom/flyersoft/books/BaseEBook;
.source "Mobi.java"


# instance fields
.field private content:[B

.field private context:Landroid/content/Context;

.field imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private images:[I

.field private mobi:Lcom/dozof/app/mobi/MobiDecoder;

.field private mobi_filename:Ljava/lang/String;

.field private refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;


# direct methods
.method static bridge synthetic -$$Nest$mgetBookCover2(Lcom/flyersoft/books/Mobi;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Mobi;->getBookCover2(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/books/Mobi;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    .line 24
    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    .line 25
    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->images:[I

    .line 26
    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->content:[B

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/flyersoft/books/Mobi;->inited:Z

    .line 34
    iput-object p2, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/flyersoft/books/Mobi;->context:Landroid/content/Context;

    .line 37
    :try_start_0
    new-instance v0, Lcom/dozof/app/mobi/MobiDecoder;

    invoke-direct {v0, p1, p2}, Lcom/dozof/app/mobi/MobiDecoder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    .line 38
    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getTocRefs()[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    .line 39
    iget-object p1, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {p1}, Lcom/dozof/app/mobi/MobiDecoder;->getImageIndices()[I

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Mobi;->images:[I

    .line 40
    invoke-direct {p0}, Lcom/flyersoft/books/Mobi;->getDescriptionAndCategories()V

    const/4 p1, 0x1

    if-nez p3, :cond_0

    .line 42
    invoke-direct {p0}, Lcom/flyersoft/books/Mobi;->loadContent()V

    .line 43
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getChapters()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_1

    .line 44
    iput-boolean p1, p0, Lcom/flyersoft/books/Mobi;->inited:Z

    goto :goto_0

    .line 46
    :cond_0
    iput-boolean p1, p0, Lcom/flyersoft/books/Mobi;->inited:Z

    .line 47
    :cond_1
    :goto_0
    invoke-direct {p0, p3}, Lcom/flyersoft/books/Mobi;->getBookCover(Z)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 53
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/books/Mobi;->errMsg:Ljava/lang/String;

    .line 54
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 51
    :catch_0
    const-string p1, "OutOfMemory Error, this mobi file is too large to open in this device."

    iput-object p1, p0, Lcom/flyersoft/books/Mobi;->errMsg:Ljava/lang/String;

    :goto_1
    return-void
.end method

.method private getBookCover(Z)V
    .locals 3

    .line 392
    const-string v0, "/"

    if-eqz p1, :cond_0

    .line 393
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_1.png"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 397
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_2.png"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 398
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    if-nez p1, :cond_1

    .line 400
    new-instance p1, Lcom/flyersoft/books/Mobi$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/Mobi$2;-><init>(Lcom/flyersoft/books/Mobi;)V

    const/4 v0, 0x1

    .line 408
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 409
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void

    :cond_1
    const/4 p1, 0x0

    .line 411
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Mobi;->getBookCover2(Z)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 416
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    :cond_2
    :goto_0
    return-void
.end method

.method private getBookCover2(Z)V
    .locals 2

    .line 421
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getCoverImageIndex()I

    move-result v0

    if-gez v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getThumbImageIndex()I

    move-result v0

    .line 423
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v1, v0}, Lcom/dozof/app/mobi/MobiDecoder;->getImageBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 424
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V

    return-void
.end method

.method private getChapterLength(I)J
    .locals 4

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 291
    iget-object p1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v1, p1

    if-le v1, v0, :cond_0

    .line 292
    aget-object p1, p1, v0

    iget p1, p1, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    int-to-long v0, p1

    return-wide v0

    .line 294
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getTotalSize()J

    move-result-wide v0

    return-wide v0

    .line 296
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v2, v1

    sub-int/2addr v2, v0

    if-ge p1, v2, :cond_2

    add-int/lit8 v0, p1, 0x1

    .line 297
    aget-object v0, v1, v0

    iget v0, v0, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    aget-object p1, v1, p1

    iget p1, p1, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    sub-int/2addr v0, p1

    int-to-long v0, v0

    return-wide v0

    .line 298
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getTotalSize()J

    move-result-wide v0

    iget-object v2, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    aget-object p1, v2, p1

    iget p1, p1, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    int-to-long v2, p1

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method private getChapterTextUnsafe(I)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 228
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getChapters()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    .line 229
    iget-object p1, p0, Lcom/flyersoft/books/Mobi;->content:[B

    array-length p1, p1

    goto :goto_1

    .line 231
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    aget-object p1, p1, v0

    iget p1, p1, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    goto :goto_1

    .line 233
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    .line 235
    iget-object v2, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v3, v2

    sub-int/2addr v3, v0

    if-ge p1, v3, :cond_2

    add-int/2addr p1, v0

    .line 236
    aget-object p1, v2, p1

    iget p1, p1, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    goto :goto_0

    .line 238
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/books/Mobi;->content:[B

    array-length p1, p1

    :goto_0
    sub-int/2addr p1, v1

    :goto_1
    const/4 v0, -0x1

    if-ne p1, v0, :cond_3

    .line 241
    iget-object p1, p0, Lcom/flyersoft/books/Mobi;->content:[B

    array-length p1, p1

    .line 242
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    iget-object v2, p0, Lcom/flyersoft/books/Mobi;->content:[B

    invoke-virtual {v0, v2, v1, p1}, Lcom/dozof/app/mobi/MobiDecoder;->decode([BII)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Mobi;->replaceTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 244
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 245
    const-string p1, ""

    return-object p1
.end method

.method private getDescriptionAndCategories()V
    .locals 5

    .line 59
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getSubjects()[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 60
    iget-object v4, p0, Lcom/flyersoft/books/Mobi;->categories:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 62
    const-string v1, "SUMMARY:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x8

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 64
    :cond_1
    const-string v1, "EDITORIAL REVIEW:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x11

    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 69
    :cond_2
    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->description:Ljava/lang/String;

    return-void
.end method

.method private loadContent()V
    .locals 5

    .line 74
    :try_start_0
    new-instance v0, Lcom/dozof/app/mobi/MobiTextStream;

    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-direct {v0, v1}, Lcom/dozof/app/mobi/MobiTextStream;-><init>(Lcom/dozof/app/mobi/MobiDecoder;)V

    .line 75
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/dozof/app/mobi/MobiDecoder;->setReadTextSection(I)Z

    .line 76
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x400

    .line 77
    new-array v2, v2, [B

    .line 80
    :goto_0
    invoke-virtual {v0, v2}, Lcom/dozof/app/mobi/MobiTextStream;->read([B)I

    move-result v3

    if-gtz v3, :cond_0

    .line 84
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->content:[B

    return-void

    :cond_0
    const/4 v4, 0x0

    .line 82
    invoke-virtual {v1, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 86
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private replaceTags(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 211
    :try_start_0
    const-string v0, "^[^<>]*\\s*>"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 214
    const-string v0, "<img .*?recindex=\"(.*?)\".*?>"

    const-string v1, "<img src=\"image-$1\" width=\"100\" height=\"100\"></img>"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 219
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p1
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 7

    .line 122
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    const-string v1, ""

    if-nez v0, :cond_1

    .line 124
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getAuthors()[Ljava/lang/String;

    move-result-object v0

    .line 125
    iput-object v1, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 127
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 128
    iget-object v5, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 129
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    .line 130
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 133
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    .line 134
    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    .line 137
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 138
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->author:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 140
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    const-string v2, " - "

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 142
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    const/4 v4, 0x3

    if-le v3, v4, :cond_3

    add-int/2addr v2, v4

    .line 143
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    return-object v1
.end method

.method public getBookName()Ljava/lang/String;
    .locals 3

    .line 97
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 99
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getTitle()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;

    .line 100
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 102
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 103
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->getType(C)I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 111
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 112
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;

    .line 117
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->bookName:Ljava/lang/String;

    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 4

    .line 335
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "---mobi URI: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 337
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".mobi/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    add-int/lit8 v0, v0, 0x6

    .line 339
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 340
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 341
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1

    .line 343
    :cond_1
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 344
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v1, p1}, Lcom/dozof/app/mobi/MobiDecoder;->getImageBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 346
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/books/Mobi;->mobi_filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 347
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 348
    invoke-static {v1, p1}, Lcom/flyersoft/tools/T;->bitmapToFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    :cond_2
    return-object p1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 4

    const-string v0, "<h2>"

    .line 251
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 252
    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 254
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Mobi;->getChapterTextUnsafe(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 255
    iget-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    .line 256
    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x32

    if-ge v2, v3, :cond_0

    .line 257
    iget-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    :cond_0
    const-string v2, "*"

    if-nez p1, :cond_1

    :try_start_1
    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 259
    const-string p1, ""

    iput-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    goto :goto_0

    :cond_1
    if-nez p1, :cond_3

    .line 262
    iget-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 263
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    .line 264
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 265
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</h2>"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 269
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 272
    :cond_3
    :goto_0
    iget-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 273
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "<center><h2>"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</h2></center>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 275
    :cond_4
    iget-object p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_a

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->chapters:Ljava/util/ArrayList;

    .line 166
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->content:[B

    if-nez v0, :cond_0

    goto/16 :goto_6

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 169
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v3, v2

    const/4 v4, 0x1

    if-ge v1, v3, :cond_2

    .line 170
    aget-object v2, v2, v1

    iget v2, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    if-lez v2, :cond_1

    .line 171
    iput-boolean v4, p0, Lcom/flyersoft/books/Mobi;->treeTOC:Z

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 174
    :cond_2
    :goto_1
    iget-boolean v1, p0, Lcom/flyersoft/books/Mobi;->treeTOC:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    .line 175
    :goto_2
    iget-object v2, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v3, v2

    if-ge v1, v3, :cond_3

    .line 176
    aget-object v2, v2, v1

    iget v3, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    add-int/2addr v3, v4

    iput v3, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 178
    :cond_3
    :goto_3
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v2, v1

    if-ge v0, v2, :cond_a

    .line 179
    aget-object v2, v1, v0

    if-nez v2, :cond_5

    :cond_4
    :goto_4
    move-object v6, p0

    goto :goto_5

    :cond_5
    if-lez v0, :cond_6

    .line 182
    array-length v1, v1

    sub-int/2addr v1, v4

    if-ne v0, v1, :cond_6

    iget-object v1, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->title:Ljava/lang/String;

    const-string v3, "Table of Contents"

    .line 183
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_4

    .line 185
    :cond_6
    iget v1, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_7

    .line 186
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v1, v1

    if-gt v1, v4, :cond_4

    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->content:[B

    array-length v1, v1

    if-nez v1, :cond_7

    goto :goto_4

    .line 193
    :cond_7
    iget-object v1, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 194
    new-instance v5, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v9, 0x0

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Mobi;->getChapterLength(I)J

    move-result-wide v10

    const/4 v8, 0x0

    move-object v6, p0

    invoke-direct/range {v5 .. v11}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 195
    iget v1, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    iput v1, v5, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    .line 196
    iget-object v1, v6, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    array-length v1, v1

    sub-int/2addr v1, v4

    if-ge v0, v1, :cond_8

    iget v1, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    iget-object v2, v6, Lcom/flyersoft/books/Mobi;->refs:[Lcom/dozof/app/mobi/MobiDecoder$Ref;

    add-int/lit8 v3, v0, 0x1

    aget-object v2, v2, v3

    iget v2, v2, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    if-ge v1, v2, :cond_8

    .line 197
    iput-boolean v4, v5, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    .line 198
    :cond_8
    iget-object v1, v6, Lcom/flyersoft/books/Mobi;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_9
    :goto_6
    move-object v6, p0

    .line 167
    iget-object v0, v6, Lcom/flyersoft/books/Mobi;->chapters:Ljava/util/ArrayList;

    return-object v0

    :cond_a
    move-object v6, p0

    .line 201
    iget-object v0, v6, Lcom/flyersoft/books/Mobi;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 3

    .line 429
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getCoverImageIndex()I

    move-result v0

    if-gez v0, :cond_0

    .line 430
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getThumbImageIndex()I

    move-result v0

    .line 431
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v1, v0}, Lcom/dozof/app/mobi/MobiDecoder;->getImageBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 434
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "image-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 2

    const/4 p2, 0x0

    .line 363
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->images:[I

    if-nez v1, :cond_0

    goto :goto_0

    .line 365
    :cond_0
    invoke-virtual {v0, p1}, Lcom/dozof/app/mobi/MobiDecoder;->getImageBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-nez p1, :cond_1

    return-object p2

    .line 368
    :cond_1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/flyersoft/books/Mobi;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 369
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_2
    :goto_0
    return-object p2

    :catch_0
    move-exception p1

    .line 374
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p2
.end method

.method public getFontFile(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getImageFileList()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 382
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 383
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->imageFiles:Ljava/util/ArrayList;

    .line 384
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->images:[I

    if-eqz v0, :cond_0

    .line 385
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, v0, v2

    .line 386
    iget-object v4, p0, Lcom/flyersoft/books/Mobi;->imageFiles:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v5, v3}, Lcom/dozof/app/mobi/MobiDecoder;->getImageUrl(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 308
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 309
    new-instance v0, Lcom/flyersoft/books/Mobi$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Mobi$1;-><init>(Lcom/flyersoft/books/Mobi;)V

    iput-object v0, p0, Lcom/flyersoft/books/Mobi;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 320
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 280
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    int-to-long v1, v1

    .line 284
    invoke-virtual {p0}, Lcom/flyersoft/books/Mobi;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-wide v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v1, v3

    long-to-int v1, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_1
    return v0
.end method

.method public getSingleFileText(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getTotalSize()J
    .locals 5

    .line 151
    iget-wide v0, p0, Lcom/flyersoft/books/Mobi;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 155
    iget-object v0, p0, Lcom/flyersoft/books/Mobi;->mobi:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->getTotalTextSize()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/Mobi;->totalSize:J

    .line 156
    iget-wide v0, p0, Lcom/flyersoft/books/Mobi;->totalSize:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const-wide/16 v0, 0x1

    .line 157
    iput-wide v0, p0, Lcom/flyersoft/books/Mobi;->totalSize:J

    .line 159
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Mobi;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 92
    iget-boolean v0, p0, Lcom/flyersoft/books/Mobi;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
