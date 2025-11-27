.class public abstract Lcom/flyersoft/tools/compress/BaseCompressor;
.super Ljava/lang/Object;
.source "BaseCompressor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;
    }
.end annotation


# instance fields
.field public err:Ljava/lang/String;

.field protected sortProc:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lcom/flyersoft/tools/compress/BaseCompressor$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/BaseCompressor$1;-><init>(Lcom/flyersoft/tools/compress/BaseCompressor;)V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/BaseCompressor;->sortProc:Ljava/util/Comparator;

    return-void
.end method

.method public static createCbzBookCover(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;)V
    .locals 2

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_1.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->rebuild_cover_size:I

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 101
    invoke-static {p0, p1, p2, v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCbzCoverBitmap(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;Landroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 p2, 0x0

    .line 102
    invoke-static {p1, p0, p2}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V

    return-void
.end method

.method public static createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;
    .locals 3

    .line 59
    const-string v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 60
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 62
    :goto_0
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    const-string v1, ".rar"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 64
    new-instance v0, Lcom/flyersoft/tools/compress/MyUnRar;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/MyUnRar;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 65
    :cond_1
    const-string v2, ".zip"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 66
    new-instance v0, Lcom/flyersoft/tools/compress/MyAntZip;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/MyAntZip;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 68
    :cond_2
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, ".cbr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    .line 70
    :cond_3
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, ".cbz"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    :cond_4
    const/4 p0, 0x0

    return-object p0

    :cond_5
    :goto_1
    new-instance v0, Lcom/flyersoft/tools/compress/MyAntZip;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/MyAntZip;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 69
    :cond_6
    :goto_2
    new-instance v0, Lcom/flyersoft/tools/compress/MyUnRar;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/compress/MyUnRar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getCbzCoverBitmap(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;Landroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 110
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object p1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_2

    :cond_0
    :goto_0
    const/4 p0, 0x0

    if-nez p2, :cond_1

    .line 112
    invoke-virtual {p1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lorg/comic/CDocument;->getImageFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    .line 113
    invoke-static {v1}, Lorg/comic/CDocument;->sortImageFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 114
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 115
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    :cond_1
    if-nez p2, :cond_2

    return-object v0

    .line 120
    :cond_2
    invoke-virtual {p1, p2, p0, p0}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    if-eqz p3, :cond_3

    const/4 p2, 0x0

    goto :goto_1

    :cond_3
    const/4 p2, 0x1

    .line 121
    :goto_1
    invoke-static {p1, p0, p2}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 124
    :goto_2
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object v0
.end method

.method public static getZRCacheFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 74
    invoke-static {p0, v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->getZRCacheFile(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getZRCacheFile(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4

    .line 78
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    const-string v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    :goto_0
    return-object p0

    :cond_1
    const/4 v1, 0x0

    .line 84
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez p1, :cond_6

    .line 87
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isEmptyFile(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_3

    .line 90
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v2, ".rar"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 91
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v2, ".cbr"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    new-instance p1, Lcom/flyersoft/tools/compress/MyAntZip;

    invoke-direct {p1, v1}, Lcom/flyersoft/tools/compress/MyAntZip;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    :goto_1
    new-instance p1, Lcom/flyersoft/tools/compress/MyUnRar;

    invoke-direct {p1, v1}, Lcom/flyersoft/tools/compress/MyUnRar;-><init>(Ljava/lang/String;)V

    .line 92
    :goto_2
    invoke-virtual {p1, p0, v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_3

    :cond_5
    const/4 p0, 0x0

    return-object p0

    :cond_6
    :goto_3
    return-object v0
.end method


# virtual methods
.method public abstract getAllList()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAllList(Z)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;
.end method

.method public abstract getFileInfo(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;
.end method

.method public abstract getFileList(Ljava/lang/String;)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFileStream(Ljava/lang/String;)Ljava/io/InputStream;
.end method

.method public abstract saveToFile(Ljava/lang/String;Ljava/lang/String;)Z
.end method
