.class Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;
.super Landroid/os/Handler;
.source "PDFPageGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;Landroid/os/Looper;)V
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

    .line 129
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->this$1:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    if-eqz p1, :cond_3

    .line 132
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_1

    .line 134
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    .line 135
    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->render()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->this$1:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    invoke-static {v1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->access$100(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->this$1:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    invoke-static {v2}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->access$100(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 137
    :cond_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 139
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 141
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    .line 142
    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->clear()Z

    .line 143
    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->this$1:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    invoke-static {v2}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->access$100(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;)Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->this$1:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    invoke-static {v3}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->access$100(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;)Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 144
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void

    .line 148
    :cond_2
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 149
    invoke-virtual {p0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    return-void

    .line 152
    :cond_3
    invoke-virtual {p0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread$1;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    return-void
.end method
