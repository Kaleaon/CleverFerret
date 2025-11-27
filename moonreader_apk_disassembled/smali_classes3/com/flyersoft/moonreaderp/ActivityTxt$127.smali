.class Lcom/flyersoft/moonreaderp/ActivityTxt$127;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_book_info()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13277
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 13279
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-class v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 13280
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getCoverFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 13281
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getCoverFile()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ebookImage"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 13283
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "imageFile"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13284
    const-string v0, "singPicOnly"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13286
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
