.class Lcom/flyersoft/moonreaderp/PicGalleryShow$6;
.super Landroid/os/Handler;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->showGallery()V
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

    .line 470
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$6;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 472
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$6;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mforceRefreshComic(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    return-void
.end method
