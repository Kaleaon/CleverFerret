.class public Lorg/mydroid/droids/djvu/codec/DjvuPage;
.super Ljava/lang/Object;
.source "DjvuPage.java"


# instance fields
.field alreadyMax:Z

.field public bitmapRef:Ljava/lang/ref/Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/Reference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final contextHandle:J

.field private final docHandle:J

.field private filename:Ljava/lang/String;

.field public inGettingBitmap:Z

.field public invertBitmap:Z

.field latestOkSize:I

.field public mHeight:I

.field public mWidth:I

.field outOutMeorySize:I

.field private pageHandle:J

.field private final pageno:I

.field public rects:[Landroid/graphics/RectF;

.field targetViewWidth:I

.field public text:Ljava/lang/String;

.field public texts:[Lorg/mydroid/core/codec/TextWord;


# direct methods
.method static bridge synthetic -$$Nest$mgetReaderBitmapFinal(Lorg/mydroid/droids/djvu/codec/DjvuPage;)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getReaderBitmapFinal()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(JJJILjava/lang/String;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    .line 42
    iput v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    .line 46
    iput-wide p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->contextHandle:J

    .line 47
    iput-wide p3, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->docHandle:J

    .line 48
    iput-wide p5, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageHandle:J

    .line 49
    iput p7, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageno:I

    .line 50
    iput-object p8, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->filename:Ljava/lang/String;

    .line 51
    invoke-static {p5, p6}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getWidth(J)I

    move-result p1

    iput p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    .line 52
    invoke-static {p5, p6}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getHeight(J)I

    move-result p1

    iput p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    .line 54
    :goto_0
    iget p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    if-eqz p1, :cond_0

    iget p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x5

    if-ge v0, p1, :cond_1

    add-int/lit8 v0, v0, 0x1

    const-wide/16 p1, 0x32

    .line 57
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :catch_0
    invoke-static {p5, p6}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getWidth(J)I

    move-result p1

    iput p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    .line 61
    invoke-static {p5, p6}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getHeight(J)I

    move-result p1

    iput p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static native free(J)V
.end method

.method private static synchronized native getHeight(J)I
.end method

.method private static native getPageLinks(JI)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI)",
            "Ljava/util/ArrayList<",
            "Lorg/mydroid/core/codec/PageLink;",
            ">;"
        }
    .end annotation
.end method

.method static native getPageText(JIJLjava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JIJ",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/mydroid/core/codec/PageTextBox;",
            ">;"
        }
    .end annotation
.end method

.method private getReaderBitmapFinal()Landroid/graphics/Bitmap;
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 122
    :cond_0
    :try_start_0
    iget v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->targetViewWidth:I

    invoke-direct {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmapWidth(I)I

    move-result v1

    .line 124
    iget v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    mul-int v2, v2, v1

    iget v3, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    div-int/2addr v2, v3

    new-instance v3, Landroid/graphics/RectF;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-direct {v3, v5, v5, v4, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-direct {p0, v1, v2, v3}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmapNative(IILandroid/graphics/RectF;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 125
    iget-boolean v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->invertBitmap:Z

    if-eqz v2, :cond_1

    .line 126
    invoke-static {v0}, Lorg/mydroid/common/bitmaps/RawBitmap;->invert(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 128
    :cond_1
    iget-object v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz v2, :cond_2

    .line 129
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 131
    :cond_2
    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    .line 133
    iget v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->latestOkSize:I

    if-le v1, v2, :cond_3

    .line 134
    iput v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->latestOkSize:I

    .line 136
    :cond_3
    iget v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->targetViewWidth:I

    invoke-direct {p0, v2}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmapWidth(I)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gt v2, v1, :cond_0

    return-object v0

    :catchall_0
    move-exception v1

    .line 145
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_0
    move-exception v2

    const/4 v3, 0x1

    .line 140
    sput-boolean v3, Lorg/djvu/DDocument;->outOfMemory:Z

    .line 141
    iput v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->outOutMeorySize:I

    .line 143
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method private static synchronized native getWidth(J)I
.end method

.method private renderBitmapNative(IILandroid/graphics/RectF;)Landroid/graphics/Bitmap;
    .locals 13

    move v5, p2

    move-object/from16 v0, p3

    .line 160
    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getWidth()I

    move-result v1

    if-lt p1, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->alreadyMax:Z

    if-lez p1, :cond_1

    if-lez v5, :cond_1

    .line 164
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v12

    mul-int v1, p1, v5

    .line 165
    new-array v1, v1, [I

    .line 167
    iget-wide v6, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageHandle:J

    iget-wide v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->contextHandle:J

    move-wide v7, v6

    iget v6, v0, Landroid/graphics/RectF;->left:F

    move-wide v8, v7

    iget v7, v0, Landroid/graphics/RectF;->top:F

    move-object v10, v1

    move-wide v0, v8

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->width()F

    move-result v8

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->height()F

    move-result v9

    const/4 v11, 0x0

    move v4, p1

    invoke-static/range {v0 .. v11}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderPage(JJIIFFFF[II)Z

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move v6, p1

    move v3, p1

    move v7, p2

    move-object v1, v10

    move-object v0, v12

    .line 173
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private renderBitmapWidth(I)I
    .locals 1

    .line 152
    iget v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    if-le p1, v0, :cond_0

    move p1, v0

    .line 153
    :cond_0
    iget v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->outOutMeorySize:I

    if-lez v0, :cond_1

    iget v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->latestOkSize:I

    if-le p1, v0, :cond_1

    return v0

    :cond_1
    return p1
.end method

.method private static native renderPage(JJIIFFFF[II)Z
.end method

.method private static native renderPageBitmap(JJIIFFFFLandroid/graphics/Bitmap;I)Z
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .line 71
    iget v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    return v0
.end method

.method public getPageLinks()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/mydroid/core/codec/PageLink;",
            ">;"
        }
    .end annotation

    .line 200
    :try_start_0
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->docHandle:J

    iget v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageno:I

    invoke-static {v0, v1, v2}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getPageLinks(JI)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 202
    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getWidth()I

    .line 203
    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getHeight()I

    .line 204
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mydroid/core/codec/PageLink;

    .line 206
    iget-object v3, v2, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, v2, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;

    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    .line 208
    :try_start_1
    iget-object v3, v2, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    sub-int/2addr v3, v4

    iput v3, v2, Lorg/mydroid/core/codec/PageLink;->targetPage:I

    const/4 v3, 0x0

    .line 209
    iput-object v3, v2, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 211
    :try_start_2
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_1
    return-object v0

    :catchall_0
    move-exception v0

    .line 218
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 220
    :cond_2
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method public getPageText()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/mydroid/core/codec/PageTextBox;",
            ">;"
        }
    .end annotation

    .line 283
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->docHandle:J

    iget v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageno:I

    iget-wide v3, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->contextHandle:J

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getPageText(JIJLjava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 286
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mydroid/core/codec/PageTextBox;

    .line 287
    iget v3, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    int-to-float v3, v3

    iget v4, v2, Lorg/mydroid/core/codec/PageTextBox;->top:F

    sub-float/2addr v3, v4

    .line 288
    iget v4, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mHeight:I

    int-to-float v4, v4

    iget v5, v2, Lorg/mydroid/core/codec/PageTextBox;->bottom:F

    sub-float/2addr v4, v5

    cmpl-float v5, v3, v4

    if-lez v5, :cond_0

    move v5, v4

    goto :goto_1

    :cond_0
    move v5, v3

    .line 289
    :goto_1
    iput v5, v2, Lorg/mydroid/core/codec/PageTextBox;->top:F

    cmpg-float v5, v3, v4

    if-gez v5, :cond_1

    move v3, v4

    .line 290
    :cond_1
    iput v3, v2, Lorg/mydroid/core/codec/PageTextBox;->bottom:F

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 67
    iget v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    return v0
.end method

.method public initText()V
    .locals 16

    move-object/from16 v1, p0

    .line 225
    :try_start_0
    invoke-virtual {v1}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getPageText()Ljava/util/List;

    move-result-object v0

    .line 226
    invoke-static {v0}, Lorg/mydroid/core/codec/TxtUtils;->isListEmpty(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_4

    .line 229
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lorg/mydroid/core/codec/TextWord;

    iput-object v2, v1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->texts:[Lorg/mydroid/core/codec/TextWord;

    .line 230
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    .line 233
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_b

    .line 234
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/mydroid/core/codec/PageTextBox;

    .line 235
    new-instance v7, Lorg/mydroid/core/codec/TextWord;

    iget-object v8, v6, Lorg/mydroid/core/codec/PageTextBox;->text:Ljava/lang/String;

    invoke-direct {v7, v8, v6}, Lorg/mydroid/core/codec/TextWord;-><init>(Ljava/lang/String;Landroid/graphics/RectF;)V

    .line 236
    invoke-virtual {v7, v6}, Lorg/mydroid/core/codec/TextWord;->setOriginal(Landroid/graphics/RectF;)V

    .line 237
    iget-object v8, v1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->texts:[Lorg/mydroid/core/codec/TextWord;

    aput-object v7, v8, v5

    .line 239
    iget-object v7, v6, Lorg/mydroid/core/codec/PageTextBox;->text:Ljava/lang/String;

    .line 240
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    sub-int/2addr v8, v9

    const/4 v10, 0x5

    if-ge v5, v8, :cond_2

    add-int/lit8 v8, v5, 0x1

    .line 241
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/mydroid/core/codec/PageTextBox;

    .line 242
    invoke-virtual {v11, v6}, Lorg/mydroid/core/codec/PageTextBox;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 243
    iget-object v5, v6, Lorg/mydroid/core/codec/PageTextBox;->text:Ljava/lang/String;

    iget-object v12, v6, Lorg/mydroid/core/codec/PageTextBox;->text:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    sub-int/2addr v12, v9

    invoke-virtual {v5, v12}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->getType(C)I

    move-result v5

    if-eq v5, v10, :cond_1

    .line 244
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 245
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v11, Lorg/mydroid/core/codec/PageTextBox;->text:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move v5, v8

    goto :goto_1

    .line 251
    :cond_2
    invoke-virtual {v6}, Lorg/mydroid/core/codec/PageTextBox;->width()F

    move-result v8

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v8, v11

    const/4 v11, 0x0

    .line 252
    :goto_2
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v11, v12, :cond_3

    .line 253
    iget v12, v6, Lorg/mydroid/core/codec/PageTextBox;->left:F

    int-to-float v13, v11

    mul-float v13, v13, v8

    add-float/2addr v12, v13

    .line 254
    invoke-virtual {v7, v11}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 255
    new-instance v13, Landroid/graphics/RectF;

    iget v14, v6, Lorg/mydroid/core/codec/PageTextBox;->top:F

    add-float v15, v12, v8

    iget v4, v6, Lorg/mydroid/core/codec/PageTextBox;->bottom:F

    invoke-direct {v13, v12, v14, v15, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 258
    :cond_3
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_a

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v9

    if-ge v5, v4, :cond_a

    add-int/lit8 v4, v5, 0x1

    .line 259
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mydroid/core/codec/PageTextBox;

    .line 260
    iget v11, v4, Lorg/mydroid/core/codec/PageTextBox;->top:F

    iget v12, v6, Lorg/mydroid/core/codec/PageTextBox;->top:F

    sub-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    const/high16 v12, 0x40800000    # 4.0f

    div-float v12, v8, v12

    cmpl-float v11, v11, v12

    if-lez v11, :cond_4

    const/4 v11, 0x1

    goto :goto_3

    :cond_4
    const/4 v11, 0x0

    .line 261
    :goto_3
    iget v4, v4, Lorg/mydroid/core/codec/PageTextBox;->left:F

    iget v13, v6, Lorg/mydroid/core/codec/PageTextBox;->right:F

    sub-float/2addr v4, v13

    const/4 v13, 0x0

    if-nez v11, :cond_5

    cmpl-float v14, v4, v13

    if-lez v14, :cond_a

    :cond_5
    if-eqz v11, :cond_6

    .line 263
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v14

    sub-int/2addr v14, v9

    invoke-virtual {v7, v14}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->getType(C)I

    move-result v7

    if-ne v7, v10, :cond_7

    :cond_6
    cmpl-float v7, v4, v12

    if-lez v7, :cond_a

    :cond_7
    const/16 v7, 0x20

    .line 265
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-nez v11, :cond_8

    const/high16 v7, 0x41000000    # 8.0f

    div-float v7, v8, v7

    cmpg-float v4, v4, v7

    if-gez v4, :cond_9

    :cond_8
    const/4 v8, 0x0

    .line 269
    :cond_9
    new-instance v4, Landroid/graphics/RectF;

    iget v7, v6, Lorg/mydroid/core/codec/PageTextBox;->right:F

    iget v9, v6, Lorg/mydroid/core/codec/PageTextBox;->top:F

    iget v10, v6, Lorg/mydroid/core/codec/PageTextBox;->right:F

    add-float/2addr v10, v8

    iget v6, v6, Lorg/mydroid/core/codec/PageTextBox;->bottom:F

    invoke-direct {v4, v7, v9, v10, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 274
    :cond_b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    .line 275
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Landroid/graphics/RectF;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/graphics/RectF;

    iput-object v0, v1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->rects:[Landroid/graphics/RectF;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 277
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_4
    return-void
.end method

.method public loadText()V
    .locals 1

    .line 31
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->texts:[Lorg/mydroid/core/codec/TextWord;

    if-nez v0, :cond_0

    .line 32
    invoke-virtual {p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->initText()V

    :cond_0
    return-void
.end method

.method public declared-synchronized recycle()V
    .locals 5

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz v0, :cond_0

    .line 182
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 184
    :cond_0
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    .line 185
    monitor-exit p0

    return-void

    .line 189
    :cond_1
    :try_start_1
    iput-wide v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->pageHandle:J

    .line 190
    invoke-static {v0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->free(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 192
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 194
    :goto_0
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public renderBitmap(IZZ)Landroid/graphics/Bitmap;
    .locals 1

    .line 79
    iget p2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->mWidth:I

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return-object v0

    .line 83
    :cond_0
    iget-object p2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz p2, :cond_1

    .line 85
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/graphics/Bitmap;

    .line 88
    :cond_1
    iget-boolean p2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->alreadyMax:Z

    if-eqz p2, :cond_2

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result p2

    if-nez p2, :cond_2

    goto :goto_0

    .line 91
    :cond_2
    invoke-direct {p0, p1}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmapWidth(I)I

    move-result p1

    if-eqz v0, :cond_3

    .line 93
    iget p2, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->targetViewWidth:I

    if-ge p2, p1, :cond_4

    .line 94
    :cond_3
    iput p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->targetViewWidth:I

    .line 95
    sget-boolean p1, Lcom/radaee/pdf/Global;->dark_mode:Z

    iput-boolean p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->invertBitmap:Z

    if-eqz p3, :cond_5

    .line 98
    iget-boolean p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->inGettingBitmap:Z

    if-nez p1, :cond_4

    const/4 p1, 0x1

    .line 99
    iput-boolean p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->inGettingBitmap:Z

    .line 100
    new-instance p2, Lorg/mydroid/droids/djvu/codec/DjvuPage$1;

    invoke-direct {p2, p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage$1;-><init>(Lorg/mydroid/droids/djvu/codec/DjvuPage;)V

    .line 106
    invoke-virtual {p2, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 107
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    :cond_4
    :goto_0
    return-object v0

    .line 110
    :cond_5
    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 111
    invoke-direct {p0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->getReaderBitmapFinal()Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method
