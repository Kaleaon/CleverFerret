.class public Lcom/flyersoft/books/ComicInfo;
.super Lcom/flyersoft/books/BaseEBook;
.source "ComicInfo.java"


# instance fields
.field Count:Ljava/lang/String;

.field Number:Ljava/lang/String;

.field Series:Ljava/lang/String;

.field Summary:Ljava/lang/String;

.field Title:Ljava/lang/String;

.field Volume:Ljava/lang/String;

.field Writer:Ljava/lang/String;

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


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 18
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/flyersoft/books/ComicInfo;->filename:Ljava/lang/String;

    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/flyersoft/books/ComicInfo;->inited:Z

    const-wide/16 v1, -0x1

    .line 21
    iput-wide v1, p0, Lcom/flyersoft/books/ComicInfo;->totalSize:J

    const/4 v1, 0x1

    .line 22
    iput-boolean v1, p0, Lcom/flyersoft/books/ComicInfo;->isHtml:Z

    .line 24
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 27
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/ComicInfo;->filesize:J

    .line 30
    :try_start_0
    iput-boolean v0, p0, Lcom/flyersoft/books/ComicInfo;->showChaptersAtBegin:Z

    .line 31
    invoke-direct {p0}, Lcom/flyersoft/books/ComicInfo;->getComicInfo()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v2

    .line 33
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 34
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/ComicInfo;->errMsg:Ljava/lang/String;

    .line 35
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private getComicInfo()V
    .locals 6

    .line 42
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 47
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList()Ljava/util/ArrayList;

    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 49
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".xml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 50
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, "comicinfo.xml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v2, v3

    goto :goto_1

    :cond_2
    if-nez v2, :cond_1

    move-object v2, v3

    goto :goto_0

    :cond_3
    :goto_1
    if-eqz v2, :cond_5

    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 58
    invoke-virtual {v0, v2, v1, v3}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    .line 59
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 60
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 61
    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 62
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 63
    const-string v2, "Title"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Title:Ljava/lang/String;

    .line 64
    const-string v2, "Series"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Series:Ljava/lang/String;

    .line 65
    const-string v2, "Number"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Number:Ljava/lang/String;

    .line 66
    const-string v2, "Count"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Count:Ljava/lang/String;

    .line 67
    const-string v2, "Volume"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Volume:Ljava/lang/String;

    .line 68
    const-string v2, "Summary"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Summary:Ljava/lang/String;

    .line 69
    const-string v2, "Writer"

    invoke-direct {p0, v2, v1, v0}, Lcom/flyersoft/books/ComicInfo;->getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Writer:Ljava/lang/String;

    .line 71
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Summary:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/ComicInfo;->description:Ljava/lang/String;

    .line 72
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Series:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 73
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->categories:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/books/ComicInfo;->Series:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Volume:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 75
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->categories:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "#"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/books/ComicInfo;->Volume:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_4
    iput-boolean v3, p0, Lcom/flyersoft/books/ComicInfo;->inited:Z

    :cond_5
    :goto_2
    return-void
.end method

.method private getMeta(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ">"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 84
    invoke-virtual {p3, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 86
    const-string v1, "</"

    invoke-virtual {p3, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p3

    if-le p3, v0, :cond_0

    .line 88
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr v0, p1

    invoke-virtual {p2, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 113
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Writer:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Writer:Ljava/lang/String;

    return-object v0

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 117
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    add-int/2addr v1, v3

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 120
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 101
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Title:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->Title:Ljava/lang/String;

    return-object v0

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 105
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    const/4 v2, 0x0

    .line 106
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 192
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 0

    .line 143
    const-string p1, ""

    return-object p1
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

    .line 135
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/ComicInfo;->chapters:Ljava/util/ArrayList;

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->chapters:Ljava/util/ArrayList;

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

    .line 169
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/ComicInfo;->imageFiles:Ljava/util/ArrayList;

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/ComicInfo;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public getSingleFileText(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    .line 187
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/ComicInfo;->getChapterText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalSize()J
    .locals 2

    .line 125
    iget-wide v0, p0, Lcom/flyersoft/books/ComicInfo;->filesize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 153
    iget-boolean v0, p0, Lcom/flyersoft/books/ComicInfo;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lcom/flyersoft/books/ComicInfo;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 177
    iget-boolean v0, p0, Lcom/flyersoft/books/ComicInfo;->showChaptersAtBegin:Z

    return v0
.end method
