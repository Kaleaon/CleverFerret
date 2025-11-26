.class Lcom/flyersoft/moonreaderp/PicGalleryShow$4;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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

    .line 322
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 325
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1}, Landroid/widget/Gallery;->getAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p4

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-wide v0, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->tmpTime:J

    sub-long/2addr p4, v0

    const-wide/16 v0, 0x3e8

    cmp-long p1, p4, v0

    if-lez p1, :cond_0

    .line 326
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1, p2}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 327
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    const/4 p4, 0x0

    invoke-virtual {p1, p4}, Landroid/widget/Gallery;->setAnimation(Landroid/view/animation/Animation;)V

    .line 328
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 330
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {p1, p4}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 331
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-static {p4, p1, p2}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    .line 333
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->titleTv:Landroid/widget/TextView;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string p5, ""

    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 p5, p3, 0x1

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p5, "/"

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p5, p5, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result p5

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 334
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misCbz(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {p1}, Lcom/flyersoft/views/MyViewPager;->getCurrentItem()I

    move-result p1

    if-eq p1, p3, :cond_1

    .line 335
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {p1, p3, p2}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(IZ)V

    :cond_1
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
