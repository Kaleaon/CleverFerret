.class public Lcom/radaee/util/PDFGridThread;
.super Ljava/lang/Thread;
.source "PDFGridThread.java"


# instance fields
.field private is_notified:Z

.field private is_waitting:Z

.field private m_hand:Landroid/os/Handler;

.field private m_handUI:Landroid/os/Handler;


# direct methods
.method protected constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/radaee/util/PDFGridThread;->m_hand:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridThread;->is_notified:Z

    .line 15
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridThread;->is_waitting:Z

    .line 43
    iput-object p1, p0, Lcom/radaee/util/PDFGridThread;->m_handUI:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/util/PDFGridThread;)Landroid/os/Handler;
    .locals 0

    .line 10
    iget-object p0, p0, Lcom/radaee/util/PDFGridThread;->m_handUI:Landroid/os/Handler;

    return-object p0
.end method

.method private declared-synchronized notify_init()V
    .locals 1

    monitor-enter p0

    .line 35
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/util/PDFGridThread;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridThread;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
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

    .line 20
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/util/PDFGridThread;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 21
    iput-boolean v1, p0, Lcom/radaee/util/PDFGridThread;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridThread;->is_waitting:Z

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 26
    iput-boolean v1, p0, Lcom/radaee/util/PDFGridThread;->is_waitting:Z
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

    .line 32
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    monitor-enter p0

    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/radaee/util/PDFGridThread;->m_hand:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 90
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridThread;->join()V

    const/4 v0, 0x0

    .line 91
    iput-object v0, p0, Lcom/radaee/util/PDFGridThread;->m_hand:Landroid/os/Handler;

    .line 92
    iput-object v0, p0, Lcom/radaee/util/PDFGridThread;->m_handUI:Landroid/os/Handler;
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

    .line 97
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method public run()V
    .locals 2

    .line 54
    invoke-static {}, Landroid/os/Looper;->prepare()V

    const/16 v0, 0xa

    .line 55
    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFGridThread;->setPriority(I)V

    .line 56
    new-instance v0, Lcom/radaee/util/PDFGridThread$1;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/radaee/util/PDFGridThread$1;-><init>(Lcom/radaee/util/PDFGridThread;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/util/PDFGridThread;->m_hand:Landroid/os/Handler;

    .line 78
    invoke-direct {p0}, Lcom/radaee/util/PDFGridThread;->notify_init()V

    .line 79
    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void
.end method

.method public start()V
    .locals 0

    .line 48
    invoke-super {p0}, Ljava/lang/Thread;->start()V

    .line 49
    invoke-direct {p0}, Lcom/radaee/util/PDFGridThread;->wait_init()V

    return-void
.end method

.method protected declared-synchronized start_render(Lcom/radaee/util/PDFGridItem;)V
    .locals 2

    monitor-enter p0

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/radaee/util/PDFGridThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
