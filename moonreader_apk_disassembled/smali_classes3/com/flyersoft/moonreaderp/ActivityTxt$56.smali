.class Lcom/flyersoft/moonreaderp/ActivityTxt$56;
.super Ljava/util/TimerTask;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->shiftAnimateWithTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field failed:I

.field lastDraw:I

.field lastFailedTime:J

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 5522
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 5527
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollCache:Lcom/flyersoft/views/ScrollView2;

    iget v0, v0, Lcom/flyersoft/views/ScrollView2;->drawCount:I

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->lastDraw:I

    sub-int/2addr v0, v1

    .line 5528
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollCache:Lcom/flyersoft/views/ScrollView2;

    iget v1, v1, Lcom/flyersoft/views/ScrollView2;->drawCount:I

    iput v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->lastDraw:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 5529
    :cond_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->failed:I

    add-int/2addr v0, v2

    :goto_0
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->failed:I

    if-ne v0, v2, :cond_1

    .line 5531
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->lastFailedTime:J

    .line 5532
    :cond_1
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->failed:I

    const/4 v3, 0x5

    if-le v0, v3, :cond_2

    .line 5533
    new-array v0, v2, [Ljava/lang/Object;

    const-string v3, "============= no onDraw() execute ============"

    aput-object v3, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 5534
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->flippingAnimationTime:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->lastFailedTime:J

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x14

    add-long/2addr v5, v7

    add-long/2addr v3, v5

    iput-wide v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->flippingAnimationTime:J

    .line 5535
    iput v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->failed:I

    .line 5538
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueExecuteCount:I

    add-int/2addr v3, v2

    iput v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueExecuteCount:I

    .line 5539
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v5, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->flippingAnimationTime:J

    sub-long/2addr v3, v5

    long-to-float v0, v3

    .line 5540
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueDuration:J

    long-to-float v3, v3

    cmpl-float v3, v0, v3

    if-ltz v3, :cond_3

    .line 5541
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollCache:Lcom/flyersoft/views/ScrollView2;

    iput-boolean v1, v0, Lcom/flyersoft/views/ScrollView2;->recordDrawCount:Z

    .line 5542
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v1, 0x3d3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 5543
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->cancel()Z

    return-void

    .line 5545
    :cond_3
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueEnd:I

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueStart:I

    sub-int/2addr v3, v4

    .line 5546
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDirection:I

    int-to-float v3, v3

    .line 5547
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueDuration:J

    long-to-float v4, v4

    sub-float/2addr v4, v0

    float-to-double v4, v4

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v0, v4

    mul-float v0, v0, v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueDuration:J

    long-to-double v4, v4

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v4, v4

    div-float/2addr v0, v4

    sub-float/2addr v3, v0

    .line 5548
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueStart:I

    int-to-float v0, v0

    add-float/2addr v0, v3

    float-to-int v0, v0

    .line 5549
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3, v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setValueAnimationPos(IZZ)V

    return-void
.end method
