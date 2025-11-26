.class Lcom/flyersoft/moonreaderp/PicGalleryShow$7;
.super Ljava/lang/Thread;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->doUnzipToCache(Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V
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

    .line 672
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$7;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 675
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$7;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$munzipImagesProc(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    return-void
.end method
