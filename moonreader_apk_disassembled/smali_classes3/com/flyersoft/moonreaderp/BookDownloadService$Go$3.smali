.class Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;
.super Ljava/lang/Thread;
.source "BookDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->startFileDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 355
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 358
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 359
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingNotifications:Ljava/util/Set;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 360
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide/16 v4, 0x3e8

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    goto :goto_0

    .line 362
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 364
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v3, v3, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v2, v3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$misCancelled(Lcom/flyersoft/moonreaderp/BookDownloadService;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 365
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingNotifications:Ljava/util/Set;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    .line 366
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "*****send cancel message from DownloadHandler(1)"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 367
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_2
    return-void
.end method
