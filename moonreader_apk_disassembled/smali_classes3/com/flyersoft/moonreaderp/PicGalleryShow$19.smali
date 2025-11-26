.class Lcom/flyersoft/moonreaderp/PicGalleryShow$19;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->initViewPager()V
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

    .line 1410
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1417
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mupdateStatusInfo(Lcom/flyersoft/moonreaderp/PicGalleryShow;I)V

    .line 1418
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput p1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    .line 1419
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 1420
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getSelectedItemPosition()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 1421
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0, p1}, Landroid/widget/Gallery;->setSelection(I)V

    :cond_0
    const/16 v0, 0x14

    .line 1422
    invoke-static {v0}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1423
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mclearImageCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    .line 1424
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPageSelected:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1425
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$msetGifButtonVisible(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    return-void
.end method
