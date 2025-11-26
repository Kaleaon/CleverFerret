.class public Lcom/flyersoft/books/chmlib/ChmDocumentCache;
.super Ljava/lang/Object;
.source "ChmDocumentCache.java"


# static fields
.field public static final FILE_HHC_INDEX:Ljava/lang/String; = "hhc_index.html"

.field private static logger:Lcom/flyersoft/books/chmlib/Logger;


# instance fields
.field public cachePath:Ljava/lang/String;

.field public doc:Lcom/flyersoft/books/chmlib/ChmDocument;

.field private hhc:Lcom/flyersoft/books/chmlib/HHC;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-string v0, "ChmDocumentCache"

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/Logger;->getLogger(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->logger:Lcom/flyersoft/books/chmlib/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    .line 26
    iput-object p2, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->cachePath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCacheFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 49
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    .line 50
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 51
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->cachePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDoc()Lcom/flyersoft/books/chmlib/ChmDocument;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    return-object v0
.end method

.method public getFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getCacheFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 40
    const-string v1, "hhc_index.html"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 41
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getHHC()Lcom/flyersoft/books/chmlib/HHC;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 42
    :cond_0
    new-instance p1, Ljava/io/FileNotFoundException;

    invoke-direct {p1, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 44
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-object v0
.end method

.method public getHHC()Lcom/flyersoft/books/chmlib/HHC;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->hhc:Lcom/flyersoft/books/chmlib/HHC;

    if-eqz v0, :cond_0

    return-object v0

    .line 86
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->cachePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/hhc_index.html"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".idx"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 94
    sget-object v2, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v3, "getHHC: start"

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/Logger;->logTimeStart(Ljava/lang/String;)V

    .line 95
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/ChmDocument;->getHHCFileName()Ljava/lang/String;

    move-result-object v2

    .line 96
    sget-object v3, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v4, "getHHC: after getHHCFileName"

    invoke-virtual {v3, v4}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    if-nez v2, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 99
    :cond_1
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 100
    sget-object v3, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v4, "getHHC: after unzip"

    invoke-virtual {v3, v4}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 101
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 102
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 103
    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-virtual {v4}, Lcom/flyersoft/books/chmlib/ChmDocument;->getCharset()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 104
    new-instance v2, Lcom/flyersoft/books/chmlib/MyBufferedReader;

    const/16 v4, 0x2000

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/books/chmlib/MyBufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 105
    new-instance v3, Lcom/flyersoft/books/chmlib/HHC;

    invoke-direct {v3, v2, v0, v1}, Lcom/flyersoft/books/chmlib/HHC;-><init>(Lcom/flyersoft/books/chmlib/MyBufferedReader;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->hhc:Lcom/flyersoft/books/chmlib/HHC;

    .line 106
    sget-object v0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v1, "getHHC: after HHC converted"

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 107
    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->close()V

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->hhc:Lcom/flyersoft/books/chmlib/HHC;

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/HHC;->hChapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;

    .line 111
    iget-object v2, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->filename:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_2

    .line 112
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    iget-object v3, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 114
    iget v2, v2, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    int-to-long v2, v2

    iput-wide v2, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->size:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 118
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 120
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->hhc:Lcom/flyersoft/books/chmlib/HHC;

    return-object v0
.end method

.method public getNextPage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getHHC()Lcom/flyersoft/books/chmlib/HHC;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/HHC;->getNextFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPageId(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getHHC()Lcom/flyersoft/books/chmlib/HHC;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/HHC;->getFileId(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getPreviousPage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getHHC()Lcom/flyersoft/books/chmlib/HHC;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/HHC;->getPreviousFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public hasHHC()Z
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->hasHHC()Z

    move-result v0

    return v0
.end method

.method public saveToCache(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 62
    sget-object v0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const-string v2, "saveToCache(fileName=%s, cacheFilePath=%s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V

    .line 63
    invoke-static {p2}, Lcom/flyersoft/books/chmlib/ChmUtil;->mkdirs(Ljava/lang/String;)V

    .line 64
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2

    .line 66
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->doc:Lcom/flyersoft/books/chmlib/ChmDocument;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Ljava/lang/String;Ljava/io/OutputStream;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 68
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    if-eqz p2, :cond_0

    .line 72
    :try_start_1
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 74
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    :goto_1
    return-void
.end method
