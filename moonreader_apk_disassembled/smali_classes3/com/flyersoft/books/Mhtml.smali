.class public Lcom/flyersoft/books/Mhtml;
.super Lcom/flyersoft/books/BaseEBook;
.source "Mhtml.java"


# instance fields
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

.field sourceHtml:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 19
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/flyersoft/books/Mhtml;->filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/flyersoft/books/Mhtml;->inited:Z

    const-wide/16 v1, -0x1

    .line 22
    iput-wide v1, p0, Lcom/flyersoft/books/Mhtml;->totalSize:J

    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Lcom/flyersoft/books/Mhtml;->isHtml:Z

    .line 25
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 28
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/Mhtml;->filesize:J

    .line 31
    :try_start_0
    iput-boolean v0, p0, Lcom/flyersoft/books/Mhtml;->showChaptersAtBegin:Z

    .line 32
    invoke-direct {p0}, Lcom/flyersoft/books/Mhtml;->getSourceHtml()V

    .line 33
    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getChapters()Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    iput-boolean v1, p0, Lcom/flyersoft/books/Mhtml;->inited:Z

    return-void

    :catchall_0
    move-exception v2

    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 36
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Mhtml;->errMsg:Ljava/lang/String;

    .line 37
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/flyersoft/books/Mhtml;->filename:Ljava/lang/String;

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/flyersoft/books/Mhtml;->inited:Z

    return-void
.end method

.method private getSourceHtml()V
    .locals 2

    .line 100
    new-instance v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;

    iget-object v1, p0, Lcom/flyersoft/books/Mhtml;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;-><init>(Ljava/lang/String;)V

    .line 101
    invoke-virtual {v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->init()Lcom/flyersoft/books/mhtml/IMhtmlParas;

    .line 102
    invoke-virtual {v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->convet2Html()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Mhtml;->sourceHtml:Ljava/lang/String;

    const/4 v1, 0x1

    .line 103
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->getHtmlBody(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteHtmlStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Mhtml;->sourceHtml:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 66
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 68
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    add-int/2addr v1, v3

    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 71
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 56
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 58
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    const/4 v2, 0x0

    .line 59
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 188
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 1

    if-ltz p1, :cond_1

    .line 108
    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 110
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    .line 109
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

    .line 91
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Mhtml;->chapters:Ljava/util/ArrayList;

    .line 93
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->chapters:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getBookName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/books/Mhtml;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/books/Mhtml;->sourceHtml:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    int-to-long v6, v2

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object v2, p0

    .line 95
    :goto_0
    iget-object v0, v2, Lcom/flyersoft/books/Mhtml;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 0

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
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Mhtml;->imageFiles:Ljava/util/ArrayList;

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 131
    new-instance v0, Lcom/flyersoft/books/Mhtml$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Mhtml$1;-><init>(Lcom/flyersoft/books/Mhtml;)V

    iput-object v0, p0, Lcom/flyersoft/books/Mhtml;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Mhtml;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 115
    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getChapters()Ljava/util/ArrayList;

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

    .line 119
    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getChapters()Ljava/util/ArrayList;

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

    .line 183
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Mhtml;->getChapterText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 76
    iget-wide v0, p0, Lcom/flyersoft/books/Mhtml;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 77
    iput-wide v2, p0, Lcom/flyersoft/books/Mhtml;->totalSize:J

    .line 78
    invoke-virtual {p0}, Lcom/flyersoft/books/Mhtml;->getChapters()Ljava/util/ArrayList;

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

    .line 79
    iget-wide v2, p0, Lcom/flyersoft/books/Mhtml;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Mhtml;->totalSize:J

    goto :goto_0

    .line 81
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Mhtml;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 125
    iget-boolean v0, p0, Lcom/flyersoft/books/Mhtml;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 51
    iget-boolean v0, p0, Lcom/flyersoft/books/Mhtml;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 173
    iget-boolean v0, p0, Lcom/flyersoft/books/Mhtml;->showChaptersAtBegin:Z

    return v0
.end method
