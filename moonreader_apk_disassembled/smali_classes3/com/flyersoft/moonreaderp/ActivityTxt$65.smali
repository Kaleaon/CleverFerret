.class Lcom/flyersoft/moonreaderp/ActivityTxt$65;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->txtFileFinalScrollAtStartup(J)V
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

    .line 6248
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 6251
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v2, 0xca

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 6252
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mfixBrokenTextView(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v1, 0x32

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$65;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdelayTime(Lcom/flyersoft/moonreaderp/ActivityTxt;)J

    move-result-wide v1

    .line 6251
    :goto_0
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method
