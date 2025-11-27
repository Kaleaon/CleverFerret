.class Lcom/radaee/util/PDFGridThread$1;
.super Landroid/os/Handler;
.source "PDFGridThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/PDFGridThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/util/PDFGridThread;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFGridThread;Landroid/os/Looper;)V
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

    .line 57
    iput-object p1, p0, Lcom/radaee/util/PDFGridThread$1;->this$0:Lcom/radaee/util/PDFGridThread;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    if-eqz p1, :cond_2

    .line 62
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_1

    .line 64
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/util/PDFGridItem;

    .line 65
    invoke-virtual {v0}, Lcom/radaee/util/PDFGridItem;->render()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/radaee/util/PDFGridThread$1;->this$0:Lcom/radaee/util/PDFGridThread;

    invoke-static {v1}, Lcom/radaee/util/PDFGridThread;->access$000(Lcom/radaee/util/PDFGridThread;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/radaee/util/PDFGridThread$1;->this$0:Lcom/radaee/util/PDFGridThread;

    invoke-static {v2}, Lcom/radaee/util/PDFGridThread;->access$000(Lcom/radaee/util/PDFGridThread;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 66
    :cond_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 70
    :cond_1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 71
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridThread$1;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    return-void

    .line 75
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridThread$1;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    return-void
.end method
