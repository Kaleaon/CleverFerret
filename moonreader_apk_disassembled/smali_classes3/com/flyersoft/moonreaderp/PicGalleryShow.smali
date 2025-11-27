.class public Lcom/flyersoft/moonreaderp/PicGalleryShow;
.super Lcom/flyersoft/moonreaderp/MyActionBarActivity;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;,
        Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;,
        Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;
    }
.end annotation


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PicGalleryShow;


# instance fields
.field actTransArrive:Z

.field actTransEnd:Z

.field baseFrame:Landroid/widget/FrameLayout;

.field cbzH:I

.field cbzThumbSize:I

.field cbzW:I

.field private cbz_file:Ljava/lang/String;

.field closeIv:Landroid/widget/ImageView;

.field currentImageFile:Ljava/lang/String;

.field currentPage:I

.field cutoutInsets:Landroid/graphics/Insets;

.field daynightIv:Landroid/view/View;

.field private disableBackKey:Z

.field ebook:Lcom/flyersoft/books/BaseEBook;

.field gallery:Landroid/widget/Gallery;

.field private galleryClearTag:Z

.field galleryInited:Z

.field gif:Landroid/view/View;

.field handler:Landroid/os/Handler;

.field hasActTrans:Z

.field hasActTransExtra:Z

.field public imageCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field imageFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field imageHandler:Landroid/os/Handler;

.field navigationBarInsets:Landroid/graphics/Insets;

.field optionIv:Landroid/view/View;

.field playIv:Landroid/view/View;

.field private progressDlg:Landroid/app/ProgressDialog;

.field progressIndicator:Landroid/widget/ProgressBar;

.field shareIv:Landroid/view/View;

.field singPicOnly:Z

.field slideshowTimer:Ljava/util/Timer;

.field statusBarInsets:Landroid/graphics/Insets;

.field private statusHandler:Landroid/os/Handler;

.field statusLay:Landroid/view/View;

.field private statusLeft:Landroid/widget/TextView;

.field private statusLeft2:Landroid/widget/TextView;

.field private statusMiddle:Landroid/widget/TextView;

.field private statusRight:Landroid/widget/TextView;

.field titleTv:Landroid/widget/TextView;

.field tmpTime:J

.field top:Ljava/lang/Integer;

.field topLay:Landroid/view/View;

.field private unzippingFile:Ljava/lang/String;

.field viewPager:Lcom/flyersoft/views/MyViewPager;

.field private zipImageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;",
            ">;"
        }
    .end annotation
.end field

.field private zipThread:Ljava/lang/Thread;

.field private zipper:Lcom/flyersoft/tools/compress/BaseCompressor;


