.class public Lcom/flyersoft/books/Chm;
.super Lcom/flyersoft/books/BaseEBook;
.source "Chm.java"


# instance fields
.field chm_filename:Ljava/lang/String;

.field doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

.field private encoding:Ljava/lang/String;

.field private fileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

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


# direct methods
.method static bridge synthetic -$$Nest$mgetEntryName(Lcom/flyersoft/books/Chm;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Chm;->getEntryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 27
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/flyersoft/books/Chm;->chm_filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/flyersoft/books/Chm;->inited:Z

    const-wide/16 v1, -0x1

    .line 30
    iput-wide v1, p0, Lcom/flyersoft/books/Chm;->totalSize:J

    const/4 v1, 0x1

    .line 31
    iput-boolean v1, p0, Lcom/flyersoft/books/Chm;->isHtml:Z

    .line 33
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/Chm;->filesize:J

    .line 39
    :try_start_0
    new-instance v2, Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    .line 40
    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/flyersoft/books/Chm;->showChaptersAtBegin:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    iput-boolean v1, p0, Lcom/flyersoft/books/Chm;->inited:Z

    return-void

    :catchall_0
    move-exception v2

    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 45
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Chm;->errMsg:Ljava/lang/String;

    .line 46
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 53
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/flyersoft/books/Chm;->chm_filename:Ljava/lang/String;

    const/4 p1, 0x1

    .line 55
    iput-boolean p1, p0, Lcom/flyersoft/books/Chm;->inited:Z

    return-void
.end method

.method private clearChapterContents()V
    .locals 3

    const/4 v0, 0x0

    .line 202
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 203
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    const-string v2, "UN_LOAD_TAG"

    iput-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private convertIfNotHtmlContent(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 176
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 177
    const-string v1, "<body"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const-string v1, "<br"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v2, :cond_0

    const-string v1, "<p"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 178
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getTxtDisplayText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\n"

    const-string v1, "<br>"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private getEncoding()Ljava/lang/String;
    .locals 3

    .line 185
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->encoding:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 186
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "file_encoding"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 188
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->chm_filename:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 189
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->chm_filename:Ljava/lang/String;

    const-string v2, "xxx"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 190
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getValidedEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    iput-object v0, p0, Lcom/flyersoft/books/Chm;->encoding:Ljava/lang/String;

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->encoding:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 195
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getCharset()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Chm;->encoding:Ljava/lang/String;

    .line 197
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->encoding:Ljava/lang/String;

    sput-object v0, Lcom/flyersoft/tools/A;->fileEncoding:Ljava/lang/String;

    .line 198
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method private getEntryName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 235
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 236
    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 237
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 239
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "/"

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 240
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v1

    .line 242
    :cond_3
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    .line 243
    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 244
    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 245
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 246
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_5
    return-object v1

    :cond_6
    const/4 p1, 0x0

    return-object p1
.end method

.method private getFileList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 226
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->fileList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 227
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Chm;->fileList:Ljava/util/ArrayList;

    .line 228
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->listFiles()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;

    .line 229
    iget-object v2, p0, Lcom/flyersoft/books/Chm;->fileList:Ljava/util/ArrayList;

    iget-object v1, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->fileList:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 75
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chm_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 77
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    add-int/2addr v1, v3

    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 80
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 65
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chm_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 66
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    const/4 v2, 0x0

    .line 68
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    .line 374
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 375
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".chm/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    .line 376
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 378
    sget-object v0, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1

    .line 381
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 382
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Chm;->getEntryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 384
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getCacheFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 386
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v1, p1, v0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 5

    .line 136
    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->clearChapterContents()V

    :cond_0
    if-ltz p1, :cond_4

    .line 139
    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    goto/16 :goto_3

    .line 142
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 143
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 144
    const-string v1, "UN_LOAD_TAG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<h2>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</h2>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 146
    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    .line 149
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    iget-object v2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    sget-object v3, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_4

    goto :goto_0

    :catch_0
    move-exception v1

    .line 151
    :try_start_1
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 152
    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/flyersoft/books/Chm;->getEntryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 154
    iget-object v2, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    sget-object v3, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    :cond_2
    :goto_0
    sget-object v1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->getEncoding()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 159
    :try_start_2
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Chm;->convertIfNotHtmlContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 160
    :try_start_3
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getHtmlBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteHtmlStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    goto :goto_1

    :catch_2
    return-object v0

    :catch_3
    move-exception v1

    .line 167
    :goto_1
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 171
    :catch_4
    :cond_3
    :goto_2
    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object v0

    .line 140
    :cond_4
    :goto_3
    const-string p1, ""

    return-object p1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    iget-object v2, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getDoc()Lcom/flyersoft/books/chmlib/ChmDocument;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object v7

    .line 104
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->hasHHC()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 105
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getHHC()Lcom/flyersoft/books/chmlib/HHC;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/HHC;->hChapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v9, 0x1

    if-eqz v0, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lcom/flyersoft/books/chmlib/HHC$HChapter;

    .line 106
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v10, Lcom/flyersoft/books/chmlib/HHC$HChapter;->name:Ljava/lang/String;

    iget-object v3, v10, Lcom/flyersoft/books/chmlib/HHC$HChapter;->filename:Ljava/lang/String;

    const-string v4, "UN_LOAD_TAG"

    iget-wide v5, v10, Lcom/flyersoft/books/chmlib/HHC$HChapter;->size:J

    const-wide/16 v11, 0x2

    div-long/2addr v5, v11

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 107
    iget-boolean v2, v10, Lcom/flyersoft/books/chmlib/HHC$HChapter;->hasSubChapter:Z

    iput-boolean v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    .line 108
    iget v2, v10, Lcom/flyersoft/books/chmlib/HHC$HChapter;->indent:I

    iput v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    .line 109
    iget v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    if-lez v2, :cond_1

    .line 110
    iput-boolean v9, p0, Lcom/flyersoft/books/Chm;->treeTOC:Z

    .line 111
    :cond_1
    iget-boolean v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    if-nez v2, :cond_2

    iget-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 112
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const/4 v8, 0x0

    if-eqz v7, :cond_4

    .line 114
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getDoc()Lcom/flyersoft/books/chmlib/ChmDocument;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 115
    iget-object v10, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getBookName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v3}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getDoc()Lcom/flyersoft/books/chmlib/ChmDocument;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    const-string v4, "UN_LOAD_TAG"

    iget v5, v7, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    div-int/lit8 v5, v5, 0x2

    int-to-long v5, v5

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v10, v8, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 117
    :cond_4
    iget-boolean v0, p0, Lcom/flyersoft/books/Chm;->treeTOC:Z

    if-eqz v0, :cond_6

    .line 118
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_6

    .line 119
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    add-int/2addr v2, v9

    iput v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_5
    if-eqz v7, :cond_6

    .line 122
    iget-object v8, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getBookName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v3}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getDoc()Lcom/flyersoft/books/chmlib/ChmDocument;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    const-string v4, "UN_LOAD_TAG"

    iget v5, v7, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    div-int/lit8 v5, v5, 0x2

    int-to-long v5, v5

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 126
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 127
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Chm;->errMsg:Ljava/lang/String;

    .line 131
    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 316
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Chm;->getEntryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 318
    iget-object v1, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v1, p1}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getCacheFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 319
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isEmptyFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 321
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v2, p1, v1}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 323
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0

    :cond_0
    :goto_0
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    .line 327
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    .line 328
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/flyersoft/tools/T;->getFileDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v0
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
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 336
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 337
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Chm;->imageFiles:Ljava/util/ArrayList;

    .line 338
    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 339
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 340
    iget-object v2, p0, Lcom/flyersoft/books/Chm;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 342
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 256
    new-instance v0, Lcom/flyersoft/books/Chm$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Chm$1;-><init>(Lcom/flyersoft/books/Chm;)V

    iput-object v0, p0, Lcom/flyersoft/books/Chm;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 209
    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getChapters()Ljava/util/ArrayList;

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

    .line 214
    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getChapters()Ljava/util/ArrayList;

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
    .locals 2

    .line 358
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Chm;->getEntryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 361
    iget-object v0, p0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    sget-object v1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flyersoft/books/Chm;->getEncoding()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 365
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 85
    iget-wide v0, p0, Lcom/flyersoft/books/Chm;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 86
    iput-wide v2, p0, Lcom/flyersoft/books/Chm;->totalSize:J

    .line 87
    invoke-virtual {p0}, Lcom/flyersoft/books/Chm;->getChapters()Ljava/util/ArrayList;

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

    .line 88
    iget-wide v2, p0, Lcom/flyersoft/books/Chm;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Chm;->totalSize:J

    goto :goto_0

    .line 90
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Chm;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 221
    iget-boolean v0, p0, Lcom/flyersoft/books/Chm;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lcom/flyersoft/books/Chm;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 347
    iget-boolean v0, p0, Lcom/flyersoft/books/Chm;->showChaptersAtBegin:Z

    return v0
.end method
