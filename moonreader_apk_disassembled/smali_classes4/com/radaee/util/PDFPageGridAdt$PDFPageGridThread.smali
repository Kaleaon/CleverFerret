.class Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;
.super Ljava/lang/Thread;
.source "PDFPageGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/PDFPageGridAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PDFPageGridThread"
.end annotation


# instance fields
.field private is_notified:Z

.field private is_waitting:Z

.field private m_hand:Landroid/os/Handler;

.field private m_handUI:Landroid/os/Handler;

.field final synthetic this$0:Lcom/radaee/util/PDFPageGridAdt;


# direct methods
.method protected constructor <init>(Lcom/radaee/util/PDFPageGridAdt;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 114
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    .line 115
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 p1, 0x0

    .line 89
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_hand:Landroid/os/Handler;

    const/4 p1, 0x0

    .line 91
    iput-boolean p1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_notified:Z

    .line 92
    iput-boolean p1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_waitting:Z

    .line 116
    iput-object p2, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_handUI:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$100(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;)Landroid/os/Handler;
    .locals 0

    .line 88
    iget-object p0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_handUI:Landroid/os/Handler;

    return-object p0
.end method

.method private declared-synchronized notify_init()V
    .locals 1

    monitor-enter p0

    .line 108
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 111
    iput-boolean v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
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

    .line 96
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 97
    iput-boolean v1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 99
    iput-boolean v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_waitting:Z

    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 101
    iput-boolean v1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->is_waitting:Z
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

    .line 105
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    monitor-enter p0

    .line 169
    :try_start_0
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_hand:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 170
    invoke-virtual {p0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->join()V

    const/4 v0, 0x0

    .line 171
    iput-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_hand:Landroid/os/Handler;

    .line 172
    iput-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_handUI:Landroid/os/Handler;
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

    .line 175
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method protected declared-synchronized end_render(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V
    .locals 2

    monitor-enter p0

    .line 159
    :try_start_0
    invoke-virtual {p1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->render_end()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    .line 160
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public run()V
    .locals 2

    .line 127
    invoke-static {}, Landroid/os/Looper;->prepare()V

    const/16 v0, 0xa

    .line 128
    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->setPriority(I)V

    .line 129
    new-instance v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;-><init>(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_hand:Landroid/os/Handler;

    .line 155
    invoke-direct {p0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->notify_init()V

    .line 156
    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void
.end method

.method public start()V
    .locals 0

    .line 121
    invoke-super {p0}, Ljava/lang/Thread;->start()V

    .line 122
    invoke-direct {p0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->wait_init()V

    return-void
.end method

.method protected declared-synchronized start_render(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V
    .locals 2

    monitor-enter p0

    .line 163
    :try_start_0
    invoke-virtual {p1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->render_start()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    .line 164
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
