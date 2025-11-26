.class Lcom/flyersoft/moonreaderp/PicGalleryShow$18;
.super Landroid/os/Handler;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->statusHandlerSendMessage(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

.field final synthetic val$delay:I

.field final synthetic val$what:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/os/Looper;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 1369
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput p3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->val$what:I

    iput p4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->val$delay:I

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1372
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mupdateBarTime(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1373
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetstatusHandler(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Landroid/os/Handler;

    move-result-object p1

    iget v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->val$what:I

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$18;->val$delay:I

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_0
    return-void
.end method
