.class Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$17;->done(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$17;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2300
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 2303
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$front:Z

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$dualPage:Z

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mget3dCurlShot_step2(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLcom/flyersoft/tools/T$OnResult;ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$17$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$17;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$17;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-static {v0, v4, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mget3dCurlShot(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLcom/flyersoft/tools/T$OnResult;)Z

    :cond_0
    return-void
.end method
