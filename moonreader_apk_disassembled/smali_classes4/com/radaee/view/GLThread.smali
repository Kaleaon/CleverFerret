.class public Lcom/radaee/view/GLThread;
.super Ljava/lang/Thread;
.source "GLThread.java"


# instance fields
.field private is_notified:Z

.field private is_waitting:Z

.field private m_hand:Landroid/os/Handler;

.field private m_hand_gl:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    .line 17
    iput-object v0, p0, Lcom/radaee/view/GLThread;->m_hand_gl:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/radaee/view/GLThread;->is_notified:Z

    .line 19
    iput-boolean v0, p0, Lcom/radaee/view/GLThread;->is_waitting:Z

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/view/GLThread;)Landroid/os/Handler;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/radaee/view/GLThread;->m_hand_gl:Landroid/os/Handler;

    return-object p0
.end method

.method private declared-synchronized notify_init()V
    .locals 1

    monitor-enter p0

    .line 39
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/GLThread;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/radaee/view/GLThread;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
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

    .line 24
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/GLThread;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 25
    iput-boolean v1, p0, Lcom/radaee/view/GLThread;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/radaee/view/GLThread;->is_waitting:Z

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 30
    iput-boolean v1, p0, Lcom/radaee/view/GLThread;->is_waitting:Z
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

    .line 36
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    monitor-enter p0

    .line 134
    :try_start_0
    iget-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/16 v1, 0x64

    .line 137
    :try_start_1
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 138
    invoke-virtual {p0}, Lcom/radaee/view/GLThread;->join()V

    const/4 v0, 0x0

    .line 139
    iput-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    :catch_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method protected find_start(Lcom/radaee/view/VFinder;)V
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public reflow_destroy_page(Lcom/radaee/pdf/Page;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public reflow_end(Lcom/radaee/view/GLReflowBlock;)V
    .locals 2

    .line 152
    invoke-virtual {p1}, Lcom/radaee/view/GLReflowBlock;->render_cancel()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public reflow_start(Lcom/radaee/view/GLReflowBlock;)V
    .locals 2

    .line 147
    invoke-virtual {p1}, Lcom/radaee/view/GLReflowBlock;->render_start()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public render_end(Ljavax/microedition/khronos/opengles/GL10;Lcom/radaee/view/GLBlock;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    .line 111
    :cond_0
    invoke-virtual {p2, p1}, Lcom/radaee/view/GLBlock;->gl_end(Ljavax/microedition/khronos/opengles/GL10;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 113
    iget-object p1, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return v0
.end method

.method public render_start(Lcom/radaee/view/GLBlock;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 103
    invoke-virtual {p1}, Lcom/radaee/view/GLBlock;->gl_start()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public run()V
    .locals 2

    .line 47
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 48
    new-instance v0, Lcom/radaee/view/GLThread$1;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/radaee/view/GLThread$1;-><init>(Lcom/radaee/view/GLThread;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/view/GLThread;->m_hand:Landroid/os/Handler;

    .line 98
    invoke-direct {p0}, Lcom/radaee/view/GLThread;->notify_init()V

    .line 99
    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void
.end method

.method public set_handler(Landroid/os/Handler;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/radaee/view/GLThread;->m_hand_gl:Landroid/os/Handler;

    return-void
.end method

.method public start()V
    .locals 0

    .line 125
    invoke-super {p0}, Ljava/lang/Thread;->start()V

    .line 126
    invoke-direct {p0}, Lcom/radaee/view/GLThread;->wait_init()V

    return-void
.end method