# direct methods
.method static bridge synthetic -$$Nest$fgetcbz_file(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetgalleryClearTag(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetstatusHandler(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetunzippingFile(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzippingFile:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetzipper(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Lcom/flyersoft/tools/compress/BaseCompressor;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcacheFileOk(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cacheFileOk(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mclearGallery(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearGallery()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearImageCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoTapEvent(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/view/MotionEvent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doTapEvent(Landroid/view/MotionEvent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoUnzipToCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doUnzipToCache(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mforceRefreshComic(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->forceRefreshComic()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgoNextImage(Lcom/flyersoft/moonreaderp/PicGalleryShow;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->goNextImage(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhideGallery(Lcom/flyersoft/moonreaderp/PicGalleryShow;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hideGallery(J)V

    return-void
.end method

.method static bridge synthetic -$$Nest$misCbz(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$misGalleryEmpty(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isGalleryEmpty()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$msetAndroid15Insets(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setAndroid15Insets(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetGifButtonVisible(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setGifButtonVisible()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowProgressMessage(Lcom/flyersoft/moonreaderp/PicGalleryShow;ZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showProgressMessage(ZLjava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$munzipImagesProc(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzipImagesProc()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateBarTime(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->updateBarTime()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mupdateStatusInfo(Lcom/flyersoft/moonreaderp/PicGalleryShow;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->updateStatusInfo(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 82
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;-><init>()V

    .line 359
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 507
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->disableBackKey:Z

    .line 798
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    .line 845
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$8;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow$8;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageHandler:Landroid/os/Handler;

    const/4 v0, -0x1

    .line 996
    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzW:I

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzH:I

    const/16 v1, 0xf0

    .line 1289
    iput v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzThumbSize:I

    .line 1407
    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    return-void
.end method

.method private allowBookCoverAnimat()Z
    .locals 1

    .line 1489
    invoke-static {}, Lcom/flyersoft/tools/A;->openBookAnim()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hasActTransExtra:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private cacheFileOk(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_1

    .line 984
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    if-gtz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 985
    :cond_1
    :goto_0
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 986
    invoke-static {p2}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 987
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p1, p3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 988
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "s"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 990
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    const/4 p1, 0x0

    return p1
.end method

.method private clearFileCache()V
    .locals 2

    .line 1336
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1338
    :cond_0
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$17;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$17;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    const/4 v1, 0x1

    .line 1362
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 1363
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private clearGallery()V
    .locals 2

    .line 431
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 432
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 433
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    .line 434
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    new-instance v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;

    invoke-direct {v1, p0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 435
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    .line 436
    const-string v0, "clearGallery: "

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private clearImageCache()V
    .locals 2

    .line 800
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/16 v0, 0xf

    .line 801
    invoke-static {v0}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 802
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method private createImagetFileList()V
    .locals 8

    .line 198
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v0, :cond_b

    .line 199
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    .line 203
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    .line 204
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const-string v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 205
    const-string v4, ""

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 206
    :goto_0
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-ne v0, v1, :cond_1

    .line 207
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-virtual {v4}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList()Ljava/util/ArrayList;

    move-result-object v4

    goto :goto_2

    :cond_1
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-virtual {v5, v4}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    goto :goto_2

    .line 208
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->singPicOnly:Z

    if-nez v0, :cond_3

    .line 209
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3, v2, v2, v3}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v4

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    :goto_1
    const/4 v0, 0x0

    :goto_2
    if-eqz v4, :cond_4

    .line 212
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 214
    :cond_4
    iget-boolean v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->singPicOnly:Z

    if-eqz v5, :cond_5

    .line 215
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_5
    if-eqz v4, :cond_8

    .line 218
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 219
    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 220
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    if-eqz v6, :cond_7

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 221
    :cond_7
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_8
    :goto_4
    if-ne v0, v1, :cond_a

    .line 223
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    .line 225
    const-string v0, "cbz_progress"

    invoke-virtual {p0, v0, v3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    .line 226
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 227
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-virtual {v1, v0, v2, v3}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->loading:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "...      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showProgressMessage(ZLjava/lang/String;)V

    .line 230
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    sput-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    :cond_a
    return-void

    .line 233
    :cond_b
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_c

    .line 234
    :goto_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const-string v1, "-0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const-string v2, "-"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    goto :goto_5

    .line 236
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    return-void
.end method

.method private doFinish()V
    .locals 1

    const/4 v0, 0x0

    .line 1247
    sput-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 1248
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->allowBookCoverAnimat()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1249
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->finishAfterTransition()V

    return-void

    .line 1251
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->finish()V

    return-void
.end method

.method private doTapEvent(Landroid/view/MotionEvent;)V
    .locals 1

    const/4 v0, 0x0

    .line 1064
    invoke-static {p1, v0, v0}, Lcom/flyersoft/tools/A;->clickArea(Landroid/view/MotionEvent;ZZ)I

    move-result p1

    if-eqz p1, :cond_4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    return-void

    .line 1075
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doTouchDown(I)V

    return-void

    .line 1072
    :cond_1
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doTouchDown(I)V

    return-void

    .line 1069
    :cond_2
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doTouchDown(I)V

    return-void

    .line 1066
    :cond_3
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doTouchDown(I)V

    return-void

    .line 1078
    :cond_4
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->switchGalleyVisible()V

    return-void
.end method

.method private doUnzipToCache(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V
    .locals 9

    .line 657
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 658
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 659
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    .line 660
    :cond_0
    invoke-direct {p0, p1, p2, v5}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageInProgress(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;Ljava/lang/String;)Z

    move-result v0

    const/4 v7, 0x0

    if-nez v0, :cond_1

    .line 661
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    invoke-virtual {v8, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_1
    const/4 v0, 0x1

    add-int/lit8 v2, p3, 0x1

    .line 662
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 663
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4, v0, v7}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 664
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipThread:Ljava/lang/Thread;

    if-eqz v0, :cond_3

    .line 667
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    .line 669
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    :goto_0
    return-void

    .line 672
    :cond_4
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$7;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$7;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipThread:Ljava/lang/Thread;

    .line 679
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 680
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method private forceRefreshComic()V
    .locals 4

    .line 347
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v0}, Lcom/flyersoft/views/MyViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    .line 348
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v1}, Lcom/flyersoft/views/MyViewPager;->getCurrentItem()I

    move-result v1

    .line 349
    aget-object v0, v0, v1

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    .line 351
    invoke-virtual {v0, v2}, Lcom/flyersoft/views/picview/ComicView;->setTag(Ljava/lang/Object;)V

    .line 352
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 353
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setImageView(Lcom/flyersoft/views/picview/ComicView;I)V

    .line 355
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v0}, Lcom/flyersoft/views/MyViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method

.method private getCurImagePos()I
    .locals 5

    .line 388
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    return v0

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    return v2

    .line 393
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const-string v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v1, :cond_2

    .line 394
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 395
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 397
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_3

    instance-of v1, v0, Lcom/flyersoft/books/Epub;

    if-eqz v1, :cond_3

    .line 398
    check-cast v0, Lcom/flyersoft/books/Epub;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    sget v3, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/books/Epub;->getImageFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    :cond_3
    const/4 v0, 0x0

    .line 399
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 400
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    return v0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 403
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const/4 v0, 0x0

    .line 404
    :goto_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_8

    .line 405
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_2

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_7
    :goto_2
    return v0

    :cond_8
    return v2
.end method

.method private getFileDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 5

    const/4 v0, 0x1

    .line 636
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getImageOpts(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    .line 637
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->maxScreenWidth()I

    move-result v3

    mul-int/lit8 v3, v3, 0x5

    const/4 v4, 0x3

    if-lt v2, v3, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    .line 639
    :cond_0
    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->maxScreenWidth()I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    mul-int/lit8 v2, v2, 0x3

    if-lt v1, v2, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :catch_0
    move-exception v1

    .line 642
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 644
    :cond_1
    :goto_0
    invoke-static {p0, p1, v0}, Lcom/flyersoft/tools/T;->getFileDrawable(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method

.method private getImageOpts(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1029
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1030
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    const-string v1, "r"

    .line 1029
    invoke-virtual {v0, p1, v1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    .line 1031
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    .line 1032
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    .line 1033
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    const/4 v1, 0x0

    .line 1034
    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private goNextImage(Z)V
    .locals 4

    .line 551
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v0

    const/4 v1, 0x1

    if-nez p1, :cond_0

    .line 553
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v1

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    const-wide/16 v2, 0x0

    .line 556
    invoke-direct {p0, v2, v3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hideGallery(J)V

    .line 557
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1}, Landroid/widget/Gallery;->clearAnimation()V

    .line 559
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v1

    if-ge v0, p1, :cond_1

    add-int/2addr v0, v1

    .line 560
    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 562
    iput p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    .line 564
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 565
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(IZ)V

    return-void
.end method

.method private goPriorImage(Z)V
    .locals 3

    .line 569
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v0

    if-nez p1, :cond_0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-wide/16 v1, 0x0

    .line 574
    invoke-direct {p0, v1, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hideGallery(J)V

    .line 575
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1}, Landroid/widget/Gallery;->clearAnimation()V

    const/4 p1, 0x1

    if-lez v0, :cond_1

    sub-int/2addr v0, p1

    .line 578
    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    goto :goto_0

    .line 580
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    .line 582
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 583
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    invoke-virtual {v0, v1, p1}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(IZ)V

    return-void
.end method

.method private hideGallery(J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_2

    .line 413
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v0

    if-nez v0, :cond_1

    .line 414
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 415
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 416
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryInited:Z

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    if-nez p1, :cond_0

    .line 417
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1, v0}, Landroid/widget/Gallery;->startAnimation(Landroid/view/animation/Animation;)V

    .line 418
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 420
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-static {v0, p1, p2}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    .line 422
    :cond_2
    sget-boolean p1, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    const/4 p2, 0x4

    if-eqz p1, :cond_3

    .line 423
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearGallery()V

    goto :goto_0

    .line 424
    :cond_3
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryInited:Z

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    if-nez p1, :cond_4

    .line 425
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1, p2}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 426
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private initCbzBrowser()V
    .locals 6

    .line 1292
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLay:Landroid/view/View;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->galleryShowStatusbar:Z

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->optionIv:Landroid/view/View;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v1, 0x8

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1294
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1295
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    if-nez v0, :cond_4

    return-void

    .line 1298
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzThumbSize:I

    int-to-float v1, v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 1299
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->txtStatusLay:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLay:Landroid/view/View;

    .line 1300
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->statusLeft:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft:Landroid/widget/TextView;

    .line 1301
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->statusLeft2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft2:Landroid/widget/TextView;

    .line 1302
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->statusRight:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusRight:Landroid/widget/TextView;

    .line 1303
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->statusMiddle:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusMiddle:Landroid/widget/TextView;

    .line 1304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1305
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft2:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusMiddle:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1307
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusRight:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1308
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/tools/A;->statusMargin:I

    sget v2, Lcom/flyersoft/tools/A;->statusMargin:I

    sget v4, Lcom/flyersoft/tools/A;->statusMargin:I

    sget v5, Lcom/flyersoft/tools/A;->statusMargin:I

    invoke-virtual {v0, v1, v2, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 1310
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->statusLeftPanel:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusTime:Z

    const/4 v2, 0x4

    if-eqz v1, :cond_5

    const/4 v1, 0x0

    goto :goto_4

    :cond_5
    const/4 v1, 0x4

    :goto_4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1311
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusMiddle:Landroid/widget/TextView;

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusChapter:Z

    if-eqz v1, :cond_6

    const/4 v1, 0x0

    goto :goto_5

    :cond_6
    const/4 v1, 0x4

    :goto_5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1312
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusRight:Landroid/widget/TextView;

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusProgress:Z

    if-eqz v1, :cond_7

    goto :goto_6

    :cond_7
    const/4 v3, 0x4

    :goto_6
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1314
    invoke-static {}, Lcom/flyersoft/tools/A;->isFullScreenPhone()Z

    move-result v0

    if-eqz v0, :cond_8

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v0, :cond_8

    sget-boolean v0, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-eqz v0, :cond_8

    .line 1315
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->statusLeftPanel:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 1316
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusRight:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x41800000    # 16.0f

    .line 1317
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 1320
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->galley_bottom:I

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setBackgroundResource(I)V

    .line 1321
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearFileCache()V

    .line 1322
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setBatteryIcon()V

    return-void
.end method

.method private initGallery(Z)V
    .locals 5

    .line 296
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryInited:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 298
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryInited:Z

    .line 299
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 303
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzThumbSize:I

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenHeight(Landroid/content/Context;)I

    move-result v2

    const/high16 v3, 0x40400000    # 3.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    div-int/2addr v2, v4

    if-le v0, v2, :cond_1

    .line 304
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenHeight(Landroid/content/Context;)I

    move-result v0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    div-int/2addr v0, v2

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzThumbSize:I

    .line 305
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->tmpTime:J

    .line 306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    new-instance v2, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;

    invoke-direct {v2, p0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 307
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Gallery;->setSelection(I)V

    .line 308
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    new-instance v2, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$3;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v0, v2}, Landroid/widget/Gallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 322
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    new-instance v2, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$4;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v0, v2}, Landroid/widget/Gallery;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 342
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->singPicOnly:Z

    if-nez v0, :cond_2

    if-eqz p1, :cond_2

    .line 343
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_2
    :goto_0
    return-void
.end method

.method private initView()V
    .locals 2

    .line 251
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->base:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->baseFrame:Landroid/widget/FrameLayout;

    .line 252
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->txtStatusLay:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLay:Landroid/view/View;

    .line 253
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->mainPager:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/MyViewPager;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    .line 255
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->gallery1:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    .line 256
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->titleTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->titleTv:Landroid/widget/TextView;

    .line 257
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->gif:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gif:Landroid/view/View;

    .line 258
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->shareIv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->shareIv:Landroid/view/View;

    .line 259
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->closeIv:Landroid/widget/ImageView;

    .line 260
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setColoseIvColor()V

    .line 261
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->optionIv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->optionIv:Landroid/view/View;

    .line 262
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->daynightIv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->daynightIv:Landroid/view/View;

    .line 263
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->playIv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    .line 264
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->topLay:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->shareIv:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->closeIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->optionIv:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 270
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->daynightIv:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gif:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 277
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 278
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 281
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->initCbzBrowser()V

    .line 282
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->initViewPager()V

    .line 283
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->baseFrame:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/flyersoft/tools/A;->keepScreenAwakePic:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setKeepScreenOn(Z)V

    return-void
.end method

.method private initViewPager()V
    .locals 2

    .line 1409
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    new-instance v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/MyViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 1410
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    new-instance v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$19;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/MyViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 1430
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    .line 1431
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setGifButtonVisible()V

    .line 1432
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(I)V

    .line 1433
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->updateStatusInfo(I)V

    return-void
.end method

.method private isCbz()Z
    .locals 1

    .line 288
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isGalleryEmpty()Z
    .locals 1

    .line 441
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private maxScreenWidth()I
    .locals 2

    .line 648
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenWidth(Landroid/content/Context;)I

    move-result v0

    .line 649
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez v1, :cond_0

    const/16 v1, 0x438

    if-le v0, v1, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method private setAndroid15Insets(Landroid/view/View;)V
    .locals 4

    .line 165
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->navigationBarInsets:Landroid/graphics/Insets;

    invoke-static {p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result p1

    if-nez p1, :cond_0

    .line 166
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result v0

    if-lez v0, :cond_0

    .line 167
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result p1

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->navigationBarInsets:Landroid/graphics/Insets;

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/graphics/Insets;)I

    move-result v0

    if-nez v0, :cond_1

    .line 169
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/graphics/Insets;)I

    move-result v1

    if-lez v1, :cond_1

    .line 170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/graphics/Insets;)I

    move-result v0

    .line 172
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    if-nez v1, :cond_2

    return-void

    .line 175
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->top:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v2, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 176
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {p1}, Landroid/widget/Gallery;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 177
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->navigationBarInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/graphics/Insets;)I

    move-result v1

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 178
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->closeIv:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 179
    sget v1, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->top:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 182
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setAndroid15NavigationBar()V

    return-void
.end method

.method private setAndroid15NavigationBar()V
    .locals 3

    .line 186
    invoke-static {}, Lcom/flyersoft/tools/A;->Android15()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 188
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 190
    sget-boolean v1, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    const/16 v2, 0x10

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/16 v1, 0x10

    :goto_0
    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsetsController;II)V

    :cond_2
    :goto_1
    return-void
.end method

.method private setBatteryIcon()V
    .locals 2

    .line 1326
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 1327
    check-cast v0, Lcom/flyersoft/views/BatteryTextView;

    sget-boolean v1, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BatteryTextView;->setBatteryIcon(Z)V

    :cond_0
    return-void
.end method

.method private setColoseIvColor()V
    .locals 2

    .line 1332
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->closeIv:Landroid/widget/ImageView;

    sget-boolean v1, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    if-eqz v1, :cond_0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->close_light2:I

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->close_dark2:I

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method private setGifButtonVisible()V
    .locals 3

    .line 1437
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentPage:I

    if-le v0, v1, :cond_1

    .line 1438
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gif:Landroid/view/View;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".gif"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private showClickTip()V
    .locals 3

    .line 861
    sget-boolean v0, Lcom/flyersoft/tools/A;->showedImageClickTip:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 863
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 866
    :cond_1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/flyersoft/moonreaderp/ClickTip;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 867
    const-string v1, "hideModeZone"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 868
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->startActivity(Landroid/content/Intent;)V

    .line 869
    sput-boolean v2, Lcom/flyersoft/tools/A;->showedImageClickTip:Z

    .line 870
    invoke-static {p0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 872
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private showGallery()V
    .locals 5

    .line 445
    sget-boolean v0, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryClearTag:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 453
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 455
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v0, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v3, 0x1f4

    .line 456
    invoke-virtual {v0, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 457
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v3

    if-nez v3, :cond_1

    .line 458
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 460
    :cond_1
    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->galleryInited:Z

    if-eqz v3, :cond_2

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isGalleryEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 461
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Gallery;->setSelection(I)V

    .line 462
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v3, v2}, Landroid/widget/Gallery;->setVisibility(I)V

    .line 463
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v3

    if-nez v3, :cond_3

    .line 464
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v3, v0}, Landroid/widget/Gallery;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 466
    :cond_2
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->initGallery(Z)V

    .line 468
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v1, v0, v2}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    .line 469
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->sysHasNavBar()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 470
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow$6;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/os/Looper;)V

    const-wide/16 v3, 0x64

    .line 474
    invoke-virtual {v0, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PicGalleryShow$6;->sendEmptyMessageDelayed(IJ)Z

    :cond_4
    return-void

    .line 446
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 448
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v1, v0, v2}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    .line 449
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearGallery()V

    return-void
.end method

.method private showProgressMessage(ZLjava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 838
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_0

    .line 839
    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    const/4 p1, 0x0

    const/4 v0, 0x1

    .line 840
    invoke-static {p0, p1, p2, v0, v0}, Lcom/flyersoft/tools/A;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/app/ProgressDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressDlg:Landroid/app/ProgressDialog;

    return-void

    .line 841
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_2

    .line 842
    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_2
    return-void
.end method

.method private statusHandlerSendMessage(II)V
    .locals 3

    .line 1368
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 1369
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/os/Looper;II)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandler:Landroid/os/Handler;

    .line 1377
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1378
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandler:Landroid/os/Handler;

    int-to-long v1, p2

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private switchGalleyVisible()V
    .locals 2

    .line 1275
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->topLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1278
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showGallery()V

    return-void

    :cond_1
    :goto_0
    const-wide/16 v0, 0x1f4

    .line 1276
    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hideGallery(J)V

    return-void
.end method

.method private unrarAll(Lcom/flyersoft/tools/compress/BaseCompressor;)V
    .locals 9

    .line 755
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/tools/compress/MyUnRar;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 758
    :cond_0
    :goto_0
    iget-object v3, v0, Lcom/flyersoft/tools/compress/MyUnRar;->rar:Lcom/github/junrar/Archive;

    invoke-virtual {v3}, Lcom/github/junrar/Archive;->nextFileHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 761
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isFinishing()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 782
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 763
    :cond_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "["

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x1

    add-int/2addr v2, v6

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    .line 764
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "] "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Lcom/flyersoft/tools/compress/MyUnRar;->getRarFilename(Lcom/github/junrar/rarfile/FileHeader;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0xa

    .line 763
    invoke-virtual {v4, v7, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const/4 v4, 0x0

    .line 767
    :try_start_0
    invoke-virtual {v0, v3}, Lcom/flyersoft/tools/compress/MyUnRar;->getRarFilename(Lcom/github/junrar/rarfile/FileHeader;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5, v6, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v5

    .line 768
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "extract:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v7, v6, v1

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 769
    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v4

    .line 770
    iget-object v5, v0, Lcom/flyersoft/tools/compress/MyUnRar;->rar:Lcom/github/junrar/Archive;

    invoke-virtual {v5, v3, v4}, Lcom/github/junrar/Archive;->extractFile(Lcom/github/junrar/rarfile/FileHeader;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 776
    :try_start_1
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catchall_0
    move-exception v3

    .line 772
    :try_start_2
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v4, :cond_0

    .line 776
    :try_start_3
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v3

    .line 778
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    :catchall_1
    move-exception p1

    if-eqz v4, :cond_3

    .line 776
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    .line 778
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 780
    :cond_3
    :goto_2
    throw p1
.end method

.method private unzipImagesProc()V
    .locals 8

    .line 697
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_8

    .line 698
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzippingFile:Ljava/lang/String;

    if-eqz v0, :cond_1

    goto :goto_1

    .line 700
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_1
    return-void

    .line 702
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;

    .line 703
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzippingFile:Ljava/lang/String;

    .line 706
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 707
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 708
    sput-boolean v1, Lcom/flyersoft/tools/A;->crcError:Z

    .line 709
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 710
    sget-boolean v3, Lcom/flyersoft/tools/A;->crcError:Z

    if-eqz v3, :cond_3

    .line 711
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unrarAll(Lcom/flyersoft/tools/compress/BaseCompressor;)V

    .line 712
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 715
    :cond_3
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 716
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    if-eqz v3, :cond_4

    .line 717
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4, v4}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 718
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-direct {p0, v3, v2, v5}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cacheFileOk(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 719
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "s"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    iput-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->d:Landroid/graphics/drawable/Drawable;

    .line 721
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 724
    :cond_4
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    if-eqz v3, :cond_5

    .line 725
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getFileDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 726
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-direct {p0, v3, v2, v4}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cacheFileOk(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 727
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 728
    iput-object v3, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->d:Landroid/graphics/drawable/Drawable;

    .line 729
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    .line 737
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_1
    move-exception v2

    .line 734
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    .line 735
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 740
    :cond_5
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "zipImageList.size():"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 741
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 742
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_6
    const/4 v0, 0x0

    .line 743
    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzippingFile:Ljava/lang/String;

    .line 744
    sget-boolean v0, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    if-nez v0, :cond_7

    sget-boolean v0, Lcom/flyersoft/tools/T;->tmpGetFileDrawableOutOfMemory:Z

    if-nez v0, :cond_7

    const/16 v0, 0x14

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 745
    :cond_7
    sput-boolean v1, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    .line 746
    sput-boolean v1, Lcom/flyersoft/tools/T;->tmpGetFileDrawableOutOfMemory:Z

    .line 747
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    goto/16 :goto_0

    .line 750
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 751
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->handler:Landroid/os/Handler;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method private updateBarTime()Z
    .locals 5

    .line 1382
    sget-boolean v0, Lcom/flyersoft/tools/A;->galleryShowStatusbar:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1384
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_1

    return v1

    .line 1386
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusRight:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1387
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1388
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusMiddle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1390
    :cond_2
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft2:Landroid/widget/TextView;

    sget-boolean v3, Lcom/flyersoft/tools/A;->use12Hour:Z

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/flyersoft/tools/T;->time(ZZLjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1391
    invoke-static {}, Lcom/flyersoft/tools/T;->getBattery()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1393
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1395
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusLeft:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1397
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private updateStatusInfo(I)V
    .locals 1

    .line 1282
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1283
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1284
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusRight:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 1285
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1286
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showClickTip()V

    return-void
.end method

.method private zipImageInProgress(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;Ljava/lang/String;)Z
    .locals 4

    .line 684
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;

    .line 685
    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-eqz p1, :cond_1

    .line 686
    iput-object p1, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    :cond_1
    if-eqz p2, :cond_2

    .line 687
    iput-object p2, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    .line 688
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 689
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipImageList:Ljava/util/ArrayList;

    invoke-virtual {p1, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const/4 p1, 0x1

    return p1

    :cond_3
    return v2
.end method


# virtual methods
.method public CbzHeightRatio()I
    .locals 3

    .line 1013
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzH:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1014
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurComicView()Lcom/flyersoft/views/picview/ComicView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1015
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1016
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzH:I

    goto :goto_0

    .line 1018
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getImageOpts(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    .line 1019
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzH:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 1021
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1024
    :cond_1
    :goto_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzH:I

    if-lez v0, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenWidth(Landroid/content/Context;)I

    move-result v0

    goto :goto_1

    :cond_3
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenHeight(Landroid/content/Context;)I

    move-result v0

    :goto_1
    return v0
.end method

.method public CbzWidthRatio()I
    .locals 3

    .line 998
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzW:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 999
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurComicView()Lcom/flyersoft/views/picview/ComicView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1000
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1001
    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzW:I

    goto :goto_0

    .line 1003
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getImageOpts(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    .line 1004
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzW:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 1006
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1009
    :cond_1
    :goto_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzW:I

    if-lez v0, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenHeight(Landroid/content/Context;)I

    move-result v0

    goto :goto_1

    :cond_3
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getScreenWidth(Landroid/content/Context;)I

    move-result v0

    :goto_1
    return v0
.end method

.method doEvent(I)V
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1057
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->goPriorImage(Z)V

    return-void

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 1059
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->goNextImage(Z)V

    :cond_1
    return-void
.end method

.method doTouchDown(I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    return-void

    .line 1050
    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->doTapScreenRight:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doEvent(I)V

    return-void

    .line 1047
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->doTapScreenLeft:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doEvent(I)V

    return-void

    .line 1044
    :cond_2
    sget p1, Lcom/flyersoft/tools/A;->doTapScreenBottom:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doEvent(I)V

    return-void

    .line 1041
    :cond_3
    sget p1, Lcom/flyersoft/tools/A;->doTapScreenTop:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doEvent(I)V

    return-void
.end method

.method getCurComicView()Lcom/flyersoft/views/picview/ComicView;
    .locals 2

    .line 1403
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v0}, Lcom/flyersoft/views/MyViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;

    .line 1404
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 1089
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gif:Landroid/view/View;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_2

    .line 1090
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 1091
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    if-eqz v3, :cond_0

    .line 1092
    invoke-virtual {v3, v0, v2, v2}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1093
    :cond_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v3, :cond_1

    .line 1094
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 1095
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3, v0}, Lcom/flyersoft/books/BaseEBook;->getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 1097
    :cond_1
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1098
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;

    invoke-direct {v3, p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 1099
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$10;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$10;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v3, v0}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1105
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefHtmlViewer;->show()V

    .line 1109
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->closeIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_3

    .line 1110
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doFinish()V

    .line 1113
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->shareIv:Landroid/view/View;

    const-string v3, ""

    const/4 v4, 0x0

    if-ne p1, v0, :cond_6

    .line 1116
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v0, :cond_4

    .line 1124
    new-instance v0, Ljava/io/File;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/flyersoft/tools/A;->getUriProvider(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_2

    .line 1126
    :cond_4
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurComicView()Lcom/flyersoft/views/picview/ComicView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 1127
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1128
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    if-eqz v5, :cond_5

    .line 1129
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v5, v6, v2, v2}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    :cond_5
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 1131
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 1132
    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1130
    invoke-static {v6, v0, v5, v4}, Landroid/provider/MediaStore$Images$Media;->insertImage(Landroid/content/ContentResolver;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1133
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 1136
    :goto_2
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.SEND"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1137
    const-string v6, "image/png"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1138
    const-string v6, "android.intent.extra.SUBJECT"

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 1139
    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1138
    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1140
    invoke-virtual {v5, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v6, 0x10000000

    .line 1141
    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1142
    const-string v6, "android.intent.extra.STREAM"

    invoke-virtual {v5, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1143
    invoke-static {v5, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    .line 1145
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1149
    :cond_6
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->daynightIv:Landroid/view/View;

    if-ne p1, v0, :cond_9

    .line 1150
    sget-boolean v0, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    xor-int/2addr v0, v1

    sput-boolean v0, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    .line 1151
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setBatteryIcon()V

    .line 1152
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setColoseIvColor()V

    .line 1153
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->viewPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v0}, Lcom/flyersoft/views/MyViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->comics:[Lcom/flyersoft/views/picview/ComicView;

    array-length v5, v0

    const/4 v6, 0x0

    :goto_4
    if-ge v6, v5, :cond_8

    aget-object v7, v0, v6

    if-eqz v7, :cond_7

    .line 1155
    invoke-virtual {v7}, Lcom/flyersoft/views/picview/ComicView;->postInvalidate()V

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 1156
    :cond_8
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setAndroid15NavigationBar()V

    .line 1159
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    if-ne p1, v0, :cond_b

    .line 1160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->slideshowTimer:Ljava/util/Timer;

    if-nez v0, :cond_a

    .line 1161
    new-instance v5, Ljava/util/Timer;

    invoke-direct {v5}, Ljava/util/Timer;-><init>()V

    iput-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->slideshowTimer:Ljava/util/Timer;

    .line 1162
    new-instance v6, Lcom/flyersoft/moonreaderp/PicGalleryShow$11;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$11;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    sget v0, Lcom/flyersoft/tools/A;->gallerySlideshowInterval:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v7, v0

    sget v0, Lcom/flyersoft/tools/A;->gallerySlideshowInterval:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v9, v0

    invoke-virtual/range {v5 .. v10}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 1167
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->stop:I

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_5

    .line 1169
    :cond_a
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1170
    iput-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->slideshowTimer:Ljava/util/Timer;

    .line 1171
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->play:I

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_5
    const-wide/16 v5, 0x1f4

    .line 1173
    invoke-direct {p0, v5, v6}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hideGallery(J)V

    .line 1176
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->optionIv:Landroid/view/View;

    if-ne p1, v0, :cond_e

    .line 1177
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->gallery_options:I

    invoke-virtual {p1, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 1178
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->screenBrightness:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 1179
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->statusBar:I

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 1180
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->autoCheck:I

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    .line 1181
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->keepAwake:I

    invoke-virtual {p1, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    .line 1182
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->interval:I

    invoke-virtual {p1, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 1183
    sget-boolean v8, Lcom/flyersoft/tools/A;->keepScreenAwakePic:Z

    invoke-virtual {v6, v8}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1184
    new-instance v8, Lcom/flyersoft/moonreaderp/PicGalleryShow$12;

    invoke-direct {v8, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$12;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v6, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1190
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/flyersoft/tools/A;->gallerySlideshowInterval:I

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1191
    sget-boolean v3, Lcom/flyersoft/tools/A;->galleryShowStatusbar:Z

    invoke-virtual {v4, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1192
    new-instance v3, Lcom/flyersoft/moonreaderp/PicGalleryShow$13;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$13;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {v4, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1199
    sget v3, Lcom/flyersoft/tools/A;->galleryBrightnessValue:I

    const/16 v4, -0x64

    if-ne v3, v4, :cond_c

    const/4 v2, 0x1

    :cond_c
    invoke-virtual {v5, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1200
    new-instance v2, Lcom/flyersoft/moonreaderp/PicGalleryShow$14;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$14;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/SeekBar;)V

    invoke-virtual {v5, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1210
    sget v2, Lcom/flyersoft/tools/A;->galleryBrightnessValue:I

    if-lez v2, :cond_d

    sget v2, Lcom/flyersoft/tools/A;->galleryBrightnessValue:I

    sub-int/2addr v2, v1

    goto :goto_6

    :cond_d
    const/16 v2, 0x32

    :goto_6
    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1211
    new-instance v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$15;

    invoke-direct {v1, p0, v5}, Lcom/flyersoft/moonreaderp/PicGalleryShow$15;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/CheckBox;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1225
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    .line 1226
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1227
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;

    invoke-direct {v0, p0, v7}, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/EditText;)V

    const v1, 0x104000a

    .line 1228
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 1241
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_e
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 90
    const-string v0, "singPicOnly"

    const-string v1, "ebookImage"

    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 91
    sget-object p1, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    if-nez p1, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->finish()V

    return-void

    .line 95
    :cond_0
    sput-object p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->selfPref:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    const/4 p1, 0x0

    .line 96
    sput-boolean p1, Lcom/flyersoft/tools/A;->tmpOutOfMemoryTag:Z

    .line 97
    sput-boolean p1, Lcom/flyersoft/tools/T;->tmpGetFileDrawableOutOfMemory:Z

    const/4 v2, 0x1

    .line 98
    invoke-virtual {p0, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->requestWindowFeature(I)Z

    .line 100
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x23

    if-ge v3, v4, :cond_1

    .line 101
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v4, 0x400

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 102
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/high16 v4, 0x1000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 103
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 106
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "hasActTrans"

    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hasActTransExtra:Z

    .line 107
    invoke-static {}, Lcom/flyersoft/tools/A;->openBookAnim()Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    if-eqz p1, :cond_2

    .line 108
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hasActTransExtra:Z

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hasActTrans:Z

    .line 109
    :cond_2
    new-instance p1, Lcom/flyersoft/moonreaderp/PicGalleryShow$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$1;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setEnterSharedElementCallback(Landroid/app/SharedElementCallback;)V

    .line 124
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    .line 125
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 126
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 127
    invoke-static {v1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 128
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    .line 129
    iput-boolean v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->singPicOnly:Z

    goto :goto_0

    .line 131
    :cond_3
    const-string v1, "imageFile"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    .line 132
    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 133
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->singPicOnly:Z

    .line 135
    :cond_4
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->createImagetFileList()V

    .line 136
    sget p1, Lcom/flyersoft/moonreaderp/R$layout;->gallery:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setContentView(I)V

    .line 137
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->initView()V

    .line 139
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_5

    .line 140
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 142
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 143
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->finish()V

    .line 146
    :cond_5
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->Android15()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 147
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow$2;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    :cond_6
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 489
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onDestroy()V

    const/4 v0, 0x0

    .line 490
    sput-object v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->selfPref:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 510
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->tmpTime:J

    const/16 v0, 0x18

    const/4 v1, 0x1

    if-eq p1, v0, :cond_5

    const/16 v0, 0x5c

    if-eq p1, v0, :cond_5

    const/16 v0, 0x69

    if-ne p1, v0, :cond_0

    goto :goto_1

    :cond_0
    const/16 v0, 0x19

    if-eq p1, v0, :cond_4

    const/16 v0, 0x5d

    if-eq p1, v0, :cond_4

    const/16 v0, 0x6a

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    const/16 v0, 0x52

    if-ne p1, v0, :cond_2

    .line 520
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->switchGalleyVisible()V

    return v1

    :cond_2
    const/4 v0, 0x4

    if-ne p1, v0, :cond_3

    .line 524
    sget-boolean v0, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->gallery:Landroid/widget/Gallery;

    invoke-virtual {v0}, Landroid/widget/Gallery;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3

    .line 525
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->switchGalleyVisible()V

    .line 526
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->disableBackKey:Z

    return v1

    .line 530
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 516
    :cond_4
    :goto_0
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->goNextImage(Z)V

    return v1

    .line 512
    :cond_5
    :goto_1
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->goPriorImage(Z)V

    return v1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/16 v0, 0x18

    const/4 v1, 0x1

    if-eq p1, v0, :cond_3

    const/16 v0, 0x5c

    if-eq p1, v0, :cond_3

    const/16 v0, 0x69

    if-eq p1, v0, :cond_3

    const/16 v0, 0x19

    if-eq p1, v0, :cond_3

    const/16 v0, 0x5d

    if-eq p1, v0, :cond_3

    const/16 v0, 0x6a

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    .line 540
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->disableBackKey:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 541
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->disableBackKey:Z

    return v1

    .line 544
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doFinish()V

    return v1

    .line 547
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_3
    :goto_0
    return v1
.end method

.method protected onPause()V
    .locals 8

    .line 495
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 496
    const-string v0, "cbz_progress"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 497
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 498
    const-string v0, "positions10"

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 499
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->currentImageFile:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 500
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getCurImagePos()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    int-to-long v4, v4

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    int-to-long v6, v6

    invoke-static {v4, v5, v6, v7}, Lcom/flyersoft/tools/T;->getPercentStr(JJ)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 499
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 500
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 501
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbz_file:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v0, v2, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->createCbzBookCover(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;)V

    .line 503
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    .line 504
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 479
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onResume()V

    .line 480
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    .line 481
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->isCbz()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 482
    sget v0, Lcom/flyersoft/tools/A;->galleryBrightnessValue:I

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setScreenBrightness(IZ)V

    .line 483
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->updateBarTime()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0xea60

    .line 484
    invoke-direct {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandlerSendMessage(II)V

    :cond_1
    return-void
.end method

.method setImageDrawable(Landroid/widget/ImageView;I)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    .line 940
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 941
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    .line 942
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 943
    invoke-direct {p0, p1, v0, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doUnzipToCache(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V

    return-void

    .line 948
    :cond_1
    new-instance v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;

    invoke-direct {v0, p0, p2, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;ILandroid/widget/ImageView;)V

    .line 979
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 980
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method setImageView(Lcom/flyersoft/views/picview/ComicView;I)V
    .locals 6

    if-nez p1, :cond_0

    goto/16 :goto_3

    .line 589
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 590
    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicView;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 591
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_1

    goto/16 :goto_3

    .line 593
    :cond_1
    invoke-virtual {p1, v0}, Lcom/flyersoft/views/picview/ComicView;->setTag(Ljava/lang/Object;)V

    .line 595
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 596
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2

    .line 597
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-lez v2, :cond_2

    .line 598
    invoke-virtual {p1, v1}, Lcom/flyersoft/views/picview/ComicView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 605
    :cond_2
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    const/4 p2, -0x1

    .line 606
    invoke-virtual {v1, v0, p2}, Lcom/flyersoft/books/BaseEBook;->getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    goto :goto_1

    .line 607
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    if-nez v1, :cond_4

    .line 608
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getFileDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    goto :goto_1

    :cond_4
    const/4 v1, 0x1

    .line 610
    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showProgressIndicator(Z)V

    .line 611
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    invoke-virtual {v3, v0, v1, v2}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    .line 612
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzippingFile:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 613
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getFileDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_0

    :cond_5
    move-object v3, v4

    .line 614
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->unzippingFile:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-direct {p0, v3, v1, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cacheFileOk(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 615
    invoke-direct {p0, v4, p1, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->doUnzipToCache(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V

    :cond_6
    move-object p2, v3

    :goto_1
    if-eqz p2, :cond_7

    .line 617
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    if-lez v1, :cond_7

    .line 618
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/picview/ComicView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 619
    invoke-virtual {p1}, Lcom/flyersoft/views/picview/ComicView;->postInvalidate()V

    .line 620
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    invoke-virtual {p0, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showProgressIndicator(Z)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 627
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_1
    move-exception p1

    .line 624
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    .line 625
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_7
    :goto_2
    const/16 p1, 0x14

    .line 629
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 630
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->clearImageCache()V

    :cond_8
    :goto_3
    return-void
.end method

.method public setScreenBrightness(IZ)V
    .locals 2

    .line 1255
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, -0x64

    if-ne p1, v1, :cond_0

    const/high16 p1, -0x40800000    # -1.0f

    .line 1258
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    goto :goto_0

    :cond_0
    const/16 v1, 0x64

    if-le p1, v1, :cond_1

    const/16 p1, 0x64

    :cond_1
    const/4 v1, 0x1

    if-ge p1, v1, :cond_2

    const/4 p1, 0x1

    :cond_2
    if-eqz p2, :cond_3

    .line 1266
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "%"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 1268
    :cond_3
    sput p1, Lcom/flyersoft/tools/A;->galleryBrightnessValue:I

    int-to-float p1, p1

    const/high16 p2, 0x42c80000    # 100.0f

    div-float/2addr p1, p2

    .line 1269
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1271
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method showProgressIndicator(Z)V
    .locals 2

    if-eqz p1, :cond_1

    .line 815
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressIndicator:Landroid/widget/ProgressBar;

    if-nez p1, :cond_0

    .line 816
    new-instance p1, Landroid/widget/ProgressBar;

    invoke-direct {p1, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressIndicator:Landroid/widget/ProgressBar;

    .line 817
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 818
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v0, 0x41f00000    # 30.0f

    .line 819
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 820
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const/16 v0, 0x11

    .line 821
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/high16 v0, 0x41200000    # 10.0f

    .line 822
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 823
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 825
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->bringToFront()V

    .line 826
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressIndicator:Landroid/widget/ProgressBar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 828
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 830
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->progressIndicator:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_2

    const/16 v0, 0x8

    .line 831
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_2
    :goto_0
    return-void
.end method
