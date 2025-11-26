.class public Lcom/flyersoft/books/Umd;
.super Lcom/flyersoft/books/BaseEBook;
.source "Umd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/Umd$UMDDecoder;,
        Lcom/flyersoft/books/Umd$UMD_Info;,
        Lcom/flyersoft/books/Umd$ChapterPosition;,
        Lcom/flyersoft/books/Umd$UMDInputStream;
    }
.end annotation


# instance fields
.field decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

.field umd_filename:Ljava/lang/String;

.field umd_info:Lcom/flyersoft/books/Umd$UMD_Info;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 26
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/flyersoft/books/Umd;->inited:Z

    .line 28
    iput-object p1, p0, Lcom/flyersoft/books/Umd;->umd_filename:Ljava/lang/String;

    const-wide/16 v1, -0x1

    .line 29
    iput-wide v1, p0, Lcom/flyersoft/books/Umd;->totalSize:J

    .line 30
    iput-boolean v0, p0, Lcom/flyersoft/books/Umd;->isHtml:Z

    .line 31
    iput-boolean v0, p0, Lcom/flyersoft/books/Umd;->showChaptersAtBegin:Z

    .line 33
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 37
    :cond_0
    :try_start_0
    new-instance v1, Lcom/flyersoft/books/Umd$UMDDecoder;

    invoke-direct {v1, p0}, Lcom/flyersoft/books/Umd$UMDDecoder;-><init>(Lcom/flyersoft/books/Umd;)V

    iput-object v1, p0, Lcom/flyersoft/books/Umd;->decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

    .line 38
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/books/Umd$UMDDecoder;->decode(Ljava/io/File;Z)Lcom/flyersoft/books/Umd$UMD_Info;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    .line 39
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/flyersoft/books/Umd;->inited:Z

    return-void

    :catchall_0
    move-exception p1

    .line 41
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Umd;->errMsg:Ljava/lang/String;

    .line 42
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 50
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p0, Lcom/flyersoft/books/Umd;->inited:Z

    .line 52
    iput-object p1, p0, Lcom/flyersoft/books/Umd;->umd_filename:Ljava/lang/String;

    .line 54
    :try_start_0
    new-instance v0, Lcom/flyersoft/books/Umd$UMDDecoder;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Umd$UMDDecoder;-><init>(Lcom/flyersoft/books/Umd;)V

    iput-object v0, p0, Lcom/flyersoft/books/Umd;->decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

    .line 55
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, p2}, Lcom/flyersoft/books/Umd$UMDDecoder;->decode(Ljava/io/File;Z)Lcom/flyersoft/books/Umd$UMD_Info;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    .line 56
    invoke-virtual {p1}, Lcom/flyersoft/books/Umd$UMD_Info;->getGender()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Lcom/flyersoft/books/Umd$UMD_Info;->getGender()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_0

    .line 57
    iget-object p1, p0, Lcom/flyersoft/books/Umd;->categories:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p2}, Lcom/flyersoft/books/Umd$UMD_Info;->getGender()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p1

    const/4 p2, 0x0

    .line 59
    iput-boolean p2, p0, Lcom/flyersoft/books/Umd;->inited:Z

    .line 60
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 2

    .line 68
    const-string v0, ""

    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v1}, Lcom/flyersoft/books/Umd$UMD_Info;->getAuthor()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v1}, Lcom/flyersoft/books/Umd$UMD_Info;->getAuthor()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v0

    :catch_0
    move-exception v1

    .line 70
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 1

    .line 78
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v0}, Lcom/flyersoft/books/Umd$UMD_Info;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v0}, Lcom/flyersoft/books/Umd$UMD_Info;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Umd;->umd_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 80
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/books/Umd;->umd_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 4

    if-ltz p1, :cond_2

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 95
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    const-string v1, "UN_LOAD_TAG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 96
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v1, p0, Lcom/flyersoft/books/Umd;->decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

    .line 97
    invoke-virtual {v1, p1}, Lcom/flyersoft/books/Umd$UMDDecoder;->getChapterText(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u2029"

    const-string v3, "\n"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 101
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    .line 93
    :cond_2
    :goto_0
    const-string p1, ""

    return-object p1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/flyersoft/books/Umd;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Umd;->chapters:Ljava/util/ArrayList;

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 108
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/books/Umd;->decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

    iget-object v2, v2, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 109
    iget-object v2, p0, Lcom/flyersoft/books/Umd;->decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

    iget-object v2, v2, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/Umd$ChapterPosition;

    .line 111
    iget v3, v2, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    const/4 v3, 0x0

    goto :goto_2

    .line 113
    :cond_0
    iget v3, v2, Lcom/flyersoft/books/Umd$ChapterPosition;->end:I

    if-ne v3, v4, :cond_1

    .line 114
    iget-object v3, p0, Lcom/flyersoft/books/Umd;->decoder:Lcom/flyersoft/books/Umd$UMDDecoder;

    iget-object v3, v3, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v2, v2, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    goto :goto_1

    .line 116
    :cond_1
    iget v3, v2, Lcom/flyersoft/books/Umd$ChapterPosition;->end:I

    iget v2, v2, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    :goto_1
    sub-int/2addr v3, v2

    .line 118
    :goto_2
    iget-object v2, p0, Lcom/flyersoft/books/Umd;->chapters:Ljava/util/ArrayList;

    new-instance v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v5, p0, Lcom/flyersoft/books/Umd;->umd_info:Lcom/flyersoft/books/Umd$UMD_Info;

    .line 119
    invoke-virtual {v5}, Lcom/flyersoft/books/Umd$UMD_Info;->getChapterTitles()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/String;

    const-string v8, "UN_LOAD_TAG"

    int-to-long v9, v3

    const/4 v7, 0x0

    move-object v5, p0

    invoke-direct/range {v4 .. v10}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 118
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    move-object v5, p0

    .line 125
    iget-object v0, v5, Lcom/flyersoft/books/Umd;->chapters:Ljava/util/ArrayList;

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

    const/4 v0, 0x0

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
    .locals 5

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 130
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

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

    .line 135
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

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
    .locals 6

    .line 142
    iget-wide v0, p0, Lcom/flyersoft/books/Umd;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 143
    iput-wide v2, p0, Lcom/flyersoft/books/Umd;->totalSize:J

    .line 144
    invoke-virtual {p0}, Lcom/flyersoft/books/Umd;->getChapters()Ljava/util/ArrayList;

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

    .line 145
    iget-wide v2, p0, Lcom/flyersoft/books/Umd;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Umd;->totalSize:J

    goto :goto_0

    .line 147
    :cond_0
    iget-wide v0, p0, Lcom/flyersoft/books/Umd;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isHtml()Z
    .locals 1

    .line 162
    iget-boolean v0, p0, Lcom/flyersoft/books/Umd;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 152
    iget-boolean v0, p0, Lcom/flyersoft/books/Umd;->inited:Z

    return v0
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 167
    iget-boolean v0, p0, Lcom/flyersoft/books/Umd;->showChaptersAtBegin:Z

    return v0
.end method
