.class Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$51;->done(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$51;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 4704
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 4707
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforceDisableCurlEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 4708
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->val$what:I

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$51;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->val$event:Landroid/view/MotionEvent;

    invoke-static {v1, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCurlMsg(Lcom/flyersoft/moonreaderp/ActivityTxt;ILandroid/view/MotionEvent;)Landroid/os/Message;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhandleCurlMessage(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Message;)V

    return-void
.end method
