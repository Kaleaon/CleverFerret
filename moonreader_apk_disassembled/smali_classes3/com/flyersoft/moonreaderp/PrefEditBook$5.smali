.class Lcom/flyersoft/moonreaderp/PrefEditBook$5;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;


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

    .line 389
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$5;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    if-nez p2, :cond_0

    return-void

    .line 393
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$5;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverImage:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 394
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$5;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setClickable(Z)V

    .line 395
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$5;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverChanged:Z

    .line 396
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$5;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method
