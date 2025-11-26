.class Lcom/flyersoft/books/Fb2$1;
.super Ljava/lang/Object;
.source "Fb2.java"

# interfaces
.implements Landroid/text/Html$ImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Fb2;->getImageGetter()Landroid/text/Html$ImageGetter;
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

    .line 220
    iput-object p1, p0, Lcom/flyersoft/books/Fb2$1;->this$0:Lcom/flyersoft/books/Fb2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/flyersoft/books/Fb2$1;->this$0:Lcom/flyersoft/books/Fb2;

    invoke-virtual {v0}, Lcom/flyersoft/books/Fb2;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;->getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method
