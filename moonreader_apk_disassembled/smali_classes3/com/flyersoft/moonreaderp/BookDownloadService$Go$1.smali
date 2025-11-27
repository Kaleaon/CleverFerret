.class Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;
.super Landroid/os/Handler;
.source "BookDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/BookDownloadService$Go;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;Landroid/os/Looper;)V
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

    .line 171
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 174
    iget v0, p1, Landroid/os/Message;->arg2:I

    iget v1, p1, Landroid/os/Message;->arg1:I

    const/16 v2, 0x64

    const/4 v3, 0x0

    if-lt v0, v1, :cond_0

    iget v0, p1, Landroid/os/Message;->arg1:I

    mul-int/lit8 v0, v0, 0x64

    iget v1, p1, Landroid/os/Message;->arg2:I

    div-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 175
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notification:Landroid/app/Notification;

    iget-object v1, v1, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 177
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->download_progress:I

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    .line 178
    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    int-to-long v6, v6

    invoke-static {v5, v6, v7}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    .line 177
    invoke-virtual {v1, v4, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 179
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->download_total:I

    .line 180
    iget v5, p1, Landroid/os/Message;->arg2:I

    const-string v6, ""

    if-lez v5, :cond_1

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget p1, p1, Landroid/os/Message;->arg2:I

    int-to-long v7, p1

    invoke-static {v5, v7, v8}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    move-object p1, v6

    .line 179
    :goto_1
    invoke-virtual {v1, v4, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 181
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->download_notification_progress_text:I

    if-lez v0, :cond_2

    .line 182
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 181
    :cond_2
    invoke-virtual {v1, p1, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 183
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->download_notification_progress_bar:I

    invoke-virtual {v1, p1, v2, v0, v3}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 184
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->nm:Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notification:Landroid/app/Notification;

    invoke-virtual {p1, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 186
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mpostProgressToNetInfoDialog(Lcom/flyersoft/moonreaderp/BookDownloadService;II)V

    return-void
.end method
