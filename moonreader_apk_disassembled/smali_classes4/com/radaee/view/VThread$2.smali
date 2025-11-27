.class Lcom/radaee/view/VThread$2;
.super Landroid/os/Handler;
.source "VThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/view/VThread;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/VThread;


# direct methods
.method constructor <init>(Lcom/radaee/view/VThread;Landroid/os/Looper;)V
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

    .line 72
    iput-object p1, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    if-eqz p1, :cond_6

    .line 78
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide v3, 0xffffffffL

    const/16 v5, 0x20

    if-nez v0, :cond_0

    .line 80
    iget v0, p1, Landroid/os/Message;->arg1:I

    int-to-long v6, v0

    shl-long v5, v6, v5

    iget v0, p1, Landroid/os/Message;->arg2:I

    int-to-long v7, v0

    and-long/2addr v3, v7

    or-long/2addr v3, v5

    .line 81
    invoke-static {v3, v4, v2}, Lcom/radaee/pdf/VNCache;->render(JZ)V

    .line 82
    iget-object v0, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v0}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v0

    iget-object v3, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v3}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v3

    iget v4, p1, Landroid/os/Message;->arg1:I

    iget v5, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 83
    iput-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 84
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 86
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v6, 0x1

    if-ne v0, v6, :cond_1

    .line 88
    iget v0, p1, Landroid/os/Message;->arg1:I

    int-to-long v6, v0

    shl-long v5, v6, v5

    iget v0, p1, Landroid/os/Message;->arg2:I

    int-to-long v7, v0

    and-long/2addr v3, v7

    or-long/2addr v3, v5

    .line 89
    invoke-static {v3, v4}, Lcom/radaee/pdf/VNCache;->destroy(J)V

    .line 90
    iput-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 91
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 93
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v7, 0x2

    if-ne v0, v7, :cond_2

    .line 95
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find()I

    move-result v0

    .line 96
    iget-object v3, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v3}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v4}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v6, v0, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 97
    iput-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 98
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 100
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 102
    iget v0, p1, Landroid/os/Message;->arg1:I

    int-to-long v0, v0

    shl-long/2addr v0, v5

    iget v2, p1, Landroid/os/Message;->arg2:I

    int-to-long v5, v2

    and-long/2addr v3, v5

    or-long/2addr v0, v3

    .line 103
    invoke-static {v0, v1}, Lcom/radaee/pdf/VNBlock;->Render(J)V

    .line 104
    iget-object v0, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v0}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v1}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v1, v7, v2, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 105
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 107
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    .line 109
    iget v0, p1, Landroid/os/Message;->arg1:I

    int-to-long v0, v0

    shl-long/2addr v0, v5

    iget v2, p1, Landroid/os/Message;->arg2:I

    int-to-long v5, v2

    and-long/2addr v3, v5

    or-long/2addr v0, v3

    .line 110
    invoke-static {v0, v1}, Lcom/radaee/pdf/VNBlock;->destroy(J)V

    .line 111
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 113
    :cond_4
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_5

    .line 115
    invoke-virtual {p0}, Lcom/radaee/view/VThread$2;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 116
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 118
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/VThread$2;->this$0:Lcom/radaee/view/VThread;

    invoke-static {p1}, Lcom/radaee/view/VThread;->access$110(Lcom/radaee/view/VThread;)I

    return-void

    .line 122
    :cond_6
    invoke-virtual {p0}, Lcom/radaee/view/VThread$2;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    return-void
.end method
