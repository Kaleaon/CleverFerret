.class Lcom/flyersoft/views/MRBookView$BookViewClient$1;
.super Landroid/os/Handler;
.source "MRBookView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/MRBookView$BookViewClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/MRBookView$BookViewClient;Landroid/os/Looper;)V
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

    .line 113
    iput-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 11

    .line 116
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/webkit/WebView;

    .line 117
    iget-object v1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v1, v1, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 119
    iget v1, p1, Landroid/os/Message;->what:I

    const-wide/16 v2, 0x32

    const-wide/16 v4, 0xbb8

    const/4 v6, 0x0

    if-nez v1, :cond_1

    .line 120
    invoke-virtual {v0}, Landroid/webkit/WebView;->getContentHeight()I

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iget-object v1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-wide v9, v1, Lcom/flyersoft/views/MRBookView$BookViewClient;->pageFinishedTime:J

    sub-long/2addr v7, v9

    cmp-long v1, v7, v4

    if-gez v1, :cond_0

    .line 121
    iget-object v1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v1, v1, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    iget-object v7, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v7, v7, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    invoke-virtual {v7, v6, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {v1, v7, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 123
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v1, v1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iget v1, v1, Lcom/flyersoft/views/MRBookView;->lastY:I

    invoke-virtual {v0, v6, v1}, Landroid/webkit/WebView;->scrollTo(II)V

    .line 124
    iget-object v1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v1, v1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iput v6, v1, Lcom/flyersoft/views/MRBookView;->lastY:I

    .line 128
    :cond_1
    :goto_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    if-ne p1, v1, :cond_5

    .line 129
    invoke-virtual {v0}, Landroid/webkit/WebView;->getContentHeight()I

    move-result p1

    if-nez p1, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-wide v9, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->pageFinishedTime:J

    sub-long/2addr v7, v9

    cmp-long p1, v7, v4

    if-gez p1, :cond_2

    .line 130
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object p1, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    iget-object v4, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v4, v4, Lcom/flyersoft/views/MRBookView$BookViewClient;->pHanlder:Landroid/os/Handler;

    invoke-virtual {v4, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    .line 132
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object p1, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iget p1, p1, Lcom/flyersoft/views/MRBookView;->lastX:I

    if-nez p1, :cond_3

    .line 133
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object p1, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-virtual {p1}, Lcom/flyersoft/views/MRBookView;->getContentWidth2()I

    move-result p1

    iget-object v1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object v1, v1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-virtual {v1}, Lcom/flyersoft/views/MRBookView;->getWidth()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1, v6}, Landroid/webkit/WebView;->scrollTo(II)V

    goto :goto_1

    .line 134
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object p1, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iget p1, p1, Lcom/flyersoft/views/MRBookView;->lastX:I

    const/4 v1, -0x1

    if-ne p1, v1, :cond_4

    .line 135
    invoke-virtual {v0, v6, v6}, Landroid/webkit/WebView;->scrollTo(II)V

    goto :goto_1

    .line 137
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object p1, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iget p1, p1, Lcom/flyersoft/views/MRBookView;->lastX:I

    invoke-virtual {v0, p1, v6}, Landroid/webkit/WebView;->scrollTo(II)V

    .line 138
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewClient$1;->this$1:Lcom/flyersoft/views/MRBookView$BookViewClient;

    iget-object p1, p1, Lcom/flyersoft/views/MRBookView$BookViewClient;->this$0:Lcom/flyersoft/views/MRBookView;

    iput v6, p1, Lcom/flyersoft/views/MRBookView;->lastX:I

    :cond_5
    return-void
.end method
