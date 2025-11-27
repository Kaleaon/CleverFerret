.class public Lcom/radaee/view/VThread;
.super Landroid/os/HandlerThread;
.source "VThread.java"

# interfaces
.implements Lcom/radaee/pdf/VNPage$VNPageListener;


# static fields
.field private static ms_paint:Landroid/graphics/Paint;


# instance fields
.field private is_notified:Z

.field private is_waitting:Z

.field private m_dst:Landroid/graphics/Rect;

.field private m_hand:Landroid/os/Handler;

.field private m_handUI:Landroid/os/Handler;

.field private m_pending:I

.field private m_src:Landroid/graphics/Rect;

.field private m_timer:Ljava/util/Timer;

.field private m_timer_task:Ljava/util/TimerTask;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 54
    const-string v0, "VThread"

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    .line 23
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_handUI:Landroid/os/Handler;

    .line 25
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_timer_task:Ljava/util/TimerTask;

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/radaee/view/VThread;->is_notified:Z

    .line 27
    iput-boolean v0, p0, Lcom/radaee/view/VThread;->is_waitting:Z

    .line 132
    iput v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    .line 194
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VThread;->m_src:Landroid/graphics/Rect;

    .line 195
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    .line 55
    iput-object p1, p0, Lcom/radaee/view/VThread;->m_handUI:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/radaee/view/VThread;->m_handUI:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$110(Lcom/radaee/view/VThread;)I
    .locals 2

    .line 20
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/radaee/view/VThread;->m_pending:I

    return v0
.end method

