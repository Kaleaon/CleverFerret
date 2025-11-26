.class Lcom/flyersoft/moonreaderp/ActivityTxt$62;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->getAndroid22Handler()Landroid/os/Handler;
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

    .line 6088
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 6091
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    const-wide/16 v0, 0xc8

    const/4 v2, 0x1

    if-nez p1, :cond_0

    .line 6092
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mfixBrokenTextView(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Z

    .line 6093
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-nez p1, :cond_4

    .line 6094
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 6097
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget p1, p1, Lcom/flyersoft/staticlayout/MRTextView;->layoutState:I

    const-wide/16 v3, 0x64

    const/4 v5, 0x0

    if-ne p1, v2, :cond_1

    .line 6098
    new-array p1, v2, [Ljava/lang/Object;

    const-string v0, "**************SoftHyphenStaticLayout tWorking, delay 100************"

    aput-object v0, p1, v5

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6099
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getAndroid22Handler()Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v5, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    .line 6102
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 6103
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 6110
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->fixBottomForScrollTo(Lcom/flyersoft/staticlayout/MRTextView;I)V

    goto :goto_1

    .line 6104
    :cond_3
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v3, "********error txtView.getHeight():"

    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object p1, v3, v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6105
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mfixBrokenTextView(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Z

    .line 6106
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-nez p1, :cond_4

    .line 6107
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getAndroid22Handler()Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v5, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_4
    return-void

    .line 6114
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    sget-wide v1, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int v2, v1

    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetLineTopForPageTurn(Lcom/flyersoft/moonreaderp/ActivityTxt;I)I

    move-result p1

    .line 6115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->goToLastTime:J

    .line 6117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 6118
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$menableTxtViewDraw(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    .line 6119
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 6120
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforceDelayFlipAnimation(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 6122
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mjustOpenBookAnim(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-wide/16 v3, 0x3e8

    :cond_6
    const/16 v0, 0x38e

    invoke-virtual {p1, v0, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 6123
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mjustOpenBookAnim(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 v0, 0x514

    goto :goto_2

    :cond_7
    const/16 v0, 0x12c

    :goto_2
    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCachePageShotsHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;I)Z

    .line 6125
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcontinueSpeakOrAutoScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 6126
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, 0x32

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mforceUpdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    return-void
.end method
