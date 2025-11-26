.class Lcom/flyersoft/moonreaderp/ActivityTxt$17;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->get3dCurlShot(ZLcom/flyersoft/tools/T$OnResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$dualPage:Z

.field final synthetic val$front:Z

.field final synthetic val$onGlResult:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLcom/flyersoft/tools/T$OnResult;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2295
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$front:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$dualPage:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 1

    .line 2298
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tmpFlipShot1:Landroid/graphics/Bitmap;

    .line 2299
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tmpFlipShot1:Landroid/graphics/Bitmap;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowCurl3dCover(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/graphics/Bitmap;)V

    .line 2300
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$17;)V

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
