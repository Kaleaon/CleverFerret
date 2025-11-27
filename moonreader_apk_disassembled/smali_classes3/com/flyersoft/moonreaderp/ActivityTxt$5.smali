.class Lcom/flyersoft/moonreaderp/ActivityTxt$5;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->syncFromCloudOnResumeDelay()V
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

    .line 709
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$5;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 712
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$5;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->syncOnResumeTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    goto :goto_0

    .line 714
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$5;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 715
    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "syncFromCloudOnResumeDelay: no network"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 716
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$5;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msyncFromCloudOnResumeDelay(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 717
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz v0, :cond_2

    .line 718
    sget-boolean v0, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v1, v0}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    :cond_2
    :goto_0
    return-void
.end method
