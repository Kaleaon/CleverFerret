.class Lcom/flyersoft/views/FlipImageView$1;
.super Ljava/util/TimerTask;
.source "FlipImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/FlipImageView;->startAnimation(ZILcom/flyersoft/tools/A$AfterFlipCurl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/FlipImageView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/FlipImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 118
    iput-object p1, p0, Lcom/flyersoft/views/FlipImageView$1;->this$0:Lcom/flyersoft/views/FlipImageView;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 121
    iget-object v0, p0, Lcom/flyersoft/views/FlipImageView$1;->this$0:Lcom/flyersoft/views/FlipImageView;

    iget v1, v0, Lcom/flyersoft/views/FlipImageView;->msgCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/flyersoft/views/FlipImageView;->msgCount:I

    .line 122
    iget-object v0, p0, Lcom/flyersoft/views/FlipImageView$1;->this$0:Lcom/flyersoft/views/FlipImageView;

    iget-boolean v0, v0, Lcom/flyersoft/views/FlipImageView;->isDrawing:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/FlipImageView$1;->this$0:Lcom/flyersoft/views/FlipImageView;

    invoke-virtual {v0}, Lcom/flyersoft/views/FlipImageView;->postInvalidate()V

    .line 125
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/flyersoft/views/FlipImageView$1;->this$0:Lcom/flyersoft/views/FlipImageView;

    iget-wide v2, v2, Lcom/flyersoft/views/FlipImageView;->animateStartTime:J

    sub-long/2addr v0, v2

    iget-object v2, p0, Lcom/flyersoft/views/FlipImageView$1;->this$0:Lcom/flyersoft/views/FlipImageView;

    invoke-static {v2}, Lcom/flyersoft/views/FlipImageView;->-$$Nest$fgetmDuration(Lcom/flyersoft/views/FlipImageView;)I

    move-result v2

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-ltz v4, :cond_1

    .line 126
    invoke-virtual {p0}, Lcom/flyersoft/views/FlipImageView$1;->cancel()Z

    :cond_1
    :goto_0
    return-void
.end method
