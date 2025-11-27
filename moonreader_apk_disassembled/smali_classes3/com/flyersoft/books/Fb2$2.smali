.class Lcom/flyersoft/books/Fb2$2;
.super Ljava/lang/Object;
.source "Fb2.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Fb2;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Fb2;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Fb2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 235
    iput-object p1, p0, Lcom/flyersoft/books/Fb2$2;->this$0:Lcom/flyersoft/books/Fb2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getBytes(Ljava/lang/String;)[B
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$2;->this$0:Lcom/flyersoft/books/Fb2;

    iget-object v0, v0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$2;->this$0:Lcom/flyersoft/books/Fb2;

    iget-object v0, v0, Lcom/flyersoft/books/Fb2;->images:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/Fb2$FB2Image;

    invoke-virtual {p1}, Lcom/flyersoft/books/Fb2$FB2Image;->getBinary()Ljava/lang/String;

    move-result-object p1

    .line 241
    invoke-static {p1}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 2

    const/4 p2, 0x0

    .line 246
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2$2;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    const/4 v0, 0x0

    .line 249
    invoke-static {p1, v0, v0}, Lcom/flyersoft/tools/A;->getBytesBitmap([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 250
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 251
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 256
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p2
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 0

    const/4 p2, 0x0

    .line 263
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/Fb2$2;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 266
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBytesBitmapBounds([B)Landroid/graphics/Rect;

    move-result-object p1

    .line 267
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getDisplayDrawableBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 270
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p2
.end method
