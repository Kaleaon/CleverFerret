.class Lcom/flyersoft/moonreaderp/BookDownloadService$Go;
.super Ljava/lang/Object;
.source "BookDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/BookDownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Go"
.end annotation


# instance fields
.field cookies:Ljava/lang/String;

.field downloadFinishHandler:Landroid/os/Handler;

.field private downloadedSize:I

.field hc:Lorg/apache/http/impl/client/DefaultHttpClient;

.field httpParams:Lorg/apache/http/params/BasicHttpParams;

.field library_xml:Ljava/lang/String;

.field private loginStart:Z

.field nm:Landroid/app/NotificationManager;

.field notification:Landroid/app/Notification;

.field notificationId:I

.field password:Ljava/lang/String;

.field progressHandler:Landroid/os/Handler;

.field saveName:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

.field url_str:Ljava/lang/String;

.field user_agent:Ljava/lang/String;

.field username:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fputloginStart(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->loginStart:Z

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/moonreaderp/BookDownloadService;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 160
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    new-instance p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$1;-><init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->progressHandler:Landroid/os/Handler;

    .line 190
    new-instance p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$2;-><init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    return-void
.end method

.method private createDownloadProgressNotification()Landroid/app/Notification;
    .locals 7

    .line 542
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 543
    new-instance v1, Landroid/widget/RemoteViews;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 544
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-le v3, v4, :cond_0

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->download_notification12:I

    goto :goto_0

    :cond_0
    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->download_notification:I

    :goto_0
    invoke-direct {v1, v2, v3}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 545
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->download_notification_title:I

    invoke-virtual {v1, v2, v0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 546
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->download_notification_progress_text:I

    const-string v2, "0%"

    invoke-virtual {v1, v0, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 547
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->download_progress:I

    const-string v2, ""

    invoke-virtual {v1, v0, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 548
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->download_total:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 549
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->download_notification_progress_bar:I

    const/16 v2, 0x64

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v1, v0, v2, v4, v3}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 551
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const/high16 v3, 0x4000000

    invoke-static {v0, v4, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 553
    new-instance v2, Landroid/content/Intent;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    const-class v6, Lcom/flyersoft/moonreaderp/BookDownloadCancelAct;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 554
    const-string v5, "id"

    iget v6, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 555
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 556
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-static {v5, v4, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 557
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->serviceCancel:I

    invoke-virtual {v1, v3, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 559
    new-instance v2, Landroid/app/Notification$Builder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 560
    invoke-static {v2}, Lcom/flyersoft/tools/A;->setNotificationChannel(Landroid/app/Notification$Builder;)V

    .line 561
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    const v3, 0x1080081

    .line 562
    iput v3, v2, Landroid/app/Notification;->icon:I

    .line 563
    iget v3, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v2, Landroid/app/Notification;->flags:I

    .line 564
    iput-object v1, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 565
    iput-object v0, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    return-object v2
.end method

.method private getReaderIntent()Landroid/content/Intent;
    .locals 4

    .line 522
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.flyersoft.moonreaderp.open_broadcast"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    .line 523
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "downloaded"

    const/4 v3, 0x1

    .line 524
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "id"

    iget v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    .line 525
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 526
    const-string v3, "bookFile"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 522
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->sendBroadcast(Landroid/content/Intent;)V

    .line 528
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    const-string v1, ".cbz"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    const-string v1, ".cbr"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 533
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 534
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 535
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0

    .line 529
    :cond_1
    :goto_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 530
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 531
    const-string v1, "imageFile"

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method


# virtual methods
.method protected createDownloadFinishNotification(Landroid/os/Message;)Landroid/app/Notification;
    .locals 8

    .line 459
    const-string v0, ".mr"

    const/4 v1, 0x1

    :try_start_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 460
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_6

    .line 461
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x2

    const-string v5, "UTF-8"

    const-string v6, ".zip"

    if-nez v3, :cond_3

    .line 462
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, v5, v4}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 463
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileTypeFromBinary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 464
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 465
    const-string v0, ".txt"

    .line 466
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 467
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 468
    new-instance v0, Lcom/flyersoft/books/Epub;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/flyersoft/books/Epub;-><init>(Ljava/lang/String;)V

    .line 469
    iget-boolean v0, v0, Lcom/flyersoft/books/Epub;->inited:Z

    if-eqz v0, :cond_1

    .line 470
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".epub"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    goto :goto_0

    .line 472
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    goto :goto_0

    .line 474
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 476
    :cond_3
    :goto_0
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v0, v2, v1}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 477
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    const-string v2, ".rar"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    .line 480
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    const-string v2, ".fb2"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 481
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, v5, v4}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 482
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileTypeFromBinary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 483
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 484
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 485
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    goto :goto_2

    .line 478
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    const-string v2, ".fb2.zip"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 479
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getBookFromZip(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    goto :goto_2

    :cond_6
    const/4 v0, 0x0

    .line 490
    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 492
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 495
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_3

    :cond_8
    const/4 v0, 0x0

    .line 496
    :goto_3
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    if-eqz v0, :cond_9

    const/16 v4, 0x64

    goto :goto_4

    :cond_9
    const/4 v4, -0x1

    :goto_4
    iget v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v3, v4, v5}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$mpostProgressToNetInfoDialog(Lcom/flyersoft/moonreaderp/BookDownloadService;II)V

    if-eqz v0, :cond_a

    .line 499
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    .line 498
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->downloaded:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    .line 499
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadedSize:I

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_5

    .line 500
    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_5
    if-eqz v0, :cond_b

    .line 502
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->getReaderIntent()Landroid/content/Intent;

    move-result-object v3

    goto :goto_6

    :cond_b
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 503
    :goto_6
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    const/high16 v5, 0x4000000

    invoke-static {v4, v2, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    if-eqz v0, :cond_c

    .line 505
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 506
    :goto_7
    new-instance v3, Landroid/app/Notification$Builder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x1080082

    .line 507
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 508
    invoke-virtual {v3, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 509
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 510
    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 511
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 512
    invoke-static {p1}, Lcom/flyersoft/tools/A;->setNotificationChannel(Landroid/app/Notification$Builder;)V

    .line 513
    invoke-virtual {p1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    return-object p1
.end method

.method protected doDownloadHandlerWithLogin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 443
    :try_start_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->httpParams:Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    .line 444
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v0

    new-instance v1, Lorg/apache/http/auth/AuthScope;

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2, v3}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lorg/apache/http/auth/UsernamePasswordCredentials;

    invoke-direct {v2, p1, p2}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1, v2}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 447
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->hc:Lorg/apache/http/impl/client/DefaultHttpClient;

    new-instance p2, Lorg/apache/http/client/methods/HttpGet;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-direct {p2, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object p1

    .line 448
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadWithHttpGet(Lorg/apache/http/HttpResponse;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 450
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 451
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 450
    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method doUnauthorizedDownload()V
    .locals 4

    .line 428
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->library_xml:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->library_xml:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 431
    const-string v2, "username"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 432
    const-string v3, "password"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getDecryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 433
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->loginStart:Z

    if-nez v1, :cond_1

    const/4 v1, 0x1

    .line 434
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->loginStart:Z

    .line 435
    invoke-virtual {p0, v2, v0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->doDownloadHandlerWithLogin(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 437
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public downloadWithHttpGet(Lorg/apache/http/HttpResponse;)V
    .locals 13

    .line 221
    const-string v0, ".mr"

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$misCancelled(Lcom/flyersoft/moonreaderp/BookDownloadService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 226
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0x191

    if-ne v3, v4, :cond_1

    .line 232
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->doUnauthorizedDownload()V

    return-void

    :cond_1
    const/16 v4, 0xc8

    if-eq v3, v4, :cond_2

    .line 237
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    .line 238
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 237
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 242
    :cond_2
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, -0x1

    .line 245
    :try_start_1
    const-string v5, "Content-Length"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    const/4 p1, -0x1

    :goto_0
    const/16 v5, 0x2000

    .line 251
    :try_start_2
    new-array v5, v5, [B

    .line 254
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v2

    const-wide/16 v6, 0x0

    if-nez v2, :cond_3

    .line 256
    new-instance v8, Ljava/io/FileOutputStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    move-object v2, v8

    :cond_3
    const/4 v0, 0x0

    .line 258
    :cond_4
    :goto_1
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v8

    const/4 v9, 0x1

    if-eq v8, v4, :cond_6

    .line 259
    iget-object v10, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget v11, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v10, v11}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$misCancelled(Lcom/flyersoft/moonreaderp/BookDownloadService;I)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 260
    new-array p1, v9, [Ljava/lang/Object;

    const-string v0, "*****send cancel message from DownloadHandler(2)"

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 261
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_8

    .line 283
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    .line 264
    :cond_5
    :try_start_4
    invoke-virtual {v2, v5, v1, v8}, Ljava/io/OutputStream;->write([BII)V

    add-int/2addr v0, v8

    .line 266
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long/2addr v8, v6

    const-wide/16 v10, 0x3e8

    cmp-long v12, v8, v10

    if-lez v12, :cond_4

    .line 267
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 268
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->progressHandler:Landroid/os/Handler;

    invoke-virtual {v8, v1, v0, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 271
    :cond_6
    iput v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadedSize:I

    if-lez v0, :cond_7

    .line 273
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    invoke-virtual {p1, v9}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_2

    .line 275
    :cond_7
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadWithUrlConnection()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_2
    if-eqz v2, :cond_8

    .line 283
    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_3

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    .line 278
    :try_start_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    .line 279
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 278
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v2, :cond_8

    .line 283
    :try_start_7
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_3

    :catch_2
    move-exception p1

    .line 285
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_8
    :goto_3
    return-void

    :goto_4
    if-eqz v2, :cond_9

    .line 283
    :try_start_8
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    .line 285
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 287
    :cond_9
    :goto_5
    throw p1
.end method

.method public downloadWithUrlConnection()V
    .locals 13

    .line 291
    const-string v0, ".mr"

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$misCancelled(Lcom/flyersoft/moonreaderp/BookDownloadService;I)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 295
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v2

    if-nez v2, :cond_1

    .line 297
    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    .line 299
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->user_agent:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->cookies:Ljava/lang/String;

    invoke-static {v0, v3, v4}, Lcom/flyersoft/tools/T;->openUrlConnection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v0

    .line 300
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentLength()I

    move-result v3

    .line 301
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v4, 0x2000

    .line 305
    new-array v4, v4, [B

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    .line 307
    :cond_2
    :goto_0
    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v8

    const/4 v9, -0x1

    const/4 v10, 0x1

    if-eq v8, v9, :cond_4

    .line 308
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget v11, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v9, v11}, Lcom/flyersoft/moonreaderp/BookDownloadService;->-$$Nest$misCancelled(Lcom/flyersoft/moonreaderp/BookDownloadService;I)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 309
    new-array v0, v10, [Ljava/lang/Object;

    const-string v3, "*****send cancel message from DownloadHandler(2)"

    aput-object v3, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 310
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_5

    .line 328
    :try_start_1
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    .line 313
    :cond_3
    :try_start_2
    invoke-virtual {v2, v4, v1, v8}, Ljava/io/OutputStream;->write([BII)V

    add-int/2addr v7, v8

    .line 315
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long/2addr v8, v5

    const-wide/16 v10, 0x3e8

    cmp-long v12, v8, v10

    if-lez v12, :cond_2

    .line 316
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    .line 317
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->progressHandler:Landroid/os/Handler;

    invoke-virtual {v8, v1, v7, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 320
    :cond_4
    iput v7, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadedSize:I

    .line 321
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    invoke-virtual {v0, v10}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_5

    .line 328
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    return-void

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 323
    :try_start_4
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->downloadFinishHandler:Landroid/os/Handler;

    .line 324
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 323
    invoke-virtual {v3, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v2, :cond_5

    .line 328
    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 330
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    return-void

    :goto_2
    if-eqz v2, :cond_6

    .line 328
    :try_start_6
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_3

    :catch_2
    move-exception v1

    .line 330
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 332
    :cond_6
    :goto_3
    throw v0
.end method

.method startFileDownload()V
    .locals 4

    .line 336
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingUrls:Ljava/util/Set;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 337
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingNotifications:Ljava/util/Set;

    iget v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    .line 338
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->loginStart:Z

    .line 339
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->cookies:Ljava/lang/String;

    .line 340
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "cookie2: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->cookies:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v1, v3, v0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 342
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->this$0:Lcom/flyersoft/moonreaderp/BookDownloadService;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->nm:Landroid/app/NotificationManager;

    .line 343
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->createDownloadProgressNotification()Landroid/app/Notification;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notification:Landroid/app/Notification;

    .line 344
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->nm:Landroid/app/NotificationManager;

    iget v3, p0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    invoke-virtual {v1, v3, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 355
    new-instance v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$3;-><init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;)V

    .line 373
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setPriority(I)V

    .line 374
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 376
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go$4;-><init>(Lcom/flyersoft/moonreaderp/BookDownloadService$Go;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 423
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setPriority(I)V

    .line 424
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
