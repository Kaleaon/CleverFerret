.class Lcom/flyersoft/books/Mobi$1;
.super Ljava/lang/Object;
.source "Mobi.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Mobi;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Mobi;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Mobi;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 309
    iput-object p1, p0, Lcom/flyersoft/books/Mobi$1;->this$0:Lcom/flyersoft/books/Mobi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 311
    iget-object p2, p0, Lcom/flyersoft/books/Mobi$1;->this$0:Lcom/flyersoft/books/Mobi;

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/books/Mobi;->getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 0

    .line 315
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/Mobi$1;->getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 316
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
