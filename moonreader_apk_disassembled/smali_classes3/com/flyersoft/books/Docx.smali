.class public Lcom/flyersoft/books/Docx;
.super Lcom/flyersoft/books/BaseEBook;
.source "Docx.java"


# instance fields
.field private fileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end field

.field filename:Ljava/lang/String;

.field filesize:J

.field imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field insertImg:Z

.field private myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

.field sourceHtml:Ljava/lang/String;

.field type:I


# direct methods
.method static bridge synthetic -$$Nest$mcheckDownloadBooCover2(Lcom/flyersoft/books/Docx;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->checkDownloadBooCover2(Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 24
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/flyersoft/books/Docx;->inited:Z

    const-wide/16 v1, -0x1

    .line 27
    iput-wide v1, p0, Lcom/flyersoft/books/Docx;->totalSize:J

    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Lcom/flyersoft/books/Docx;->isHtml:Z

    .line 30
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 31
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 33
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/Docx;->filesize:J

    .line 36
    :try_start_0
    iput-boolean v0, p0, Lcom/flyersoft/books/Docx;->showChaptersAtBegin:Z

    .line 37
    invoke-direct {p0}, Lcom/flyersoft/books/Docx;->getSourceHtml()V

    .line 38
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getChapters()Ljava/util/ArrayList;

    .line 39
    invoke-direct {p0, v1}, Lcom/flyersoft/books/Docx;->checkDownloadBookCover(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    iput-boolean v1, p0, Lcom/flyersoft/books/Docx;->inited:Z

    return-void

    :catchall_0
    move-exception v2

    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 42
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Docx;->errMsg:Ljava/lang/String;

    .line 43
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 50
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    const/4 p1, 0x0

    .line 52
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->checkDownloadBookCover(Z)V

    const/4 p1, 0x1

    .line 53
    iput-boolean p1, p0, Lcom/flyersoft/books/Docx;->inited:Z

    return-void
.end method

.method private checkDownloadBooCover2(Z)V
    .locals 4

    .line 486
    iget v0, p0, Lcom/flyersoft/books/Docx;->type:I

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 489
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getCoverFile()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 493
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_2.png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz p1, :cond_2

    .line 495
    const-string v3, ""

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    .line 497
    :cond_2
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Docx;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const/4 v2, 0x0

    .line 498
    invoke-static {v0, v2, v1}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 499
    iget-object v1, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V

    :cond_3
    :goto_0
    return-void
.end method

.method private checkDownloadBookCover(Z)V
    .locals 4

    .line 457
    iget v0, p0, Lcom/flyersoft/books/Docx;->type:I

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 461
    :try_start_0
    sget v0, Lcom/flyersoft/tools/A;->rebuild_cover_size:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_2

    .line 462
    const-string v0, "/"

    if-nez p1, :cond_1

    .line 463
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_1.png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 465
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_2.png"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    if-eqz p1, :cond_3

    .line 470
    new-instance p1, Lcom/flyersoft/books/Docx$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/Docx$2;-><init>(Lcom/flyersoft/books/Docx;)V

    .line 476
    invoke-virtual {p1, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 477
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void

    :cond_3
    const/4 p1, 0x0

    .line 479
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->checkDownloadBooCover2(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 481
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_0
    return-void
.end method

.method private convertDocxImages(Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 206
    const-string v0, ">"

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/flyersoft/books/Docx;->insertImg:Z

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 211
    :goto_0
    :try_start_0
    const-string v4, "<w:drawing"

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    goto/16 :goto_1

    .line 214
    :cond_0
    const-string v5, "</w:drawing>"

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    if-ne v5, v4, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v6, 0x1

    add-int/2addr v3, v6

    .line 219
    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    add-int/2addr v7, v6

    invoke-virtual {p1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 220
    const-string v8, "<pic:cNvPr"

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x0

    if-eq v8, v4, :cond_6

    .line 222
    const-string v10, "name=\""

    invoke-virtual {v7, v10, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    if-eq v8, v4, :cond_6

    add-int/lit8 v8, v8, 0x6

    .line 224
    const-string v4, "\""

    invoke-virtual {v7, v4, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v7, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 225
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v6, :cond_2

    .line 226
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    check-cast v9, Ljava/lang/String;

    :cond_2
    if-nez v9, :cond_4

    .line 228
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 229
    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    move-object v9, v8

    :cond_4
    if-nez v9, :cond_6

    .line 237
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "image"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 238
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 239
    invoke-static {v8}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    move-object v9, v8

    :cond_6
    if-eqz v9, :cond_7

    .line 247
    iput-boolean v6, p0, Lcom/flyersoft/books/Docx;->insertImg:Z

    .line 248
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "<p><img src=\""

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\" align=\"center\"><p>"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    add-int/2addr v5, v6

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :cond_7
    move v2, v5

    goto/16 :goto_0

    :catch_0
    move-exception v0

    .line 256
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_1
    return-object p1
.end method

.method private convertOdtImages(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 262
    const-string v0, ">"

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/flyersoft/books/Docx;->insertImg:Z

    const/4 v2, 0x0

    .line 266
    :goto_0
    :try_start_0
    const-string v3, "<draw:frame"

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    goto/16 :goto_2

    .line 269
    :cond_0
    const-string v4, "</draw:frame>"

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v3, :cond_1

    goto/16 :goto_2

    .line 273
    :cond_1
    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v6, 0x1

    add-int/2addr v5, v6

    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 274
    const-string v7, "<draw:image"

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v3, :cond_3

    .line 276
    const-string v8, "href=\""

    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    if-eq v7, v3, :cond_3

    add-int/lit8 v7, v7, 0x6

    .line 278
    const-string v3, "\""

    invoke-virtual {v5, v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v5, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 279
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 280
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 281
    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_1

    :cond_3
    const/4 v7, 0x0

    :goto_1
    if-eqz v7, :cond_4

    .line 288
    iput-boolean v6, p0, Lcom/flyersoft/books/Docx;->insertImg:Z

    .line 289
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "<p><img src=\""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\" align=\"center\"><p>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    add-int/2addr v4, v6

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :cond_4
    move v2, v4

    goto/16 :goto_0

    :catch_0
    move-exception v0

    .line 297
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_2
    return-object p1
.end method

.method private formatDocument(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 142
    iget v0, p0, Lcom/flyersoft/books/Docx;->type:I

    if-nez v0, :cond_0

    .line 143
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->convertDocxImages(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 144
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->formatDocx(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 146
    :cond_0
    iget v0, p0, Lcom/flyersoft/books/Docx;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 147
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->convertOdtImages(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 148
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx;->formatOdt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 151
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/Docx;->insertImg:Z

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 153
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-string v1, "<hr>"

    move-object v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 154
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "<img src=\""

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\" align=\"center\"><p>"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 155
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_3
    return-object p1
.end method

.method private formatDocx(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 162
    const-string v0, ""

    :try_start_0
    const-string v1, "<tblPr>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"

    .line 163
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "tab/>"

    const-string v2, "z/>&nbsp;&nbsp;&nbsp;&nbsp;"

    .line 164
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "w:val=\""

    const-string v2, "class=\"c"

    .line 165
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "tc>"

    const-string v2, "td>"

    .line 166
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "tbl>"

    const-string v2, "table>"

    .line 167
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<w:"

    const-string v2, "<"

    .line 168
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</w:"

    const-string v2, "</"

    .line 169
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 171
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method private formatOdt(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 178
    const-string v0, ""

    :try_start_0
    const-string v1, "<office:.*?>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "</office:.*?>"

    .line 179
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<style:.*?>"

    .line 180
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "</style:.*?>"

    .line 181
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<table:table-column.*?>"

    .line 182
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 183
    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<table:table "

    const-string v2, "<table "

    .line 184
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</table:table>"

    const-string v2, "</table>"

    .line 185
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<table:table-row"

    const-string v2, "<tr"

    .line 186
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</table:table-row>"

    const-string v2, "</tr>"

    .line 187
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<table:table-cell"

    const-string v2, "<td"

    .line 188
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</table:table-cell>"

    const-string v2, "</td>"

    .line 189
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 190
    const-string v0, "<text:"

    const-string v1, "<"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</text:"

    const-string v2, "</"

    .line 191
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 192
    const-string v0, "<list "

    const-string v1, "<ul "

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</list>"

    const-string v2, "</ul>"

    .line 193
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<list-item"

    const-string v2, "<li"

    .line 194
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</list-item>"

    const-string v2, "</li>"

    .line 195
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 196
    const-string v0, "<h "

    const-string v1, "<h3 "

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "</h>"

    const-string v2, "</h3>"

    .line 197
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 199
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method private getDocumentFilename()Ljava/lang/String;
    .locals 2

    .line 303
    iget v0, p0, Lcom/flyersoft/books/Docx;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 304
    const-string v0, "content.xml"

    return-object v0

    .line 305
    :cond_0
    const-string v0, "word/document.xml"

    return-object v0
.end method

.method private getSourceHtml()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Docx;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    .line 115
    const-string v1, "Invalidated document."

    if-eqz v0, :cond_3

    .line 118
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 119
    const-string v2, ".docx"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x0

    .line 120
    iput v0, p0, Lcom/flyersoft/books/Docx;->type:I

    goto :goto_0

    .line 121
    :cond_0
    const-string v2, ".odt"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    .line 122
    iput v0, p0, Lcom/flyersoft/books/Docx;->type:I

    .line 125
    :cond_1
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getFileList()Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 127
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 128
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper2(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Docx;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    .line 129
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getFileList()Ljava/util/ArrayList;

    .line 132
    :goto_1
    invoke-direct {p0}, Lcom/flyersoft/books/Docx;->getDocumentFilename()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Docx;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 136
    invoke-static {v0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 137
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Docx;->formatDocument(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/flyersoft/books/Docx;->sourceHtml:Ljava/lang/String;

    return-void

    .line 134
    :cond_2
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_3
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 73
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 74
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    add-int/2addr v1, v3

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 78
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 63
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    const/4 v2, 0x0

    .line 66
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 4

    .line 521
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 522
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".docx/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x5

    .line 524
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 526
    :cond_0
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    .line 527
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 529
    :cond_1
    const-string v1, "#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_2

    .line 531
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    if-le v1, v2, :cond_2

    const/4 v2, 0x0

    .line 533
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 537
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 538
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1

    .line 540
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Docx;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 541
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 542
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/flyersoft/books/Docx;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_4
    if-nez v1, :cond_5

    const/4 p1, 0x0

    return-object p1

    .line 546
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 547
    const-string v2, "//"

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 549
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0, v1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 1

    if-ltz p1, :cond_1

    .line 316
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 318
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    .line 317
    :cond_1
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Docx;->chapters:Ljava/util/ArrayList;

    .line 105
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->chapters:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getBookName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/books/Docx;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/books/Docx;->sourceHtml:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    int-to-long v6, v2

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object v2, p0

    .line 107
    :goto_0
    iget-object v0, v2, Lcom/flyersoft/books/Docx;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 4

    .line 93
    iget v0, p0, Lcom/flyersoft/books/Docx;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 94
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 95
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    const-string v3, "thumbnails/thumbnail.png"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 96
    iget-object v0, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 429
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Docx;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 430
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 431
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Docx;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_2

    .line 433
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Docx;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 434
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v1, ".svg"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 435
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getSvgDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    .line 436
    invoke-static {v0, p2, p1}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 437
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object p2

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getFileList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation

    .line 309
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->fileList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileInfoOfZip()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Docx;->fileList:Ljava/util/ArrayList;

    .line 312
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->fileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 338
    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 339
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 340
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 341
    :cond_1
    iget-object p1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
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
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 445
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 446
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Docx;->imageFiles:Ljava/util/ArrayList;

    .line 447
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 448
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 449
    invoke-static {v2}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ".tiff"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 450
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/books/Docx;->imageFiles:Ljava/util/ArrayList;

    iget-object v1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 453
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1

    .line 348
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0, p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 353
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 354
    new-instance v0, Lcom/flyersoft/books/Docx$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Docx$1;-><init>(Lcom/flyersoft/books/Docx;)V

    iput-object v0, p0, Lcom/flyersoft/books/Docx;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 424
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Docx;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 323
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getChapters()Ljava/util/ArrayList;

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

    .line 327
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getChapters()Ljava/util/ArrayList;

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

    .line 515
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Docx;->getChapterText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 83
    iget-wide v0, p0, Lcom/flyersoft/books/Docx;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 84
    iput-wide v2, p0, Lcom/flyersoft/books/Docx;->totalSize:J

    .line 85
    invoke-virtual {p0}, Lcom/flyersoft/books/Docx;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 86
    iget-wide v2, p0, Lcom/flyersoft/books/Docx;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Docx;->totalSize:J

    goto :goto_0

    .line 88
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Docx;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 333
    iget-boolean v0, p0, Lcom/flyersoft/books/Docx;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lcom/flyersoft/books/Docx;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 505
    iget-boolean v0, p0, Lcom/flyersoft/books/Docx;->showChaptersAtBegin:Z

    return v0
.end method
