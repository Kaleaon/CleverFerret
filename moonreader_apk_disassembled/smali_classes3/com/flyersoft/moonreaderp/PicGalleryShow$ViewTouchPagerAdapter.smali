.class public Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewTouchPagerAdapter"
.end annotation


# instance fields
.field comics:[Lcom/flyersoft/views/picview/ComicView;

.field onComicTap:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1443
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 1476
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->onComicTap:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;

    .line 1444
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Lcom/flyersoft/views/picview/ComicView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    return-void
.end method

.method private setTapEvent(Lcom/flyersoft/views/picview/ComicView;)V
    .locals 1

    .line 1473
    iget-object p1, p1, Lcom/flyersoft/views/picview/ComicView;->mAttacher:Lcom/flyersoft/views/picview/ComicViewAttacher;

    iget-object p1, p1, Lcom/flyersoft/views/picview/ComicViewAttacher;->doubleTapListener:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->onComicTap:Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener;->setOnSingleTap(Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1451
    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1452
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    const/4 p3, 0x0

    aput-object p3, p1, p2

    .line 1453
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "destroyItem:"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p3, 0x0

    aput-object p1, p2, p3

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 1447
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    .line 1458
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    aget-object v0, v0, p2

    if-nez v0, :cond_0

    .line 1459
    new-instance v0, Lcom/flyersoft/views/picview/ComicView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/views/picview/ComicView;-><init>(Landroid/content/Context;)V

    const/4 v1, -0x1

    .line 1460
    invoke-virtual {p1, v0, v1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 1461
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    aput-object v0, p1, p2

    .line 1462
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->setTapEvent(Lcom/flyersoft/views/picview/ComicView;)V

    .line 1465
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {p1, v0, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setImageView(Lcom/flyersoft/views/picview/ComicView;I)V

    .line 1466
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "instantiateItem:"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, p2, v1

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1484
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
