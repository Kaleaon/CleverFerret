.class public Lcom/flyersoft/moonreaderp/BookTtsService;
.super Landroid/app/Service;
.source "BookTtsService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 0

    .line 20
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 44
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .locals 0

    .line 61
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const/4 p1, 0x1

    .line 25
    new-array p2, p1, [Ljava/lang/Object;

    const-string p3, "BookTtsService onStartCommand"

    const/4 v0, 0x0

    aput-object p3, p2, v0

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 27
    sget-object p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 28
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 30
    :try_start_0
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1d

    const v1, 0x6169e17f

    if-lt p3, v0, :cond_0

    .line 31
    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_notification:Landroid/app/Notification;

    const/4 p3, 0x2

    invoke-static {p0, v1, p2, p3}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Lcom/flyersoft/moonreaderp/BookTtsService;ILandroid/app/Notification;I)V

    goto :goto_0

    .line 33
    :cond_0
    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_notification:Landroid/app/Notification;

    invoke-virtual {p0, v1, p2}, Lcom/flyersoft/moonreaderp/BookTtsService;->startForeground(ILandroid/app/Notification;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p2

    .line 35
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return p1
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 0

    .line 56
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method
