.class public Lorg/comic/CDocument;
.super Ljava/lang/Object;
.source "CDocument.java"


# static fields
.field public static keepCache:Z

.field static zeroStartIntCount:I


# instance fields
.field public cacheFolder:Ljava/lang/String;

.field public closed:Z

.field defaultPageHeight:I

.field defaultPageWidth:I

.field public filename:Ljava/lang/String;

.field handler:Landroid/os/Handler;

.field public imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public imageInfo:[Lorg/comic/CbzPageInfo;

.field public isCbr:Z

.field public m_layout:Lorg/comic/CLayout;

.field public outOfMemoryError:Z

.field private pageCount:I

.field public pageInfo:[Lorg/comic/CbzPageInfo;

.field public pages:[Lorg/comic/CPage;

.field progressMsgWhat:I

.field suggest:Lorg/comic/CbzPageInfo;

.field unrarList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/comic/CbzPageInfo;",
            ">;"
        }
    .end annotation
.end field

.field unrarThread:Ljava/lang/Thread;

.field public view_mode:I

.field public zipper:Lcom/flyersoft/tools/compress/BaseCompressor;


# direct methods
.method static bridge synthetic -$$Nest$munrarAll(Lorg/comic/CDocument;)V
    .locals 0

    invoke-direct {p0}, Lorg/comic/CDocument;->unrarAll()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 232
    iput v0, p0, Lorg/comic/CDocument;->pageCount:I

    return-void
.end method

.method public static comicString2Int(Ljava/lang/String;)I
    .locals 5

    .line 182
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 184
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 186
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    if-ltz v2, :cond_3

    .line 187
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 188
    invoke-static {v3}, Lcom/flyersoft/tools/T;->charIsNumber(C)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 189
    invoke-virtual {v0, v1, v3}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 190
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2

    if-lez v2, :cond_2

    const/16 v4, 0x5f

    if-eq v3, v4, :cond_2

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_2

    goto :goto_2

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 197
    :cond_3
    :goto_2
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p0

    const/16 v2, 0x30

    if-ne p0, v2, :cond_4

    .line 198
    sget p0, Lorg/comic/CDocument;->zeroStartIntCount:I

    add-int/lit8 p0, p0, 0x1

    sput p0, Lorg/comic/CDocument;->zeroStartIntCount:I

    .line 199
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_5

    return v1

    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    return v1
.end method

.method private deleteImageCaches()V
    .locals 4

    .line 215
    sget-object v0, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1, v1, v1, v1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v0

    .line 216
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    .line 217
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, ".cb"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 218
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 219
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 220
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_1
    if-ltz v1, :cond_3

    .line 221
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "/comic"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 222
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 223
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteFolder(Ljava/lang/String;)Z

    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method private getCacheFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/comic/CDocument;->cacheFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getImageFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 108
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 109
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 111
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getImageInfo(I)Lorg/comic/CbzPageInfo;
    .locals 2

    .line 290
    iget-object v0, p0, Lorg/comic/CDocument;->pageInfo:[Lorg/comic/CbzPageInfo;

    aget-object v0, v0, p1

    if-nez v0, :cond_2

    .line 292
    new-instance v0, Lorg/comic/CbzPageInfo;

    invoke-direct {v0}, Lorg/comic/CbzPageInfo;-><init>()V

    .line 293
    iput p1, v0, Lorg/comic/CbzPageInfo;->pageno:I

    .line 294
    iget-object v1, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    .line 295
    iget-object p1, v0, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/comic/CDocument;->getCacheFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    .line 296
    iget p1, p0, Lorg/comic/CDocument;->defaultPageWidth:I

    iput p1, v0, Lorg/comic/CbzPageInfo;->width:I

    .line 297
    iget p1, p0, Lorg/comic/CDocument;->defaultPageHeight:I

    iput p1, v0, Lorg/comic/CbzPageInfo;->height:I

    .line 300
    :try_start_0
    iget-object p1, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v1, v0, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    const/4 v1, 0x0

    if-nez p1, :cond_1

    .line 303
    iget-object p1, v0, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 304
    iget-object p1, v0, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/flyersoft/tools/A;->getFileBitmapBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_0

    .line 306
    :cond_1
    invoke-static {p1, v1, v1}, Lcom/flyersoft/tools/A;->getStreamBitmapBounds(Ljava/io/InputStream;ZZ)Landroid/graphics/Rect;

    move-result-object v1

    .line 307
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    move-object p1, v1

    :goto_0
    if-eqz p1, :cond_2

    .line 310
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iput v1, v0, Lorg/comic/CbzPageInfo;->width:I

    .line 311
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    iput p1, v0, Lorg/comic/CbzPageInfo;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 314
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-object v0
.end method

.method private getSuggestImageInfo()Lorg/comic/CbzPageInfo;
    .locals 4

    .line 273
    iget-object v0, p0, Lorg/comic/CDocument;->suggest:Lorg/comic/CbzPageInfo;

    if-eqz v0, :cond_0

    return-object v0

    .line 275
    :cond_0
    iget v0, p0, Lorg/comic/CDocument;->pageCount:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ge v0, v1, :cond_1

    .line 276
    invoke-direct {p0, v2}, Lorg/comic/CDocument;->getImageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v0

    return-object v0

    .line 278
    :cond_1
    invoke-direct {p0, v2}, Lorg/comic/CDocument;->getImageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v0

    const/4 v1, 0x1

    .line 279
    invoke-direct {p0, v1}, Lorg/comic/CDocument;->getImageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v1

    const/4 v2, 0x2

    .line 280
    invoke-direct {p0, v2}, Lorg/comic/CDocument;->getImageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v2

    .line 282
    iget v3, v1, Lorg/comic/CbzPageInfo;->width:I

    iget v2, v2, Lorg/comic/CbzPageInfo;->width:I

    sub-int/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget v3, v1, Lorg/comic/CbzPageInfo;->width:I

    div-int/lit8 v3, v3, 0x14

    if-ge v2, v3, :cond_2

    .line 283
    iput-object v1, p0, Lorg/comic/CDocument;->suggest:Lorg/comic/CbzPageInfo;

    goto :goto_0

    .line 285
    :cond_2
    iput-object v0, p0, Lorg/comic/CDocument;->suggest:Lorg/comic/CbzPageInfo;

    .line 286
    :goto_0
    iget-object v0, p0, Lorg/comic/CDocument;->suggest:Lorg/comic/CbzPageInfo;

    return-object v0
.end method

.method public static sortImageFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 117
    new-instance v0, Lorg/comic/CDocument$1;

    invoke-direct {v0}, Lorg/comic/CDocument$1;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v0, 0x0

    .line 125
    sput v0, Lorg/comic/CDocument;->zeroStartIntCount:I

    .line 126
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 127
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 128
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 129
    invoke-static {v4}, Lorg/comic/CDocument;->comicString2Int(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-nez v5, :cond_0

    .line 130
    const-string v6, "0"

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v5, -0x1

    .line 132
    :cond_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 135
    :cond_1
    sget v2, Lorg/comic/CDocument;->zeroStartIntCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "zeroStartIntCount"

    aput-object v4, v3, v0

    const/4 v0, 0x1

    aput-object v2, v3, v0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 136
    new-instance v0, Lorg/comic/CDocument$2;

    invoke-direct {v0, v1}, Lorg/comic/CDocument$2;-><init>(Ljava/util/HashMap;)V

    .line 153
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 154
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 156
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v3, 0x0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-nez v3, :cond_2

    .line 158
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 159
    :cond_2
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 160
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 161
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 163
    :cond_3
    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 164
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 165
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 166
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v3, v5

    goto :goto_1

    .line 170
    :cond_4
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p0

    if-nez p0, :cond_5

    .line 171
    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 172
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_5
    return-object v1
.end method

.method private unrar3Images()V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    .line 455
    iget v2, p0, Lorg/comic/CDocument;->pageCount:I

    if-ge v1, v2, :cond_0

    .line 456
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "@unrar: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 457
    iget-object v2, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v3, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v4}, Lorg/comic/CDocument;->getCacheFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private unrarAll()V
    .locals 10

    .line 412
    iget-object v0, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    check-cast v0, Lcom/flyersoft/tools/compress/MyUnRar;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 415
    :cond_0
    :goto_0
    iget-object v3, v0, Lcom/flyersoft/tools/compress/MyUnRar;->rar:Lcom/github/junrar/Archive;

    invoke-virtual {v3}, Lcom/github/junrar/Archive;->nextFileHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 418
    :cond_1
    iget-boolean v4, p0, Lorg/comic/CDocument;->closed:Z

    if-eqz v4, :cond_2

    goto :goto_1

    .line 421
    :cond_2
    invoke-virtual {v0, v3}, Lcom/flyersoft/tools/compress/MyUnRar;->getRarFilename(Lcom/github/junrar/rarfile/FileHeader;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\"

    const-string v6, "/"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 422
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_0

    .line 424
    :cond_3
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_0

    .line 427
    :cond_4
    iget-object v5, p0, Lorg/comic/CDocument;->handler:Landroid/os/Handler;

    if-eqz v5, :cond_5

    .line 428
    iget v6, p0, Lorg/comic/CDocument;->progressMsgWhat:I

    add-int/lit8 v2, v2, 0x1

    iget v7, p0, Lorg/comic/CDocument;->pageCount:I

    invoke-virtual {v5, v6, v2, v7}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 430
    :cond_5
    invoke-direct {p0, v4}, Lorg/comic/CDocument;->getCacheFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 431
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_6

    goto :goto_0

    .line 433
    :cond_6
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7

    :goto_1
    return-void

    :cond_7
    const/4 v5, 0x0

    .line 438
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "*unrar: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v6, v7, v1

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 439
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v5

    .line 440
    iget-object v4, v0, Lcom/flyersoft/tools/compress/MyUnRar;->rar:Lcom/github/junrar/Archive;

    invoke-virtual {v4, v3, v5}, Lcom/github/junrar/Archive;->extractFile(Lcom/github/junrar/rarfile/FileHeader;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_0

    .line 446
    :try_start_1
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catchall_0
    move-exception v3

    .line 442
    :try_start_2
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v5, :cond_0

    .line 446
    :try_start_3
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v3

    .line 448
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    if-eqz v5, :cond_8

    .line 446
    :try_start_4
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_1
    move-exception v1

    .line 448
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 450
    :cond_8
    :goto_2
    throw v0
.end method


# virtual methods
.method public Close()V
    .locals 1

    const/4 v0, 0x1

    .line 207
    iput-boolean v0, p0, Lorg/comic/CDocument;->closed:Z

    .line 208
    sget-boolean v0, Lorg/comic/CDocument;->keepCache:Z

    if-nez v0, :cond_0

    .line 209
    invoke-direct {p0}, Lorg/comic/CDocument;->deleteImageCaches()V

    :cond_0
    return-void
.end method

.method public GetPage(I)Lorg/comic/CPage;
    .locals 2

    .line 227
    iget-object v0, p0, Lorg/comic/CDocument;->pages:[Lorg/comic/CPage;

    aget-object v1, v0, p1

    if-nez v1, :cond_0

    .line 228
    new-instance v1, Lorg/comic/CPage;

    invoke-direct {v1, p0, p1}, Lorg/comic/CPage;-><init>(Lorg/comic/CDocument;I)V

    aput-object v1, v0, p1

    .line 229
    :cond_0
    iget-object v0, p0, Lorg/comic/CDocument;->pages:[Lorg/comic/CPage;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public GetPageCount()I
    .locals 1

    .line 234
    iget v0, p0, Lorg/comic/CDocument;->pageCount:I

    return v0
.end method

.method public GetPageHeight(I)I
    .locals 0

    .line 242
    invoke-virtual {p0, p1}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object p1

    iget p1, p1, Lorg/comic/CbzPageInfo;->height:I

    return p1
.end method

.method public GetPageWidth(I)I
    .locals 0

    .line 238
    invoke-virtual {p0, p1}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object p1

    iget p1, p1, Lorg/comic/CbzPageInfo;->width:I

    return p1
.end method

.method public GetPagesMaxSize()[F
    .locals 4

    const/4 v0, 0x0

    .line 325
    invoke-virtual {p0, v0}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v1

    iget v1, v1, Lorg/comic/CbzPageInfo;->width:I

    .line 326
    invoke-virtual {p0, v0}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v2

    iget v2, v2, Lorg/comic/CbzPageInfo;->height:I

    int-to-float v1, v1

    int-to-float v2, v2

    const/4 v3, 0x2

    .line 327
    new-array v3, v3, [F

    aput v1, v3, v0

    const/4 v0, 0x1

    aput v2, v3, v0

    return-object v3
.end method

.method public Open(Ljava/lang/String;ILandroid/view/View;)Ljava/lang/String;
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    .line 42
    invoke-virtual/range {v0 .. v5}, Lorg/comic/CDocument;->Open(Ljava/lang/String;ILandroid/view/View;Landroid/os/Handler;I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public Open(Ljava/lang/String;ILandroid/view/View;Landroid/os/Handler;I)Ljava/lang/String;
    .locals 0

    .line 46
    iput-object p1, p0, Lorg/comic/CDocument;->filename:Ljava/lang/String;

    .line 47
    iput p2, p0, Lorg/comic/CDocument;->view_mode:I

    .line 48
    iput-object p4, p0, Lorg/comic/CDocument;->handler:Landroid/os/Handler;

    .line 49
    iput p5, p0, Lorg/comic/CDocument;->progressMsgWhat:I

    .line 51
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 52
    const-string p5, ".7z"

    invoke-virtual {p4, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_0

    .line 53
    const-string p1, "This is a .7z file, the reader only supports comics in .cbz or .cbr format."

    return-object p1

    .line 55
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object p4

    iput-object p4, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    .line 56
    const-string p5, ""

    if-nez p4, :cond_1

    return-object p5

    .line 59
    :cond_1
    invoke-virtual {p4}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList()Ljava/util/ArrayList;

    move-result-object p4

    invoke-static {p4}, Lorg/comic/CDocument;->getImageFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p4

    iput-object p4, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    .line 61
    invoke-virtual {p4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_3

    .line 62
    iget-object p1, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object p1, p1, Lcom/flyersoft/tools/compress/BaseCompressor;->err:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    return-object p5

    :cond_2
    iget-object p1, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object p1, p1, Lcom/flyersoft/tools/compress/BaseCompressor;->err:Ljava/lang/String;

    return-object p1

    .line 64
    :cond_3
    iget-object p4, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    instance-of p4, p4, Lcom/flyersoft/tools/compress/MyUnRar;

    iput-boolean p4, p0, Lorg/comic/CDocument;->isCbr:Z

    .line 65
    iget-object p4, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-static {p4}, Lorg/comic/CDocument;->sortImageFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p4

    iput-object p4, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    .line 69
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p5, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p5, "/comic"

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/comic/CDocument;->cacheFolder:Ljava/lang/String;

    .line 70
    iget-object p1, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iput p1, p0, Lorg/comic/CDocument;->pageCount:I

    .line 71
    new-array p4, p1, [Lorg/comic/CbzPageInfo;

    iput-object p4, p0, Lorg/comic/CDocument;->pageInfo:[Lorg/comic/CbzPageInfo;

    .line 72
    new-array p4, p1, [Lorg/comic/CbzPageInfo;

    iput-object p4, p0, Lorg/comic/CDocument;->imageInfo:[Lorg/comic/CbzPageInfo;

    .line 73
    new-array p1, p1, [Lorg/comic/CPage;

    iput-object p1, p0, Lorg/comic/CDocument;->pages:[Lorg/comic/CPage;

    if-eqz p3, :cond_4

    .line 76
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p1

    if-lez p1, :cond_4

    .line 77
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p1

    .line 78
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    goto :goto_0

    .line 80
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 81
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    iget p3, p3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 84
    :goto_0
    iput p1, p0, Lorg/comic/CDocument;->defaultPageWidth:I

    .line 85
    iput p3, p0, Lorg/comic/CDocument;->defaultPageHeight:I

    if-ge p3, p1, :cond_5

    if-eqz p2, :cond_5

    mul-int p3, p3, p3

    .line 87
    div-int/2addr p3, p1

    iput p3, p0, Lorg/comic/CDocument;->defaultPageWidth:I

    .line 90
    :cond_5
    iget-boolean p1, p0, Lorg/comic/CDocument;->isCbr:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_8

    .line 91
    sget-boolean p1, Lorg/comic/CDocument;->keepCache:Z

    if-nez p1, :cond_6

    .line 92
    invoke-direct {p0}, Lorg/comic/CDocument;->deleteImageCaches()V

    .line 93
    :cond_6
    sput-boolean p2, Lorg/comic/CDocument;->keepCache:Z

    .line 94
    sget-boolean p1, Lcom/flyersoft/tools/A;->crcError:Z

    if-eqz p1, :cond_7

    .line 95
    invoke-direct {p0}, Lorg/comic/CDocument;->unrarAll()V

    goto :goto_1

    .line 97
    :cond_7
    invoke-direct {p0}, Lorg/comic/CDocument;->unrar3Images()V

    .line 100
    :cond_8
    :goto_1
    iget p1, p0, Lorg/comic/CDocument;->pageCount:I

    if-ge p2, p1, :cond_9

    .line 101
    invoke-virtual {p0, p2}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_9
    const/4 p1, 0x0

    return-object p1
.end method

.method public d(F)I
    .locals 1

    .line 332
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1
.end method

.method public getPageInfo(I)Lorg/comic/CbzPageInfo;
    .locals 6

    .line 246
    iget-object v0, p0, Lorg/comic/CDocument;->pageInfo:[Lorg/comic/CbzPageInfo;

    aget-object v0, v0, p1

    if-nez v0, :cond_5

    .line 248
    new-instance v0, Lorg/comic/CbzPageInfo;

    invoke-direct {v0}, Lorg/comic/CbzPageInfo;-><init>()V

    .line 249
    iput p1, v0, Lorg/comic/CbzPageInfo;->pageno:I

    .line 250
    iget-object v1, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    .line 251
    iget-object v1, v0, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/comic/CDocument;->getCacheFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    .line 252
    iget v1, p0, Lorg/comic/CDocument;->view_mode:I

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-nez v1, :cond_1

    if-ge p1, v3, :cond_0

    .line 253
    invoke-direct {p0, p1}, Lorg/comic/CDocument;->getImageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lorg/comic/CDocument;->getSuggestImageInfo()Lorg/comic/CbzPageInfo;

    move-result-object v1

    .line 254
    :goto_0
    iget v4, p0, Lorg/comic/CDocument;->defaultPageWidth:I

    iput v4, v0, Lorg/comic/CbzPageInfo;->width:I

    .line 255
    iget v4, p0, Lorg/comic/CDocument;->defaultPageWidth:I

    iget v5, v1, Lorg/comic/CbzPageInfo;->height:I

    mul-int v4, v4, v5

    iget v1, v1, Lorg/comic/CbzPageInfo;->width:I

    div-int/2addr v4, v1

    iput v4, v0, Lorg/comic/CbzPageInfo;->height:I

    goto :goto_2

    :cond_1
    if-ne v1, v2, :cond_3

    if-ge p1, v3, :cond_2

    .line 257
    invoke-direct {p0, p1}, Lorg/comic/CDocument;->getImageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v1

    goto :goto_1

    :cond_2
    invoke-direct {p0}, Lorg/comic/CDocument;->getSuggestImageInfo()Lorg/comic/CbzPageInfo;

    move-result-object v1

    .line 258
    :goto_1
    iget v4, p0, Lorg/comic/CDocument;->defaultPageHeight:I

    iput v4, v0, Lorg/comic/CbzPageInfo;->height:I

    .line 259
    iget v4, p0, Lorg/comic/CDocument;->defaultPageHeight:I

    iget v5, v1, Lorg/comic/CbzPageInfo;->width:I

    mul-int v4, v4, v5

    iget v1, v1, Lorg/comic/CbzPageInfo;->height:I

    div-int/2addr v4, v1

    iput v4, v0, Lorg/comic/CbzPageInfo;->width:I

    goto :goto_2

    .line 261
    :cond_3
    iget v1, p0, Lorg/comic/CDocument;->defaultPageWidth:I

    iput v1, v0, Lorg/comic/CbzPageInfo;->width:I

    .line 262
    iget v1, p0, Lorg/comic/CDocument;->defaultPageHeight:I

    iput v1, v0, Lorg/comic/CbzPageInfo;->height:I

    :goto_2
    if-ge p1, v3, :cond_4

    .line 265
    iput-boolean v2, v0, Lorg/comic/CbzPageInfo;->realSize:Z

    .line 266
    :cond_4
    iget-object v1, p0, Lorg/comic/CDocument;->pageInfo:[Lorg/comic/CbzPageInfo;

    aput-object v0, v1, p1

    :cond_5
    return-object v0
.end method

.method public getPageX(I)I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 346
    invoke-virtual {p0, v0}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v2

    iget v2, v2, Lorg/comic/CbzPageInfo;->width:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public getPageXRtl(I)I
    .locals 2

    add-int/lit8 p1, p1, 0x1

    const/4 v0, 0x0

    .line 353
    :goto_0
    iget v1, p0, Lorg/comic/CDocument;->pageCount:I

    if-ge p1, v1, :cond_0

    .line 354
    invoke-virtual {p0, p1}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v1

    iget v1, v1, Lorg/comic/CbzPageInfo;->width:I

    add-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public getPageY(I)I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 338
    invoke-virtual {p0, v0}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v2

    iget v2, v2, Lorg/comic/CbzPageInfo;->height:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public unrarFile(Lorg/comic/CbzPageInfo;)V
    .locals 2

    .line 365
    iget-boolean v0, p0, Lorg/comic/CDocument;->closed:Z

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lorg/comic/CDocument;->isCbr:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 367
    :cond_0
    iget-object v0, p0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 368
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    .line 369
    :cond_1
    iget-object v0, p0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 370
    iget-object v0, p0, Lorg/comic/CDocument;->m_layout:Lorg/comic/CLayout;

    if-eqz v0, :cond_2

    iget v0, v0, Lorg/comic/CLayout;->m_pageno:I

    iget v1, p1, Lorg/comic/CbzPageInfo;->pageno:I

    if-ne v0, v1, :cond_2

    .line 371
    iget-object v0, p0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 373
    :cond_2
    iget-object v0, p0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 375
    :cond_3
    :goto_0
    iget-object p1, p0, Lorg/comic/CDocument;->unrarThread:Ljava/lang/Thread;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_1

    .line 377
    :cond_4
    iget-object p1, p0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_5

    goto :goto_1

    .line 380
    :cond_5
    new-instance p1, Lorg/comic/CDocument$3;

    invoke-direct {p1, p0}, Lorg/comic/CDocument$3;-><init>(Lorg/comic/CDocument;)V

    iput-object p1, p0, Lorg/comic/CDocument;->unrarThread:Ljava/lang/Thread;

    const/4 v0, 0x1

    .line 407
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 408
    iget-object p1, p0, Lorg/comic/CDocument;->unrarThread:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_6
    :goto_1
    return-void
.end method
