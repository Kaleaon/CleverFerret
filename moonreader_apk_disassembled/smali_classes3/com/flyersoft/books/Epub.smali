.class public Lcom/flyersoft/books/Epub;
.super Lcom/flyersoft/books/BaseEBook;
.source "Epub.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/Epub$Reference;,
        Lcom/flyersoft/books/Epub$FontItem;
    }
.end annotation


# instance fields
.field private final ADITIONAL_TEXT_TAG:Ljava/lang/String;

.field audioContents:[Ljava/lang/String;

.field audioFiles:[Ljava/lang/String;

.field audioIds:[Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$AudioId;",
            ">;"
        }
    .end annotation
.end field

.field chapterPath:Ljava/lang/String;

.field chapterTagFilenameCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end field

.field private checkOpfChaptersFromHtmlDone:Z

.field private contentBeforeChapter:Ljava/lang/String;

.field private contentBeforeChapterFilename:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private contentBeforeFirstTag:Ljava/lang/String;

.field private contentBeforeFirstTagFilename:Ljava/lang/String;

.field public cssCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation
.end field

.field private cssFileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field dAudio:Landroid/graphics/drawable/Drawable;

.field dVideo:Landroid/graphics/drawable/Drawable;

.field private epub3Toc:Z

.field private epub_filename:Ljava/lang/String;

.field private fileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end field

.field private fileTexts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private filesize:J

.field private firstChapterPos:I

.field fontFileCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fontFileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fontMaps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/Epub$FontItem;",
            ">;"
        }
    .end annotation
.end field

.field private hasAddtionalText:Z

.field private has_id_str:Z

.field imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private inGetChaptersProc:Z

.field private isMobi:Z

.field private myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

.field noPath:Z

.field opfChapters_addtional:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation
.end field

.field private opfChecked:Z

.field private opfFilename:Ljava/lang/String;

.field private pureFilenameInfoCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end field

.field private references:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/Epub$Reference;",
            ">;"
        }
    .end annotation
.end field

.field private tocBasePath:Ljava/lang/String;

.field private tocEpub3Inited:Z

.field private tocFilename:Ljava/lang/String;

.field private tocFilenameEpub3:Ljava/lang/String;

.field private tocHtmlFileForOpf:Ljava/lang/String;

.field private tocInited:Z

