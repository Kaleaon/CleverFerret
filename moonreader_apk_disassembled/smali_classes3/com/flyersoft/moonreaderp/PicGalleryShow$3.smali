.class Lcom/flyersoft/moonreaderp/PicGalleryShow$3;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->initGallery(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 308
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 311
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misCbz(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 312
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 313
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {p1}, Lcom/flyersoft/views/MyViewPager;->getCurrentItem()I

    move-result p1

    if-eq p1, p3, :cond_0

    .line 314
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    const/4 p2, 0x0

    invoke-virtual {p1, p3, p2}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(IZ)V

    return-void

    .line 316
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mforceRefreshComic(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    :cond_1
    return-void
.end method
