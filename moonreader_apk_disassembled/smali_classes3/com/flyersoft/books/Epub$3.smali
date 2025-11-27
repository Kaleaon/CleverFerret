.class Lcom/flyersoft/books/Epub$3;
.super Ljava/lang/Object;
.source "Epub.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Epub;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Epub;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Epub;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2073
    iput-object p1, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 4

    const/4 v0, 0x0

    .line 2077
    :try_start_0
    const-string v1, "#audio#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "#video#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 2081
    :cond_0
    const-string v1, "data:image"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 2082
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 2083
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    .line 2084
    array-length v1, p1

    invoke-static {p1, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 2085
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    if-nez p2, :cond_1

    .line 2087
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v1

    .line 2091
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    sget v3, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v1, p1, v3}, Lcom/flyersoft/books/Epub;->getImageFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    return-object v0

    .line 2094
    :cond_3
    iget-object v3, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 2097
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v3, ".svg"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 2098
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSvgDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    .line 2100
    :cond_4
    invoke-static {v1, v2, v2}, Lcom/flyersoft/tools/A;->getStreamBitmap(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 2101
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    move-object p1, v2

    .line 2104
    :goto_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    if-nez p2, :cond_5

    .line 2106
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :cond_5
    return-object p1

    .line 2078
    :cond_6
    :goto_1
    iget-object p2, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    invoke-virtual {p2, p1}, Lcom/flyersoft/books/Epub;->getAudioVideoDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 2079
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 2113
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object v0
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 7

    const/4 v0, 0x0

    .line 2120
    :try_start_0
    const-string v1, "#audio#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_8

    const-string v1, "#video#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_1

    .line 2125
    :cond_0
    const-string v1, "data:image"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    .line 2126
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v3

    .line 2127
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    .line 2128
    array-length v1, p1

    invoke-static {p1, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 2129
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 2130
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    if-lez p1, :cond_2

    .line 2131
    new-instance p1, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-direct {p1, v2, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    if-nez p2, :cond_1

    .line 2133
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1

    :cond_1
    return-object p1

    :cond_2
    return-object v0

    .line 2139
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    sget v4, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v1, p1, v4}, Lcom/flyersoft/books/Epub;->getImageFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    return-object v0

    .line 2142
    :cond_4
    iget-object v4, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    invoke-virtual {v4, v1}, Lcom/flyersoft/books/Epub;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 2145
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const-string v4, ".svg"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 2148
    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/SVG;->getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p1

    .line 2149
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getDocumentWidth()F

    move-result v3

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_5

    .line 2150
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

    :cond_5
    return-object v0

    .line 2154
    :cond_6
    invoke-static {v1, v3, v2}, Lcom/flyersoft/tools/A;->getStreamBitmapBounds(Ljava/io/InputStream;ZZ)Landroid/graphics/Rect;

    move-result-object v3

    .line 2157
    :goto_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    if-nez p2, :cond_7

    .line 2159
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1

    return-object p1

    :cond_7
    return-object v3

    .line 2121
    :cond_8
    :goto_1
    iget-object p2, p0, Lcom/flyersoft/books/Epub$3;->this$0:Lcom/flyersoft/books/Epub;

    invoke-virtual {p2, p1}, Lcom/flyersoft/books/Epub;->getAudioVideoDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 2122
    new-instance p2, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    invoke-direct {p2, v2, v2, v1, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2123
    invoke-static {p2}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 2166
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object v0
.end method
