.class Lcom/radaee/view/PDFVThread$2;
.super Landroid/os/Handler;
.source "PDFVThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/view/PDFVThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/PDFVThread;


# direct methods
.method constructor <init>(Lcom/radaee/view/PDFVThread;Landroid/os/Looper;)V
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
    iput-object p1, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    if-eqz p1, :cond_5

    .line 77
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 79
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/view/PDFVCache;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVCache;->Render()V

    .line 80
    iget-object v0, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v0}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v0

    iget-object v3, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v3}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/radaee/view/PDFVCache;

    invoke-virtual {v3, v1, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 81
    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 82
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 84
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 86
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/view/PDFVCache;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVCache;->Clear()V

    .line 87
    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 88
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 90
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_2

    .line 92
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find()I

    move-result v0

    .line 93
    iget-object v4, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v4}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v5}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v3, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 94
    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 95
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 97
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_3

    .line 99
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/view/PDFVCache;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVCache;->RenderThumb()V

    .line 100
    iget-object v0, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v0}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v0

    iget-object v3, p0, Lcom/radaee/view/PDFVThread$2;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v3}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/radaee/view/PDFVCache;

    invoke-virtual {v3, v1, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 101
    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 102
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 104
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_4

    .line 106
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 107
    invoke-virtual {p0}, Lcom/radaee/view/PDFVThread$2;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    :cond_4
    return-void

    .line 111
    :cond_5
    invoke-virtual {p0}, Lcom/radaee/view/PDFVThread$2;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    return-void
.end method
