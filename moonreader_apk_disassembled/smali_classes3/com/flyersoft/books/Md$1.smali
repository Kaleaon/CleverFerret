.class Lcom/flyersoft/books/Md$1;
.super Ljava/lang/Object;
.source "Md.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Md;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Md;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Md;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 227
    iput-object p1, p0, Lcom/flyersoft/books/Md$1;->this$0:Lcom/flyersoft/books/Md;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 230
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 231
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/books/Md$1;->this$0:Lcom/flyersoft/books/Md;

    iget-object v2, v2, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 232
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 234
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {v0, p1, p1}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p2, :cond_1

    .line 236
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-object p1

    :catch_0
    move-exception p1

    .line 242
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 6

    .line 248
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 249
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/books/Md$1;->this$0:Lcom/flyersoft/books/Md;

    iget-object v2, v2, Lcom/flyersoft/books/Md;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 250
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 252
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 255
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v1, ".svg"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 256
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/SVG;->getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p1

    .line 257
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentWidth()F

    move-result v2

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_1

    .line 258
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentWidth()F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentHeight()F

    move-result p1

    float-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int p1, v4

    invoke-direct {v2, v1, v1, v3, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    .line 260
    :cond_1
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 262
    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/A;->getStreamBitmapBounds(Ljava/io/InputStream;ZZ)Landroid/graphics/Rect;

    move-result-object v2

    .line 265
    :goto_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    if-nez p2, :cond_3

    .line 267
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_3
    return-object v2

    :catch_0
    move-exception p1

    .line 273
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method
