.class public Lcom/flyersoft/books/Rtf;
.super Lcom/flyersoft/books/BaseEBook;
.source "Rtf.java"


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

    .line 22
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/flyersoft/books/Rtf;->filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/flyersoft/books/Rtf;->inited:Z

    const-wide/16 v1, -0x1

    .line 25
    iput-wide v1, p0, Lcom/flyersoft/books/Rtf;->totalSize:J

    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Lcom/flyersoft/books/Rtf;->isHtml:Z

    .line 28
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 29
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 31
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/Rtf;->filesize:J

    .line 34
    :try_start_0
    iput-boolean v0, p0, Lcom/flyersoft/books/Rtf;->showChaptersAtBegin:Z

    .line 35
    invoke-direct {p0}, Lcom/flyersoft/books/Rtf;->getSourceHtml()V

    .line 36
    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getChapters()Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    iput-boolean v1, p0, Lcom/flyersoft/books/Rtf;->inited:Z

    return-void

    :catchall_0
    move-exception v2

    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 39
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Rtf;->errMsg:Ljava/lang/String;

    .line 40
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/flyersoft/books/Rtf;->filename:Ljava/lang/String;

    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Lcom/flyersoft/books/Rtf;->inited:Z

    return-void
.end method

.method private getSourceHtml()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 103
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/flyersoft/books/Rtf;->filename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 104
    new-instance v1, Lcom/rtfparserkit/converter/text/StringTextConverter;

    invoke-direct {v1}, Lcom/rtfparserkit/converter/text/StringTextConverter;-><init>()V

    .line 105
    new-instance v2, Lcom/rtfparserkit/parser/RtfStreamSource;

    invoke-direct {v2, v0}, Lcom/rtfparserkit/parser/RtfStreamSource;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v2}, Lcom/rtfparserkit/converter/text/StringTextConverter;->convert(Lcom/rtfparserkit/parser/IRtfSource;)V

    .line 106
    invoke-virtual {v1}, Lcom/rtfparserkit/converter/text/StringTextConverter;->getText()Ljava/lang/String;

    move-result-object v0

    .line 107
    const-string v1, "\r"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\n"

    const-string v2, "<br>"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Rtf;->sourceHtml:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 70
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    add-int/2addr v1, v3

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 74
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 59
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 61
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    const/4 v2, 0x0

    .line 62
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 199
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 1

    if-ltz p1, :cond_1

    .line 112
    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    .line 113
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

    .line 94
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Rtf;->chapters:Ljava/util/ArrayList;

    .line 96
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->chapters:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getBookName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/books/Rtf;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/books/Rtf;->sourceHtml:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    int-to-long v6, v2

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object v2, p0

    .line 98
    :goto_0
    iget-object v0, v2, Lcom/flyersoft/books/Rtf;->chapters:Ljava/util/ArrayList;

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

    .line 176
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 177
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Rtf;->imageFiles:Ljava/util/ArrayList;

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 135
    new-instance v0, Lcom/flyersoft/books/Rtf$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Rtf$1;-><init>(Lcom/flyersoft/books/Rtf;)V

    iput-object v0, p0, Lcom/flyersoft/books/Rtf;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Rtf;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 119
    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getChapters()Ljava/util/ArrayList;

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

    .line 123
    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getChapters()Ljava/util/ArrayList;

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

    .line 194
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Rtf;->getChapterText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 79
    iget-wide v0, p0, Lcom/flyersoft/books/Rtf;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 80
    iput-wide v2, p0, Lcom/flyersoft/books/Rtf;->totalSize:J

    .line 81
    invoke-virtual {p0}, Lcom/flyersoft/books/Rtf;->getChapters()Ljava/util/ArrayList;

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

    .line 82
    iget-wide v2, p0, Lcom/flyersoft/books/Rtf;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Rtf;->totalSize:J

    goto :goto_0

    .line 84
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Rtf;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 129
    iget-boolean v0, p0, Lcom/flyersoft/books/Rtf;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 54
    iget-boolean v0, p0, Lcom/flyersoft/books/Rtf;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 184
    iget-boolean v0, p0, Lcom/flyersoft/books/Rtf;->showChaptersAtBegin:Z

    return v0
.end method
