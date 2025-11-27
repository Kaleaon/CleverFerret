.class Lcom/flyersoft/books/Docx$1;
.super Ljava/lang/Object;
.source "Docx.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Docx;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Docx;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Docx;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 354
    iput-object p1, p0, Lcom/flyersoft/books/Docx$1;->this$0:Lcom/flyersoft/books/Docx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getImageFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 357
    iget-object v0, p0, Lcom/flyersoft/books/Docx$1;->this$0:Lcom/flyersoft/books/Docx;

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/Docx;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 358
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 359
    iget-object v0, p0, Lcom/flyersoft/books/Docx$1;->this$0:Lcom/flyersoft/books/Docx;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/Docx;->getFilenameWithPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 4

    const/4 v0, 0x0

    .line 365
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx$1;->getImageFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    return-object v0

    .line 368
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/books/Docx$1;->this$0:Lcom/flyersoft/books/Docx;

    invoke-virtual {v2, v1}, Lcom/flyersoft/books/Docx;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 371
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v2, ".svg"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 372
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSvgDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 374
    invoke-static {v1, p1, p1}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 375
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    move-object p1, v2

    .line 378
    :goto_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    if-nez p2, :cond_2

    .line 380
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-object p1

    :catch_0
    move-exception p1

    .line 386
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object v0
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 7

    const/4 v0, 0x0

    .line 393
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Docx$1;->getImageFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    return-object v0

    .line 396
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/books/Docx$1;->this$0:Lcom/flyersoft/books/Docx;

    invoke-virtual {v2, v1}, Lcom/flyersoft/books/Docx;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 399
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v2, ".svg"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    const/4 v2, 0x0

    if-eqz p1, :cond_2

    .line 400
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/SVG;->getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p1

    .line 401
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentWidth()F

    move-result v3

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_1

    .line 402
    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentWidth()F

    move-result v4

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentHeight()F

    move-result p1

    float-to-double v5, p1

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int p1, v5

    invoke-direct {v3, v2, v2, v4, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    .line 404
    :cond_1
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 406
    invoke-static {v1, p1, v2}, Lcom/flyersoft/tools/A;->getStreamBitmapBounds(Ljava/io/InputStream;ZZ)Landroid/graphics/Rect;

    move-result-object v3

    .line 409
    :goto_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    if-nez p2, :cond_3

    .line 411
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_3
    return-object v3

    :catch_0
    move-exception p1

    .line 417
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object v0
.end method
