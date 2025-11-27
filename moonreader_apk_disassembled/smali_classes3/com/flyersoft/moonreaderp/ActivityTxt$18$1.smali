.class Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$18;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$18;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2323
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 4

    .line 2326
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tmpFlipShot2:Landroid/graphics/Bitmap;

    .line 2327
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->val$front:Z

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$18$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$18;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt$18;->val$dualPage:Z

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mget3dCurlShot_step2(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLcom/flyersoft/tools/T$OnResult;ZZ)Z

    return-void
.end method