.method private declared-synchronized notify_init()V
    .locals 1

    monitor-enter p0

    .line 47
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/VThread;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lcom/radaee/view/VThread;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
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

    .line 32
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/VThread;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 33
    iput-boolean v1, p0, Lcom/radaee/view/VThread;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/radaee/view/VThread;->is_waitting:Z

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 38
    iput-boolean v1, p0, Lcom/radaee/view/VThread;->is_waitting:Z
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

    .line 44
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public BlkDealloc(J)V
    .locals 3

    .line 179
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    .line 180
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    const/16 v1, 0x20

    shr-long v1, p1, v1

    long-to-int v2, v1

    long-to-int p2, p1

    const/4 p1, 0x4

    invoke-virtual {v0, p1, v2, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public BlkRender(J)V
    .locals 3

    .line 172
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    .line 173
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    const/16 v1, 0x20

    shr-long v1, p1, v1

    long-to-int v2, v1

    long-to-int p2, p1

    const/4 p1, 0x3

    invoke-virtual {v0, p1, v2, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public Dealloc(J)V
    .locals 4

    .line 166
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    .line 167
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    const/16 v2, 0x20

    shr-long v2, p1, v2

    long-to-int v3, v2

    long-to-int p2, p1

    invoke-virtual {v0, v1, v3, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public Draw(JLandroid/graphics/Canvas;IIIIIIII)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p3, :cond_0

    return v0

    .line 201
    :cond_0
    iget-object v1, p0, Lcom/radaee/view/VThread;->m_src:Landroid/graphics/Rect;

    iput p4, v1, Landroid/graphics/Rect;->left:I

    .line 202
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_src:Landroid/graphics/Rect;

    iput p5, p4, Landroid/graphics/Rect;->top:I

    .line 203
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_src:Landroid/graphics/Rect;

    iput p6, p4, Landroid/graphics/Rect;->right:I

    .line 204
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_src:Landroid/graphics/Rect;

    iput p7, p4, Landroid/graphics/Rect;->bottom:I

    .line 206
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    iput p8, p4, Landroid/graphics/Rect;->left:I

    .line 207
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    iput p9, p4, Landroid/graphics/Rect;->top:I

    .line 208
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    iput p10, p4, Landroid/graphics/Rect;->right:I

    .line 209
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    iput p11, p4, Landroid/graphics/Rect;->bottom:I

    .line 211
    sget-object p4, Lcom/radaee/view/VThread;->ms_paint:Landroid/graphics/Paint;

    if-nez p4, :cond_1

    .line 212
    new-instance p4, Landroid/graphics/Paint;

    invoke-direct {p4}, Landroid/graphics/Paint;-><init>()V

    sput-object p4, Lcom/radaee/view/VThread;->ms_paint:Landroid/graphics/Paint;

    .line 213
    sget-object p5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p4, p5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 214
    sget-object p4, Lcom/radaee/view/VThread;->ms_paint:Landroid/graphics/Paint;

    const/4 p5, -0x1

    invoke-virtual {p4, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 216
    :cond_1
    invoke-static {p1, p2}, Lcom/radaee/pdf/VNBlock;->bmp(J)Landroid/graphics/Bitmap;

    move-result-object p4

    const/4 p5, 0x1

    if-eqz p4, :cond_2

    .line 219
    iget-object p1, p0, Lcom/radaee/view/VThread;->m_src:Landroid/graphics/Rect;

    iget-object p2, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    const/4 p6, 0x0

    invoke-virtual {p3, p4, p1, p2, p6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return p5

    .line 224
    :cond_2
    iget-object p4, p0, Lcom/radaee/view/VThread;->m_dst:Landroid/graphics/Rect;

    sget-object p6, Lcom/radaee/view/VThread;->ms_paint:Landroid/graphics/Paint;

    invoke-virtual {p3, p4, p6}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 225
    invoke-static {p1, p2}, Lcom/radaee/pdf/VNBlock;->getSta(J)I

    move-result p1

    if-nez p1, :cond_3

    return p5

    :cond_3
    return v0
.end method

.method public Render(J)V
    .locals 3

    .line 159
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    .line 160
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    const/16 v1, 0x20

    shr-long v1, p1, v1

    long-to-int v2, v1

    long-to-int p2, p1

    const/4 p1, 0x0

    invoke-virtual {v0, p1, v2, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public declared-synchronized destroy()V
    .locals 3

    monitor-enter p0

    .line 142
    :try_start_0
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 143
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_timer_task:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    const/4 v0, 0x0

    .line 144
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_timer:Ljava/util/Timer;

    .line 145
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_timer_task:Ljava/util/TimerTask;

    .line 146
    iget-object v1, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 147
    invoke-virtual {p0}, Lcom/radaee/view/VThread;->join()V

    .line 148
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    .line 149
    iput-object v0, p0, Lcom/radaee/view/VThread;->m_handUI:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 153
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 155
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method protected onLooperPrepared()V
    .locals 0

    .line 130
    invoke-direct {p0}, Lcom/radaee/view/VThread;->notify_init()V

    return-void
.end method

.method public start()V
    .locals 7

    .line 60
    invoke-super {p0}, Landroid/os/HandlerThread;->start()V

    .line 61
    invoke-direct {p0}, Lcom/radaee/view/VThread;->wait_init()V

    .line 62
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VThread;->m_timer:Ljava/util/Timer;

    .line 63
    new-instance v2, Lcom/radaee/view/VThread$1;

    invoke-direct {v2, p0}, Lcom/radaee/view/VThread$1;-><init>(Lcom/radaee/view/VThread;)V

    iput-object v2, p0, Lcom/radaee/view/VThread;->m_timer_task:Ljava/util/TimerTask;

    .line 70
    iget-object v1, p0, Lcom/radaee/view/VThread;->m_timer:Ljava/util/Timer;

    const-wide/16 v3, 0x64

    const-wide/16 v5, 0x64

    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 71
    new-instance v0, Lcom/radaee/view/VThread$2;

    invoke-virtual {p0}, Lcom/radaee/view/VThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/radaee/view/VThread$2;-><init>(Lcom/radaee/view/VThread;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    return-void
.end method

.method protected start_find(Lcom/radaee/view/VFinder;)V
    .locals 2

    .line 135
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    .line 136
    iget-object v0, p0, Lcom/radaee/view/VThread;->m_hand:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected declared-synchronized wait_pending()V
    .locals 2

    monitor-enter p0

    .line 185
    :goto_0
    :try_start_0
    iget v0, p0, Lcom/radaee/view/VThread;->m_pending:I

    if-lez v0, :cond_0

    const-wide/16 v0, 0x32

    .line 186
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 191
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    :cond_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
