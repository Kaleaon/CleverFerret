.class Lcom/flyersoft/views/NewCurl3D$Render3D$1;
.super Ljava/lang/Object;
.source "NewCurl3D.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/NewCurl3D$Render3D;->onDrawFrameLocked(Ljavax/microedition/khronos/opengles/GL10;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/views/NewCurl3D$Render3D;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/NewCurl3D$Render3D;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 753
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D$1;->this$1:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 755
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D$1;->this$1:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    const/4 v1, 0x2

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D;->renderState:I

    .line 756
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D$1;->this$1:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D;->curl3dCover:Lcom/flyersoft/views/FlipImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/FlipImageView;->setVisibility(I)V

    .line 757
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D$1;->this$1:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D;->curl3dCover:Lcom/flyersoft/views/FlipImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/FlipImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 758
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D$1;->this$1:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D;->curl3dCover:Lcom/flyersoft/views/FlipImageView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/FlipImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
