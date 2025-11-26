.class Lcom/flyersoft/books/Chm$1;
.super Ljava/lang/Object;
.source "Chm.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Chm;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Chm;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Chm;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 256
    iput-object p1, p0, Lcom/flyersoft/books/Chm$1;->this$0:Lcom/flyersoft/books/Chm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getImageFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 259
    iget-object v0, p0, Lcom/flyersoft/books/Chm$1;->this$0:Lcom/flyersoft/books/Chm;

    invoke-static {v0, p1}, Lcom/flyersoft/books/Chm;->-$$Nest$mgetEntryName(Lcom/flyersoft/books/Chm;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 262
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Chm$1;->this$0:Lcom/flyersoft/books/Chm;

    iget-object v0, v0, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->getCacheFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 263
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isEmptyFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 265
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/Chm$1;->this$0:Lcom/flyersoft/books/Chm;

    iget-object v1, v1, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v1, p1, v0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 267
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 268
    sget-object v0, Lcom/flyersoft/tools/A;->tmp_out_file:Ljava/lang/String;

    .line 269
    iget-object v1, p0, Lcom/flyersoft/books/Chm$1;->this$0:Lcom/flyersoft/books/Chm;

    iget-object v1, v1, Lcom/flyersoft/books/Chm;->doc:Lcom/flyersoft/books/chmlib/ChmDocumentCache;

    invoke-virtual {v1, p1, v0}, Lcom/flyersoft/books/chmlib/ChmDocumentCache;->saveToCache(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 1

    const/4 p2, 0x0

    .line 276
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Chm$1;->getImageFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 279
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {v0, p1, p1}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 280
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 285
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p2
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 3

    const/4 p2, 0x0

    .line 292
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Chm$1;->getImageFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 295
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 296
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    const-string v1, "r"

    invoke-virtual {v0, p1, v1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    .line 297
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    .line 298
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    .line 299
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 300
    invoke-static {p1, p2, v0}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 301
    new-instance p1, Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/4 v2, 0x0

    invoke-direct {p1, v2, v2, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 304
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p2
.end method
