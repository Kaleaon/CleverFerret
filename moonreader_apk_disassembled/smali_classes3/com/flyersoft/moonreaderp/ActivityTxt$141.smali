.class Lcom/flyersoft/moonreaderp/ActivityTxt$141;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->registerHardwares()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
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

    .line 14146
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 14150
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputregisterHardwaresTime(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 14151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->registerShakeSensor()V

    .line 14152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-wide/16 v1, -0x1

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputregisterHardwaresTime(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 14153
    sget-boolean v0, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    if-eqz v0, :cond_1

    .line 14154
    sget-boolean v0, Lcom/flyersoft/tools/A;->askForTiltAction:Z

    if-eqz v0, :cond_0

    .line 14155
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v1, 0x386

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    .line 14157
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$141;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->shakeSensorLisener:Lcom/flyersoft/components/MyShakeSensorListener;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_turn_page:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 14160
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
