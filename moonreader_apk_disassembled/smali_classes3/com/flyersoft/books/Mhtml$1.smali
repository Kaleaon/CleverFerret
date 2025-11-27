.class Lcom/flyersoft/books/Mhtml$1;
.super Ljava/lang/Object;
.source "Mhtml.java"

# interfaces
.implements Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Mhtml;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Mhtml;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Mhtml;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 131
    iput-object p1, p0, Lcom/flyersoft/books/Mhtml$1;->this$0:Lcom/flyersoft/books/Mhtml;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
