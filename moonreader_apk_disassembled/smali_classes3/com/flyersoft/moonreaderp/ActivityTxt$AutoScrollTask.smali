.class public Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;
.super Ljava/util/TimerTask;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AutoScrollTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11943
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 11946
    sget-boolean v0, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v0, :cond_0

    .line 11947
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->cancel()Z

    return-void

    .line 11951
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetautoScrollPaused(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 11954
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetautoScrollTimesCount(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputautoScrollTimesCount(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 11955
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetScrollMode(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    const/16 v1, 0x12d

    if-eqz v0, :cond_7

    const/4 v3, 0x0

    const/4 v4, 0x4

    if-eq v0, v2, :cond_5

    const/4 v2, 0x2

    if-eq v0, v2, :cond_4

    const/4 v2, 0x3

    if-eq v0, v2, :cond_3

    if-eq v0, v4, :cond_2

    goto :goto_0

    .line 11975
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 11969
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetautoScrollTimesCount(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x5

    sget v2, Lcom/flyersoft/tools/A;->autoScrollSpeed:I

    if-lt v0, v2, :cond_6

    .line 11970
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputautoScrollTimesCount(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 11971
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 11966
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 11960
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetautoScrollTimesCount(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    sget v2, Lcom/flyersoft/tools/A;->autoScrollSpeed:I

    if-lt v0, v2, :cond_6

    .line 11961
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputautoScrollTimesCount(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 11962
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_6
    :goto_0
    return-void

    .line 11957
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$AutoScrollTask;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
