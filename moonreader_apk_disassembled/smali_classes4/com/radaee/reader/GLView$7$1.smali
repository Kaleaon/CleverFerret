.class Lcom/radaee/reader/GLView$7$1;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Lcom/radaee/view/GLLayout$GLListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/GLView$7;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView$7;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 816
    iput-object p1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnBlockRendered(I)V
    .locals 2

    .line 819
    iget-object v0, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object v0, v0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 820
    iget-object v0, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object v0, v0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object v1, v1, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1, p1}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageRendered(Lcom/radaee/view/ILayoutView$IVPage;)V

    .line 821
    :cond_0
    iget-object p1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object p1, p1, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method

.method public OnFound(Z)V
    .locals 2

    if-eqz p1, :cond_1

    .line 826
    iget-object p1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object p1, p1, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object p1, p1, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFSearchFinished(Z)V

    .line 827
    :cond_0
    iget-object p1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object p1, p1, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->doInvalidate()V

    return-void

    .line 829
    :cond_1
    iget-object p1, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object p1, p1, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "no more found"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public OnRedraw()V
    .locals 1

    .line 833
    iget-object v0, p0, Lcom/radaee/reader/GLView$7$1;->this$1:Lcom/radaee/reader/GLView$7;

    iget-object v0, v0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
