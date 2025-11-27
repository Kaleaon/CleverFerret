.class Lcom/flyersoft/moonreaderp/PicGalleryShow$5;
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

    .line 359
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 361
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_1

    .line 362
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misCbz(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v1, 0x1388

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0xbb8

    :goto_0
    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mhideGallery(Lcom/flyersoft/moonreaderp/PicGalleryShow;J)V

    .line 364
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 365
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mgoNextImage(Lcom/flyersoft/moonreaderp/PicGalleryShow;Z)V

    .line 367
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ne v0, v2, :cond_3

    .line 368
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showProgressIndicator(Z)V

    .line 370
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_4

    .line 371
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->showProgressIndicator(Z)V

    .line 373
    :cond_4
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_5

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetgalleryClearTag(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 374
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mclearGallery(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    .line 377
    :cond_5
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0xa

    if-ne v0, v2, :cond_6

    .line 378
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mshowProgressMessage(Lcom/flyersoft/moonreaderp/PicGalleryShow;ZLjava/lang/String;)V

    .line 380
    :cond_6
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0xb

    if-ne p1, v0, :cond_7

    .line 381
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$5;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    const/4 v0, 0x0

    invoke-static {p1, v3, v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mshowProgressMessage(Lcom/flyersoft/moonreaderp/PicGalleryShow;ZLjava/lang/String;)V

    :cond_7
    return-void
.end method
