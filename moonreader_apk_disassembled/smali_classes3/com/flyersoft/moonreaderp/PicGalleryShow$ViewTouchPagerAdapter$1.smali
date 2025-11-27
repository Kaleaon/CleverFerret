.class Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter$1;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Lcom/flyersoft/views/picview/DefaultOnDoubleTapListener$OnSingleTap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1476
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTap(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1479
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ViewTouchPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mdoTapEvent(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/view/MotionEvent;)V

    return-void
.end method
