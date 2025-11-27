.class Lcom/flyersoft/moonreaderp/ActivityTxt$225;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->goPriorCacheChapter()V
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

    .line 20771
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 20773
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetoldPriorChapterY(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result p1

    const/4 v0, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v0, :cond_0

    .line 20774
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$menableTxtViewDraw(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    .line 20775
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetoldPriorChapterY(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 20776
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforceDelayFlipAnimation(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    goto :goto_0

    .line 20778
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgettxtScrollHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/os/Handler;

    move-result-object p1

    const-wide/16 v3, 0x32

    invoke-virtual {p1, v1, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 20780
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipCurl()Z

    move-result p1

    const-wide/16 v3, 0x0

    if-eqz p1, :cond_1

    .line 20781
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v2, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache(ZZ)V

    .line 20782
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v5, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curlBackTime:J

    cmp-long p1, v5, v3

    if-lez p1, :cond_2

    .line 20783
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetCurl3dVisibility(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 20784
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetFlipViewINVISIBLE(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    goto :goto_1

    .line 20787
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, 0x32

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mforceUpdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 20788
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    .line 20789
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$225;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-wide v3, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curlBackTime:J

    return-void
.end method
