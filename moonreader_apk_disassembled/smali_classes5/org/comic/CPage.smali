.class public Lorg/comic/CPage;
.super Ljava/lang/Object;
.source "CPage.java"


# static fields
.field static final MaxSize:I = 0x6400000


# instance fields
.field alpha:I

.field alphaStart:J

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

.field imageWidth:I

.field inGettingBitmap:Z

.field public m_doc:Lorg/comic/CDocument;

.field public pageno:I

.field targetViewWidth:I


# direct methods
.method static bridge synthetic -$$Nest$mgetReaderBitmapFinal(Lorg/comic/CPage;)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0}, Lorg/comic/CPage;->getReaderBitmapFinal()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lorg/comic/CDocument;I)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    .line 24
    iput p2, p0, Lorg/comic/CPage;->pageno:I

    return-void
.end method

.method private getReaderBitmapFinal()Landroid/graphics/Bitmap;
    .locals 4

    :cond_0
    const/4 v0, 0x0

    .line 90
    :try_start_0
    iget-boolean v1, p0, Lorg/comic/CPage;->alreadyMax:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/comic/CPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 91
    iget-object v1, p0, Lorg/comic/CPage;->bitmapRef:Ljava/lang/ref/Reference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    return-object v1

    .line 93
    :cond_1
    invoke-direct {p0}, Lorg/comic/CPage;->renderBitmapWidth()I

    move-result v1

    const/4 v2, 0x0

    .line 94
    invoke-static {p0, v1, v2}, Lorg/comic/CPage;->renderBitmapNative(Lorg/comic/CPage;II)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_2

    return-object v0

    .line 98
    :cond_2
    iget-object v3, p0, Lorg/comic/CPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz v3, :cond_3

    .line 99
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Bitmap;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 101
    :cond_3
    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lorg/comic/CPage;->bitmapRef:Ljava/lang/ref/Reference;

    .line 103
    invoke-direct {p0}, Lorg/comic/CPage;->renderBitmapWidth()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    if-gt v0, v1, :cond_0

    return-object v2

    :catch_0
    move-exception v1

    .line 107
    iget-object v2, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lorg/comic/CDocument;->outOfMemoryError:Z

    .line 108
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private static declared-synchronized renderBitmapNative(Lorg/comic/CPage;II)Landroid/graphics/Bitmap;
    .locals 8

    const-class v0, Lorg/comic/CPage;

    monitor-enter v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 124
    :try_start_0
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 125
    iput-boolean v1, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 127
    iget-object v4, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget-object v4, v4, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    .line 128
    iget-object v5, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget v6, p0, Lorg/comic/CPage;->pageno:I

    invoke-virtual {v5, v6}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v5

    .line 129
    iget-object v6, v5, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    if-nez v6, :cond_1

    .line 132
    iget-object v4, v5, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 133
    iget-object v3, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v3, v5}, Lorg/comic/CDocument;->unrarFile(Lorg/comic/CbzPageInfo;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    monitor-exit v0

    return-object v2

    .line 137
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    new-instance v6, Ljava/io/File;

    iget-object v7, v5, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 138
    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    const-string v7, "r"

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v4

    .line 139
    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-static {v4, v2, v3}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 140
    invoke-static {p0, v3, p1}, Lorg/comic/CPage;->setImageOptsSize(Lorg/comic/CPage;Landroid/graphics/BitmapFactory$Options;I)V

    .line 141
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/2addr v4, p2

    iput v4, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 142
    iget-object v4, v5, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    invoke-static {v4, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 143
    invoke-static {p0, v2}, Lorg/comic/CPage;->updatePageInfo(Lorg/comic/CPage;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 145
    :cond_1
    invoke-static {v6, v2, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v7
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    :try_start_2
    invoke-static {p0, v3, p1}, Lorg/comic/CPage;->setImageOptsSize(Lorg/comic/CPage;Landroid/graphics/BitmapFactory$Options;I)V

    .line 147
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 148
    iget-object v5, v5, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 149
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/2addr v5, p2

    iput v5, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 150
    invoke-static {v4, v2, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 151
    :try_start_3
    invoke-static {p0, v2}, Lorg/comic/CPage;->updatePageInfo(Lorg/comic/CPage;Landroid/graphics/Bitmap;)V

    :goto_0
    if-eqz v2, :cond_2

    .line 154
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v3

    const/high16 v4, 0x6400000

    if-le v3, v4, :cond_2

    add-int/lit8 v3, p2, 0x1

    .line 155
    invoke-static {p0, p1, v3}, Lorg/comic/CPage;->renderBitmapNative(Lorg/comic/CPage;II)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit v0

    return-object p0

    :catch_0
    move-exception p0

    move-object v2, v7

    goto :goto_1

    :catch_1
    move-exception v3

    move-object v2, v7

    goto :goto_2

    :catchall_0
    move-exception p0

    goto :goto_4

    :catch_2
    move-exception p0

    .line 164
    :goto_1
    :try_start_4
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_3
    move-exception v3

    .line 159
    :goto_2
    iget-object v4, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iput-boolean v1, v4, Lorg/comic/CDocument;->outOfMemoryError:Z

    .line 160
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v3, 0x2

    if-ge p2, v3, :cond_2

    add-int/2addr p2, v1

    .line 162
    invoke-static {p0, p1, p2}, Lorg/comic/CPage;->renderBitmapNative(Lorg/comic/CPage;II)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit v0

    return-object p0

    .line 166
    :cond_2
    :goto_3
    monitor-exit v0

    return-object v2

    :goto_4
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p0
.end method

.method private renderBitmapWidth()I
    .locals 2

    .line 116
    iget v0, p0, Lorg/comic/CPage;->targetViewWidth:I

    iget v1, p0, Lorg/comic/CPage;->imageWidth:I

    if-le v0, v1, :cond_0

    if-lez v1, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method private static setImageOptsSize(Lorg/comic/CPage;Landroid/graphics/BitmapFactory$Options;I)V
    .locals 4

    .line 192
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v0, v0

    int-to-float v1, p2

    div-float/2addr v0, v1

    .line 193
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_0

    float-to-int v1, v0

    int-to-float v1, v1

    sub-float v1, v0, v1

    const v2, 0x3f4ccccd    # 0.8f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto :goto_0

    :cond_0
    float-to-int v0, v0

    :goto_0
    const/4 v1, 0x1

    if-lez v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    .line 194
    :goto_1
    iput v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v0, 0x0

    .line 195
    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 197
    sget v2, Lcom/flyersoft/tools/A;->comic_render_quality:I

    if-ne v2, v1, :cond_2

    .line 198
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/2addr v2, v1

    iput v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 199
    :cond_2
    sget v2, Lcom/flyersoft/tools/A;->comic_render_quality:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    .line 200
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 202
    :cond_3
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v2, p0, Lorg/comic/CPage;->imageWidth:I

    .line 203
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-eq v2, v1, :cond_5

    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lt p2, p1, :cond_4

    goto :goto_2

    :cond_4
    const/4 v1, 0x0

    :cond_5
    :goto_2
    iput-boolean v1, p0, Lorg/comic/CPage;->alreadyMax:Z

    return-void
.end method

.method private startThread()V
    .locals 2

    .line 72
    new-instance v0, Lorg/comic/CPage$1;

    invoke-direct {v0, p0}, Lorg/comic/CPage$1;-><init>(Lorg/comic/CPage;)V

    const/4 v1, 0x1

    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 81
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private static updatePageInfo(Lorg/comic/CPage;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 170
    iget-object v0, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget v0, v0, Lorg/comic/CDocument;->view_mode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 172
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 174
    :cond_1
    iget-object v0, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/CPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->getPageInfo(I)Lorg/comic/CbzPageInfo;

    move-result-object v0

    .line 175
    iget-boolean v1, v0, Lorg/comic/CbzPageInfo;->realSize:Z

    if-eqz v1, :cond_2

    goto :goto_1

    .line 178
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 179
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    .line 180
    iget-object v2, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget v2, v2, Lorg/comic/CDocument;->view_mode:I

    if-nez v2, :cond_3

    .line 181
    iget-object v2, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget v2, v2, Lorg/comic/CDocument;->defaultPageWidth:I

    mul-int v2, v2, p1

    div-int/2addr v2, v1

    iput v2, v0, Lorg/comic/CbzPageInfo;->height:I

    goto :goto_0

    .line 183
    :cond_3
    iget-object v2, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget v2, v2, Lorg/comic/CDocument;->defaultPageHeight:I

    mul-int v2, v2, v1

    div-int/2addr v2, p1

    iput v2, v0, Lorg/comic/CbzPageInfo;->width:I

    :goto_0
    const/4 p1, 0x1

    .line 186
    iput-boolean p1, v0, Lorg/comic/CbzPageInfo;->realSize:Z

    .line 187
    iget-object p1, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget-object p1, p1, Lorg/comic/CDocument;->m_layout:Lorg/comic/CLayout;

    if-eqz p1, :cond_4

    .line 188
    iget-object p0, p0, Lorg/comic/CPage;->m_doc:Lorg/comic/CDocument;

    iget-object p0, p0, Lorg/comic/CDocument;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p0}, Lorg/comic/CLayout;->vLayout()V

    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public getAlpha(I)I
    .locals 5

    const/16 v0, 0xff

    if-eqz p1, :cond_3

    .line 36
    iget v1, p0, Lorg/comic/CPage;->alpha:I

    if-le v1, v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lorg/comic/CPage;->alphaStart:J

    .line 40
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lorg/comic/CPage;->alphaStart:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0xff

    mul-long v1, v1, v3

    int-to-long v3, p1

    .line 41
    div-long/2addr v1, v3

    const-wide/16 v3, 0x14

    add-long/2addr v1, v3

    long-to-int p1, v1

    iput p1, p0, Lorg/comic/CPage;->alpha:I

    if-le p1, v0, :cond_2

    return v0

    :cond_2
    return p1

    :cond_3
    :goto_0
    return v0
.end method

.method public renderBitmap(IZ)Landroid/graphics/Bitmap;
    .locals 1

    .line 49
    iget-object p2, p0, Lorg/comic/CPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz p2, :cond_0

    .line 51
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 54
    :goto_0
    iget-boolean v0, p0, Lorg/comic/CPage;->alreadyMax:Z

    if-eqz v0, :cond_1

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    if-eqz p2, :cond_2

    .line 57
    iget v0, p0, Lorg/comic/CPage;->targetViewWidth:I

    if-ge v0, p1, :cond_3

    .line 59
    :cond_2
    iput p1, p0, Lorg/comic/CPage;->targetViewWidth:I

    .line 60
    iget-boolean p1, p0, Lorg/comic/CPage;->inGettingBitmap:Z

    if-nez p1, :cond_3

    const/4 p1, 0x1

    .line 61
    iput-boolean p1, p0, Lorg/comic/CPage;->inGettingBitmap:Z

    .line 62
    invoke-direct {p0}, Lorg/comic/CPage;->startThread()V

    .line 66
    :cond_3
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result p1

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    .line 67
    iput p1, p0, Lorg/comic/CPage;->alpha:I

    :cond_4
    :goto_1
    return-object p2
.end method