.field private usedHtml:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$mcheckDownloadBooCover2(Lcom/flyersoft/books/Epub;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->checkDownloadBooCover2(Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 52
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 593
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->opfChecked:Z

    .line 900
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->hasAddtionalText:Z

    .line 901
    const-string v1, "#MORE#"

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->ADITIONAL_TEXT_TAG:Ljava/lang/String;

    .line 982
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->checkOpfChaptersFromHtmlDone:Z

    .line 1056
    iput v0, p0, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    const/4 v1, 0x0

    .line 1180
    iput-object v1, p0, Lcom/flyersoft/books/Epub;->chapterPath:Ljava/lang/String;

    .line 1181
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    .line 1182
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    .line 2015
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->inGetChaptersProc:Z

    .line 2799
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->cssCache:Ljava/util/HashMap;

    .line 2806
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->fontFileCache:Ljava/util/HashMap;

    .line 54
    iput-object p1, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/tmp.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    .line 56
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->inited:Z

    const-wide/16 v1, -0x1

    .line 57
    iput-wide v1, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    const/4 v1, 0x1

    .line 58
    iput-boolean v1, p0, Lcom/flyersoft/books/Epub;->isHtml:Z

    .line 59
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->showChaptersAtBegin:Z

    .line 60
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->has_id_str:Z

    .line 62
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 63
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 65
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/Epub;->filesize:J

    .line 66
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/flyersoft/books/Epub;->isMobi:Z

    .line 70
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v2, :cond_1

    goto :goto_1

    .line 82
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    goto :goto_2

    :catch_0
    move-exception v2

    .line 84
    :try_start_2
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 85
    invoke-static {p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper2(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    .line 86
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    .line 89
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->fileList:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 93
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    .line 95
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_1
    return-void

    .line 97
    :cond_3
    invoke-direct {p0, v1}, Lcom/flyersoft/books/Epub;->checkDownloadBookCover(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 105
    iput-boolean v1, p0, Lcom/flyersoft/books/Epub;->inited:Z

    return-void

    .line 99
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "**ERROR BOOK***"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 100
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Epub;->errMsg:Ljava/lang/String;

    .line 101
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void

    :catchall_1
    move-exception p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->errMsg:Ljava/lang/String;

    .line 73
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 108
    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;-><init>()V

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 593
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->opfChecked:Z

    .line 900
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->hasAddtionalText:Z

    .line 901
    const-string v1, "#MORE#"

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->ADITIONAL_TEXT_TAG:Ljava/lang/String;

    .line 982
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->checkOpfChaptersFromHtmlDone:Z

    .line 1056
    iput v0, p0, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    const/4 v1, 0x0

    .line 1180
    iput-object v1, p0, Lcom/flyersoft/books/Epub;->chapterPath:Ljava/lang/String;

    .line 1181
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    .line 1182
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    .line 2015
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->inGetChaptersProc:Z

    .line 2799
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->cssCache:Ljava/util/HashMap;

    .line 2806
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->fontFileCache:Ljava/util/HashMap;

    .line 109
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->inited:Z

    .line 111
    :try_start_0
    iput-object p1, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    .line 113
    invoke-static {p1, p2}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper(Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    .line 114
    invoke-direct {p0, p2}, Lcom/flyersoft/books/Epub;->getChaptersFromOpf(Z)V

    .line 115
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->checkDownloadBookCover(Z)V

    const/4 p1, 0x1

    .line 116
    iput-boolean p1, p0, Lcom/flyersoft/books/Epub;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 118
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 119
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->inited:Z

    return-void
.end method

.method private addEpub3NCXChapters(Lorg/w3c/dom/Node;ILjava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Node;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 512
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 513
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 514
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "a"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 515
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    const-string v4, "href"

    invoke-interface {v0, v4}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    .line 516
    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 517
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-nez v4, :cond_0

    const-string v3, ""

    goto :goto_1

    .line 518
    :cond_0
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-interface {v3, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    .line 519
    :goto_1
    invoke-direct {p0, v0, v3}, Lcom/flyersoft/books/Epub;->getChapter(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 521
    iput p2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    .line 522
    iget-object v3, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v4, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 523
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 525
    :cond_1
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ol"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    if-eqz v0, :cond_2

    .line 527
    iput-boolean v4, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    .line 528
    :cond_2
    iput-boolean v4, p0, Lcom/flyersoft/books/Epub;->treeTOC:Z

    const/4 v4, 0x0

    .line 529
    :goto_2
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 530
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "li"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 531
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    add-int/lit8 v6, p2, 0x1

    invoke-direct {p0, v5, v6, p3}, Lcom/flyersoft/books/Epub;->addEpub3NCXChapters(Lorg/w3c/dom/Node;ILjava/util/ArrayList;)V

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_4
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_5
    return-void
.end method

.method private addNCXChapters(Lorg/w3c/dom/Node;Ljava/lang/String;I)V
    .locals 12

    .line 537
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "content"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 538
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "navlabel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 539
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "navpoint"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 545
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 546
    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    const/4 v9, 0x1

    if-ge v6, v8, :cond_3

    .line 547
    invoke-interface {p1, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 548
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    if-nez v4, :cond_0

    .line 549
    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 550
    invoke-direct {p0, v8}, Lcom/flyersoft/books/Epub;->getCFilename(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 551
    :cond_0
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 552
    invoke-direct {p0, v8, p2}, Lcom/flyersoft/books/Epub;->getCName(Lorg/w3c/dom/Node;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 553
    :cond_1
    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 555
    iput-boolean v9, p0, Lcom/flyersoft/books/Epub;->treeTOC:Z

    const/4 v7, 0x1

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 559
    :cond_3
    invoke-direct {p0, v4, v3}, Lcom/flyersoft/books/Epub;->getChapter(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 561
    iput p3, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    .line 562
    iget-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v3, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 563
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 564
    iput-boolean v9, p0, Lcom/flyersoft/books/Epub;->showChaptersAtBegin:Z

    :cond_4
    if-eqz v7, :cond_6

    .line 568
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge v5, v0, :cond_6

    .line 569
    invoke-interface {p1, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 570
    invoke-interface {p1, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    add-int/lit8 v1, p3, 0x1

    invoke-direct {p0, v0, p2, v1}, Lcom/flyersoft/books/Epub;->addNCXChapters(Lorg/w3c/dom/Node;Ljava/lang/String;I)V

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_6
    return-void
.end method

.method private adjustOpfChapter(Lcom/flyersoft/books/BaseEBook$Chapter;)Lcom/flyersoft/books/BaseEBook$Chapter;
    .locals 4

    .line 1030
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->allCharsAreNumber(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1032
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->references:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 1033
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/Epub$Reference;

    .line 1034
    iget-object v2, v1, Lcom/flyersoft/books/Epub$Reference;->href:Ljava/lang/String;

    iget-object v3, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/flyersoft/books/Epub$Reference;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    .line 1035
    iget-object v0, v1, Lcom/flyersoft/books/Epub$Reference;->title:Ljava/lang/String;

    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    return-object p1

    .line 1038
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_3

    .line 1039
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 1040
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getHtmlTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1041
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getBookName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception v0

    .line 1044
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    return-object p1
.end method

.method private chapterFilenameUsed(Lcom/flyersoft/books/BaseEBook$Chapter;)Z
    .locals 3

    .line 970
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 971
    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private checkAdditioanlHtmlFiles()V
    .locals 11

    .line 1115
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->opfChecked:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getOpfFilename()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1116
    invoke-direct {p0, v1}, Lcom/flyersoft/books/Epub;->getChaptersFromOpf(Z)V

    .line 1118
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 1120
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1121
    iget-object v3, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/flyersoft/books/Epub;->isHtmlFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1122
    iget-object v3, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    new-instance v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    const-string v8, "UN_LOAD_TAG"

    iget-wide v9, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    move-object v5, p0

    invoke-direct/range {v4 .. v10}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    move-object v5, p0

    goto :goto_0

    :cond_2
    move-object v5, p0

    const/4 v0, 0x0

    .line 1124
    iput-object v0, v5, Lcom/flyersoft/books/Epub;->fileTexts:Ljava/util/HashMap;

    return-void
.end method

.method private checkChapterAdditionalText(Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;IIZZ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            "IIZZ)V"
        }
    .end annotation

    move v0, p3

    move/from16 v1, p4

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eqz p5, :cond_0

    if-gt v1, v0, :cond_1

    :cond_0
    if-eq v0, v2, :cond_10

    if-eq v1, v2, :cond_10

    sub-int v4, v1, v0

    if-le v4, v3, :cond_10

    .line 907
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v5, v0, 0x1

    :goto_0
    if-ge v5, v1, :cond_d

    if-ltz v5, :cond_c

    .line 910
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v3

    if-le v5, v6, :cond_2

    goto/16 :goto_3

    .line 913
    :cond_2
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/books/BaseEBook$Chapter;

    if-nez p6, :cond_3

    .line 914
    invoke-direct {p0, v6}, Lcom/flyersoft/books/Epub;->chapterFilenameUsed(Lcom/flyersoft/books/BaseEBook$Chapter;)Z

    move-result v7

    if-eqz v7, :cond_3

    goto/16 :goto_3

    :cond_3
    if-nez p6, :cond_4

    if-nez p5, :cond_4

    sub-int v7, v1, v0

    const/4 v8, 0x3

    if-le v7, v8, :cond_4

    const/4 v7, 0x1

    goto :goto_1

    :cond_4
    const/4 v7, 0x0

    :goto_1
    if-nez p5, :cond_5

    if-nez p6, :cond_5

    .line 920
    iget-boolean v8, p0, Lcom/flyersoft/books/Epub;->isMobi:Z

    if-eqz v8, :cond_5

    .line 922
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getUsedHtml()Ljava/util/ArrayList;

    move-result-object v8

    iget-object v9, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v8

    if-ne v8, v2, :cond_c

    :cond_5
    if-nez p6, :cond_6

    .line 924
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getUsedHtml()Ljava/util/ArrayList;

    move-result-object v8

    iget-object v9, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-nez p5, :cond_6

    .line 926
    iget-object v8, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v9, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 927
    iget-wide v8, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    iget-wide v10, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v8, v10

    iput-wide v8, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    :cond_6
    if-nez v7, :cond_a

    .line 931
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<a name="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 932
    iget-object v7, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-direct {p0, v7}, Lcom/flyersoft/books/Epub;->getChapterHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-lez v5, :cond_8

    .line 933
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x64

    if-gt v8, v9, :cond_7

    invoke-static {v7}, Lcom/flyersoft/tools/T;->html2Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_8

    .line 934
    :cond_7
    const-string v8, "<hr2>"

    goto :goto_2

    :cond_8
    const-string v8, ""

    .line 935
    :goto_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p5, :cond_c

    .line 938
    iget-object v7, p0, Lcom/flyersoft/books/Epub;->contentBeforeChapterFilename:Ljava/util/ArrayList;

    if-nez v7, :cond_9

    .line 939
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/flyersoft/books/Epub;->contentBeforeChapterFilename:Ljava/util/ArrayList;

    .line 940
    :cond_9
    iget-object v7, p0, Lcom/flyersoft/books/Epub;->contentBeforeChapterFilename:Ljava/util/ArrayList;

    iget-object v8, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    .line 941
    iget-object v7, p0, Lcom/flyersoft/books/Epub;->contentBeforeChapterFilename:Ljava/util/ArrayList;

    iget-object v6, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 944
    :cond_a
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-nez v6, :cond_b

    .line 945
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "#MORE#_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "|"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 946
    :cond_b
    iput-boolean v3, p0, Lcom/flyersoft/books/Epub;->hasAddtionalText:Z
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    :cond_c
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 955
    :catch_0
    :cond_d
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-le p1, v3, :cond_10

    if-eqz p5, :cond_e

    .line 957
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Epub;->contentBeforeChapter:Ljava/lang/String;

    goto :goto_5

    :cond_e
    if-eqz p6, :cond_f

    .line 959
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_4

    :cond_f
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_4
    iput-object p1, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_5

    .line 964
    :catch_1
    const-string p1, "#ERROR#"

    iput-object p1, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    :cond_10
    :goto_5
    return-void
.end method

.method private checkDownloadBooCover2(Z)V
    .locals 8

    .line 2273
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getCoverFile()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 2277
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_2.png"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_1

    .line 2279
    const-string v2, ""

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2281
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 2282
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 2284
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v4, ".svg"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v0, :cond_2

    .line 2285
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getSvgDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    .line 2287
    :cond_2
    invoke-static {v3, v5, v4}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2288
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-static {v0, v3, p1}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V

    .line 2289
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "extract cover time:"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v0, v4, [Ljava/lang/Object;

    aput-object p1, v0, v5

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method private checkDownloadBookCover(Z)V
    .locals 3

    .line 2248
    :try_start_0
    sget v0, Lcom/flyersoft/tools/A;->rebuild_cover_size:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_1

    .line 2249
    const-string v0, "/"

    if-nez p1, :cond_0

    .line 2250
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

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

    .line 2252
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_2.png"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    .line 2257
    new-instance p1, Lcom/flyersoft/books/Epub$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/Epub$4;-><init>(Lcom/flyersoft/books/Epub;)V

    const/4 v0, 0x1

    .line 2263
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 2264
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void

    :cond_2
    const/4 p1, 0x0

    .line 2266
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->checkDownloadBooCover2(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 2268
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private checkOpfChaptersFromHtml(Ljava/util/ArrayList;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;)V"
        }
    .end annotation

    .line 984
    const-string v0, "\r"

    const-string v1, "/"

    const-string v2, ""

    const-string v3, "\n"

    iget-boolean v4, p0, Lcom/flyersoft/books/Epub;->checkOpfChaptersFromHtmlDone:Z

    if-eqz v4, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v4, 0x1

    .line 986
    iput-boolean v4, p0, Lcom/flyersoft/books/Epub;->checkOpfChaptersFromHtmlDone:Z

    .line 988
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocHtmlFileForOpf()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 991
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocHtmlFileForOpf()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 990
    invoke-static {v5}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    .line 992
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const v7, 0xc350

    if-ge v6, v7, :cond_3

    .line 993
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 994
    iget-object v7, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    .line 995
    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_2

    .line 996
    invoke-virtual {v7, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    add-int/2addr v8, v4

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 997
    :cond_2
    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v9, :cond_1

    .line 999
    invoke-virtual {v5, v3, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v8

    .line 1000
    invoke-virtual {v5, v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v10

    const/4 v11, 0x2

    if-le v8, v11, :cond_1

    if-lez v10, :cond_1

    add-int/lit8 v8, v8, 0x1

    .line 1002
    invoke-virtual {v5, v8, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 1003
    iget-object v8, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v8, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 1005
    iget-object v8, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_1

    .line 1006
    const-string v8, ">"

    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    .line 1007
    const-string v10, "</a>"

    invoke-virtual {v5, v10, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    if-eq v8, v9, :cond_1

    if-eq v7, v9, :cond_1

    if-le v7, v8, :cond_1

    add-int/lit8 v8, v8, 0x1

    .line 1009
    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 1010
    iget-object v7, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v7, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    :cond_3
    :goto_1
    return-void
.end method

.method private clearChapterContents()V
    .locals 3

    .line 2017
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->inGetChaptersProc:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 2020
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2021
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->unload_Tag:Ljava/lang/String;

    iput-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2022
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    if-eqz v0, :cond_2

    .line 2023
    invoke-virtual {v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->clear()V

    :cond_2
    :goto_1
    return-void
.end method

.method private deleteBrokenChapters()V
    .locals 3

    .line 1097
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 1098
    iget-boolean v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->brokenChapter:Z

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-le v1, v0, :cond_3

    .line 1100
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    .line 1101
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_3

    .line 1102
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-boolean v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->brokenChapter:Z

    if-eqz v1, :cond_2

    .line 1103
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method private extractSeries(Lorg/w3c/dom/NodeList;)V
    .locals 17

    move-object/from16 v0, p0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 834
    :goto_0
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v3, v6, :cond_9

    move-object/from16 v6, p1

    .line 835
    invoke-interface {v6, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    .line 839
    :goto_1
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v12

    if-ge v8, v12, :cond_8

    .line 840
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v12

    .line 842
    const-string v13, "property"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    const-string v14, ">"

    const-string v15, "<"

    const-string v1, "#"

    const/16 v16, 0x1

    if-eqz v13, :cond_2

    .line 843
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v13

    invoke-interface {v13, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v13

    invoke-interface {v13}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v13

    .line 844
    const-string v2, "belongs-to-collection"

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 846
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v11

    .line 847
    invoke-static {v11}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 848
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 849
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 850
    iget-object v5, v0, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_2
    const/4 v5, 0x1

    goto :goto_3

    .line 852
    :cond_1
    const-string v2, "group-position"

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 854
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v11

    .line 855
    invoke-static {v11}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 856
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_2
    :goto_3
    if-nez v5, :cond_5

    .line 861
    const-string v2, "name"

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 862
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 863
    const-string v12, "calibre:series"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    const/4 v9, 0x1

    goto :goto_4

    .line 865
    :cond_3
    const-string v12, "calibre:series_index"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v10, 0x1

    goto :goto_4

    .line 867
    :cond_4
    const-string v2, "content"

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 868
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    move-object v11, v2

    :cond_5
    :goto_4
    if-eqz v9, :cond_6

    .line 870
    invoke-static {v11}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 871
    iget-object v1, v0, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_6
    if-nez v4, :cond_7

    if-eqz v10, :cond_7

    if-eqz v11, :cond_7

    .line 873
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v4, v1

    :cond_7
    :goto_5
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 876
    :cond_9
    iget-object v1, v0, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_a

    if-eqz v4, :cond_a

    .line 877
    iget-object v1, v0, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a
    return-void
.end method

.method private fileInList(Ljava/lang/String;Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 2793
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2794
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private getAdditionalText(Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;
    .locals 10

    .line 1512
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    .line 1513
    const-string v1, "#MORE#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1514
    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const-string v2, "|"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1515
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 1516
    iget-object v4, p0, Lcom/flyersoft/books/Epub;->opfChapters_addtional:Ljava/util/ArrayList;

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v3, p0

    move-object v5, p1

    invoke-direct/range {v3 .. v9}, Lcom/flyersoft/books/Epub;->checkChapterAdditionalText(Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;IIZZ)V

    goto :goto_0

    :cond_0
    move-object v5, p1

    .line 1517
    const-string p1, "#ERROR#"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1518
    const-string p1, ""

    return-object p1

    .line 1519
    :cond_1
    :goto_0
    iget-object p1, v5, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    return-object p1
.end method

.method private getBookCoverGuess()Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;
    .locals 4

    .line 2323
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

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

    .line 2324
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2325
    const-string v3, "cover"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2326
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2327
    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ".jpeg"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_1
    return-object v1

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private getBookCoverItem()Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;
    .locals 12

    .line 2335
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getOpfFilename()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 2337
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v2, v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 2339
    invoke-direct {p0, v0, v2}, Lcom/flyersoft/books/Epub;->getEpub3CoverItem(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    .line 2343
    :cond_1
    const-string v0, "type=\"cover\""

    const-string v3, "<reference "

    invoke-virtual {p0, v3, v0, v2}, Lcom/flyersoft/books/Epub;->getHtmlForTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2344
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    .line 2345
    const-string v0, "type=\"coverimagestandard\""

    invoke-virtual {p0, v3, v0, v2}, Lcom/flyersoft/books/Epub;->getHtmlForTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2346
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    .line 2347
    const-string v0, "type=\"other.ms-coverimage-standard\""

    invoke-virtual {p0, v3, v0, v2}, Lcom/flyersoft/books/Epub;->getHtmlForTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2361
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "href=\".*?\""

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v3, :cond_a

    .line 2362
    const-string v0, "<meta "

    const-string v3, "name=\"cover\""

    invoke-virtual {p0, v0, v3, v2}, Lcom/flyersoft/books/Epub;->getHtmlForTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2364
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const-string v7, "\""

    const-string v8, ">"

    if-lez v3, :cond_4

    .line 2365
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2366
    invoke-virtual {v2, v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2367
    const-string v3, "content="

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_4

    add-int/lit8 v9, v3, 0x9

    add-int/lit8 v3, v3, 0xa

    .line 2369
    invoke-virtual {v0, v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v0, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2370
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v9, "id=\""

    invoke-direct {v3, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "<item "

    invoke-virtual {p0, v3, v0, v2}, Lcom/flyersoft/books/Epub;->getHtmlForTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2372
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4

    .line 2373
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2374
    invoke-virtual {v2, v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2375
    const-string v3, "href="

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_4

    add-int/lit8 v1, v3, 0x6

    add-int/lit8 v3, v3, 0x7

    .line 2377
    invoke-virtual {v0, v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2378
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    return-object v0

    .line 2385
    :cond_4
    const-string v3, "idref=\"coverpage\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v9, -0x1

    if-ne v3, v9, :cond_5

    .line 2387
    const-string v3, "idref=\"cover\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 2388
    :cond_5
    const-string v10, "<"

    if-eq v3, v9, :cond_6

    .line 2389
    invoke-virtual {v2, v10, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v11

    .line 2390
    invoke-virtual {v2, v8, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v11, v9, :cond_6

    if-eq v3, v9, :cond_6

    .line 2392
    invoke-virtual {v2, v11, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2393
    invoke-static {v4, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2397
    :cond_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_8

    .line 2398
    const-string v3, "id=\"coverpage\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v9, :cond_7

    .line 2400
    const-string v3, "id=\"cover\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    :cond_7
    if-eq v3, v9, :cond_8

    .line 2402
    invoke-virtual {v2, v10, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v11

    .line 2403
    invoke-virtual {v2, v8, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v11, v9, :cond_8

    if-eq v3, v9, :cond_8

    .line 2405
    invoke-virtual {v2, v11, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2406
    invoke-static {v4, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2411
    :cond_8
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_9

    .line 2412
    const-string v3, " idref=\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v9, :cond_9

    add-int/lit8 v11, v3, 0x7

    add-int/lit8 v3, v3, 0x8

    .line 2415
    invoke-virtual {v2, v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v3, v9, :cond_9

    add-int/2addr v3, v5

    .line 2417
    invoke-virtual {v2, v11, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 2418
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v11, " id="

    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v9, :cond_9

    .line 2420
    invoke-virtual {v2, v10, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    .line 2421
    invoke-virtual {v2, v8, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 2422
    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2423
    invoke-static {v4, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x1

    .line 2430
    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_b

    return-object v1

    .line 2433
    :cond_a
    invoke-static {v4, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2435
    :cond_b
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v5

    const/4 v3, 0x6

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2436
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v2

    if-nez v2, :cond_c

    .line 2438
    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v2

    :cond_c
    if-nez v2, :cond_d

    return-object v1

    .line 2441
    :cond_d
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 2442
    const-string v3, ".jpg"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_14

    const-string v4, ".jpeg"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_14

    const-string v7, ".png"

    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    goto/16 :goto_0

    :cond_e
    if-eqz v6, :cond_f

    .line 2445
    iget-wide v8, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    const-wide/16 v10, 0x5dc

    cmp-long v0, v8, v10

    if-lez v0, :cond_f

    return-object v1

    .line 2447
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    iget-object v2, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 2450
    const-string v2, "<image .*?>"

    invoke-static {v2, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2451
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v8, 0xc

    const-string v9, "xlink:href=\".*?\""

    if-lez v6, :cond_10

    .line 2452
    invoke-static {v9, v2}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2453
    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2454
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_13

    .line 2455
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v5

    invoke-virtual {v0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    return-object v0

    .line 2458
    :cond_10
    const-string v2, "<img .*?>"

    invoke-static {v2, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2459
    const-string v6, "src=\".*?\""

    invoke-static {v6, v2}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2460
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_11

    .line 2461
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v5

    const/4 v1, 0x5

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    return-object v0

    .line 2463
    :cond_11
    invoke-static {v9, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2464
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_13

    .line 2465
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v5

    invoke-virtual {v0, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2466
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_12

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_12

    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 2467
    :cond_12
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    return-object v0

    :cond_13
    return-object v1

    :cond_14
    :goto_0
    return-object v2
.end method

.method private getCFilename(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1155
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1156
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 1157
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 1158
    const-string v3, "src"

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getCName(Lorg/w3c/dom/Node;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1166
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "text"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1167
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    const/4 v0, 0x0

    .line 1168
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1169
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 1170
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1171
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1172
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1175
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getCSS(I)V
    .locals 16

    move-object/from16 v0, p0

    .line 2623
    invoke-virtual {v0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    move/from16 v2, p1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v2, 0x0

    .line 2624
    iput-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    .line 2628
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2629
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 2631
    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 2632
    iget-object v6, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-direct {v0, v6, v5}, Lcom/flyersoft/books/Epub;->fileInList(Ljava/lang/String;Ljava/util/ArrayList;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 2633
    iget-object v6, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2635
    :cond_0
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_b

    .line 2636
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v6, v2

    move-object v8, v6

    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 2637
    invoke-virtual {v0, v9}, Lcom/flyersoft/books/Epub;->getSingleFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2638
    invoke-static {v10}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 2640
    invoke-static {v10}, Lcom/flyersoft/tools/T;->getLowerCaseIfSameLen(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    .line 2643
    :goto_1
    const-string v12, "rel=\"stylesheet\""

    invoke-virtual {v10, v12, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    const/4 v12, -0x1

    .line 2644
    const-string v13, ">"

    const-string v14, "\""

    if-lez v11, :cond_4

    add-int/lit8 v15, v11, 0x1

    .line 2646
    const-string v7, "<"

    invoke-virtual {v10, v7, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v10, v13, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v10, v7, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 2647
    const-string v11, "href=\""

    invoke-virtual {v7, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    if-lez v11, :cond_3

    add-int/lit8 v11, v11, 0x6

    .line 2650
    invoke-virtual {v7, v14, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v13

    invoke-virtual {v7, v11, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 2651
    const-string v11, "/"

    invoke-virtual {v7, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    if-ne v13, v12, :cond_2

    .line 2652
    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 2653
    invoke-static {v12}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 2654
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2656
    :cond_2
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 2657
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    move v11, v15

    goto :goto_1

    .line 2663
    :cond_4
    const-string v7, "<style"

    invoke-virtual {v10, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_6

    .line 2665
    const-string v9, "</style>"

    invoke-virtual {v10, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-le v9, v7, :cond_6

    .line 2667
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v15, 0x5dc

    if-gt v11, v15, :cond_5

    invoke-static {v10}, Lcom/flyersoft/tools/T;->getHtmlBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/flyersoft/tools/T;->html2Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_6

    .line 2668
    :cond_5
    invoke-virtual {v10, v13, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v10, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2671
    :cond_6
    const-string v7, "<body"

    invoke-virtual {v10, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-eq v9, v12, :cond_1

    .line 2673
    invoke-virtual {v10, v13, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    .line 2674
    invoke-virtual {v10, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 2675
    const-string v11, "class=\""

    invoke-virtual {v9, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    if-lez v11, :cond_8

    .line 2678
    const-string v12, "</body"

    invoke-virtual {v10, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v10, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v15

    if-le v13, v15, :cond_7

    .line 2679
    invoke-virtual {v10, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v10, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v10, v7, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Lcom/flyersoft/books/Epub;->ifHasImageOnly(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_7

    goto :goto_2

    :cond_7
    add-int/lit8 v11, v11, 0x7

    .line 2682
    invoke-virtual {v9, v14, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 2683
    invoke-virtual {v9, v11, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 2686
    :cond_8
    :goto_2
    const-string v7, "id=\""

    invoke-virtual {v9, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_9

    add-int/lit8 v7, v7, 0x4

    .line 2689
    invoke-virtual {v9, v14, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    .line 2690
    invoke-virtual {v9, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 2692
    :cond_9
    const-string v7, "style=\""

    invoke-virtual {v9, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_1

    add-int/lit8 v7, v7, 0x7

    .line 2695
    invoke-virtual {v9, v14, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    .line 2696
    invoke-virtual {v9, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    goto/16 :goto_0

    :cond_a
    move-object v5, v6

    const/4 v6, 0x0

    goto :goto_4

    .line 2702
    :cond_b
    invoke-direct {v0}, Lcom/flyersoft/books/Epub;->getCssFileList()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_d

    .line 2703
    invoke-direct {v0}, Lcom/flyersoft/books/Epub;->getCssFileList()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 2704
    const-string v7, "stylesheet.css"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 2705
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2709
    :cond_d
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_e

    invoke-direct {v0}, Lcom/flyersoft/books/Epub;->getCssFileList()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_e

    .line 2710
    invoke-direct {v0}, Lcom/flyersoft/books/Epub;->getCssFileList()Ljava/util/ArrayList;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_e
    const/4 v6, 0x0

    :goto_3
    move-object v5, v2

    move-object v8, v5

    .line 2713
    :goto_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v7

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-nez v9, :cond_f

    goto :goto_5

    :cond_f
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v6

    :goto_5
    add-int/2addr v7, v6

    .line 2715
    iget-object v6, v0, Lcom/flyersoft/books/Epub;->cssCache:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    .line 2716
    iget-object v3, v0, Lcom/flyersoft/books/Epub;->cssCache:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 2717
    iget-object v4, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    iput-object v4, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    .line 2718
    iget-object v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    iput-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    .line 2719
    iput-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_class:Ljava/lang/String;

    .line 2720
    iput-object v5, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_id:Ljava/lang/String;

    .line 2721
    iput-object v8, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_style:Ljava/lang/String;

    return-void

    .line 2726
    :cond_10
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 2727
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const-string v9, ""

    :cond_11
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const-string v11, "\n"

    if-eqz v10, :cond_14

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 2728
    invoke-direct {v0, v10, v6}, Lcom/flyersoft/books/Epub;->fileInList(Ljava/lang/String;Ljava/util/ArrayList;)Z

    move-result v12

    if-eqz v12, :cond_12

    goto :goto_6

    .line 2731
    :cond_12
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2732
    invoke-virtual {v0, v10}, Lcom/flyersoft/books/Epub;->getSingleFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2733
    invoke-static {v10}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_11

    .line 2734
    invoke-direct {v0, v10, v6}, Lcom/flyersoft/books/Epub;->getCssText(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v10

    .line 2735
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2736
    iget-object v11, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    if-nez v11, :cond_13

    new-instance v11, Lcom/flyersoft/components/CSS;

    invoke-direct {v11, v10}, Lcom/flyersoft/components/CSS;-><init>(Ljava/lang/String;)V

    iput-object v11, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    goto :goto_6

    .line 2737
    :cond_13
    iget-object v11, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    invoke-virtual {v11, v10}, Lcom/flyersoft/components/CSS;->scanTextForStyles(Ljava/lang/String;)V

    goto :goto_6

    .line 2741
    :cond_14
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_16

    .line 2742
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2743
    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    if-nez v3, :cond_15

    .line 2744
    new-instance v3, Lcom/flyersoft/components/CSS;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/components/CSS;-><init>(Ljava/lang/String;)V

    iput-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    goto :goto_7

    .line 2746
    :cond_15
    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/flyersoft/components/CSS;->scanTextForStyles(Ljava/lang/String;)V

    .line 2749
    :cond_16
    :goto_7
    iput-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_class:Ljava/lang/String;

    .line 2750
    iput-object v5, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_id:Ljava/lang/String;

    .line 2751
    iput-object v8, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_style:Ljava/lang/String;

    .line 2752
    iput-object v9, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    .line 2754
    iget-object v2, v0, Lcom/flyersoft/books/Epub;->cssCache:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private getChapter(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$Chapter;
    .locals 13

    const/4 v0, 0x0

    if-eqz p1, :cond_1c

    if-nez p2, :cond_0

    goto/16 :goto_4

    .line 1188
    :cond_0
    const-string v1, "\n"

    const-string v2, ""

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "\r"

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 1190
    const-string p2, "#"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 1191
    const-string v5, "/"

    const-wide/16 v6, -0x1

    if-ne p2, v1, :cond_11

    .line 1193
    iget-object p2, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    if-eqz p2, :cond_1

    .line 1195
    iget-object p1, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1196
    iget-wide v8, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    goto :goto_0

    :cond_1
    move-wide v8, v6

    :goto_0
    cmp-long p2, v8, v6

    if-nez p2, :cond_3

    .line 1199
    iget-object p2, p0, Lcom/flyersoft/books/Epub;->tocBasePath:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->mergeFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1200
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1201
    iget-object v11, v10, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v11, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 1202
    iget-object p1, v10, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1203
    iget-wide v8, v10, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_3
    cmp-long p2, v8, v6

    if-nez p2, :cond_f

    .line 1208
    iget-object p2, p0, Lcom/flyersoft/books/Epub;->chapterPath:Ljava/lang/String;

    if-eqz p2, :cond_4

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapterPath:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_4
    move-object p2, v0

    .line 1209
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1210
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1211
    iget-boolean v12, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    if-eqz v12, :cond_6

    .line 1212
    iget-object v12, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v12, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 1213
    iget-object p1, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1214
    iget-wide v8, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    goto :goto_2

    :cond_6
    if-nez p2, :cond_7

    .line 1218
    iget-object v12, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v12, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 1219
    iget-object p1, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1220
    iget-wide v8, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    .line 1221
    iget-object v10, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iget-object v11, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v11, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v5, v4

    invoke-virtual {v10, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/flyersoft/books/Epub;->chapterPath:Ljava/lang/String;

    .line 1222
    iput-boolean v2, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    goto :goto_2

    .line 1225
    :cond_7
    iget-object v12, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v12, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 1226
    iget-object p1, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1227
    iget-wide v8, v11, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_8
    :goto_2
    cmp-long v2, v8, v6

    if-nez v2, :cond_d

    .line 1232
    iput-object v0, p0, Lcom/flyersoft/books/Epub;->chapterPath:Ljava/lang/String;

    .line 1233
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1234
    iget-boolean v5, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    if-nez v5, :cond_a

    iget-object v5, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_a
    iget-boolean v5, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    if-nez v5, :cond_b

    if-eqz p2, :cond_9

    :cond_b
    iget-object v5, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1235
    invoke-virtual {v5, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1236
    :cond_c
    iget-object p2, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/books/Epub;->noPath:Z

    .line 1237
    iget-object p1, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1238
    iget-wide v1, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    move-wide v8, v1

    :cond_d
    cmp-long p2, v8, v6

    if-nez p2, :cond_f

    .line 1242
    const-string p2, "../"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_f

    const/4 p2, 0x3

    .line 1243
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 1244
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1245
    iget-object v4, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v4, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 1246
    iget-object p1, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1247
    iget-wide v8, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_f
    move-object v4, p1

    cmp-long p1, v8, v6

    if-eqz p1, :cond_10

    .line 1253
    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    const-string v5, "UN_LOAD_TAG"

    move-object v2, p0

    move-wide v6, v8

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object p1, v1

    move-object v1, v2

    return-object p1

    :cond_10
    move-object v1, p0

    goto/16 :goto_4

    :cond_11
    move-object v1, p0

    .line 1257
    iput-boolean v4, v1, Lcom/flyersoft/books/Epub;->has_id_str:Z

    add-int/lit8 v4, p2, 0x1

    .line 1258
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 1259
    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1262
    iget-object p2, v1, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    if-eqz p2, :cond_12

    .line 1264
    iget-object p1, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1265
    iget-wide v9, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    goto :goto_3

    :cond_12
    move-wide v9, v6

    :goto_3
    cmp-long p2, v9, v6

    if-nez p2, :cond_1b

    .line 1269
    iget-object p2, v1, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    if-eqz p2, :cond_13

    .line 1271
    iget-object p1, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1272
    iget-wide v9, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_13
    cmp-long p2, v9, v6

    if-nez p2, :cond_15

    .line 1276
    iget-object p2, v1, Lcom/flyersoft/books/Epub;->tocBasePath:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->mergeFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1277
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1278
    iget-object v11, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v11, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_14

    .line 1279
    iget-object p2, v1, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1280
    iget-object p1, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1281
    iget-wide v9, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_15
    cmp-long p2, v9, v6

    if-nez p2, :cond_18

    .line 1287
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_16
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1288
    iget-object v4, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    iget-object v4, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 1289
    :cond_17
    iget-object p2, v1, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1290
    iget-object p1, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1291
    iget-wide v9, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_18
    cmp-long p2, v9, v6

    if-nez p2, :cond_1b

    .line 1298
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1299
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1300
    iget-object v11, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v11, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1a

    iget-object v11, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_19

    .line 1301
    :cond_1a
    iget-object p2, v1, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1302
    iget-object p1, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    .line 1303
    iget-wide v9, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    :cond_1b
    move-object v4, p1

    cmp-long p1, v9, v6

    if-eqz p1, :cond_1c

    .line 1311
    new-instance v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    const-string v5, "HAS_ID_TAG"

    move-object v2, p0

    move-wide v6, v9

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1312
    iput-object v8, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    return-object v1

    :cond_1c
    :goto_4
    return-object v0
.end method

.method private getChapterHtml(I)Ljava/lang/String;
    .locals 1

    .line 1600
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->getChapterHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getChapterHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 1604
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/books/Epub;->getChapterHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getChapterHtml(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 1608
    const-string v0, ""

    .line 1610
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v1, p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 1611
    invoke-static {p1}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 1614
    :goto_0
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 1616
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_1
    if-eqz p2, :cond_1

    .line 1619
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getHtmlBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private getChapterTextWithIDTag(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 1321
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/books/Epub;->getChapterTextWithIDTag(IZ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getChapterTextWithIDTag(IZ)Ljava/lang/String;
    .locals 13

    .line 1325
    const-string v0, "\'"

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 1326
    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    .line 1327
    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    .line 1330
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    const/4 v6, 0x0

    if-ge p1, v4, :cond_0

    .line 1331
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v4

    add-int/lit8 v7, p1, 0x1

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v4, v6

    .line 1333
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    invoke-virtual {p0, v2}, Lcom/flyersoft/books/Epub;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    :cond_1
    iget-object v7, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    :goto_1
    const/16 v8, 0x64

    const/4 v9, 0x0

    const/4 v10, -0x1

    if-eqz v3, :cond_3

    .line 1339
    :try_start_0
    invoke-static {v7, v3, v9}, Lcom/flyersoft/books/Epub;->getIdPosInHtml(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v11

    if-ne v11, v10, :cond_2

    .line 1341
    invoke-direct {p0, v2, v9}, Lcom/flyersoft/books/Epub;->getChapterHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v11

    .line 1342
    invoke-static {v11, v3, v9}, Lcom/flyersoft/books/Epub;->getIdPosInHtml(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v11

    if-lez v11, :cond_2

    const/4 v11, 0x0

    .line 1346
    :cond_2
    iget v12, p0, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    if-ne p1, v12, :cond_4

    if-le v11, v8, :cond_4

    const/16 v12, 0x28

    .line 1347
    invoke-direct {p0, v7, v11, v12}, Lcom/flyersoft/books/Epub;->getTextBeforeTag(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/flyersoft/books/Epub;->contentBeforeFirstTag:Ljava/lang/String;

    .line 1348
    iput-object v2, p0, Lcom/flyersoft/books/Epub;->contentBeforeFirstTagFilename:Ljava/lang/String;

    goto :goto_2

    :cond_3
    const/4 v11, 0x0

    :cond_4
    :goto_2
    if-lez v11, :cond_7

    if-lez p1, :cond_7

    .line 1352
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    add-int/lit8 v12, p1, -0x1

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    iget-object v12, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const/16 v2, 0x1f4

    if-gt v11, v2, :cond_6

    if-le v11, v8, :cond_5

    .line 1353
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v2, v2, 0x4

    if-le v11, v2, :cond_5

    goto :goto_3

    :cond_5
    const/4 v11, 0x0

    goto :goto_4

    :cond_6
    :goto_3
    const/16 v2, 0x14

    .line 1354
    invoke-direct {p0, v7, v11, v2}, Lcom/flyersoft/books/Epub;->getTextBeforeTag(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_5

    if-eqz p2, :cond_7

    return-object v2

    :cond_7
    :goto_4
    if-eqz p2, :cond_8

    return-object v6

    .line 1367
    :cond_8
    const-string p2, "<"

    if-eq v11, v10, :cond_16

    .line 1371
    :try_start_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    sub-int/2addr v2, v5

    const-string v6, "\n"

    if-ge p1, v2, :cond_11

    .line 1372
    :try_start_2
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    add-int/2addr p1, v5

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    iget-object v8, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    if-eqz v4, :cond_9

    .line 1375
    invoke-static {v7, v4, v11}, Lcom/flyersoft/books/Epub;->getIdPosInHtml(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    goto :goto_5

    :cond_9
    const/4 v2, -0x1

    :goto_5
    if-ne v2, v10, :cond_10

    .line 1378
    invoke-static {v7, v3, v9}, Lcom/flyersoft/books/Epub;->getIdPTagInHtml(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 1379
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    const/4 v8, 0x1

    .line 1380
    :goto_6
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v8, v12, :cond_b

    .line 1381
    invoke-virtual {v3, v8}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Lcom/flyersoft/tools/T;->charIsNumber(C)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 1382
    invoke-virtual {v3, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 1385
    :cond_b
    :goto_7
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v5, :cond_c

    .line 1386
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    :cond_c
    if-ne v2, v10, :cond_d

    .line 1389
    const-string v2, " id="

    invoke-virtual {v7, v2, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    :cond_d
    if-eq v2, v10, :cond_10

    if-nez v4, :cond_10

    .line 1392
    const-string v4, "\""

    .line 1393
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 1394
    invoke-virtual {v7, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_8

    .line 1395
    :cond_e
    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 1396
    invoke-virtual {v7, v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    move-object v4, v0

    move v0, v3

    goto :goto_8

    :cond_f
    const/4 v0, -0x1

    :goto_8
    if-eq v0, v10, :cond_10

    .line 1400
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    const-string v5, "HAS_ID_TAG"

    iput-object v5, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1401
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    add-int/lit8 v3, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {v7, v4, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v7, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    :cond_10
    if-eq v2, v10, :cond_11

    .line 1414
    invoke-virtual {v7, p2, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v10, :cond_12

    .line 1416
    invoke-virtual {v7, v6, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p1

    add-int/lit8 p1, p1, 0x2

    goto :goto_9

    :cond_11
    const/4 p1, -0x1

    :cond_12
    :goto_9
    if-ne p1, v10, :cond_13

    .line 1421
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result p1

    .line 1423
    :cond_13
    invoke-virtual {v7, p2, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p2

    if-eq p2, v10, :cond_14

    :goto_a
    move v11, p2

    if-lez v11, :cond_15

    add-int/lit8 p2, v11, -0x1

    .line 1430
    invoke-virtual {v7, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x3e

    if-ne v0, v2, :cond_15

    const/16 v0, 0x3c

    .line 1431
    invoke-virtual {v7, v0, p2}, Ljava/lang/String;->lastIndexOf(II)I

    move-result p2

    if-eq p2, v10, :cond_15

    add-int/lit8 v0, p2, 0x1

    .line 1433
    invoke-virtual {v7, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x2f

    if-eq v0, v2, :cond_15

    goto :goto_a

    .line 1444
    :cond_14
    invoke-virtual {v7, v6, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p2

    add-int/lit8 p2, p2, 0x2

    const/4 v0, 0x5

    if-le p2, v0, :cond_15

    move v11, p2

    .line 1449
    :cond_15
    invoke-virtual {v7, v11, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    goto :goto_b

    :cond_16
    if-lez p1, :cond_18

    .line 1451
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-boolean v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    if-nez v0, :cond_18

    .line 1452
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 1453
    invoke-direct {p0, v1}, Lcom/flyersoft/books/Epub;->getAdditionalText(Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;

    move-result-object p1

    .line 1454
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_17

    .line 1455
    iput-boolean v5, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->brokenChapter:Z

    .line 1456
    :cond_17
    const-string p2, "<h2>"

    iget-object v0, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    const-string v2, "</h2>"

    filled-new-array {p2, v0, v2, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->buildString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_18
    if-nez p1, :cond_19

    if-eqz v4, :cond_19

    .line 1459
    invoke-static {v7, v4, v9}, Lcom/flyersoft/books/Epub;->getIdPosInHtml(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_19

    .line 1461
    invoke-virtual {v7, p2, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_19

    .line 1463
    invoke-virtual {v7, v9, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 1467
    :cond_19
    :goto_b
    invoke-direct {p0, v1}, Lcom/flyersoft/books/Epub;->getAdditionalText(Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;

    move-result-object p1

    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1a

    .line 1468
    invoke-direct {p0, v1}, Lcom/flyersoft/books/Epub;->getAdditionalText(Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {v7, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->buildString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0

    .line 1475
    :catch_0
    :cond_1a
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result p1

    int-to-long p1, p1

    iput-wide p1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    const-wide/16 p1, -0x1

    .line 1476
    iput-wide p1, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    return-object v7
.end method

.method private getChaptersFromOpf(Z)V
    .locals 18

    move-object/from16 v1, p0

    .line 605
    const-string v0, "description"

    const-string v2, "meta"

    const-string v3, "title"

    const/4 v8, 0x0

    const/4 v9, 0x1

    :try_start_0
    iput-boolean v9, v1, Lcom/flyersoft/books/Epub;->opfChecked:Z

    .line 606
    invoke-direct {v1}, Lcom/flyersoft/books/Epub;->getOpfFilename()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/flyersoft/books/Epub;->getDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 607
    invoke-interface {v4}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v4

    .line 610
    invoke-direct {v1, v4}, Lcom/flyersoft/books/Epub;->getPrefixName(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v5

    .line 611
    const-string v6, "dc:"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 613
    :try_start_1
    const-string v7, "dc:title"

    invoke-interface {v4, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 614
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-nez v10, :cond_1

    .line 615
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "metadata"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v10, ":title"

    invoke-direct {v1, v4, v7, v10, v6}, Lcom/flyersoft/books/Epub;->getPrefixName2(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 616
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    :cond_1
    if-eqz v7, :cond_2

    .line 618
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-lez v10, :cond_2

    .line 619
    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Lcom/flyersoft/books/Epub;->bookName:Ljava/lang/String;

    .line 621
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 622
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-nez v10, :cond_4

    .line 623
    :cond_3
    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    :cond_4
    if-eqz v7, :cond_5

    .line 624
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-lez v0, :cond_5

    .line 625
    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/books/Epub;->getDescription(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/books/Epub;->description:Ljava/lang/String;

    .line 627
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "creator"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 628
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-lez v7, :cond_6

    .line 630
    :try_start_2
    invoke-interface {v0, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;

    .line 631
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-le v7, v9, :cond_6

    const/4 v7, 0x1

    .line 632
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v7, v10, :cond_6

    .line 633
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v1, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v1, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 637
    :try_start_3
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 641
    :catch_1
    :cond_6
    :try_start_4
    iget-object v0, v1, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 642
    invoke-interface {v4, v2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 643
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-lez v7, :cond_7

    .line 644
    invoke-direct {v1, v0}, Lcom/flyersoft/books/Epub;->extractSeries(Lorg/w3c/dom/NodeList;)V

    .line 645
    :cond_7
    iget-object v0, v1, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_8

    .line 646
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 647
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-lez v2, :cond_8

    .line 648
    invoke-direct {v1, v0}, Lcom/flyersoft/books/Epub;->extractSeries(Lorg/w3c/dom/NodeList;)V

    .line 650
    :cond_8
    iget-object v0, v1, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_9

    .line 651
    const-string v0, "opf:meta"

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 652
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-lez v2, :cond_9

    .line 653
    invoke-direct {v1, v0}, Lcom/flyersoft/books/Epub;->extractSeries(Lorg/w3c/dom/NodeList;)V

    .line 656
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "subject"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 657
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-lez v2, :cond_b

    const/4 v2, 0x0

    .line 658
    :goto_1
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v2, v6, :cond_b

    .line 659
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 660
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_a

    const-string v7, "<"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a

    .line 661
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v10, 0x64

    if-ge v7, v10, :cond_a

    .line 662
    iget-object v7, v1, Lcom/flyersoft/books/Epub;->categories:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :catch_2
    nop

    :cond_b
    if-eqz p1, :cond_c

    goto/16 :goto_14

    .line 675
    :cond_c
    :try_start_5
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 678
    const-string v0, "tours"

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 679
    const-string v6, "href"

    const-string v10, ""

    if-eqz v0, :cond_12

    :try_start_6
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-lez v0, :cond_12

    .line 680
    const-string v0, "site"

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 681
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Lorg/w3c/dom/NodeList;)Z

    move-result v11

    if-nez v11, :cond_12

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 682
    :goto_2
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v13

    if-ge v11, v13, :cond_11

    .line 686
    invoke-interface {v0, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    move-object v15, v10

    const/4 v13, 0x0

    const/4 v14, 0x0

    .line 688
    :goto_3
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v16

    const/16 v17, 0x1

    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v9

    if-ge v13, v9, :cond_f

    .line 689
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 690
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v15

    .line 691
    :cond_d
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 692
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    :cond_e
    add-int/lit8 v13, v13, 0x1

    const/4 v9, 0x1

    goto :goto_3

    .line 695
    :cond_f
    invoke-direct {v1, v14, v15}, Lcom/flyersoft/books/Epub;->getChapter(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 697
    iget-object v12, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v13, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 698
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10
    add-int/lit8 v11, v11, 0x1

    const/4 v9, 0x1

    const/4 v12, 0x1

    goto :goto_2

    :cond_11
    const/16 v17, 0x1

    goto :goto_4

    :cond_12
    const/16 v17, 0x1

    const/4 v12, 0x0

    :goto_4
    if-nez v12, :cond_1c

    .line 704
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "spine"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 705
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-lez v0, :cond_1c

    .line 706
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 707
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "item"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v9}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    .line 708
    invoke-static {v9}, Lcom/flyersoft/tools/T;->isNull(Lorg/w3c/dom/NodeList;)Z

    move-result v11

    if-eqz v11, :cond_13

    .line 709
    const-string v9, "opf:item"

    invoke-interface {v4, v9}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    .line 710
    :cond_13
    invoke-static {v9}, Lcom/flyersoft/tools/T;->isNull(Lorg/w3c/dom/NodeList;)Z

    move-result v11

    if-nez v11, :cond_18

    const/4 v11, 0x0

    .line 711
    :goto_5
    invoke-interface {v9}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v12

    if-ge v11, v12, :cond_18

    .line 714
    invoke-interface {v9, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    .line 716
    :goto_6
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v8

    if-ge v13, v8, :cond_16

    .line 717
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v8

    invoke-interface {v8, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    const-string v7, "id"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 718
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v14

    .line 719
    :cond_14
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 720
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7, v13}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    :cond_15
    add-int/lit8 v13, v13, 0x1

    const/4 v8, 0x0

    goto :goto_6

    :cond_16
    if-eqz v14, :cond_17

    if-eqz v15, :cond_17

    .line 724
    invoke-virtual {v0, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    add-int/lit8 v11, v11, 0x1

    const/4 v8, 0x0

    goto :goto_5

    .line 727
    :cond_18
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "itemref"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 728
    invoke-static {v5}, Lcom/flyersoft/tools/T;->isNull(Lorg/w3c/dom/NodeList;)Z

    move-result v7

    if-nez v7, :cond_1c

    const/4 v7, 0x0

    .line 729
    :goto_7
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v7, v8, :cond_1c

    .line 732
    invoke-interface {v5, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v11, 0x0

    .line 734
    :goto_8
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v12

    if-ge v9, v12, :cond_1a

    .line 735
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12, v9}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v12

    const-string v13, "idref"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_19

    .line 736
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v11

    invoke-interface {v11, v9}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v11

    :cond_19
    add-int/lit8 v9, v9, 0x1

    goto :goto_8

    :cond_1a
    if-eqz v11, :cond_1b

    .line 739
    invoke-virtual {v0, v11}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1b

    .line 740
    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 741
    invoke-direct {v1, v8, v11}, Lcom/flyersoft/books/Epub;->getChapter(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v8

    if-eqz v8, :cond_1b

    .line 743
    iget-object v9, v8, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v11, v8, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 744
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 745
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 752
    :cond_1c
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_30

    .line 753
    const-string v0, "reference"

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    const/4 v4, 0x0

    .line 754
    iput-object v4, v1, Lcom/flyersoft/books/Epub;->references:Ljava/util/ArrayList;

    if-eqz v0, :cond_21

    .line 756
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v1, Lcom/flyersoft/books/Epub;->references:Ljava/util/ArrayList;

    const/4 v5, 0x0

    .line 757
    :goto_9
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v5, v7, :cond_21

    .line 760
    invoke-interface {v0, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    move-object v9, v4

    move-object v11, v9

    const/4 v8, 0x0

    .line 761
    :goto_a
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v12

    if-ge v8, v12, :cond_1f

    .line 762
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1d

    .line 763
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 764
    :cond_1d
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v12

    invoke-interface {v12, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    invoke-interface {v12}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1e

    .line 765
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v11

    invoke-interface {v11, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v11

    :cond_1e
    add-int/lit8 v8, v8, 0x1

    goto :goto_a

    :cond_1f
    if-eqz v9, :cond_20

    if-eqz v11, :cond_20

    .line 768
    new-instance v7, Lcom/flyersoft/books/Epub$Reference;

    invoke-direct {v7, v1}, Lcom/flyersoft/books/Epub$Reference;-><init>(Lcom/flyersoft/books/Epub;)V

    .line 769
    iput-object v9, v7, Lcom/flyersoft/books/Epub$Reference;->href:Ljava/lang/String;

    .line 770
    iput-object v11, v7, Lcom/flyersoft/books/Epub$Reference;->title:Ljava/lang/String;

    .line 771
    iget-object v8, v1, Lcom/flyersoft/books/Epub;->references:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_20
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 776
    :cond_21
    iget-object v0, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x2

    if-ge v0, v3, :cond_22

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v3, :cond_22

    goto/16 :goto_11

    .line 782
    :cond_22
    iget-object v0, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v8, v0, [I

    const/4 v3, 0x0

    .line 783
    :goto_b
    iget-object v4, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_23

    .line 784
    iget-object v4, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-direct {v1, v2, v4}, Lcom/flyersoft/books/Epub;->getOpfIndex(Ljava/util/ArrayList;Ljava/lang/String;)I

    move-result v4

    aput v4, v8, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_23
    const/4 v9, 0x0

    .line 786
    :goto_c
    iget-object v3, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v9, v3, :cond_2a

    .line 787
    iget-object v3, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v9, v3, :cond_24

    const/4 v3, 0x1

    goto :goto_d

    :cond_24
    const/4 v3, 0x0

    .line 788
    :goto_d
    iget-object v4, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    move v5, v3

    move-object v3, v4

    .line 789
    aget v4, v8, v9

    if-nez v5, :cond_25

    add-int/lit8 v6, v9, 0x1

    .line 790
    aget v6, v8, v6

    goto :goto_e

    :cond_25
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    :goto_e
    if-nez v5, :cond_27

    add-int/lit8 v5, v9, 0x2

    :goto_f
    if-ge v5, v0, :cond_27

    .line 793
    aget v7, v8, v5

    if-le v6, v7, :cond_26

    move v6, v7

    :cond_26
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    :cond_27
    move v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 804
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/Epub;->checkChapterAdditionalText(Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;IIZZ)V

    if-nez v9, :cond_29

    if-le v5, v4, :cond_28

    move v5, v4

    :cond_28
    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v4, -0x1

    move-object/from16 v1, p0

    .line 807
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/Epub;->checkChapterAdditionalText(Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;IIZZ)V

    move-object v7, v2

    goto :goto_10

    :cond_29
    move-object/from16 v1, p0

    move-object v7, v2

    :goto_10
    add-int/lit8 v9, v9, 0x1

    move-object v2, v7

    goto :goto_c

    :cond_2a
    move-object v7, v2

    goto :goto_13

    :cond_2b
    :goto_11
    move-object v7, v2

    .line 777
    invoke-direct {v1, v7}, Lcom/flyersoft/books/Epub;->checkOpfChaptersFromHtml(Ljava/util/ArrayList;)V

    .line 778
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 779
    invoke-direct {v1, v2}, Lcom/flyersoft/books/Epub;->adjustOpfChapter(Lcom/flyersoft/books/BaseEBook$Chapter;)Lcom/flyersoft/books/BaseEBook$Chapter;

    goto :goto_12

    .line 780
    :cond_2c
    iput-object v7, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    .line 812
    :goto_13
    iget-object v0, v1, Lcom/flyersoft/books/Epub;->contentBeforeChapter:Ljava/lang/String;

    if-eqz v0, :cond_2f

    .line 813
    iget-object v8, v1, Lcom/flyersoft/books/Epub;->contentBeforeChapterFilename:Ljava/util/ArrayList;

    if-eqz v8, :cond_2d

    .line 814
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2d

    const/4 v2, 0x0

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    :cond_2d
    move-object v3, v10

    .line 815
    new-instance v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {v1}, Lcom/flyersoft/books/Epub;->getBookName()Ljava/lang/String;

    move-result-object v2

    iget-object v4, v1, Lcom/flyersoft/books/Epub;->contentBeforeChapter:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    if-eqz v8, :cond_2e

    .line 816
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2e

    .line 817
    iput-object v8, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    .line 818
    :cond_2e
    iget-object v2, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 819
    iget v0, v1, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v1, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    .line 822
    :cond_2f
    iget-boolean v0, v1, Lcom/flyersoft/books/Epub;->hasAddtionalText:Z

    if-eqz v0, :cond_30

    .line 823
    iput-object v7, v1, Lcom/flyersoft/books/Epub;->opfChapters_addtional:Ljava/util/ArrayList;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_14

    :catch_3
    move-exception v0

    .line 826
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    .line 827
    iput-boolean v2, v1, Lcom/flyersoft/books/Epub;->inited:Z

    :cond_30
    :goto_14
    return-void
.end method

.method private getChaptersFromToc()V
    .locals 11

    .line 387
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilename()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 388
    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    .line 391
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getPrefixName(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v1

    .line 392
    const-string v2, "docTitle"

    invoke-interface {v0, v2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 393
    const-string v3, "text"

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-lez v5, :cond_1

    .line 394
    invoke-interface {v2, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    const/4 v5, 0x0

    .line 395
    :goto_0
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 396
    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 397
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    if-eqz v7, :cond_0

    .line 399
    :try_start_2
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/flyersoft/books/Epub;->bookName:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 405
    :cond_1
    :try_start_3
    const-string v2, "docAuthor"

    invoke-interface {v0, v2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 406
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-lez v5, :cond_3

    .line 407
    invoke-interface {v2, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    const/4 v5, 0x0

    .line 408
    :goto_1
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 409
    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 410
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    if-eqz v7, :cond_2

    .line 412
    :try_start_4
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 418
    :cond_3
    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "navMap"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 419
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-lez v3, :cond_5

    const/4 v3, 0x0

    .line 420
    :goto_2
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_5

    .line 421
    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    const/4 v6, 0x0

    .line 422
    :goto_3
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v6, v7, :cond_4

    .line 423
    invoke-interface {v5, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-direct {p0, v7, v1, v4}, Lcom/flyersoft/books/Epub;->addNCXChapters(Lorg/w3c/dom/Node;Ljava/lang/String;I)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 426
    :cond_5
    iget-boolean v1, p0, Lcom/flyersoft/books/Epub;->epub3Toc:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_f

    .line 427
    const-string v1, "nav"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 428
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-lez v1, :cond_f

    .line 430
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    const-string v3, "epub:type"

    if-le v1, v2, :cond_7

    const/4 v1, 0x0

    .line 432
    :goto_4
    :try_start_6
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v1, v5, :cond_7

    .line 433
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    const-string v6, "toc"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    if-eqz v5, :cond_6

    goto :goto_5

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :catch_2
    move-exception v1

    .line 439
    :try_start_7
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_7
    const/4 v1, 0x0

    :goto_5
    const/4 v5, 0x0

    .line 442
    :goto_6
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    const-string v7, "li"

    const-string v8, "ol"

    if-ge v5, v6, :cond_a

    .line 443
    :try_start_8
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 444
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    const/4 v8, 0x0

    .line 445
    :goto_7
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v9

    if-ge v8, v9, :cond_9

    .line 446
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 447
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    iget-object v10, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-direct {p0, v9, v4, v10}, Lcom/flyersoft/books/Epub;->addEpub3NCXChapters(Lorg/w3c/dom/Node;ILjava/util/ArrayList;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    :cond_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    :cond_a
    const/4 v1, 0x0

    .line 455
    :goto_8
    :try_start_9
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    const/4 v6, -0x1

    if-ge v1, v5, :cond_c

    .line 456
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    const-string v9, "page-list"

    invoke-virtual {v5, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_b

    goto :goto_9

    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_c
    const/4 v1, -0x1

    :goto_9
    if-eq v1, v6, :cond_f

    .line 462
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/flyersoft/books/Epub;->pages:Ljava/util/ArrayList;

    const/4 v3, 0x0

    .line 463
    :goto_a
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_f

    .line 464
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 465
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    const/4 v6, 0x0

    .line 466
    :goto_b
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v9

    if-ge v6, v9, :cond_e

    .line 467
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 468
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-interface {v9, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    iget-object v10, p0, Lcom/flyersoft/books/Epub;->pages:Ljava/util/ArrayList;

    invoke-direct {p0, v9, v4, v10}, Lcom/flyersoft/books/Epub;->addEpub3NCXChapters(Lorg/w3c/dom/Node;ILjava/util/ArrayList;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    :cond_d
    add-int/lit8 v6, v6, 0x1

    goto :goto_b

    :cond_e
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :catch_3
    const/4 v0, 0x0

    .line 473
    :try_start_a
    iput-object v0, p0, Lcom/flyersoft/books/Epub;->pages:Ljava/util/ArrayList;

    .line 478
    :cond_f
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->treeTOC:Z

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    .line 479
    :goto_c
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_10

    .line 480
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    add-int/2addr v3, v2

    iput v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_10
    const/4 v0, 0x0

    .line 481
    :goto_d
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_12

    .line 482
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v3, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    iget-object v5, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v5, v5, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    if-ge v3, v5, :cond_11

    const/4 v3, 0x1

    goto :goto_e

    :cond_11
    const/4 v3, 0x0

    :goto_e
    iput-boolean v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    goto :goto_d

    :catch_4
    move-exception v0

    .line 486
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_12
    return-void
.end method

.method private getCssFileList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2877
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->cssFileList:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 2878
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->cssFileList:Ljava/util/ArrayList;

    .line 2879
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

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

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2880
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ".css"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2881
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->cssFileList:Ljava/util/ArrayList;

    iget-object v1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2883
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->cssFileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method private getCssText(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 2759
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 2761
    :cond_0
    :goto_0
    const-string v3, "@import "

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_5

    add-int/lit8 v2, v2, 0x8

    .line 2763
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 2765
    :try_start_0
    const-string v4, "url("

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x4

    .line 2766
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 2767
    :cond_1
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x22

    if-eq v4, v5, :cond_3

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v6, 0x27

    if-ne v4, v6, :cond_2

    goto :goto_1

    .line 2770
    :cond_2
    const-string v4, ";"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    .line 2768
    :cond_3
    :goto_1
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/4 v6, 0x1

    if-ne v4, v5, :cond_4

    const-string v4, "\""

    :goto_2
    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    goto :goto_3

    :cond_4
    const-string v4, "\'"

    goto :goto_2

    :goto_3
    invoke-virtual {v3, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 2771
    :goto_4
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 2772
    invoke-direct {p0, v3, p2}, Lcom/flyersoft/books/Epub;->fileInList(Ljava/lang/String;Ljava/util/ArrayList;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2773
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2774
    invoke-virtual {p0, v3}, Lcom/flyersoft/books/Epub;->getSingleFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2775
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2776
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v3, p2}, Lcom/flyersoft/books/Epub;->getCssText(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    .line 2780
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 2787
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2788
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_5

    :cond_6
    return-object p1
.end method

.method private getDescription(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 3

    .line 2554
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 2555
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 2556
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2557
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 491
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0, p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 492
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    .line 493
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 497
    :try_start_0
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 499
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 500
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "unterminated entity ref"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 501
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 502
    invoke-static {p1}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "&amp;"

    const-string v2, "&"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 503
    invoke-static {p1}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 504
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getEpub3CoverItem(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;
    .locals 8

    .line 2475
    const-string v0, "name=\"cover\""

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 2477
    const-string v3, "<"

    invoke-virtual {p2, v3, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v4

    .line 2478
    const-string v5, ">"

    invoke-virtual {p2, v5, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 2479
    invoke-virtual {p2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2480
    const-string v4, "content="

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-eq v4, v2, :cond_3

    add-int/lit8 v4, v4, 0x9

    .line 2482
    const-string v6, "\""

    invoke-virtual {v0, v6, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v0, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2483
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "id=\""

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2484
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v2, :cond_3

    .line 2486
    invoke-virtual {p2, v3, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v3

    .line 2487
    invoke-virtual {p2, v5, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 2488
    invoke-virtual {p2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 2489
    const-string v0, "href="

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v2, :cond_3

    add-int/lit8 v0, v0, 0x6

    .line 2491
    invoke-virtual {p2, v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {p2, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    .line 2492
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object p1

    if-nez p1, :cond_0

    return-object v1

    .line 2495
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    .line 2496
    const-string v0, ".jpg"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, ".jpeg"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, ".png"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    return-object v1

    :cond_2
    :goto_0
    return-object p1

    :cond_3
    return-object v1
.end method

.method private getFontCacheFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 2852
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2855
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 2856
    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    :goto_0
    return-object p2

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getFontFile2(Ljava/lang/String;IZ)Ljava/lang/String;
    .locals 12

    if-eqz p3, :cond_1

    .line 2810
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fontFileCache:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2811
    iget-object p3, p0, Lcom/flyersoft/books/Epub;->fontFileCache:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 2812
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/books/Epub;->getZipFontFilename(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 2816
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFontFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "/.MoonReader/cache"

    const-string v3, "/"

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2817
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2819
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2820
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/tools/A;->getInitialBookFolder()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    move-object v0, v1

    move-object v4, v0

    :goto_0
    if-nez v1, :cond_7

    .line 2826
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 2827
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".ttf"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2828
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ".otf"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2829
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".ttc"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2830
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFontFileList()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 2831
    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    .line 2832
    invoke-virtual {v10, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    invoke-virtual {v10, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    invoke-virtual {v10, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 2834
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2835
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/tools/A;->getInitialBookFolder()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v1, v9

    .line 2841
    :cond_7
    invoke-direct {p0, v1, v0}, Lcom/flyersoft/books/Epub;->getFontCacheFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_8

    if-eqz v4, :cond_8

    .line 2842
    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 2843
    invoke-direct {p0, v1, v4}, Lcom/flyersoft/books/Epub;->getFontCacheFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_8
    if-eqz p3, :cond_9

    .line 2846
    iget-object p3, p0, Lcom/flyersoft/books/Epub;->fontFileCache:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    return-object v2
.end method

.method public static getFootnoteHtml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/books/BaseEBook;)Ljava/lang/String;
    .locals 18

    move-object/from16 v0, p0

    const/4 v1, 0x0

    move-object v3, v1

    const/4 v4, 0x0

    move-object/from16 v1, p2

    .line 1808
    :cond_0
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, " href=\""

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v7, -0x1

    if-ne v5, v7, :cond_1

    .line 1810
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, " href = \""

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 1811
    :cond_1
    const-string v8, "\'"

    if-ne v5, v7, :cond_2

    .line 1812
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v9, " href=\'"

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    :cond_2
    if-ne v5, v7, :cond_3

    .line 1814
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v9, " href = \'"

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 1816
    :cond_3
    const-string v9, "<"

    if-ne v5, v7, :cond_5

    .line 1817
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    if-ne v5, v7, :cond_4

    .line 1819
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    :cond_4
    if-eq v5, v7, :cond_5

    .line 1821
    const-string v10, " href"

    invoke-virtual {v1, v10, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v10

    .line 1822
    invoke-virtual {v1, v9, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v11

    if-eq v10, v7, :cond_15

    if-lt v10, v11, :cond_15

    sub-int v10, v5, v10

    const/16 v11, 0x78

    if-le v10, v11, :cond_5

    goto/16 :goto_a

    :cond_5
    if-ne v5, v7, :cond_6

    goto/16 :goto_a

    .line 1831
    :cond_6
    invoke-virtual {v1, v9, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v10

    .line 1832
    const-string v11, ">"

    invoke-virtual {v1, v11, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    if-eq v10, v7, :cond_1a

    if-eq v12, v7, :cond_1a

    sub-int v13, v12, v10

    const/16 v14, 0xc8

    if-ge v13, v14, :cond_1a

    .line 1834
    invoke-virtual {v1, v10, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 1835
    const-string v13, "noteref"

    invoke-virtual {v10, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    if-eq v13, v7, :cond_1a

    .line 1836
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, " id=\""

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v15, 0x1

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 1837
    const-string v13, " id = \""

    if-ne v2, v7, :cond_7

    .line 1838
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 1839
    :cond_7
    const-string v7, " id=\'"

    const/4 v15, -0x1

    if-ne v2, v15, :cond_8

    .line 1840
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v17, v3

    const/4 v15, 0x1

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    goto :goto_1

    :cond_8
    move-object/from16 v17, v3

    const/4 v15, 0x1

    :goto_1
    const/4 v3, -0x1

    if-ne v2, v3, :cond_9

    .line 1842
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    :cond_9
    const/4 v15, -0x1

    if-ne v2, v15, :cond_c

    .line 1846
    const-string v3, "href=\""

    invoke-virtual {v10, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_c

    add-int/lit8 v3, v3, 0x6

    .line 1848
    invoke-virtual {v10, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v10, v3, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1849
    const-string v10, "#"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_c

    .line 1850
    invoke-virtual {v3, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    const/4 v15, 0x0

    invoke-virtual {v3, v15, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v10, p3

    .line 1851
    invoke-virtual {v10, v3}, Lcom/flyersoft/books/BaseEBook;->getSingleFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d

    .line 1854
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v15, 0x0

    invoke-virtual {v3, v1, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    const/4 v15, -0x1

    if-ne v1, v15, :cond_a

    .line 1856
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    invoke-virtual {v3, v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2

    :cond_a
    const/4 v6, 0x0

    :goto_2
    if-ne v1, v15, :cond_b

    .line 1858
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    :cond_b
    move v2, v1

    move-object v1, v3

    const/4 v3, 0x1

    goto :goto_3

    :cond_c
    move-object/from16 v10, p3

    :cond_d
    const/4 v3, 0x0

    :goto_3
    const/4 v15, -0x1

    if-eq v2, v15, :cond_19

    .line 1866
    const-string v6, "<aside "

    invoke-virtual {v1, v6, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v6

    sub-int v6, v2, v6

    const/16 v8, 0x3e8

    if-ge v6, v8, :cond_19

    if-eqz v3, :cond_e

    move-object/from16 v12, p1

    const/4 v15, -0x1

    goto :goto_4

    :cond_e
    add-int/lit8 v3, v12, 0x1

    add-int/lit8 v12, v12, 0x64

    .line 1869
    invoke-virtual {v1, v3, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xa0

    const/16 v8, 0x20

    invoke-virtual {v3, v6, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v12, p1

    invoke-virtual {v12, v6, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    move v15, v3

    .line 1870
    :goto_4
    const-string v3, "</aside>"

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/4 v6, -0x1

    if-eq v3, v6, :cond_1b

    .line 1874
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v16, 0x1

    add-int/lit8 v4, v4, -0x1

    :goto_5
    if-lez v4, :cond_10

    .line 1875
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/flyersoft/tools/T;->charIsNumber(C)Z

    move-result v6

    if-nez v6, :cond_f

    goto :goto_6

    :cond_f
    add-int/lit8 v4, v4, -0x1

    goto :goto_5

    .line 1877
    :cond_10
    :goto_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v4, v4, 0x1

    const/4 v8, 0x1

    invoke-virtual {v0, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    add-int/lit8 v13, v2, 0xa

    invoke-virtual {v1, v6, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    const/4 v8, -0x1

    if-ne v6, v8, :cond_11

    .line 1879
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x1

    invoke-virtual {v0, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    goto :goto_7

    :cond_11
    const/4 v8, 0x1

    :goto_7
    const/4 v4, -0x1

    if-eq v6, v4, :cond_13

    if-ge v6, v3, :cond_13

    .line 1881
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    const/4 v14, -0x1

    if-ne v4, v14, :cond_12

    .line 1883
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    :cond_12
    if-eq v6, v4, :cond_13

    .line 1885
    invoke-virtual {v1, v9, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v4

    if-le v4, v2, :cond_13

    goto :goto_8

    :cond_13
    move v4, v3

    .line 1891
    :goto_8
    invoke-virtual {v1, v11, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    if-nez v17, :cond_14

    add-int/lit8 v3, v2, 0x1

    .line 1893
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_9

    :cond_14
    move-object/from16 v3, v17

    :goto_9
    const/4 v14, -0x1

    if-eq v15, v14, :cond_18

    const/16 v6, 0xa

    if-ge v15, v6, :cond_18

    const/16 v16, 0x1

    add-int/lit8 v2, v2, 0x1

    .line 1896
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_15
    :goto_a
    if-eqz v3, :cond_17

    .line 1910
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1911
    const-string v1, "</div>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    const-string v1, "<div"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 1912
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x6

    const/4 v15, 0x0

    invoke-virtual {v0, v15, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_16
    return-object v0

    :cond_17
    return-object v3

    :cond_18
    const/4 v15, 0x0

    goto :goto_c

    :cond_19
    move-object/from16 v12, p1

    goto :goto_b

    :cond_1a
    move-object/from16 v12, p1

    move-object/from16 v10, p3

    move-object/from16 v17, v3

    :cond_1b
    :goto_b
    const/4 v15, 0x0

    move-object/from16 v3, v17

    :goto_c
    if-ge v4, v5, :cond_0

    add-int/lit8 v5, v5, 0x64

    move v4, v5

    goto/16 :goto_0
.end method

.method private getHtmlTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1051
    const-string v0, "<title>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1052
    const-string v1, "</title>"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    if-le v1, v0, :cond_0

    add-int/lit8 v0, v0, 0x7

    .line 1053
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public static getIdPTagInHtml(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 5

    .line 1496
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "id=\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v3, 0x1

    if-eq v0, v3, :cond_0

    .line 1497
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1498
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "id=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\'"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v3, :cond_1

    .line 1499
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1500
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "name=\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v3, :cond_2

    .line 1501
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1502
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "name=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v3, :cond_3

    .line 1503
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1504
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v3, :cond_4

    .line 1505
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1506
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p0

    if-eq p0, v3, :cond_5

    .line 1507
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getIdPosInHtml(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 6

    .line 1481
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "id=\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1482
    const-string v2, "\'"

    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 1483
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "id=\'"

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    :cond_0
    if-ne v0, v3, :cond_1

    .line 1485
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "name=\""

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    :cond_1
    if-ne v0, v3, :cond_2

    .line 1487
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "name=\'"

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    :cond_2
    const/4 v4, 0x3

    if-ne v0, v3, :cond_3

    .line 1488
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v5, v4, :cond_3

    .line 1489
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    :cond_3
    if-ne v0, v3, :cond_4

    .line 1490
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v4, :cond_4

    .line 1491
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_4
    return v0
.end method

.method private getMaxHtmlSize()J
    .locals 2

    .line 1111
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->isMobi:Z

    if-eqz v0, :cond_0

    const-wide/32 v0, 0x2dc6c0

    return-wide v0

    :cond_0
    const-wide/32 v0, 0xf4240

    return-wide v0
.end method

.method private getMoreContentFromNextID_Tag(ILjava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1993
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->nextChapterHasID_Tag(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1994
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 1995
    invoke-direct {p0, v1, v0}, Lcom/flyersoft/books/Epub;->getChapterTextWithIDTag(IZ)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1997
    invoke-static {p2}, Lcom/flyersoft/tools/A;->deleteChapterEndHint(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1998
    const-string v2, "<hr2>"

    filled-new-array {p2, v2, v0}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/flyersoft/tools/T;->buildString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1999
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 2000
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 2001
    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2002
    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object p2
.end method

.method private getOpfFilename()Ljava/lang/String;
    .locals 5

    .line 244
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 245
    const-string v0, "content.opf"

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    if-eqz v1, :cond_0

    return-object v1

    .line 248
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_4

    .line 249
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 250
    iget-object v3, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    .line 251
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 252
    iget-object v0, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    goto :goto_2

    .line 254
    :cond_1
    invoke-virtual {v3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 255
    iget-object v2, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    goto :goto_1

    .line 256
    :cond_2
    iget-object v4, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    if-nez v4, :cond_3

    const-string v4, ".opf"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 257
    iget-object v2, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    :cond_3
    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 260
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->opfFilename:Ljava/lang/String;

    return-object v0
.end method

.method private getOpfIndex(Ljava/util/ArrayList;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1023
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1024
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public static getPageListTitle(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 2987
    invoke-static {p0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v0

    if-gtz v0, :cond_0

    return-object p0

    .line 2990
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p0

    if-nez p0, :cond_3

    const/4 p0, 0x0

    .line 2991
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget p0, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    const/4 v1, -0x1

    if-ne p0, v1, :cond_1

    .line 2992
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 2993
    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    goto :goto_0

    .line 2995
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 2996
    iget v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    if-ne v1, v0, :cond_2

    .line 2997
    iget-object p0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    return-object p0

    .line 2999
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Page "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getPrefixName(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 2

    .line 574
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 576
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object p1

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 577
    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method private getPrefixName2(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 881
    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 882
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 883
    invoke-interface {p1, p2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object p1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p1

    :cond_0
    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 885
    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 886
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 887
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 889
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    if-lez v2, :cond_1

    .line 890
    invoke-virtual {v1, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v2, :cond_1

    .line 891
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-object p4
.end method

.method private getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 127
    :cond_0
    iget-object p1, p1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    return-object p1
.end method

.method private getSplitChapters(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;IILjava/lang/String;)V
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;II",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p5

    .line 339
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 340
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->clear()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v5, v3

    const/4 v6, 0x0

    move/from16 v3, p4

    .line 343
    :goto_0
    const-string v7, "href=\"#"

    invoke-virtual {v0, v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_6

    if-lez v2, :cond_0

    if-le v3, v2, :cond_0

    goto/16 :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x7

    .line 346
    const-string v7, "\""

    invoke-virtual {v0, v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 347
    invoke-virtual {v0, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 349
    const-string v8, "%s"

    if-nez v5, :cond_1

    .line 351
    const-string v5, "id=\"%s\""

    invoke-virtual {v5, v8, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 353
    const-string v5, "id = \"%s\""

    invoke-virtual {v5, v8, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 355
    const-string v5, "name=\"%s\""

    invoke-virtual {v5, v8, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 357
    const-string v5, "name = \"%s\""

    invoke-virtual {v5, v8, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    goto/16 :goto_1

    :cond_1
    if-lez v2, :cond_2

    move v6, v7

    .line 366
    :cond_2
    invoke-virtual {v5, v8, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_6

    .line 368
    const-string v9, "<"

    invoke-virtual {v0, v9, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v10

    .line 369
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-nez v11, :cond_3

    .line 370
    new-instance v12, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/books/Epub;->getBookName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v4, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    const-wide/16 v17, 0x0

    move-object/from16 v13, p0

    move-object/from16 v15, p6

    invoke-direct/range {v12 .. v18}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    :cond_3
    const-string v11, ">"

    invoke-virtual {v0, v11, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    const-string v12, "</a"

    invoke-virtual {v0, v12, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    invoke-virtual {v0, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 372
    invoke-virtual {v11, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 373
    invoke-static {v11}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    :cond_4
    move-object/from16 v21, v11

    .line 374
    new-instance v19, Lcom/flyersoft/books/BaseEBook$Chapter;

    const-string v23, "HAS_ID_TAG"

    const-wide/16 v24, 0x0

    move-object/from16 v20, p0

    move-object/from16 v22, p6

    invoke-direct/range {v19 .. v25}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object/from16 v9, v19

    .line 375
    iput-object v3, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    .line 376
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v9, p3

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-gez v2, :cond_5

    add-int/lit8 v8, v8, 0x1

    move v6, v8

    :cond_5
    move v3, v7

    goto/16 :goto_0

    :cond_6
    :goto_1
    return-void
.end method

.method private getTextBeforeTag(Ljava/lang/String;II)Ljava/lang/String;
    .locals 3

    .line 1524
    const-string v0, "<body"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1526
    const-string v2, ">"

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    .line 1530
    :cond_1
    const-string v2, "<"

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v1, :cond_2

    .line 1532
    const-string v1, "\n"

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p2

    add-int/lit8 v2, p2, 0x2

    :cond_2
    const/4 p2, 0x0

    if-le v2, v0, :cond_4

    .line 1534
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1535
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x50

    if-ge v0, v1, :cond_3

    invoke-static {p1}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, p3, :cond_3

    return-object p2

    :cond_3
    return-object p1

    :cond_4
    return-object p2
.end method

.method private getTocFilename()Ljava/lang/String;
    .locals 7

    .line 163
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->tocInited:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    .line 164
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->tocInited:Z

    .line 165
    const-string v1, "toc.ncx"

    invoke-direct {p0, v1}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 167
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    :goto_0
    if-ltz v2, :cond_4

    .line 168
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 169
    iget-object v4, v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    .line 170
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 171
    iget-object v1, v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    goto :goto_2

    .line 173
    :cond_0
    invoke-virtual {v4, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 174
    iget-object v5, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    if-eqz v5, :cond_1

    const-string v6, "/toc.ncx"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 175
    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-le v5, v4, :cond_3

    .line 176
    :cond_1
    iget-object v3, v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v3, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    goto :goto_1

    .line 177
    :cond_2
    iget-object v5, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    if-nez v5, :cond_3

    const-string v5, ".ncx"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 178
    iget-object v3, v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v3, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    :cond_3
    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 180
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    if-nez v1, :cond_5

    .line 181
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilenameEpub3()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    .line 182
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 183
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_6

    .line 185
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    const/4 v3, 0x0

    add-int/2addr v1, v0

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->tocBasePath:Ljava/lang/String;

    .line 188
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    return-object v0
.end method

.method private getTocFilenameEpub3()Ljava/lang/String;
    .locals 7

    .line 195
    const-string v0, "/"

    iget-boolean v1, p0, Lcom/flyersoft/books/Epub;->tocEpub3Inited:Z

    if-nez v1, :cond_5

    const/4 v1, 0x1

    .line 196
    iput-boolean v1, p0, Lcom/flyersoft/books/Epub;->tocEpub3Inited:Z

    .line 197
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getOpfFilename()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 199
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getOpfFilename()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 200
    const-string v3, "properties=\"nav\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_5

    .line 202
    const-string v5, "<"

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v5

    const-string v6, ">"

    invoke-virtual {v2, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 203
    const-string v3, "href=\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v4, :cond_5

    add-int/lit8 v5, v3, 0x6

    .line 205
    const-string v6, "\""

    add-int/lit8 v3, v3, 0x7

    invoke-virtual {v2, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 206
    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/flyersoft/books/Epub;->tocFilenameEpub3:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 208
    iput-boolean v1, p0, Lcom/flyersoft/books/Epub;->epub3Toc:Z

    .line 209
    :cond_0
    iget-boolean v3, p0, Lcom/flyersoft/books/Epub;->epub3Toc:Z

    if-nez v3, :cond_2

    .line 210
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v1

    :goto_0
    if-ltz v3, :cond_2

    .line 211
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v5, v5, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 212
    iput-boolean v1, p0, Lcom/flyersoft/books/Epub;->epub3Toc:Z

    .line 213
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v3, v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v3, p0, Lcom/flyersoft/books/Epub;->tocFilenameEpub3:Ljava/lang/String;

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 218
    :cond_2
    :goto_1
    iget-boolean v3, p0, Lcom/flyersoft/books/Epub;->epub3Toc:Z

    if-nez v3, :cond_5

    .line 219
    invoke-virtual {v2, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v4, :cond_5

    add-int/2addr v3, v1

    .line 221
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 222
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v1

    :goto_2
    if-ltz v3, :cond_5

    .line 223
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v4, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 224
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v4, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_3

    :cond_3
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 225
    :cond_4
    :goto_3
    iput-boolean v1, p0, Lcom/flyersoft/books/Epub;->epub3Toc:Z

    .line 226
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v0, v0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->tocFilenameEpub3:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    .line 235
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 239
    :cond_5
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->tocFilenameEpub3:Ljava/lang/String;

    return-object v0
.end method

.method private getTocHtmlFileForOpf()Ljava/lang/String;
    .locals 5

    .line 265
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->tocHtmlFileForOpf:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 266
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

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

    .line 267
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    .line 268
    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->isHtmlFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 269
    const-string v3, "toc."

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    .line 270
    iget-object v0, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->tocHtmlFileForOpf:Ljava/lang/String;

    return-object v0

    .line 273
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/books/Epub;->tocHtmlFileForOpf:Ljava/lang/String;

    if-nez v3, :cond_0

    const-string v3, "toc"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v4, :cond_0

    .line 274
    iget-object v1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    iput-object v1, p0, Lcom/flyersoft/books/Epub;->tocHtmlFileForOpf:Ljava/lang/String;

    goto :goto_0

    .line 278
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->tocHtmlFileForOpf:Ljava/lang/String;

    return-object v0
.end method

.method private getUsedHtml()Ljava/util/ArrayList;
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

    .line 1129
    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getUsedHtml(Z)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private getUsedHtml(Z)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1132
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->usedHtml:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    .line 1133
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/Epub;->usedHtml:Ljava/util/ArrayList;

    .line 1134
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 1135
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->usedHtml:Ljava/util/ArrayList;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1137
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->usedHtml:Ljava/util/ArrayList;

    return-object p1
.end method

.method private getZipFontFilename(Ljava/lang/String;I)Ljava/lang/String;
    .locals 9

    .line 2893
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fontMaps:Ljava/util/ArrayList;

    if-nez v0, :cond_c

    .line 2894
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->fontMaps:Ljava/util/ArrayList;

    .line 2895
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2896
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getCssFileList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 2897
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Lcom/flyersoft/books/Epub;->getSingleFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 2898
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\r"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "/\\*.*?\\*/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 2901
    :goto_1
    const-string v3, "@font-face"

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    goto/16 :goto_7

    .line 2904
    :cond_1
    const-string v4, "}"

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v3, :cond_2

    goto/16 :goto_7

    .line 2908
    :cond_2
    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 2911
    const-string v5, "font-family"

    invoke-static {v2, v5}, Lcom/flyersoft/components/CSS;->propertyTagIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x0

    if-eq v5, v3, :cond_6

    add-int/lit8 v5, v5, 0xc

    .line 2913
    invoke-static {v2, v5, v1}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    .line 2916
    :goto_2
    const-string v8, "url("

    invoke-virtual {v2, v8, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    if-eq v7, v3, :cond_5

    .line 2918
    const-string v8, ")"

    invoke-virtual {v2, v8, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    if-eq v8, v3, :cond_5

    add-int/lit8 v6, v7, 0x4

    .line 2920
    invoke-virtual {v2, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 2921
    invoke-static {v6}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2922
    const-string v8, "/"

    invoke-virtual {v6, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    if-eq v8, v3, :cond_3

    add-int/lit8 v8, v8, 0x1

    .line 2924
    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 2925
    :cond_3
    invoke-direct {p0, v6, p2, v1}, Lcom/flyersoft/books/Epub;->getFontFile2(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    move-object v3, v6

    move-object v6, v5

    goto :goto_4

    :cond_6
    move-object v3, v6

    .line 2936
    :goto_4
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_b

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 2937
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2939
    const-string v6, "font-style"

    const/4 v7, 0x1

    invoke-static {v2, v6, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 2940
    const-string v8, "italic"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    const-string v8, "oblique"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    goto :goto_5

    :cond_7
    const/4 v6, 0x0

    goto :goto_6

    :cond_8
    :goto_5
    const/4 v6, 0x2

    .line 2942
    :goto_6
    const-string v8, "font-weight"

    invoke-static {v2, v8, v7}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 2943
    const-string v7, "bold"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    invoke-static {v2}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v2

    const/16 v7, 0x258

    if-lt v2, v7, :cond_a

    :cond_9
    or-int/lit8 v6, v6, 0x1

    .line 2945
    :cond_a
    new-instance v2, Lcom/flyersoft/books/Epub$FontItem;

    invoke-direct {v2, p0}, Lcom/flyersoft/books/Epub$FontItem;-><init>(Lcom/flyersoft/books/Epub;)V

    .line 2946
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/flyersoft/books/Epub$FontItem;->family:Ljava/lang/String;

    .line 2947
    iput-object v3, v2, Lcom/flyersoft/books/Epub$FontItem;->file:Ljava/lang/String;

    .line 2948
    iput v6, v2, Lcom/flyersoft/books/Epub$FontItem;->style:I

    .line 2949
    iget-object v3, p0, Lcom/flyersoft/books/Epub;->fontMaps:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b
    move v2, v4

    goto/16 :goto_1

    .line 2954
    :cond_c
    :goto_7
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getFontNames(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2955
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->fontMaps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/Epub$FontItem;

    .line 2956
    iget-object v4, v3, Lcom/flyersoft/books/Epub$FontItem;->family:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    iget v4, v3, Lcom/flyersoft/books/Epub$FontItem;->style:I

    if-ne v4, p2, :cond_e

    .line 2957
    iget-object p1, v3, Lcom/flyersoft/books/Epub$FontItem;->file:Ljava/lang/String;

    return-object p1

    .line 2958
    :cond_f
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->fontMaps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/Epub$FontItem;

    .line 2959
    iget-object v4, v3, Lcom/flyersoft/books/Epub$FontItem;->family:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 2960
    iget-object p1, v3, Lcom/flyersoft/books/Epub$FontItem;->file:Ljava/lang/String;

    :cond_11
    return-object p1
.end method

.method private ifContentEmpty(Lcom/flyersoft/books/BaseEBook$Chapter;)V
    .locals 3

    .line 1918
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteHtmlComment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1919
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_0

    const-string v1, "<im"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 1920
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v2, :cond_0

    .line 1921
    invoke-static {v0}, Lcom/flyersoft/tools/T;->html2Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 1922
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<center><h2>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</h2></center>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1923
    new-instance v1, Lcom/flyersoft/components/CSS;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/flyersoft/components/CSS;-><init>(Ljava/lang/String;)V

    iput-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    .line 1924
    iput-object v2, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    .line 1926
    :cond_0
    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-void
.end method

.method private ifHasImageOnly(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 1934
    const-string v0, "\""

    const-string v1, "<image"

    const-string v2, "<img"

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x258

    const/4 v5, 0x0

    if-ge v3, v4, :cond_5

    const-string v3, "<im"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_5

    .line 1935
    const-string v3, " <br/><span align=\"right\"><font color=#6060EE><u>("

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v6, 0x0

    if-eq v3, v4, :cond_0

    .line 1936
    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, p1

    .line 1937
    :goto_0
    invoke-static {v3}, Lcom/flyersoft/tools/T;->html2Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 1938
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v7, 0x1

    if-gt v3, v7, :cond_5

    .line 1939
    const-string v3, "\r"

    const-string v8, ""

    invoke-virtual {p1, v3, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "\t"

    invoke-virtual {p1, v3, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "\n"

    invoke-virtual {p1, v3, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "<div.*?>"

    .line 1940
    invoke-virtual {p1, v3, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "</div>"

    invoke-virtual {p1, v3, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1943
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 1944
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-eq v3, v4, :cond_1

    if-eq v8, v4, :cond_1

    return-object v5

    :cond_1
    if-eq v8, v4, :cond_2

    move v3, v8

    goto :goto_1

    :cond_2
    const/4 v6, 0x1

    :goto_1
    if-eqz v6, :cond_3

    .line 1953
    const-string v8, " src"

    goto :goto_2

    :cond_3
    const-string v8, " xlink:href"

    :goto_2
    invoke-virtual {p1, v8, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v4, :cond_4

    if-nez v6, :cond_4

    .line 1955
    const-string v6, " href"

    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    :cond_4
    if-eq v3, v4, :cond_5

    .line 1957
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-eq v3, v4, :cond_5

    .line 1958
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_5

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v4, :cond_5

    add-int/2addr v3, v7

    .line 1959
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1964
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_5
    return-object v5
.end method

.method private ifHasImageOnly(Lcom/flyersoft/books/BaseEBook$Chapter;)V
    .locals 1

    .line 1930
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->ifHasImageOnly(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->hasImageOnly:Ljava/lang/String;

    return-void
.end method

.method private insertFootnote(Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;
    .locals 0

    return-object p1
.end method

.method private isHtmlFile(Ljava/lang/String;)Z
    .locals 1

    .line 1141
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1142
    const-string v0, ".htm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".html"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".xhtml"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private nextChapterHasID_Tag(I)Z
    .locals 2

    .line 2009
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    .line 2010
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    add-int/2addr p1, v1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    if-eqz p1, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private preLoadAllChapters()Z
    .locals 5

    .line 1107
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->has_id_str:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x3c

    if-ge v0, v1, :cond_0

    iget-wide v0, p0, Lcom/flyersoft/books/Epub;->filesize:J

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getMaxHtmlSize()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private recheckChapters()V
    .locals 9

    .line 1059
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->checkAdditioanlHtmlFiles()V

    .line 1060
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->preLoadAllChapters()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 1061
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1062
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 1063
    iget-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->id_Tag:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 1064
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getChapterText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1065
    iget-object v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    int-to-long v3, v3

    iput-wide v3, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    const-wide/16 v2, -0x1

    .line 1066
    iput-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1069
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->deleteBrokenChapters()V

    .line 1073
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->has_id_str:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v2, p0, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    if-le v0, v2, :cond_4

    .line 1074
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/Epub;->getChapterText(I)Ljava/lang/String;

    .line 1075
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->contentBeforeFirstTag:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 1076
    iget v0, p0, Lcom/flyersoft/books/Epub;->firstChapterPos:I

    if-nez v0, :cond_3

    .line 1077
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getBookName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/books/Epub;->contentBeforeFirstTagFilename:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/books/Epub;->contentBeforeFirstTag:Ljava/lang/String;

    .line 1078
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1

    int-to-long v7, v3

    move-object v3, p0

    :try_start_1
    invoke-direct/range {v2 .. v8}, Lcom/flyersoft/books/BaseEBook$Chapter;-><init>(Lcom/flyersoft/books/BaseEBook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1077
    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1

    :cond_3
    move-object v3, p0

    .line 1080
    iget-object v0, v3, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v3, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    const-string v4, "<hr2>"

    iget-object v5, v3, Lcom/flyersoft/books/Epub;->contentBeforeFirstTag:Ljava/lang/String;

    filled-new-array {v2, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->buildString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1081
    iget-object v0, v3, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v2, v3, Lcom/flyersoft/books/Epub;->contentBeforeFirstTagFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1082
    iget-object v0, v3, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->usedFiles:Ljava/util/ArrayList;

    iget-object v2, v3, Lcom/flyersoft/books/Epub;->contentBeforeFirstTagFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    move-object v3, p0

    .line 1087
    :cond_5
    :goto_1
    iget-object v0, v3, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 1088
    iget-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    if-eqz v4, :cond_6

    iget-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x193

    if-le v4, v5, :cond_6

    .line 1089
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    const/16 v6, 0x190

    invoke-virtual {v5, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    move-object v3, p0

    .line 1091
    :goto_3
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_7
    return-void
.end method

.method private trySplitChapters(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 314
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 315
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v5, 0x0

    const v6, 0x9c40

    move-object v1, p0

    move-object v2, p1

    move-object v7, p2

    .line 317
    :try_start_1
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/Epub;->getSplitChapters(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;IILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 318
    :try_start_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x3

    if-ge p1, p2, :cond_0

    .line 319
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    add-int/lit16 v5, p1, -0x2710

    const/4 v6, -0x1

    move-object v1, p0

    :try_start_3
    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/books/Epub;->getSplitChapters(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;IILjava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object v1, p0

    .line 321
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, p2, :cond_3

    const/4 p1, 0x0

    .line 322
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v5, v0

    iput-wide v5, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    .line 323
    :goto_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    if-ge p1, p2, :cond_2

    add-int/lit8 p2, p1, 0x1

    .line 324
    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sub-int/2addr v0, p1

    if-gtz v0, :cond_1

    goto :goto_3

    .line 327
    :cond_1
    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    int-to-long v5, v0

    iput-wide v5, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    move p1, p2

    goto :goto_1

    .line 329
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr p2, v0

    int-to-long v4, p2

    iput-wide v4, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    .line 330
    iput-object v3, v1, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object v1, p0

    :goto_2
    move-object p1, v0

    .line 333
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    :goto_3
    return-void
.end method


# virtual methods
.method public free()V
    .locals 1

    .line 2967
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    if-eqz v0, :cond_0

    .line 2968
    invoke-virtual {v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->free()V

    :cond_0
    return-void
.end method

.method public getAudioContent(I)Ljava/lang/String;
    .locals 3

    .line 3032
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getAudioFile(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3033
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioContents:[Ljava/lang/String;

    aget-object v1, v0, p1

    if-nez v1, :cond_0

    .line 3034
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getAudioFile(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/flyersoft/books/Epub;->getChapterHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, p1

    .line 3035
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioContents:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getAudioFile(I)Ljava/lang/String;
    .locals 2

    .line 3025
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioFiles:[Ljava/lang/String;

    if-eqz v0, :cond_0

    array-length v1, v0

    if-le v1, p1, :cond_0

    .line 3026
    aget-object p1, v0, p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getAudioIdList(I)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$AudioId;",
            ">;"
        }
    .end annotation

    .line 3042
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getAudioFile(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3043
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioIds:[Ljava/util/ArrayList;

    aget-object v1, v0, p1

    if-nez v1, :cond_0

    .line 3044
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    aput-object v1, v0, p1

    .line 3045
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioIds:[Ljava/util/ArrayList;

    aget-object p1, v0, p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getAudioVideoDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 2178
    const-string v0, "#audio#"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 2179
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->dAudio:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_0

    .line 2180
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->player_sound_shot:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Epub;->dAudio:Landroid/graphics/drawable/Drawable;

    .line 2181
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->dAudio:Landroid/graphics/drawable/Drawable;

    return-object p1

    .line 2183
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->dVideo:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_2

    .line 2184
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->player_video_shot:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/Epub;->dVideo:Landroid/graphics/drawable/Drawable;

    .line 2185
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/books/Epub;->dVideo:Landroid/graphics/drawable/Drawable;

    return-object p1
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 4

    .line 1583
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;

    const-string v1, "author"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1584
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->author:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1586
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1587
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 1588
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    add-int/2addr v1, v3

    .line 1589
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1591
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 4

    .line 1570
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->bookName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->bookName:Ljava/lang/String;

    const-string v1, "title"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->bookName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1571
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->bookName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1573
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1574
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 1575
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x3

    if-le v2, v3, :cond_1

    const/4 v2, 0x0

    .line 1576
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3

    .line 2574
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2575
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".epub/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x5

    .line 2577
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 2579
    :cond_0
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    .line 2580
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 2582
    :cond_1
    const-string v1, "#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_2

    .line 2584
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    if-le v1, v2, :cond_2

    const/4 v2, 0x0

    .line 2586
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2590
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

    .line 2591
    sget-object p1, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    return-object p1

    .line 2593
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 2594
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2595
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_4
    if-nez v1, :cond_5

    const/4 p1, 0x0

    return-object p1

    .line 2599
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2600
    const-string v2, "//"

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 2602
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0, v1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    return-object p1
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 6

    .line 1647
    const-string v0, "UN_LOAD_TAG"

    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1648
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->clearChapterContents()V

    .line 1650
    :cond_0
    const-string v1, ""

    if-ltz p1, :cond_a

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_1

    goto/16 :goto_4

    .line 1653
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v3, 0x1

    .line 1657
    :try_start_0
    iget-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    const-string v5, "HAS_ID_TAG"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->nextChapterHasID_Tag(I)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_0

    .line 1662
    :cond_2
    iget-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1663
    iget-boolean v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v3

    if-ge p1, v0, :cond_3

    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    add-int/lit8 v5, p1, 0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1664
    iput-object v1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    goto :goto_1

    .line 1666
    :cond_3
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->getChapterHtml(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1667
    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->getAdditionalText(Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;

    move-result-object v0

    .line 1668
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 1669
    iget-object v4, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    filled-new-array {v4, v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->buildString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1670
    :cond_4
    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/flyersoft/books/Epub;->insertFootnote(Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    goto :goto_1

    :cond_5
    if-nez p1, :cond_8

    .line 1682
    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->ifHasImageOnly(Lcom/flyersoft/books/BaseEBook$Chapter;)V

    goto :goto_2

    .line 1658
    :cond_6
    :goto_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->getChapterTextWithIDTag(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1659
    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/books/Epub;->getMoreContentFromNextID_Tag(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1660
    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/flyersoft/books/Epub;->insertFootnote(Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1676
    :goto_1
    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->ifContentEmpty(Lcom/flyersoft/books/BaseEBook$Chapter;)V

    .line 1677
    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->ifHasImageOnly(Lcom/flyersoft/books/BaseEBook$Chapter;)V

    .line 1678
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->isMobi:Z

    if-eqz v0, :cond_7

    .line 1679
    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    const-string v4, "<mbp:pagebreak/>"

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    .line 1680
    :cond_7
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->setAudioFile(I)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1685
    :catch_0
    sput-boolean v3, Lcom/flyersoft/tools/T;->isOutOfMemoryError:Z

    .line 1687
    const-string v0, "#ERROR#"

    iput-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->additionalText:Ljava/lang/String;

    .line 1691
    :cond_8
    :goto_2
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->inGetChaptersProc:Z

    if-nez v0, :cond_9

    .line 1693
    :try_start_1
    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    if-nez v0, :cond_9

    iget-object v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->css_str:Ljava/lang/String;

    if-nez v0, :cond_9

    .line 1694
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->getCSS(I)V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception p1

    .line 1696
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1700
    :cond_9
    :goto_3
    iget-object p1, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->text:Ljava/lang/String;

    return-object p1

    :cond_a
    :goto_4
    return-object v1
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation

    .line 282
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 283
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 284
    iput-boolean v0, p0, Lcom/flyersoft/books/Epub;->inGetChaptersProc:Z

    .line 285
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilename()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 286
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getChaptersFromToc()V

    .line 287
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilenameEpub3()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilename()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilenameEpub3()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 288
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 289
    iget-object v3, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 290
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilenameEpub3()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/flyersoft/books/Epub;->tocFilename:Ljava/lang/String;

    .line 291
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getChaptersFromToc()V

    .line 292
    iget-object v3, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v3, v1, :cond_0

    .line 293
    iput-boolean v2, p0, Lcom/flyersoft/books/Epub;->tocInited:Z

    .line 294
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getTocFilename()Ljava/lang/String;

    .line 295
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 296
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getChaptersFromToc()V

    .line 300
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->recheckChapters()V

    .line 301
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v0, :cond_1

    .line 302
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/Epub;->getChapterText(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/books/Epub;->trySplitChapters(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    :cond_1
    iput-boolean v2, p0, Lcom/flyersoft/books/Epub;->inGetChaptersProc:Z

    .line 304
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapterTagFilenameCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 305
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->audioFiles:[Ljava/lang/String;

    .line 306
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->audioContents:[Ljava/lang/String;

    .line 307
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->audioIds:[Ljava/util/ArrayList;

    .line 309
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCoverFile()Ljava/lang/String;
    .locals 6

    .line 2295
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getBookCoverItem()Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2297
    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getBookCoverGuess()Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    .line 2298
    iget-wide v1, v0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    const-wide/32 v3, 0x4c4b40

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    .line 2299
    iget-object v0, v0, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 2301
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 6

    .line 2191
    const-string v0, "#audio"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    const-string v0, "#video"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    const/4 v3, 0x7

    .line 2193
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_2
    const/4 v3, 0x0

    .line 2195
    invoke-virtual {p0, v3, p1, v2}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v4

    if-nez v4, :cond_4

    .line 2197
    sget v4, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 2198
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-static {v4, p1}, Lcom/flyersoft/tools/T;->mergeFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2199
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object v4

    :cond_4
    if-eqz v4, :cond_5

    .line 2202
    iget-object v4, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    goto :goto_2

    :cond_5
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_2
    if-nez v4, :cond_6

    .line 2203
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 2204
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_6
    if-eqz v4, :cond_a

    .line 2206
    invoke-virtual {p0, v4}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    if-eqz v0, :cond_8

    .line 2208
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/books/Epub;->epub_filename:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2209
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "save media:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2210
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 2211
    invoke-static {v4, p1}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    :cond_7
    return-object v3

    .line 2215
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v0, ".svg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 2216
    invoke-static {v4}, Lcom/flyersoft/tools/A;->getSvgDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    .line 2218
    :cond_9
    invoke-static {v4, p2, v1}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 2219
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object p2

    :cond_a
    return-object v3
.end method

.method public getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2507
    invoke-virtual {p0, v0, p1, v1}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object p1

    return-object p1
.end method

.method public getFileItem(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;
    .locals 4

    const/4 v0, 0x0

    if-eqz p3, :cond_2

    .line 2512
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2513
    iget-object v1, p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object p3

    :cond_1
    return-object v0

    .line 2518
    :cond_2
    iget-object p3, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    if-eqz p3, :cond_3

    return-object p3

    :cond_3
    const/4 p3, 0x0

    .line 2523
    :goto_0
    const-string v1, "../"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p3, 0x3

    .line 2524
    invoke-virtual {p2, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    goto :goto_0

    .line 2527
    :cond_4
    const-string v1, "/"

    if-nez p3, :cond_5

    if-eqz p1, :cond_5

    .line 2528
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2529
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_5

    .line 2530
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2533
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2534
    iget-object v2, p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    return-object p3

    .line 2536
    :cond_7
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2537
    iget-object v2, p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    return-object p3

    .line 2539
    :cond_9
    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    const/4 p3, -0x1

    if-eq p1, p3, :cond_c

    .line 2540
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2541
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2542
    iget-object v2, p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    iget-object v2, p3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_b
    return-object p3

    :cond_c
    return-object v0
.end method

.method public getFileList()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fileList:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 132
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileInfoOfZip()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->fileList:Ljava/util/ArrayList;

    .line 133
    new-instance v1, Lcom/flyersoft/books/Epub$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/books/Epub$1;-><init>(Lcom/flyersoft/books/Epub;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 144
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 145
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 146
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 147
    iget-object v3, v2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 148
    iget-object v4, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 149
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 151
    :cond_0
    iget-object v4, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-virtual {v4, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 153
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 154
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->pureFilenameInfoCache:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 156
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileText(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1544
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fileTexts:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 1545
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->fileTexts:Ljava/util/HashMap;

    .line 1546
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fileTexts:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1547
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fileTexts:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 1549
    :cond_1
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->getChapterHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1550
    iget-object v1, p0, Lcom/flyersoft/books/Epub;->fileTexts:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1556
    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1557
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 1560
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 1561
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1562
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename2:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1563
    :cond_2
    iget-object p1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    return-object p1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public getFontFile(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 2803
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/books/Epub;->getFontFile2(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getFontFileList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2865
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fontFileList:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 2866
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->fontFileList:Ljava/util/ArrayList;

    .line 2867
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

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

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2868
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2869
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->fontFileList:Ljava/util/ArrayList;

    iget-object v1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2872
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->fontFileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method getHtmlForTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 2308
    invoke-virtual {p3, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2309
    :goto_0
    const-string v1, ""

    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    .line 2311
    const-string v3, ">"

    invoke-virtual {p3, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v2, :cond_0

    return-object v1

    .line 2314
    :cond_0
    invoke-virtual {p3, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 2315
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v2, :cond_1

    return-object v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 2317
    invoke-virtual {p3, p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public getImageFile(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 2061
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 2062
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-object p2, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->mergeFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2063
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFileItem(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 2064
    iget-object p2, p2, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    if-nez p2, :cond_2

    .line 2065
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2066
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    return-object p2
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

    .line 2227
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->imageFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 2228
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->imageFiles:Ljava/util/ArrayList;

    .line 2229
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

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

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2230
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2231
    iget-object v2, p0, Lcom/flyersoft/books/Epub;->imageFiles:Ljava/util/ArrayList;

    iget-object v1, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2233
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->imageFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getImageGetter()Landroid/text/Html$ImageGetter;
    .locals 1

    .line 2050
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->imageGetter:Landroid/text/Html$ImageGetter;

    if-nez v0, :cond_0

    .line 2051
    new-instance v0, Lcom/flyersoft/books/Epub$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Epub$2;-><init>(Lcom/flyersoft/books/Epub;)V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->imageGetter:Landroid/text/Html$ImageGetter;

    .line 2057
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->imageGetter:Landroid/text/Html$ImageGetter;

    return-object v0
.end method

.method public getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1

    .line 1642
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myZip:Lcom/flyersoft/tools/compress/MyZip_Base;

    invoke-virtual {v0, p1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method public getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
    .locals 1

    .line 2072
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-nez v0, :cond_0

    .line 2073
    new-instance v0, Lcom/flyersoft/books/Epub$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/books/Epub$3;-><init>(Lcom/flyersoft/books/Epub;)V

    iput-object v0, p0, Lcom/flyersoft/books/Epub;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    .line 2173
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    return-object v0
.end method

.method public getPriorTextLength(I)I
    .locals 8

    const/4 v0, 0x0

    if-ltz p1, :cond_4

    .line 2030
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_2

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    int-to-long v1, v1

    .line 2035
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-wide v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v1, v3

    long-to-int v1, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2037
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getTotalSize()J

    int-to-long v2, v1

    .line 2038
    iget-wide v4, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    cmp-long v0, v2, v4

    if-gtz v0, :cond_2

    iget-wide v4, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    add-int/lit8 v0, p1, 0x1

    int-to-long v6, v0

    mul-long v4, v4, v6

    .line 2039
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-long v6, v0

    div-long/2addr v4, v6

    const-wide/16 v6, 0x3

    mul-long v4, v4, v6

    const-wide/16 v6, 0x2

    div-long/2addr v4, v6

    cmp-long v0, v2, v4

    if-lez v0, :cond_3

    .line 2040
    :cond_2
    iput-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    .line 2041
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_3

    .line 2042
    iget-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-wide v4, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_3
    return v1

    :cond_4
    :goto_2
    return v0
.end method

.method public getSingleFileText(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 2562
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2563
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 2564
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    .line 2566
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 2567
    invoke-static {p1}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getTotalSize()J
    .locals 6

    .line 1623
    iget-wide v0, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_3

    .line 1624
    iput-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    .line 1625
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->has_id_str:Z

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lcom/flyersoft/books/Epub;->filesize:J

    invoke-direct {p0}, Lcom/flyersoft/books/Epub;->getMaxHtmlSize()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 1626
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 1627
    iget-object v2, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1628
    const-string v3, ".htm"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ".html"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ".xml"

    .line 1629
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, ".xhtml"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1630
    :cond_1
    iget-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    iget-wide v4, v1, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->size:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 1634
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 1635
    iget-wide v1, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget-wide v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1638
    :cond_3
    iget-wide v0, p0, Lcom/flyersoft/books/Epub;->totalSize:J

    return-wide v0
.end method

.method public isDrmProtected()Z
    .locals 8

    .line 2609
    invoke-virtual {p0}, Lcom/flyersoft/books/Epub;->getFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 2610
    iget-object v6, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    const-string v7, "/encryption.xml"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v2, 0x1

    .line 2612
    :cond_1
    iget-object v6, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    const-string v7, "/rights.xml"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    :goto_1
    const/4 v3, 0x1

    goto :goto_0

    .line 2614
    :cond_2
    iget-object v6, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    const-string v7, "zhangyue-expansion.xml"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_1

    .line 2616
    :cond_3
    iget-object v4, v4, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    const-string v6, "/signatures.xml"

    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_4
    if-eqz v2, :cond_5

    if-eqz v3, :cond_5

    return v5

    :cond_5
    return v1
.end method

.method public isHtml()Z
    .locals 1

    .line 2238
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->isHtml:Z

    return v0
.end method

.method public isInited()Z
    .locals 1

    .line 1596
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->inited:Z

    return v0
.end method

.method setAudioFile(I)V
    .locals 4

    .line 3009
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->getAudioFile(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3011
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioFiles:[Ljava/lang/String;

    if-eqz v0, :cond_3

    array-length v0, v0

    if-le v0, p1, :cond_3

    .line 3012
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/Epub;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3013
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3014
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_overlay.smil"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3015
    const-string v3, ".smil"

    if-nez v2, :cond_1

    .line 3016
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_1
    if-nez v2, :cond_2

    .line 3018
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/books/Epub;->getPureFilenameCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3019
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/Epub;->audioFiles:[Ljava/lang/String;

    aput-object v2, v0, p1

    :cond_3
    :goto_0
    return-void
.end method

.method public showChaptersAtBegin()Z
    .locals 1

    .line 2243
    iget-boolean v0, p0, Lcom/flyersoft/books/Epub;->showChaptersAtBegin:Z

    return v0
.end method
