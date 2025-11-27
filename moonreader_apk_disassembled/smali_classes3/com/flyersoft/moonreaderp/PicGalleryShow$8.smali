.class Lcom/flyersoft/moonreaderp/PicGalleryShow$8;
.super Landroid/os/Handler;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 845
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$8;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 847
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;

    .line 848
    iget v1, p1, Landroid/os/Message;->what:I

    if-nez v1, :cond_0

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ComicView;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 849
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Lcom/flyersoft/views/picview/ComicView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 850
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    invoke-virtual {v1}, Lcom/flyersoft/views/picview/ComicView;->postInvalidate()V

    .line 852
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    iget-object p1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    if-eqz p1, :cond_1

    iget-object p1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$8;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misGalleryEmpty(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 853
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 854
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->postInvalidate()V

    .line 856
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method
