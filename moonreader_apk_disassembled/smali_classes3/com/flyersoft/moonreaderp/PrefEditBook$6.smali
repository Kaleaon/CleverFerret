.class Lcom/flyersoft/moonreaderp/PrefEditBook$6;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 402
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 405
    sput-object p2, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    .line 406
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setClickable(Z)V

    .line 407
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getCoverImages(Z)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {p2, p1, v0, v0}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/util/ArrayList;Ljava/lang/String;II)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 410
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverImage:Landroid/widget/ImageView;

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 411
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iput-object p1, p2, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectedInnerCover:Ljava/lang/String;

    .line 412
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getVisibility()I

    move-result p2

    const/16 v1, 0x8

    if-ne p2, v1, :cond_0

    const-string p2, "/"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 413
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 414
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 415
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverChanged:Z

    .line 416
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$6;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->-$$Nest$mshowSetDefaultCoverTip(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    :cond_2
    return-void
.end method
