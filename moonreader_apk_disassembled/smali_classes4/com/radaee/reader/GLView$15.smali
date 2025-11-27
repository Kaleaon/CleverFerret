.class Lcom/radaee/reader/GLView$15;
.super Lcom/radaee/reader/GLView$TouchRunnable;
.source "GLView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/reader/GLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1197
    iput-object p1, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Lcom/radaee/reader/GLView$TouchRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1200
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$15;->get_x()F

    move-result v0

    .line 1201
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$15;->next()V

    .line 1202
    iget-object v1, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$2700(Lcom/radaee/reader/GLView;)F

    move-result v2

    mul-float v2, v2, v0

    iget-object v0, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$2800(Lcom/radaee/reader/GLView;)F

    move-result v0

    div-float/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLLayout;->gl_zoom_set(F)V

    .line 1203
    iget-object v0, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2600(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 1204
    iget-object v0, p0, Lcom/radaee/reader/GLView$15;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
