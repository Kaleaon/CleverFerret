.class Lcom/flyersoft/moonreaderp/ActivityTxt$18;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    .line 2320
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->val$front:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->val$dualPage:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2323
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mHighQuality3D(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v1

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$18;)V

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(ZLcom/flyersoft/tools/T$OnResult;)Landroid/graphics/Bitmap;

    return-void
.end method
