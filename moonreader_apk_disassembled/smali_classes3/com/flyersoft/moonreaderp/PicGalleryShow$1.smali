.class Lcom/flyersoft/moonreaderp/PicGalleryShow$1;
.super Landroid/app/SharedElementCallback;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->onCreate(Landroid/os/Bundle;)V
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

    .line 109
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$1;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Landroid/app/SharedElementCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedElementEnd(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 111
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "onSharedElementEnd"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 112
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$1;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->actTransEnd:Z

    .line 113
    invoke-super {p0, p1, p2, p3}, Landroid/app/SharedElementCallback;->onSharedElementEnd(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public onSharedElementsArrived(Ljava/util/List;Ljava/util/List;Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 116
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "onSharedElementsArrived"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 117
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$1;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->hasActTrans:Z

    .line 118
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$1;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->actTransArrive:Z

    .line 119
    invoke-super {p0, p1, p2, p3}, Landroid/app/SharedElementCallback;->onSharedElementsArrived(Ljava/util/List;Ljava/util/List;Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;)V

    return-void
.end method
