.class Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ImageViewCombine"
.end annotation


# instance fields
.field comic:Lcom/flyersoft/views/picview/ComicView;

.field d:Landroid/graphics/drawable/Drawable;

.field filename:Ljava/lang/String;

.field iv:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 790
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 791
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->iv:Landroid/widget/ImageView;

    .line 792
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->comic:Lcom/flyersoft/views/picview/ComicView;

    .line 793
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->d:Landroid/graphics/drawable/Drawable;

    .line 794
    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;->filename:Ljava/lang/String;

    return-void
.end method
