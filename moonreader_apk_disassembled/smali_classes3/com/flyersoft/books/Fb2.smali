.class public Lcom/flyersoft/books/Fb2;
.super Lcom/flyersoft/books/BaseEBook;
.source "Fb2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/Fb2$FB2Image;
    }
.end annotation


# static fields
.field private static css:Lcom/flyersoft/components/CSS;

.field private static css_text:Ljava/lang/String;

.field static filesize:J


# instance fields
.field private annotHead:Ljava/lang/String;

.field private annotText:Ljava/lang/String;

.field private bufferReadPaused:Z

.field private bufferReader:Ljava/io/BufferedReader;

.field private contentLoadLen:I

.field coverName:Ljava/lang/String;

.field private curStreamPos:I

.field private encoding:Ljava/lang/String;

.field private epigraph:Ljava/lang/String;

.field private fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

.field fb2_filename:Ljava/lang/String;

.field private firstSecPos:I

.field footNotes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$FootNote;",
            ">;"
        }
    .end annotation
.end field

.field imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field images:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/books/Fb2$FB2Image;",
            ">;"
        }
    .end annotation
.end field

.field private lastBodyString:Ljava/lang/String;

.field private notLoadImageCount:I


# direct methods
.method static bridge synthetic -$$Nest$fgetcontentLoadLen(Lcom/flyersoft/books/Fb2;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/books/Fb2;->contentLoadLen:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetcurStreamPos(Lcom/flyersoft/books/Fb2;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetnotLoadImageCount(Lcom/flyersoft/books/Fb2;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/books/Fb2;->notLoadImageCount:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputcontentLoadLen(Lcom/flyersoft/books/Fb2;I)V
    .locals 0

    iput p1, p0, Lcom/flyersoft/books/Fb2;->contentLoadLen:I

    return-void
.end method

.method static bridge synthetic -$$Nest$fputnotLoadImageCount(Lcom/flyersoft/books/Fb2;I)V
    .locals 0

    iput p1, p0, Lcom/flyersoft/books/Fb2;->notLoadImageCount:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckDownloadBookCover2(Lcom/flyersoft/books/Fb2;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/books/Fb2;->checkDownloadBookCover2(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetInputStream(Lcom/flyersoft/books/Fb2;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetStringFromInputStream(Lcom/flyersoft/books/Fb2;Ljava/io/InputStream;II)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/books/Fb2;->getStringFromInputStream(Ljava/io/InputStream;II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 35
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 1068
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    const/4 v0, -0x1

    .line 1174
    iput v0, p0, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    .line 36
    iput-object p1, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lcom/flyersoft/books/Fb2;->inited:Z

    const-wide/16 v0, -0x1

    .line 38
    iput-wide v0, p0, Lcom/flyersoft/books/Fb2;->totalSize:J

    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Lcom/flyersoft/books/Fb2;->isHtml:Z

    .line 41
    iput-boolean v0, p0, Lcom/flyersoft/books/Fb2;->showChaptersAtBegin:Z

    .line 43
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    sput-wide v1, Lcom/flyersoft/books/Fb2;->filesize:J

    .line 50
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getChapters()Ljava/util/ArrayList;

    .line 51
    iget-object p1, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_1

    goto :goto_0

    .line 59
    :cond_1
    iput-boolean v0, p0, Lcom/flyersoft/books/Fb2;->inited:Z

    :cond_2
    :goto_0
    return-void

    :catchall_0
    move-exception p1

    .line 54
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->errMsg:Ljava/lang/String;

    .line 55
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 62
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 1068
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    const/4 v0, -0x1

    .line 1174
    iput v0, p0, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Lcom/flyersoft/books/Fb2;->inited:Z

    .line 64
    iput-object p1, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    .line 65
    invoke-direct {p0, p2}, Lcom/flyersoft/books/Fb2;->getChaptersFromText(Z)Ljava/util/ArrayList;

    return-void
.end method

.method private addFootNotesAsChapter()V
    .locals 8

    .line 1048
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    move-object v2, p0

    goto/16 :goto_2

    .line 1052
    :cond_0
    :try_start_0
    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->footnotes:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v5, 0x0

    const-wide/16 v6, 0x1

    move-object v2, p0

    :try_start_1
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1054
    iget-object v0, v2, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$FootNote;

    .line 1055
    iget-object v5, v4, Lcom/flyersoft/books/BaseEBook$FootNote;->title:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$FootNote;->html:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v5, v4

    add-int/lit8 v5, v5, 0x14

    add-int/2addr v3, v5

    goto :goto_0

    .line 1056
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1057
    iget-object v3, v2, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$FootNote;

    .line 1058
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<h5>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lcom/flyersoft/books/BaseEBook$FootNote;->title:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</h5>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$FootNote;->html:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1059
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1060
    iget-object v0, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    int-to-long v3, v0

    iput-wide v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    .line 1061
    iget-object v0, v2, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_0
    move-object v2, p0

    :catch_1
    const/4 v0, 0x1

    .line 1063
    sput-boolean v0, Lcom/flyersoft/tools/T;->isOutOfMemoryError:Z

    :goto_2
    return-void
.end method

.method private checkCoverAndInitImages(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8

    .line 318
    const-string v0, "/"

    if-eqz p3, :cond_0

    .line 319
    sget v1, Lcom/flyersoft/tools/A;->rebuild_cover_size:I

    if-nez v1, :cond_0

    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

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

    goto/16 :goto_5

    .line 323
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_2.png"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 327
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, v3, p2, p3, p1}, Lcom/flyersoft/books/Fb2;->scanImageStr(Ljava/lang/StringBuilder;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 328
    :try_start_1
    iget-boolean v4, p0, Lcom/flyersoft/books/Fb2;->bufferReadPaused:Z

    if-eqz v4, :cond_6

    if-eqz p3, :cond_1

    if-nez v3, :cond_6

    :cond_1
    const/16 v4, 0x2000

    .line 329
    new-array v4, v4, [C

    .line 331
    :cond_2
    iget-object v5, p0, Lcom/flyersoft/books/Fb2;->bufferReader:Ljava/io/BufferedReader;

    invoke-virtual {v5, v4}, Ljava/io/BufferedReader;->read([C)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_6

    .line 333
    invoke-static {v4, p1, v5}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v5

    if-nez v1, :cond_4

    .line 336
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/books/Fb2;->lastBodyString:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    iget v5, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    if-lez v5, :cond_3

    .line 339
    iget-object v6, p0, Lcom/flyersoft/books/Fb2;->lastBodyString:Ljava/lang/String;

    invoke-direct {p0, v6}, Lcom/flyersoft/books/Fb2;->getStrBytesLen(Ljava/lang/String;)I

    move-result v6

    sub-int/2addr v5, v6

    iput v5, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    .line 340
    :cond_3
    invoke-direct {p0, v1, p2, p3, v2}, Lcom/flyersoft/books/Fb2;->scanImageStr(Ljava/lang/StringBuilder;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 342
    :cond_4
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    invoke-direct {p0, v1, p2, p3, v2}, Lcom/flyersoft/books/Fb2;->scanImageStr(Ljava/lang/StringBuilder;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    if-eqz v5, :cond_2

    if-nez v3, :cond_5

    move-object v3, v5

    :cond_5
    if-eqz p3, :cond_2

    goto :goto_4

    :catch_0
    move-exception p1

    move-object v1, v3

    goto :goto_1

    :catch_1
    move-exception p1

    move-object v1, v3

    goto :goto_2

    :catch_2
    move-exception p1

    .line 358
    :goto_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_3
    move-exception p1

    .line 356
    :goto_2
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_3
    move-object v3, v1

    :cond_6
    :goto_4
    if-eqz p2, :cond_9

    if-eqz v3, :cond_9

    .line 362
    :try_start_2
    sget p1, Lcom/flyersoft/tools/A;->rebuild_cover_size:I

    if-gtz p1, :cond_7

    .line 363
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_9

    :cond_7
    if-nez p3, :cond_8

    .line 366
    new-instance p1, Lcom/flyersoft/books/Fb2$3;

    invoke-direct {p1, p0, p2, v3}, Lcom/flyersoft/books/Fb2$3;-><init>(Lcom/flyersoft/books/Fb2;Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    invoke-virtual {p1, v2}, Ljava/lang/Thread;->setPriority(I)V

    .line 375
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_5

    .line 377
    :cond_8
    invoke-direct {p0, p2, v3, v2}, Lcom/flyersoft/books/Fb2;->checkDownloadBookCover2(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_5

    :catch_4
    move-exception p1

    .line 382
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :catch_5
    :cond_9
    :goto_5
    return-void
.end method

.method private checkDownloadBookCover2(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 387
    sget-object p1, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 393
    :cond_0
    :try_start_0
    invoke-static {p2}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    const/4 p2, 0x0

    .line 394
    invoke-static {p1, p2, p2}, Lcom/flyersoft/tools/A;->getBytesBitmap([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 395
    iget-object p2, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    xor-int/lit8 p3, p3, 0x1

    invoke-static {p1, p2, p3}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 397
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private createTextFromFootNote(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4

    .line 686
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Fb2;->getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;

    move-result-object v0

    .line 687
    const-string v1, "</a></sup>"

    const-string v2, "\">"

    if-eqz v0, :cond_1

    .line 688
    const-string v0, "\"note\""

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    .line 690
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "<sup><a href=\"?"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_0

    const-string v2, "\" type=\"note\">"

    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 693
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "<sup><a href=\"??"

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static enoughMemory()Z
    .locals 2

    .line 583
    sget-wide v0, Lcom/flyersoft/books/Fb2;->filesize:J

    invoke-static {v0, v1}, Lcom/flyersoft/books/Fb2;->enoughMemory(J)Z

    move-result v0

    return v0
.end method

.method public static enoughMemory(J)Z
    .locals 7

    .line 586
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    const-wide/32 v2, 0xc3500

    cmp-long v4, p0, v2

    if-ltz v4, :cond_4

    const-wide/32 v2, 0x186a00

    const-wide/32 v4, 0x1312d00

    cmp-long v6, p0, v2

    if-gez v6, :cond_0

    cmp-long v2, v0, v4

    if-gtz v2, :cond_4

    :cond_0
    const-wide/32 v2, 0x989680

    cmp-long v6, p0, v2

    if-gez v6, :cond_1

    const-wide/32 v2, 0x2625a00

    cmp-long v6, v0, v2

    if-gtz v6, :cond_4

    :cond_1
    cmp-long v2, p0, v4

    if-gez v2, :cond_2

    const-wide/32 v2, 0x3938700

    cmp-long v4, v0, v2

    if-gtz v4, :cond_4

    :cond_2
    const-wide/32 v2, 0x1c9c380

    cmp-long v4, p0, v2

    if-gez v4, :cond_3

    const-wide/32 p0, 0x5f5e100

    cmp-long v2, v0, p0

    if-lez v2, :cond_3

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    return p0

    :cond_4
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private getBookAuthor(Ljava/lang/String;II)Ljava/lang/String;
    .locals 7

    .line 1303
    const-string v0, ">"

    const-string v1, ""

    const/4 v2, -0x1

    if-eq p2, v2, :cond_3

    if-ne p3, v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p2, p2, 0x8

    .line 1309
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 1314
    :goto_0
    const-string p3, "<"

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    .line 1315
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p3

    if-eq p2, v2, :cond_2

    if-eq p3, v2, :cond_2

    add-int/lit8 p2, p2, 0x1

    .line 1319
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 1320
    const-string v3, "</"

    invoke-virtual {p1, v3, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 1321
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-eq v3, v2, :cond_2

    if-eq v4, v2, :cond_2

    add-int/lit8 v5, v3, 0x2

    .line 1323
    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 1324
    const-string v6, "name"

    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-eq v6, v2, :cond_1

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1325
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p3, p3, 0x1

    invoke-virtual {p1, p3, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move p2, v4

    goto :goto_0

    :cond_1
    add-int/lit8 p2, p3, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1334
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1337
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_1
    return-object v1
.end method

.method private getBookName(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1

    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    if-ne p3, v0, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, 0xc

    .line 1345
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1343
    :cond_1
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method private getCategory(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1

    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    if-ne p3, v0, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, 0x7

    .line 1365
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1363
    :cond_1
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method private getChapterData(Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1282
    const-string v0, "<title>"

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1283
    const-string v1, "</title>"

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    if-eq v1, v2, :cond_0

    add-int/lit8 v0, v0, 0x7

    .line 1285
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1286
    const-string v2, "\n"

    const-string v3, " "

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "<.*?>|\r|\t"

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1287
    const-string v4, "  "

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x8

    .line 1288
    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1289
    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    goto :goto_0

    .line 1292
    :cond_0
    const-string v0, "..."

    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 1293
    iput-object p2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    const/4 v0, 0x0

    .line 1294
    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    .line 1296
    :goto_0
    iget v0, p0, Lcom/flyersoft/books/Fb2;->contentLoadLen:I

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v0, p2

    iput v0, p0, Lcom/flyersoft/books/Fb2;->contentLoadLen:I

    .line 1297
    iput-object p3, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    .line 1298
    iget-object p2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    int-to-long p2, p2

    iput-wide p2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    return-void
.end method

.method private getChapterIdTag(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1267
    const-string v0, ">"

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-lez v0, :cond_0

    .line 1269
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1270
    const-string p2, "id=\""

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_0

    add-int/lit8 p2, p2, 0x4

    .line 1272
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1273
    const-string p2, "\""

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_0

    const/4 v0, 0x0

    .line 1275
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1278
    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method private getChaptersFromBody(Ljava/lang/String;III)V
    .locals 23

    move-object/from16 v1, p0

    move-object/from16 v7, p1

    move/from16 v8, p3

    move/from16 v10, p2

    move/from16 v0, p4

    const/4 v2, 0x0

    .line 1179
    :goto_0
    const-string v11, "<section"

    invoke-virtual {v7, v11, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 1180
    const-string v12, ""

    const-string v13, ">"

    const/4 v14, -0x1

    if-eq v3, v14, :cond_12

    if-le v3, v8, :cond_0

    goto/16 :goto_9

    .line 1182
    :cond_0
    const-string v4, "</section>"

    invoke-virtual {v7, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    if-eq v5, v14, :cond_12

    if-le v5, v8, :cond_1

    goto/16 :goto_9

    .line 1187
    :cond_1
    iget v2, v1, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    if-ne v2, v14, :cond_2

    .line 1188
    iput v3, v1, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    :cond_2
    :goto_1
    add-int/lit8 v2, v3, 0x8

    .line 1193
    invoke-virtual {v7, v11, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 1194
    const-string v6, "<title>"

    if-eq v2, v14, :cond_7

    if-le v2, v5, :cond_3

    goto/16 :goto_3

    :cond_3
    move/from16 v16, v0

    .line 1205
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    move-object/from16 v17, v4

    const/4 v4, 0x0

    move/from16 v18, v5

    move-object/from16 v19, v6

    const-wide/16 v5, 0x1

    move/from16 v20, v2

    const-string v2, ""

    move/from16 v21, v3

    const/4 v3, 0x0

    move-object/from16 v22, v17

    move/from16 v14, v18

    move/from16 v15, v20

    move/from16 v9, v21

    move/from16 v18, v10

    move-object/from16 v17, v12

    move/from16 v12, v16

    move-object/from16 v10, v19

    const/16 v16, 0x1

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1206
    invoke-virtual {v7, v13, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v7, v2, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1207
    invoke-direct {v1, v7, v9}, Lcom/flyersoft/books/Fb2;->getChapterIdTag(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/flyersoft/books/Fb2;->getChapterData(Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 1208
    iput-boolean v3, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    .line 1209
    invoke-virtual {v2, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 1210
    iget-object v4, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_4

    if-nez v2, :cond_4

    .line 1211
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    iget-object v5, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v3

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v4, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    goto :goto_2

    :cond_4
    if-nez v2, :cond_5

    .line 1212
    iget-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xa

    if-gt v2, v3, :cond_5

    iget-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_6

    .line 1213
    :cond_5
    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1214
    iput v12, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    :cond_6
    :goto_2
    add-int/lit8 v0, v12, 0x1

    move v5, v14

    move v3, v15

    move-object/from16 v12, v17

    move/from16 v10, v18

    move-object/from16 v4, v22

    const/4 v14, -0x1

    goto/16 :goto_1

    :cond_7
    :goto_3
    move v15, v2

    move v9, v3

    move-object/from16 v22, v4

    move v14, v5

    move/from16 v18, v10

    move-object/from16 v17, v12

    move v12, v0

    move-object v10, v6

    add-int/lit8 v5, v14, 0xa

    .line 1196
    const-string v0, "</section"

    invoke-virtual {v7, v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x0

    if-le v0, v5, :cond_b

    const/4 v3, -0x1

    if-eq v15, v3, :cond_8

    if-ge v0, v15, :cond_b

    .line 1198
    :cond_8
    invoke-virtual {v7, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1199
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_b

    .line 1200
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0xa

    if-gt v3, v4, :cond_9

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_b

    .line 1201
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_a

    const-string v3, "<hr2>"

    goto :goto_4

    :cond_a
    move-object/from16 v3, v17

    :goto_4
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :cond_b
    move-object v15, v2

    .line 1220
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v4, 0x0

    const-wide/16 v5, 0x1

    const-string v2, ""

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1221
    invoke-virtual {v7, v13, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/16 v16, 0x1

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v7, v2, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    if-eqz v15, :cond_c

    .line 1223
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1224
    :cond_c
    invoke-direct {v1, v7, v9}, Lcom/flyersoft/books/Fb2;->getChapterIdTag(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/flyersoft/books/Fb2;->getChapterData(Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/lang/String;Ljava/lang/String;)V

    .line 1225
    iget-object v3, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_d

    invoke-virtual {v2, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 1226
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    iget-object v4, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v16, 0x1

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v4, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    goto :goto_5

    .line 1228
    :cond_d
    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1229
    iput v12, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    .line 1232
    :goto_5
    invoke-virtual {v7, v11, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_11

    if-le v0, v8, :cond_e

    goto :goto_8

    :cond_e
    move v5, v14

    :goto_6
    add-int/lit8 v5, v5, 0x8

    move-object/from16 v2, v22

    .line 1237
    invoke-virtual {v7, v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    if-eq v5, v3, :cond_10

    if-le v5, v0, :cond_f

    goto :goto_7

    :cond_f
    add-int/lit8 v12, v12, -0x1

    move-object/from16 v22, v2

    const/4 v3, -0x1

    goto :goto_6

    :cond_10
    :goto_7
    move v10, v0

    move v0, v12

    const/4 v2, 0x1

    goto/16 :goto_0

    :cond_11
    :goto_8
    const/4 v2, 0x1

    goto :goto_a

    :cond_12
    :goto_9
    move/from16 v18, v10

    move-object/from16 v17, v12

    :goto_a
    if-nez v2, :cond_13

    move/from16 v0, v18

    if-le v8, v0, :cond_13

    const/4 v3, -0x1

    if-eq v0, v3, :cond_13

    .line 1248
    invoke-virtual {v7, v13, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/16 v16, 0x1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v7, v0, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 1249
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v4, 0x0

    const-wide/16 v5, 0x1

    const-string v2, ""

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object/from16 v2, v17

    .line 1250
    invoke-direct {v1, v0, v7, v2}, Lcom/flyersoft/books/Fb2;->getChapterData(Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/lang/String;Ljava/lang/String;)V

    .line 1251
    iget-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_13

    .line 1252
    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_13
    const/4 v0, 0x0

    .line 1255
    :goto_b
    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_16

    .line 1256
    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v3, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    .line 1257
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/16 v16, 0x1

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_14

    iget-object v3, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    iget-object v4, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    if-le v3, v4, :cond_14

    const/4 v3, 0x1

    goto :goto_c

    :cond_14
    const/4 v3, 0x0

    :goto_c
    iput-boolean v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    .line 1258
    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-boolean v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_15

    .line 1259
    iput-boolean v3, v1, Lcom/flyersoft/books/Fb2;->treeTOC:Z

    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 1262
    :cond_16
    iget-object v0, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_17

    iget-object v0, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    const-string v3, "..."

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 1263
    iget-object v0, v1, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v1, Lcom/flyersoft/books/Fb2;->bookName:Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    :cond_17
    return-void
.end method

.method private getChaptersFromText(Z)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 837
    const-string v0, "<?xml"

    const-string v1, "PK"

    const-string v2, "</body>"

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    const/4 v3, 0x0

    .line 838
    iput-object v3, p0, Lcom/flyersoft/books/Fb2;->lastBodyString:Ljava/lang/String;

    const/4 v4, 0x0

    .line 840
    :try_start_0
    iget-object v5, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/flyersoft/books/Fb2;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 841
    iget-object v6, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/flyersoft/books/Fb2;->getFb2Body(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 843
    invoke-virtual {v6, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    const/16 v8, 0xa

    if-nez v7, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v8, :cond_0

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v7, :cond_0

    .line 845
    :try_start_1
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v5

    .line 847
    :try_start_2
    invoke-static {v5}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 849
    :goto_0
    const-string v5, "UTF-8"

    iput-object v5, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    .line 850
    iget-object v5, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/flyersoft/books/Fb2;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 851
    iget-object v6, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/flyersoft/books/Fb2;->getFb2Body(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 852
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 853
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v7, "file_encoding"

    invoke-virtual {v0, v7, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v7, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    iget-object v9, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    invoke-interface {v0, v7, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 856
    :cond_0
    invoke-virtual {v6, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".fb2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 857
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-direct {p0, v0, v4}, Lcom/flyersoft/books/Fb2;->getFb2ZipStream(Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object v5

    .line 858
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    invoke-direct {p0, v5, v0}, Lcom/flyersoft/books/Fb2;->getFb2Body(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 861
    :cond_1
    const-string v0, "<author>"

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 862
    const-string v1, "</author>"

    invoke-virtual {v6, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 863
    invoke-direct {p0, v6, v0, v1}, Lcom/flyersoft/books/Fb2;->getBookAuthor(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->author:Ljava/lang/String;

    .line 865
    const-string v0, "<book-title>"

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 866
    const-string v1, "</book-title>"

    invoke-virtual {v6, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 867
    invoke-direct {p0, v6, v0, v1}, Lcom/flyersoft/books/Fb2;->getBookName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->bookName:Ljava/lang/String;

    .line 869
    const-string v0, "<annotation>"

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 870
    const-string v1, "</annotation>"

    invoke-virtual {v6, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 871
    invoke-direct {p0, v6, v0, v1}, Lcom/flyersoft/books/Fb2;->getDescription(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->description:Ljava/lang/String;

    .line 873
    const-string v0, "<genre>"

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 874
    const-string v1, "</genre>"

    invoke-virtual {v6, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 875
    invoke-direct {p0, v6, v0, v1}, Lcom/flyersoft/books/Fb2;->getCategory(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    .line 876
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 877
    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->categories:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 879
    :cond_2
    const-string v0, "<sequence "

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 880
    const-string v1, "/>"

    invoke-virtual {v6, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 881
    invoke-direct {p0, v6, v0, v1}, Lcom/flyersoft/books/Fb2;->getSeries(Ljava/lang/String;II)V

    const/4 v0, -0x1

    if-nez p1, :cond_6

    .line 884
    const-string v1, "<body"

    invoke-virtual {v6, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 885
    invoke-virtual {v6, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 886
    const-string v9, "<body name=\"notes\""

    invoke-virtual {v6, v9, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v9

    if-ne v9, v0, :cond_3

    .line 888
    const-string v9, "<body name="

    invoke-virtual {v6, v9, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v9

    :cond_3
    if-eq v9, v0, :cond_4

    move v7, v9

    goto :goto_1

    .line 889
    :cond_4
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    :goto_1
    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v7

    .line 890
    invoke-direct {p0, v6, v1, v7, v4}, Lcom/flyersoft/books/Fb2;->getChaptersFromBody(Ljava/lang/String;III)V

    .line 892
    iget v10, p0, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    if-lez v10, :cond_5

    sub-int/2addr v10, v1

    if-le v10, v8, :cond_5

    .line 893
    const-string v8, ">"

    invoke-virtual {v6, v8, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_5

    .line 894
    iget v8, p0, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    sub-int/2addr v8, v1

    const/4 v10, 0x5

    if-le v8, v10, :cond_5

    .line 895
    invoke-direct {p0, v6, v1}, Lcom/flyersoft/books/Fb2;->getEpigraph(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/books/Fb2;->epigraph:Ljava/lang/String;

    :cond_5
    add-int/lit8 v7, v7, 0x7

    .line 899
    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 900
    invoke-direct {p0, v6, v9, v1}, Lcom/flyersoft/books/Fb2;->getNotesFromBody2(Ljava/lang/String;II)V

    .line 901
    invoke-direct {p0}, Lcom/flyersoft/books/Fb2;->addFootNotesAsChapter()V

    .line 903
    iget-boolean v1, p0, Lcom/flyersoft/books/Fb2;->treeTOC:Z

    if-eqz v1, :cond_6

    const/4 v1, 0x0

    .line 904
    :goto_2
    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 905
    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v7, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 907
    :cond_6
    const-string v1, "1:"

    invoke-static {v1}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 908
    invoke-static {}, Lcom/flyersoft/books/Fb2;->enoughMemory()Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    goto :goto_3

    :cond_7
    invoke-direct {p0, v6}, Lcom/flyersoft/books/Fb2;->getStrBytesLen(Ljava/lang/String;)I

    move-result v1

    :goto_3
    iput v1, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    .line 909
    const-string v1, "2:"

    invoke-static {v1}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 911
    iput-object v3, p0, Lcom/flyersoft/books/Fb2;->coverName:Ljava/lang/String;

    .line 912
    const-string v1, "<coverpage>"

    invoke-virtual {v6, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-eq v1, v0, :cond_8

    .line 914
    const-string v2, "\"#"

    invoke-virtual {v6, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-eq v1, v0, :cond_8

    .line 916
    const-string v2, "\""

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v0, :cond_8

    add-int/lit8 v1, v1, 0x2

    .line 918
    invoke-virtual {v6, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->coverName:Ljava/lang/String;

    .line 922
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->coverName:Ljava/lang/String;

    invoke-direct {p0, v6, v0, p1}, Lcom/flyersoft/books/Fb2;->checkCoverAndInitImages(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 925
    iget-object p1, p0, Lcom/flyersoft/books/Fb2;->bufferReader:Ljava/io/BufferedReader;

    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V

    .line 926
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception p1

    .line 933
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->errMsg:Ljava/lang/String;

    .line 934
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 935
    iput-boolean v4, p0, Lcom/flyersoft/books/Fb2;->inited:Z

    goto :goto_4

    :catch_0
    move-exception p1

    .line 929
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->errMsg:Ljava/lang/String;

    .line 930
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 931
    iput-boolean v4, p0, Lcom/flyersoft/books/Fb2;->inited:Z

    .line 937
    :goto_4
    iput-object v3, p0, Lcom/flyersoft/books/Fb2;->lastBodyString:Ljava/lang/String;

    .line 938
    iget-object p1, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    return-object p1
.end method

.method private getDescription(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1

    const/4 v0, -0x1

    if-eq p2, v0, :cond_2

    if-ne p3, v0, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, 0xc

    .line 1353
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Fb2;->annotText:Ljava/lang/String;

    .line 1354
    invoke-static {p1}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1355
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_1

    const/4 p2, 0x0

    .line 1356
    iput-object p2, p0, Lcom/flyersoft/books/Fb2;->annotText:Ljava/lang/String;

    :cond_1
    return-object p1

    .line 1351
    :cond_2
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method private getEpigraph(Ljava/lang/String;I)Ljava/lang/String;
    .locals 5

    add-int/lit8 p2, p2, 0x1

    .line 942
    iget v0, p0, Lcom/flyersoft/books/Fb2;->firstSecPos:I

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 943
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 945
    :cond_0
    const-string p2, "<title>"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 946
    const-string v1, "</title>"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    if-eq v2, v3, :cond_1

    .line 948
    const-string v0, "<h2>"

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "</h2>"

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 949
    const-string p2, "</p>"

    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v3, :cond_1

    .line 951
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v3, "<p>"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "<br>"

    invoke-virtual {v2, p2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method private getFb2Body(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1019
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1021
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v1, p0, Lcom/flyersoft/books/Fb2;->bufferReader:Ljava/io/BufferedReader;

    const/16 p1, 0x2000

    .line 1022
    new-array p1, p1, [C

    .line 1024
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/books/Fb2;->bufferReader:Ljava/io/BufferedReader;

    invoke-virtual {p2, p1}, Ljava/io/BufferedReader;->read([C)I

    move-result p2

    const/4 v1, -0x1

    if-eq p2, v1, :cond_5

    const/4 v2, 0x0

    .line 1026
    invoke-static {p1, v2, p2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object p2

    .line 1027
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_1

    const/4 v2, 0x1

    .line 1028
    :cond_1
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1029
    const-string v3, "<binary"

    if-eqz v2, :cond_2

    :try_start_1
    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v1, :cond_3

    :cond_2
    if-nez v2, :cond_0

    .line 1030
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, -0xa

    invoke-virtual {v0, v3, v5}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v3, v1, :cond_0

    .line 1031
    :cond_3
    const-string v3, "</body"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v1, :cond_0

    if-eqz v2, :cond_4

    goto :goto_0

    .line 1033
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    sub-int/2addr p1, p2

    add-int/lit8 p1, p1, -0xa

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p2

    :goto_0
    iput-object p2, p0, Lcom/flyersoft/books/Fb2;->lastBodyString:Ljava/lang/String;

    .line 1034
    iput-boolean v4, p0, Lcom/flyersoft/books/Fb2;->bufferReadPaused:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 1042
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1044
    :cond_5
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getFb2Css()Lcom/flyersoft/components/CSS;
    .locals 3

    .line 181
    const-string v0, "/fb2_css"

    sget-object v1, Lcom/flyersoft/books/Fb2;->css:Lcom/flyersoft/components/CSS;

    if-eqz v1, :cond_0

    return-object v1

    .line 184
    :cond_0
    const-string v1, ""

    sput-object v1, Lcom/flyersoft/books/Fb2;->css_text:Ljava/lang/String;

    .line 186
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 187
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 188
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "fb2.css"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    .line 189
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/Fb2;->css_text:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 191
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 193
    :goto_0
    new-instance v0, Lcom/flyersoft/components/CSS;

    sget-object v1, Lcom/flyersoft/books/Fb2;->css_text:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/CSS;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/Fb2;->css:Lcom/flyersoft/components/CSS;

    return-object v0
.end method

.method private getFb2XmlStream(Ljava/lang/String;Z)Ljava/io/InputStream;
    .locals 2

    const/4 p2, 0x0

    .line 771
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 772
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/books/Fb2;->getXmlEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    .line 773
    :cond_0
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 775
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object p2
.end method

.method private getFb2ZipStream(Ljava/lang/String;Z)Ljava/io/InputStream;
    .locals 11

    .line 781
    const-string v0, "/.tmp.fb2.zip"

    const-string v1, ".fb2"

    const-string v2, "UTF-8"

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 783
    :try_start_0
    iget-object v5, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    if-nez v5, :cond_0

    .line 784
    invoke-static {p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 786
    :try_start_1
    invoke-virtual {v5}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileInfoOfZip()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-wide v5, v5, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    sput-wide v5, Lcom/flyersoft/books/Fb2;->filesize:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v5

    .line 788
    :try_start_2
    invoke-static {v5}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 789
    invoke-static {p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper2(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    .line 790
    invoke-virtual {v5}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileInfoOfZip()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-wide v5, v5, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    sput-wide v5, Lcom/flyersoft/books/Fb2;->filesize:J

    .line 795
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v5}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileInfoOfZip()Ljava/util/ArrayList;

    move-result-object v5

    .line 796
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v6, v6, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 797
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v0, v0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    goto/16 :goto_2

    :cond_1
    move-object v6, v4

    move-object v8, v6

    const/4 v7, 0x0

    .line 799
    :goto_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v7, v9, :cond_4

    .line 800
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v9, v9, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    if-nez v6, :cond_2

    .line 801
    invoke-virtual {v9, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 802
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v6, v6, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    :cond_2
    if-nez v8, :cond_3

    .line 803
    const-string v10, ".fb2.zip"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 804
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v8, v8, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_4
    if-nez v6, :cond_5

    if-eqz v8, :cond_5

    .line 807
    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v1, v8}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 808
    :try_start_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    .line 809
    iput-object v4, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    .line 810
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Fb2;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    return-object p1

    :cond_5
    move-object v0, v6

    .line 813
    :goto_2
    :try_start_4
    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v1, v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 816
    :try_start_5
    iget-object v5, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    if-nez v5, :cond_7

    const/4 v5, 0x1

    .line 817
    invoke-static {v1, v2, v5}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    .line 818
    invoke-direct {p0, v4, v5}, Lcom/flyersoft/books/Fb2;->getXmlEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    .line 819
    iget-object v4, p0, Lcom/flyersoft/books/Fb2;->fb2Zip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v4, v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    move-object v4, v1

    goto :goto_3

    :catch_2
    move-exception v0

    .line 823
    :goto_3
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    if-eqz p2, :cond_6

    .line 826
    :try_start_6
    invoke-static {p1}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p2

    const/4 v0, 0x2

    invoke-static {p2, v2, v0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    .line 827
    const-string v0, "<?xml"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 828
    invoke-direct {p0, p1, v3}, Lcom/flyersoft/books/Fb2;->getFb2XmlStream(Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object p1
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    move-object v1, p1

    goto :goto_4

    :catch_3
    move-exception p1

    .line 830
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_6
    move-object v1, v4

    :cond_7
    :goto_4
    return-object v1
.end method

.method private getFixedTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 697
    const-string v0, "..."

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    if-nez p2, :cond_0

    return-object v1

    :cond_0
    if-nez p2, :cond_1

    return-object p1

    .line 702
    :cond_1
    const-string p1, "\n"

    const-string v0, " "

    invoke-virtual {p2, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "\t|\r"

    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 703
    const-string p2, "</p>"

    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    .line 706
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const-string v4, "<p.*?>"

    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "<br>"

    invoke-virtual {v1, p2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 707
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Fb2;->reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 708
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2;->replaceFootnoteAndImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getImageStr(Ljava/lang/StringBuilder;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 12

    .line 429
    const-string v0, "<binary"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    return-object v1

    .line 434
    :cond_0
    const-string v3, ">"

    invoke-virtual {p1, v3, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 435
    const-string v4, "id=\""

    invoke-virtual {p1, v4, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v0, v2, :cond_1

    .line 437
    const-string v6, "id=\'"

    invoke-virtual {p1, v6, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v6, 0x1

    goto :goto_0

    :cond_1
    const/4 v6, 0x0

    :goto_0
    if-eq v0, v2, :cond_3

    if-eqz v6, :cond_2

    .line 441
    const-string v6, "\'"

    goto :goto_1

    :cond_2
    const-string v6, "\""

    :goto_1
    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p1, v6, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v2, :cond_3

    .line 443
    invoke-virtual {p1, v0, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v8, v0

    goto :goto_2

    :cond_3
    move-object v8, v1

    .line 445
    :goto_2
    const-string v0, "</binary>"

    invoke-virtual {p1, v0, v3}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-eq v3, v2, :cond_7

    if-le v0, v3, :cond_7

    add-int/2addr v3, v4

    .line 447
    invoke-virtual {p1, v3, v0}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v9

    if-eqz v8, :cond_7

    if-nez p3, :cond_6

    .line 450
    iget-object p3, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    if-nez p3, :cond_4

    .line 451
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    .line 454
    :cond_4
    iget p3, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    if-lez p3, :cond_5

    .line 455
    invoke-virtual {p1, v5, v3}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2;->getStrBytesLen(Ljava/lang/String;)I

    move-result p1

    .line 456
    iget p3, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    add-int v2, p3, p1

    sub-int p1, v0, v3

    move v11, p1

    move v10, v2

    goto :goto_3

    :cond_5
    const/4 v10, -0x1

    const/4 v11, -0x1

    .line 460
    :goto_3
    new-instance v6, Lcom/flyersoft/books/Fb2$FB2Image;

    move-object v7, p0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/books/Fb2$FB2Image;-><init>(Lcom/flyersoft/books/Fb2;Ljava/lang/String;Ljava/lang/String;II)V

    .line 461
    iget-object p1, v7, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {p1, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_6
    move-object v7, p0

    :goto_4
    if-eqz p2, :cond_8

    .line 463
    invoke-virtual {p2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    return-object v9

    :cond_7
    move-object v7, p0

    :cond_8
    return-object v1
.end method

.method private getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2

    .line 758
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".fb2.zip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 759
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/books/Fb2;->getFb2ZipStream(Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    .line 761
    :cond_0
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/books/Fb2;->getFb2XmlStream(Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 764
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private getNotesFromBody2(Ljava/lang/String;II)V
    .locals 6

    const/4 p3, -0x1

    if-ne p2, p3, :cond_0

    goto/16 :goto_3

    .line 1086
    :cond_0
    :goto_0
    :try_start_0
    const-string v0, "<section "

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    if-ne p2, p3, :cond_1

    goto/16 :goto_3

    .line 1089
    :cond_1
    const-string v0, "</section>"

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, p3, :cond_2

    goto/16 :goto_3

    .line 1093
    :cond_2
    const-string v1, ">"

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1094
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 1095
    const-string v2, "id=\""

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ne v2, p3, :cond_3

    goto :goto_2

    .line 1098
    :cond_3
    const-string v3, "\""

    add-int/lit8 v4, v2, 0x4

    invoke-virtual {p2, v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, p3, :cond_4

    goto :goto_2

    .line 1102
    :cond_4
    new-instance v5, Lcom/flyersoft/books/BaseEBook$FootNote;

    invoke-direct {v5}, Lcom/flyersoft/books/BaseEBook$FootNote;-><init>()V

    .line 1103
    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    iput-object p2, v5, Lcom/flyersoft/books/BaseEBook$FootNote;->tag:Ljava/lang/String;

    .line 1105
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 1106
    const-string v1, "</title>"

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 1107
    const-string v3, "<title>"

    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1108
    const-string v4, ""

    if-eq v3, p3, :cond_5

    if-eq v2, p3, :cond_5

    add-int/lit8 v3, v3, 0x7

    .line 1109
    :try_start_1
    invoke-virtual {p2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v3, "<.*?>|\n|\r|\t"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v5, Lcom/flyersoft/books/BaseEBook$FootNote;->title:Ljava/lang/String;

    goto :goto_1

    .line 1111
    :cond_5
    iput-object v4, v5, Lcom/flyersoft/books/BaseEBook$FootNote;->title:Ljava/lang/String;

    :goto_1
    if-eq v1, p3, :cond_6

    add-int/lit8 v1, v1, 0x8

    .line 1114
    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 1116
    :cond_6
    invoke-direct {p0, p2}, Lcom/flyersoft/books/Fb2;->replaceFootnoteAndImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1117
    iput-object p2, v5, Lcom/flyersoft/books/BaseEBook$FootNote;->html:Ljava/lang/String;

    .line 1118
    iget-object p2, p0, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    move p2, v0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1125
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_1
    const/4 p1, 0x1

    .line 1122
    sput-boolean p1, Lcom/flyersoft/tools/T;->isOutOfMemoryError:Z

    :goto_3
    return-void
.end method

.method private getSeries(Ljava/lang/String;II)V
    .locals 5

    .line 1370
    const-string v0, "\""

    .line 0
    const-string v1, "#"

    const-string v2, "<"

    const/4 v3, -0x1

    if-eq p2, v3, :cond_1

    if-ne p3, v3, :cond_0

    goto :goto_0

    .line 1373
    :cond_0
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1374
    const-string p2, "name=\""

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-eq p2, v3, :cond_1

    add-int/lit8 p2, p2, 0x6

    .line 1377
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p3

    .line 1378
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 1379
    iget-object p3, p0, Lcom/flyersoft/books/Fb2;->categories:Ljava/util/ArrayList;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ">"

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1380
    const-string p2, "number=\""

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    if-eq p2, v3, :cond_1

    add-int/lit8 p2, p2, 0x8

    .line 1383
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p3

    .line 1384
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1385
    iget-object p2, p0, Lcom/flyersoft/books/Fb2;->categories:Ljava/util/ArrayList;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1389
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private getStrBytesLen(Ljava/lang/String;)I
    .locals 0

    .line 965
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 967
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1
.end method

.method private getStringFromInputStream(Ljava/io/InputStream;II)Ljava/lang/String;
    .locals 10

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move-wide v3, v0

    const/4 v5, 0x0

    :cond_0
    int-to-long v6, p2

    const/4 v8, 0x0

    cmp-long v9, v3, v6

    if-gez v9, :cond_2

    sub-long/2addr v6, v3

    .line 977
    :try_start_0
    invoke-virtual {p1, v6, v7}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v6

    add-long/2addr v3, v6

    add-int/lit8 v5, v5, 0x1

    cmp-long v9, v6, v0

    if-nez v9, :cond_1

    goto :goto_0

    :cond_1
    const/16 v6, 0x3e8

    if-le v5, v6, :cond_0

    return-object v8

    :catch_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    goto :goto_3

    :cond_2
    :goto_0
    const/4 p2, 0x1

    if-le v5, p2, :cond_3

    .line 986
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "*skipped_count: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " remainder: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array p2, p2, [Ljava/lang/Object;

    aput-object v0, p2, v2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 987
    :cond_3
    new-instance p2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->encoding:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {p2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const/16 v0, 0x2000

    .line 988
    new-array v0, v0, [C

    .line 989
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 991
    :goto_1
    invoke-virtual {p2, v0}, Ljava/io/BufferedReader;->read([C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_5

    .line 993
    invoke-static {v0, v2, v3}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v3

    .line 994
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    if-ge v4, p3, :cond_4

    .line 995
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 997
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    sub-int/2addr p3, v0

    invoke-virtual {v3, v2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1003
    :cond_5
    invoke-virtual {p2}, Ljava/io/BufferedReader;->close()V

    .line 1004
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 1005
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 1009
    :goto_2
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_4

    .line 1007
    :goto_3
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_4
    return-object v8
.end method

.method private getXmlEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 715
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "file_encoding"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 717
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 718
    const-string v1, "xxx"

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 719
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getValidedEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 720
    sput-object v0, Lcom/flyersoft/tools/A;->textEncode:Ljava/lang/String;

    return-object v0

    .line 728
    :cond_0
    const-string v0, "UTF-8"

    if-nez p2, :cond_1

    .line 729
    :try_start_0
    new-instance p2, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {p2, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 730
    new-instance p1, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p1, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 731
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 736
    const-string p1, "encoding="

    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_2

    .line 738
    const-string v2, "\""

    add-int/lit8 v3, p1, 0xb

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v1, :cond_2

    sub-int v1, v2, p1

    const/16 v3, 0x32

    if-ge v1, v3, :cond_2

    add-int/lit8 p1, p1, 0xa

    .line 740
    invoke-virtual {p2, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getValidedEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 745
    :goto_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0

    .line 748
    :cond_2
    :goto_2
    sput-object v0, Lcom/flyersoft/tools/A;->textEncode:Ljava/lang/String;

    return-object v0
.end method

.method private insertFootnote(Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    .line 132
    sget-boolean v0, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    if-eqz v0, :cond_9

    .line 134
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 137
    :cond_0
    :goto_0
    const-string v4, "<a href=\"?"

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v4, -0x1

    if-lez v3, :cond_3

    .line 138
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_3

    if-gt v2, v3, :cond_1

    if-ne v2, v4, :cond_3

    .line 139
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/books/BaseEBook;->createFootnoteBox(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v5

    .line 140
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 141
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    if-eq v2, v4, :cond_2

    .line 144
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    :cond_2
    const/4 v3, 0x0

    :cond_3
    if-ne v2, v4, :cond_4

    return-object p1

    :cond_4
    add-int/lit8 v2, v2, 0xa

    .line 151
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x3f

    if-eq v5, v6, :cond_0

    .line 152
    const-string v5, "\""

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/flyersoft/books/Fb2;->getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 154
    const-string v6, ">"

    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "</a"

    invoke-virtual {p1, v7, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 155
    const-string v8, "<"

    invoke-virtual {p1, v8, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v8

    invoke-virtual {p1, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 156
    const-string v9, "\"note\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    iget-object v8, v5, Lcom/flyersoft/books/BaseEBook$FootNote;->html:Ljava/lang/String;

    .line 157
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x1f4

    if-ge v8, v9, :cond_0

    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 158
    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/flyersoft/books/BaseEBook$FootNote;->linkName:Ljava/lang/String;

    .line 159
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    const-string v5, "<p"

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 161
    const-string v6, "<br"

    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v4, :cond_7

    if-eq v5, v4, :cond_6

    if-le v5, v6, :cond_7

    :cond_6
    move v5, v6

    :cond_7
    if-ne v5, v4, :cond_8

    .line 165
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_8
    if-nez v3, :cond_0

    move v3, v5

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 173
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_9
    return-object p1
.end method

.method private replaceFootnoteAndImage(Ljava/lang/String;)Ljava/lang/String;
    .locals 18

    move-object/from16 v1, p1

    .line 606
    const-string v0, "<"

    const-string v2, "\""

    const-string v3, ":href=\"#"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    :catch_0
    move-object/from16 v9, p0

    goto/16 :goto_e

    .line 611
    :cond_0
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v8, 0x0

    :goto_0
    if-eq v4, v5, :cond_d

    .line 616
    :try_start_1
    invoke-virtual {v1, v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v9

    .line 617
    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v10, v9, 0x1

    .line 618
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    add-int/lit8 v4, v4, 0x8

    .line 620
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    .line 621
    invoke-virtual {v1, v4, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    const/16 v12, 0x69

    .line 624
    const-string v13, ">"

    if-ne v10, v12, :cond_8

    .line 626
    :try_start_2
    const-string v12, "/>"

    invoke-virtual {v1, v12, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    .line 627
    const-string v15, "</image"

    invoke-virtual {v1, v15, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    if-eq v12, v5, :cond_3

    if-eq v15, v5, :cond_1

    if-gt v12, v15, :cond_3

    sub-int v7, v15, v12

    const/16 v16, 0x1

    const/4 v14, 0x5

    if-ge v7, v14, :cond_2

    goto :goto_1

    :cond_1
    const/16 v16, 0x1

    :cond_2
    const/4 v7, 0x0

    goto :goto_2

    :cond_3
    const/16 v16, 0x1

    .line 629
    :goto_1
    invoke-virtual {v1, v13, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    const/4 v7, 0x1

    .line 632
    :goto_2
    const-string v14, ""

    .line 633
    invoke-virtual {v1, v9, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 634
    const-string v5, "id=\""

    invoke-virtual {v9, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    move/from16 v17, v7

    const/4 v7, -0x1

    if-eq v5, v7, :cond_4

    .line 636
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, " id=\""

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v14, v5, 0x4

    add-int/lit8 v5, v5, 0x5

    invoke-virtual {v9, v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v9, v14, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 637
    :cond_4
    invoke-virtual {v1, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    const-string v7, "inline"

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v7, -0x1

    if-eq v5, v7, :cond_5

    const/4 v5, 0x1

    goto :goto_3

    :cond_5
    const/4 v5, 0x0

    .line 638
    :goto_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<img"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " src=\""

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v5, :cond_6

    const-string v5, "\"/>"

    goto :goto_4

    :cond_6
    const-string v5, "\" alt=\"nobreak\"/>"

    :goto_4
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v17, :cond_7

    const/4 v7, -0x1

    if-eq v15, v7, :cond_7

    goto :goto_5

    :cond_7
    move v15, v12

    goto :goto_5

    :cond_8
    const/16 v16, 0x1

    move v15, v11

    :goto_5
    const/16 v5, 0x61

    if-ne v10, v5, :cond_b

    .line 645
    :try_start_3
    invoke-virtual {v1, v13, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 646
    const-string v7, "</a"

    invoke-virtual {v1, v7, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    add-int/lit8 v7, v5, -0x1

    .line 647
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x2f

    if-eq v7, v8, :cond_a

    const/4 v7, -0x1

    if-eq v15, v7, :cond_9

    add-int/lit8 v7, v5, 0x1

    .line 649
    invoke-virtual {v1, v7, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 650
    invoke-virtual {v1, v0, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v8

    invoke-virtual {v1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v9, p0

    .line 651
    :try_start_4
    invoke-direct {v9, v4, v7, v5}, Lcom/flyersoft/books/Fb2;->createTextFromFootNote(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_7

    goto :goto_7

    :catch_1
    move-exception v0

    goto :goto_6

    :cond_9
    move-object/from16 v9, p0

    const/4 v7, -0x1

    const/4 v8, -0x1

    goto :goto_c

    :cond_a
    move-object/from16 v9, p0

    add-int/lit8 v4, v5, 0x1

    goto :goto_8

    :catch_2
    move-exception v0

    move-object/from16 v9, p0

    :goto_6
    const/4 v8, -0x1

    goto :goto_a

    :cond_b
    move-object/from16 v9, p0

    :goto_7
    const/4 v4, -0x1

    :goto_8
    const/4 v7, -0x1

    if-ne v4, v7, :cond_c

    .line 660
    :try_start_5
    invoke-virtual {v1, v13, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_5 .. :try_end_5} :catch_7

    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    :catch_3
    move-exception v0

    move v8, v4

    goto :goto_a

    :cond_c
    :goto_9
    move v8, v4

    if-eq v8, v7, :cond_e

    .line 662
    :try_start_6
    invoke-virtual {v1, v3, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_7

    const/4 v5, -0x1

    goto/16 :goto_0

    :catch_4
    move-exception v0

    goto :goto_a

    :catch_5
    move-exception v0

    move-object/from16 v9, p0

    .line 667
    :goto_a
    :try_start_7
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_b

    :cond_d
    move-object/from16 v9, p0

    :goto_b
    const/4 v7, -0x1

    :cond_e
    :goto_c
    if-eq v8, v7, :cond_f

    .line 672
    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/lang/OutOfMemoryError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_d

    :catch_6
    move-exception v0

    .line 674
    :try_start_8
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 676
    :cond_f
    :goto_d
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/OutOfMemoryError; {:try_start_8 .. :try_end_8} :catch_7

    return-object v0

    :catch_7
    :goto_e
    return-object v1
.end method

.method private saveImageToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    .line 473
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    if-eqz v0, :cond_2

    .line 490
    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    return-void

    .line 478
    :cond_0
    :try_start_2
    invoke-static {p2}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    const/4 p2, 0x0

    .line 479
    invoke-static {p1, p2, p2}, Lcom/flyersoft/tools/A;->getBytesBitmap([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 480
    sget-object p2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x64

    invoke-virtual {p1, p2, v1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 481
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 482
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_2

    .line 490
    :try_start_3
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 486
    :try_start_4
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v0, :cond_2

    .line 490
    :try_start_5
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    :goto_0
    if-eqz v0, :cond_1

    :try_start_6
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_1

    :catch_1
    move-exception p2

    .line 492
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 494
    :cond_1
    :goto_1
    throw p1

    :catch_2
    nop

    if-eqz v0, :cond_2

    .line 490
    :try_start_7
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_2

    :catch_3
    move-exception p1

    .line 492
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    return-void
.end method

.method private scanImageStr(Ljava/lang/StringBuilder;Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    .line 411
    :goto_0
    const-string v1, "</binary>"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    return-object v0

    .line 414
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/books/Fb2;->getImageStr(Ljava/lang/StringBuilder;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz p3, :cond_1

    return-object v2

    :cond_1
    if-eqz v2, :cond_2

    if-nez v0, :cond_2

    move-object v0, v2

    :cond_2
    const/4 v2, 0x0

    if-eqz p4, :cond_3

    .line 419
    iget v3, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    if-lez v3, :cond_3

    add-int/lit8 v4, v1, 0x9

    .line 420
    invoke-virtual {p1, v2, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/flyersoft/books/Fb2;->getStrBytesLen(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/flyersoft/books/Fb2;->curStreamPos:I

    :cond_3
    add-int/lit8 v1, v1, 0x9

    .line 421
    invoke-virtual {p1, v2, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_0
.end method


# virtual methods
.method public clearImageCache()V
    .locals 3

    .line 533
    const-string v0, "*****************************Clear Fb2 Image Cache - "

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 534
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 535
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 536
    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/Fb2$FB2Image;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/flyersoft/books/Fb2$FB2Image;->binary:Ljava/lang/String;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dealSplitHtml(IZLjava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1397
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 1398
    iget-boolean v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    if-nez v1, :cond_3

    invoke-static {}, Lcom/flyersoft/books/Fb2;->enoughMemory()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    if-nez p2, :cond_1

    .line 1402
    invoke-virtual {p0, p3}, Lcom/flyersoft/books/Fb2;->reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    if-nez p1, :cond_2

    .line 1404
    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getAnnotationHead()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    const-string p1, ""

    :goto_0
    const-string p2, "<h2>"

    iget-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    .line 1405
    invoke-direct {p0, v1, v0}, Lcom/flyersoft/books/Fb2;->getFixedTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</h2>"

    .line 1406
    invoke-virtual {p0, p3}, Lcom/flyersoft/books/Fb2;->reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1, p2, v0, v1, v2}, [Ljava/lang/String;

    move-result-object p1

    .line 1404
    invoke-static {p1}, Lcom/flyersoft/tools/T;->buildString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_3
    :goto_1
    return-object p3

    :catch_0
    move-exception p1

    .line 1413
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object p3

    :catch_1
    move-exception p1

    .line 1410
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object p3
.end method

.method public getAnnotationHead()Ljava/lang/String;
    .locals 3

    .line 1422
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 1423
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->annotText:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->epigraph:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 1424
    const-string v0, ""

    return-object v0

    :cond_0
    if-nez v0, :cond_1

    .line 1426
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<i>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->epigraph:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</i><hr2>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    goto :goto_0

    .line 1429
    :cond_1
    invoke-static {}, Lcom/flyersoft/books/Fb2;->getFb2Css()Lcom/flyersoft/components/CSS;

    .line 1430
    sget-object v0, Lcom/flyersoft/books/Fb2;->css_text:Ljava/lang/String;

    const-string v1, ".annotation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1431
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<div class=\"annotation\">"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->annotText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</div>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->annotText:Ljava/lang/String;

    .line 1432
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/books/Fb2;->annotText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<hr2>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    .line 1433
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->epigraph:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 1434
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->epigraph:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    .line 1436
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Fb2;->reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    .line 1438
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->annotHead:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->author:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->author:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->bookName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->bookName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->bookName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3

    .line 1448
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1449
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".fb2/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1451
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".zip/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    :cond_0
    if-eq v0, v1, :cond_1

    add-int/lit8 v0, v0, 0x4

    .line 1453
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1455
    :cond_1
    const-string v0, "//"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    .line 1456
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1458
    :cond_2
    sget-object v0, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1459
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1

    .line 1461
    :cond_3
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1462
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 1465
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/Fb2$FB2Image;

    invoke-virtual {v0}, Lcom/flyersoft/books/Fb2$FB2Image;->getBinary()Ljava/lang/String;

    move-result-object v0

    .line 1466
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->fb2_filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1468
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/books/Fb2;->saveImageToFile(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 7

    const-string v0, "<br>"

    .line 98
    const-string v1, ""

    if-ltz p1, :cond_5

    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    goto/16 :goto_1

    .line 101
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 102
    iget-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 104
    :try_start_0
    iput-object v1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    .line 105
    iget-boolean v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "</h2>"

    const-string v5, "<h2>"

    if-eqz v3, :cond_2

    .line 106
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    iget-object v6, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/flyersoft/books/Fb2;->getFixedTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 107
    const-string v4, "<sup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_1

    .line 108
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 109
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/flyersoft/books/Fb2;->reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    if-nez p1, :cond_3

    .line 111
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getAnnotationHead()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    goto :goto_0

    .line 113
    :cond_2
    invoke-static {}, Lcom/flyersoft/books/Fb2;->enoughMemory()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    iget-object v5, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    invoke-direct {p0, v3, v5}, Lcom/flyersoft/books/Fb2;->getFixedTitle(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/flyersoft/books/Fb2;->reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    if-nez p1, :cond_3

    .line 116
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getAnnotationHead()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 119
    :cond_3
    :goto_0
    iget-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    int-to-long v3, p1

    iput-wide v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    .line 120
    iget-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    const-string v0, "\n"

    const-string v3, " "

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "<.*?>|\r|\t"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 121
    iget-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2;->insertFootnote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    .line 126
    :catch_0
    :cond_4
    invoke-static {}, Lcom/flyersoft/books/Fb2;->getFb2Css()Lcom/flyersoft/components/CSS;

    move-result-object p1

    iput-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    .line 127
    sget-object p1, Lcom/flyersoft/books/Fb2;->css_text:Ljava/lang/String;

    iput-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    .line 128
    iget-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    :cond_5
    :goto_1
    return-object v1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 311
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 312
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Fb2;->getChaptersFromText(Z)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    .line 314
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 1

    .line 405
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->coverName:Ljava/lang/String;

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/Fb2$FB2Image;

    invoke-virtual {p1}, Lcom/flyersoft/books/Fb2$FB2Image;->getBinary()Ljava/lang/String;

    move-result-object p1

    .line 283
    invoke-static {p1}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    const/4 v0, 0x0

    .line 284
    invoke-static {p1, p2, v0}, Lcom/flyersoft/tools/A;->getBytesBitmap([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 285
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object p2

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getFontFile(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;
    .locals 3

    .line 1072
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->footNotes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$FootNote;

    .line 1073
    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$FootNote;->tag:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getImageFileList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 295
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 296
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->imageFiles:Ljava/util/ArrayList;

    .line 297
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 298
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 299
    iget-object v2, p0, Lcom/flyersoft/books/Fb2;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 301
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->imageGetter:Landroid/text/Html$ImageGetter;

    if-nez v0, :cond_1

    .line 220
    new-instance v0, Lcom/flyersoft/books/Fb2$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Fb2$1;-><init>(Lcom/flyersoft/books/Fb2;)V

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->imageGetter:Landroid/text/Html$ImageGetter;

    .line 226
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->imageGetter:Landroid/text/Html$ImageGetter;

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_1

    .line 235
    new-instance v0, Lcom/flyersoft/books/Fb2$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Fb2$2;-><init>(Lcom/flyersoft/books/Fb2;)V

    iput-object v0, p0, Lcom/flyersoft/books/Fb2;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 276
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 6

    const/4 v0, 0x1

    if-ltz p1, :cond_1

    .line 200
    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    int-to-long v2, v0

    .line 205
    invoke-virtual {p0}, Lcom/flyersoft/books/Fb2;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-wide v4, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    long-to-int v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method

.method public getSingleFileText(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 88
    iget-wide v0, p0, Lcom/flyersoft/books/Fb2;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 89
    iget-object v0, p0, Lcom/flyersoft/books/Fb2;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 90
    iget-wide v2, p0, Lcom/flyersoft/books/Fb2;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Fb2;->totalSize:J

    goto :goto_0

    .line 92
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Fb2;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 212
    iget-boolean v0, p0, Lcom/flyersoft/books/Fb2;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 70
    iget-boolean v0, p0, Lcom/flyersoft/books/Fb2;->inited:Z

    return v0
.end method

.method public reverseFb2Tag(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 542
    const-string v0, "<br><br>"

    const-string v1, "<br>"

    const-string v2, ""

    const-string v3, "</div>"

    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2;->replaceFootnoteAndImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<poem>"

    const-string v6, "<div class=\"poem\">"

    .line 543
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "</poem>"

    .line 544
    invoke-virtual {v4, v5, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<cite>"

    const-string v6, "<div class=\"cite\">"

    .line 546
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "</cite>"

    .line 547
    invoke-virtual {v4, v5, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<text-author>"

    const-string v6, "<div class=\"text-author\">"

    .line 549
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "</text-author>"

    .line 550
    invoke-virtual {v4, v5, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<(|.)(emphasis)>"

    const-string v6, "<$1i>"

    .line 552
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<stanza>"

    .line 554
    invoke-virtual {v4, v5, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "</stanza>"

    .line 555
    invoke-virtual {v4, v5, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<a l:"

    const-string v6, "<a "

    .line 556
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<(v .*?|v)>"

    const-string v6, "&nbsp;&nbsp;&nbsp;"

    .line 558
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "</v>"

    .line 559
    invoke-virtual {v4, v5, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "<empty-line/>"

    .line 560
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "<empty-line>"

    .line 561
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</empty-line>"

    .line 562
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<subtitle>"

    const-string v4, "<h5 class=\"subtitle\">"

    .line 564
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</subtitle>"

    const-string v4, "</h5>"

    .line 565
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<epigraph>"

    const-string v4, "<div class=\"epigraph\">"

    .line 566
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</epigraph>"

    .line 567
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<(|.)strikethrough>"

    const-string v3, "<$1strike>"

    .line 569
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<(|.)(title|title .*?)>"

    const-string v3, "<$1h5>"

    .line 570
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<b>(| |\u3000|\u00a0)</b>"

    .line 572
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<p>(| |\u3000|\u00a0)</p>"

    .line 573
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 v0, 0x1

    .line 576
    sput-boolean v0, Lcom/flyersoft/tools/T;->isOutOfMemoryError:Z

    return-object p1
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 306
    iget-boolean v0, p0, Lcom/flyersoft/books/Fb2;->showChaptersAtBegin:Z

    return v0
.end method
