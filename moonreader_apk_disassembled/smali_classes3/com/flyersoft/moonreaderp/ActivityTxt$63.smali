.class Lcom/flyersoft/moonreaderp/ActivityTxt$63;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->continueSpeakOrAutoScroll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
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

    .line 6157
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 6159
    sget-boolean v0, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-eqz v0, :cond_1

    .line 6160
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 6161
    invoke-static {}, Lcom/flyersoft/tools/T;->hideToast()V

    .line 6162
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_AutoScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)V

    return-void

    .line 6164
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    sub-int/2addr v1, p1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method
