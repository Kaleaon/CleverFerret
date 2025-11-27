.class Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;
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

    .line 190
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 193
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingUrls:Ljava/util/Set;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 194
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$fgetgoInstances(Lcom/flyersoft/moonreaderp/BookDownloadService;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingNotifications:Ljava/util/Set;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 196
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->nm:Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 198
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    const/4 v2, -0x1

    if-ne v0, v1, :cond_0

    .line 199
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.flyersoft.moonreaderp.open_broadcast"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    .line 200
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 201
    const-string v3, "need_password"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 199
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->sendBroadcast(Landroid/content/Intent;)V

    .line 202
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {p1, v2, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mpostProgressToNetInfoDialog(Lcom/flyersoft/moonreaderp/BookDownloadService;II)V

    goto/16 :goto_0

    .line 203
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 204
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->nm:Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-virtual {v2, p1}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->createDownloadFinishNotification(Landroid/os/Message;)Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0

    .line 205
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    .line 206
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    const/high16 v3, 0x1040000

    .line 207
    invoke-virtual {v1, v3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 208
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 206
    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 209
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {p1, v2, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mpostProgressToNetInfoDialog(Lcom/flyersoft/moonreaderp/BookDownloadService;II)V

    goto :goto_0

    .line 210
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_3

    .line 211
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->error:I

    .line 212
    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 211
    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {p1, v2, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mpostProgressToNetInfoDialog(Lcom/flyersoft/moonreaderp/BookDownloadService;II)V

    .line 216
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;->this$1:Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mdoStop(Lcom/flyersoft/moonreaderp/BookDownloadService;)V

    return-void
.end method
