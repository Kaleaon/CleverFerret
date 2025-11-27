.class Lcom/radaee/view/PDFLayout$1;
.super Landroid/os/Handler;
.source "PDFLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/PDFLayout;


# direct methods
.method constructor <init>(Lcom/radaee/view/PDFLayout;Landroid/os/Looper;)V
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

    .line 88
    iput-object p1, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 91
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    if-nez v0, :cond_0

    return-void

    .line 92
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const-wide v1, 0xffffffffL

    const/16 v3, 0x20

    if-eqz v0, :cond_5

    const/4 v4, 0x1

    if-eq v0, v4, :cond_3

    const/4 v4, 0x2

    if-eq v0, v4, :cond_2

    const/16 v1, 0x64

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    invoke-interface {v0}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnTimer()V

    goto :goto_0

    .line 109
    :cond_2
    iget v0, p1, Landroid/os/Message;->arg1:I

    int-to-long v4, v0

    shl-long v3, v4, v3

    iget v0, p1, Landroid/os/Message;->arg2:I

    int-to-long v5, v0

    and-long/2addr v1, v5

    or-long/2addr v1, v3

    .line 111
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    invoke-static {v1, v2}, Lcom/radaee/pdf/VNBlock;->getPageNO(J)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnPageRendered(I)V

    goto :goto_0

    .line 98
    :cond_3
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ne v0, v4, :cond_4

    .line 100
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vFindGoto()V

    .line 101
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v0, :cond_6

    .line 102
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    invoke-interface {v0, v4}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnFound(Z)V

    goto :goto_0

    .line 104
    :cond_4
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v0, :cond_6

    .line 105
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnFound(Z)V

    goto :goto_0

    .line 94
    :cond_5
    iget v0, p1, Landroid/os/Message;->arg1:I

    int-to-long v4, v0

    shl-long v3, v4, v3

    iget v0, p1, Landroid/os/Message;->arg2:I

    int-to-long v5, v0

    and-long/2addr v1, v5

    or-long/2addr v1, v3

    .line 95
    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/radaee/view/PDFLayout$1;->this$0:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    invoke-static {v1, v2}, Lcom/radaee/pdf/VNCache;->getNO(J)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnCacheRendered(I)V

    .line 117
    :cond_6
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
