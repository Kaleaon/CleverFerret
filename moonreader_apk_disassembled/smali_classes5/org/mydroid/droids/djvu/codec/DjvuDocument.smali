.class public Lorg/mydroid/droids/djvu/codec/DjvuDocument;
.super Ljava/lang/Object;
.source "DjvuDocument.java"


# instance fields
.field protected context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

.field protected documentHandle:J

.field public err:Ljava/lang/String;

.field private fileName:Ljava/lang/String;

.field public pages_alloc:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/mydroid/droids/djvu/codec/DjvuPage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/mydroid/droids/djvu/codec/DjvuContext;Ljava/lang/String;)V
    .locals 5

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 55
    iput-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    .line 57
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    .line 68
    iput-object p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    .line 69
    iput-object p2, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->fileName:Ljava/lang/String;

    .line 71
    :try_start_0
    invoke-virtual {p1}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->getContextHandle()J

    move-result-wide v2

    iget-object p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->fileName:Ljava/lang/String;

    invoke-static {v2, v3, p1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->open(JLjava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    .line 72
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "mydjvu! open document djvu"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 p1, 0x2

    aput-object p2, v2, p1

    invoke-static {v2}, Lorg/mydroid/core/codec/LOG;->d([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 75
    iput-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    .line 76
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 77
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->err:Ljava/lang/String;

    return-void
.end method

.method private static native free(J)V
.end method

.method private static native getMeta(JLjava/lang/String;)Ljava/lang/String;
.end method

.method private static native getMetaKeys(J)Ljava/lang/String;
.end method

.method private static native getPage(JI)J
.end method

.method private static native getPageCount(J)I
.end method

.method private static native getPageInfo(JIJLorg/mydroid/core/codec/CodecPageInfo;)I
.end method

.method private static native open(JLjava/lang/String;)J
.end method


# virtual methods
.method public freeDocument()V
    .locals 7

    .line 156
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    const-wide/16 v2, 0x0

    cmp-long v4, v2, v0

    if-eqz v4, :cond_1

    .line 157
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->fileName:Ljava/lang/String;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "mydjvu! recycle document djvu"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/4 v5, 0x1

    aput-object v0, v4, v5

    const/4 v0, 0x2

    aput-object v1, v4, v0

    invoke-static {v4}, Lorg/mydroid/core/codec/LOG;->d([Ljava/lang/Object;)V

    .line 160
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 162
    iget-object v4, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mydroid/droids/djvu/codec/DjvuPage;

    .line 163
    invoke-virtual {v1}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->recycle()V

    goto :goto_0

    .line 165
    :cond_0
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 167
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    invoke-static {v0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->free(J)V

    .line 168
    iput-wide v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    :cond_1
    return-void
.end method

.method public getBookAuthor()Ljava/lang/String;
    .locals 4

    .line 187
    const-string v0, "author"

    invoke-virtual {p0, v0}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "authors"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const-string v0, " "

    invoke-static {v0, v2}, Lorg/mydroid/core/codec/TxtUtils;->joinTrim(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBookMetaInformation(Ljava/lang/String;)Lorg/mydroid/core/codec/EbookMeta;
    .locals 9

    .line 37
    new-instance v0, Lorg/mydroid/core/codec/EbookMeta;

    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getBookTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getBookAuthor()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/mydroid/core/codec/EbookMeta;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPageCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mydroid/core/codec/EbookMeta;->setPagesCount(I)V

    .line 39
    const-string v1, "keywords"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mydroid/core/codec/EbookMeta;->setKeywords(Ljava/lang/String;)V

    .line 40
    const-string v1, "sequence"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "seria"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v1, 0x1

    aput-object v2, v4, v1

    const-string v2, " "

    invoke-static {v2, v4}, Lorg/mydroid/core/codec/TxtUtils;->joinTrim(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/mydroid/core/codec/EbookMeta;->setSequence(Ljava/lang/String;)V

    .line 41
    const-string v4, "subject"

    invoke-virtual {p0, v4}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "subjects"

    invoke-virtual {p0, v6}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-array v7, v3, [Ljava/lang/Object;

    aput-object v4, v7, v5

    aput-object v6, v7, v1

    invoke-static {v2, v7}, Lorg/mydroid/core/codec/TxtUtils;->joinTrim(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mydroid/core/codec/EbookMeta;->setGenre(Ljava/lang/String;)V

    .line 42
    const-string v2, "year"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mydroid/core/codec/EbookMeta;->setYear(Ljava/lang/String;)V

    .line 43
    const-string v2, "publisher"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mydroid/core/codec/EbookMeta;->setPublisher(Ljava/lang/String;)V

    .line 44
    const-string v2, "isbn"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mydroid/core/codec/EbookMeta;->setIsbn(Ljava/lang/String;)V

    .line 45
    const-string v2, "Language"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mydroid/core/codec/EbookMeta;->setLang(Ljava/lang/String;)V

    .line 46
    const-string v2, "Edition"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 47
    invoke-static {v2}, Lorg/mydroid/core/codec/TxtUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 48
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lorg/mydroid/core/codec/EbookMeta;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " - "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ed."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mydroid/core/codec/EbookMeta;->setTitle(Ljava/lang/String;)V

    .line 50
    :cond_0
    invoke-virtual {v0}, Lorg/mydroid/core/codec/EbookMeta;->getAuthor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/mydroid/core/codec/EbookMeta;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lorg/mydroid/core/codec/EbookMeta;->getPagesCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    const-string v8, "DjvuExtract"

    aput-object v8, v7, v5

    aput-object v2, v7, v1

    aput-object v4, v7, v3

    const/4 v1, 0x3

    aput-object v6, v7, v1

    const/4 v1, 0x4

    aput-object p1, v7, v1

    invoke-static {v7}, Lorg/mydroid/core/codec/LOG;->d([Ljava/lang/Object;)V

    return-object v0
.end method

.method public getBookOverview()Ljava/lang/String;
    .locals 2

    .line 23
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    const-string v1, "annotation"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    const-string v1, "Description"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    const-string v1, "summary"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    const-string v1, "comment"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    .line 30
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/mydroid/core/codec/LOG;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 32
    const-string v0, ""

    return-object v0
.end method

.method public getBookTitle()Ljava/lang/String;
    .locals 5

    .line 191
    const-string v0, "title"

    invoke-virtual {p0, v0}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "booktitle"

    invoke-virtual {p0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    const-string v0, " "

    invoke-static {v0, v3}, Lorg/mydroid/core/codec/TxtUtils;->joinTrim(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 2

    .line 61
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->fileName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 62
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMeta(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 98
    :try_start_0
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    invoke-static {v0, v1, p1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMeta(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 99
    invoke-static {p1}, Lorg/mydroid/core/codec/TxtUtils;->nullNullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception p1

    const/4 v0, 0x0

    .line 101
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lorg/mydroid/core/codec/LOG;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 102
    const-string p1, ""

    return-object p1
.end method

.method public getMetaKeys()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 108
    :try_start_0
    iget-wide v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    invoke-static {v1, v2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getMetaKeys(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    .line 109
    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "getMetaKeys"

    aput-object v3, v2, v0

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-static {v2}, Lorg/mydroid/core/codec/LOG;->d([Ljava/lang/Object;)V

    .line 110
    invoke-static {v1}, Lorg/mydroid/core/codec/TxtUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 111
    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v1

    .line 114
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v1, v0}, Lorg/mydroid/core/codec/LOG;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 116
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getOutline()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/mydroid/core/codec/OutlineLink;",
            ">;"
        }
    .end annotation

    .line 88
    :try_start_0
    new-instance v0, Lorg/mydroid/droids/djvu/codec/DjvuOutline;

    invoke-direct {v0}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;-><init>()V

    .line 89
    iget-wide v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    invoke-virtual {v0, v1, v2}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->getOutline(J)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    .line 91
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/mydroid/core/codec/LOG;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public getPage(I)Lorg/mydroid/droids/djvu/codec/DjvuPage;
    .locals 9

    .line 121
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/mydroid/droids/djvu/codec/DjvuPage;

    return-object p1

    .line 126
    :cond_0
    :try_start_0
    new-instance v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    invoke-virtual {v1}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->getContextHandle()J

    move-result-wide v1

    iget-wide v3, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    invoke-static {v3, v4, p1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPage(JI)J

    move-result-wide v5

    iget-object v8, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->fileName:Ljava/lang/String;

    move v7, p1

    invoke-direct/range {v0 .. v8}, Lorg/mydroid/droids/djvu/codec/DjvuPage;-><init>(JJJILjava/lang/String;)V

    .line 127
    iget-object p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->pages_alloc:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    move-object p1, v0

    const/4 v0, 0x0

    .line 130
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lorg/mydroid/core/codec/LOG;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public getPageCount()I
    .locals 2

    .line 137
    :try_start_0
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    invoke-static {v0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPageCount(J)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    .line 139
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/mydroid/core/codec/LOG;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    return v0
.end method

.method public getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;
    .locals 6

    .line 145
    new-instance v5, Lorg/mydroid/core/codec/CodecPageInfo;

    invoke-direct {v5}, Lorg/mydroid/core/codec/CodecPageInfo;-><init>()V

    .line 146
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    iget-object v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    invoke-virtual {v2}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->getContextHandle()J

    move-result-wide v3

    move v2, p1

    invoke-static/range {v0 .. v5}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPageInfo(JIJLorg/mydroid/core/codec/CodecPageInfo;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 150
    :cond_0
    new-instance p1, Lorg/mydroid/core/codec/DjvuPageInfo;

    invoke-direct {p1, v5}, Lorg/mydroid/core/codec/DjvuPageInfo;-><init>(Lorg/mydroid/core/codec/CodecPageInfo;)V

    return-object p1
.end method

.method public isValid()Z
    .locals 5

    .line 83
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->documentHandle:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
