.class public Lcom/radaee/view/PDFVThread;
.super Ljava/lang/Thread;
.source "PDFVThread.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private is_notified:Z

.field private is_waitting:Z

.field private m_hand:Landroid/os/Handler;

.field private m_handUI:Landroid/os/Handler;

.field private m_timer:Ljava/util/Timer;

.field private m_timer_task:Ljava/util/TimerTask;


# direct methods
.method protected constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    .line 20
    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_timer_task:Ljava/util/TimerTask;

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/radaee/view/PDFVThread;->is_notified:Z

    .line 22
    iput-boolean v0, p0, Lcom/radaee/view/PDFVThread;->is_waitting:Z

    .line 50
    iput-object p1, p0, Lcom/radaee/view/PDFVThread;->m_handUI:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/radaee/view/PDFVThread;->m_handUI:Landroid/os/Handler;

    return-object p0
.end method

.method private declared-synchronized notify_init()V
    .locals 1

    monitor-enter p0

    .line 42
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/PDFVThread;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/radaee/view/PDFVThread;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private declared-synchronized wait_init()V
    .locals 2

    monitor-enter p0

    .line 27
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/PDFVThread;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 28
    iput-boolean v1, p0, Lcom/radaee/view/PDFVThread;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lcom/radaee/view/PDFVThread;->is_waitting:Z

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 33
    iput-boolean v1, p0, Lcom/radaee/view/PDFVThread;->is_waitting:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 39
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 3

    monitor-enter p0

    .line 149
    :try_start_0
    iget-object v0, p0, Lcom/radaee/view/PDFVThread;->m_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 150
    iget-object v0, p0, Lcom/radaee/view/PDFVThread;->m_timer_task:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    const/4 v0, 0x0

    .line 151
    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_timer:Ljava/util/Timer;

    .line 152
    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_timer_task:Ljava/util/TimerTask;

    .line 153
    iget-object v1, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 154
    invoke-virtual {p0}, Lcom/radaee/view/PDFVThread;->join()V

    .line 155
    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    .line 156
    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_handUI:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 161
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method protected final end_render(Lcom/radaee/view/PDFVPage;)V
    .locals 2

    .line 137
    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->CancelRender()Lcom/radaee/view/PDFVCache;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 139
    iget-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public run()V
    .locals 2

    .line 70
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 71
    new-instance v0, Lcom/radaee/view/PDFVThread$2;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/radaee/view/PDFVThread$2;-><init>(Lcom/radaee/view/PDFVThread;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    .line 114
    invoke-direct {p0}, Lcom/radaee/view/PDFVThread;->notify_init()V

    .line 115
    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void
.end method

.method public start()V
    .locals 7

    .line 55
    invoke-super {p0}, Ljava/lang/Thread;->start()V

    .line 56
    invoke-direct {p0}, Lcom/radaee/view/PDFVThread;->wait_init()V

    .line 57
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFVThread;->m_timer:Ljava/util/Timer;

    .line 58
    new-instance v2, Lcom/radaee/view/PDFVThread$1;

    invoke-direct {v2, p0}, Lcom/radaee/view/PDFVThread$1;-><init>(Lcom/radaee/view/PDFVThread;)V

    iput-object v2, p0, Lcom/radaee/view/PDFVThread;->m_timer_task:Ljava/util/TimerTask;

    .line 65
    iget-object v1, p0, Lcom/radaee/view/PDFVThread;->m_timer:Ljava/util/Timer;

    const-wide/16 v3, 0x64

    const-wide/16 v5, 0x32

    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    return-void
.end method

.method protected final start_find(Lcom/radaee/view/PDFVFinder;)V
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final start_render(Lcom/radaee/view/PDFVPage;)V
    .locals 2

    .line 119
    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->RenderPrepare()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 123
    iget-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x0

    iget-object p1, p1, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 122
    :cond_0
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    :cond_1
    return-void
.end method

.method protected final start_render_thumb(Lcom/radaee/view/PDFVPage;)V
    .locals 2

    .line 128
    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->RenderPrepare()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 132
    iget-object v0, p0, Lcom/radaee/view/PDFVThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x3

    iget-object p1, p1, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 131
    :cond_0
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFVThread;->start_render_thumb(Lcom/radaee/view/PDFVPage;)V

    :cond_1
    return-void
.end method
