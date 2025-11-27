.class Lcom/radaee/reader/GLView$11;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    .line 1088
    iput-object p1, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1091
    iget-object v0, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->gl_abort_scroll()V

    .line 1092
    iget-object v0, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/radaee/view/GLLayout;->gl_down(II)V

    .line 1093
    iget-object v0, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v1

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$102(Lcom/radaee/reader/GLView;I)I

    .line 1094
    iget-object v0, p0, Lcom/radaee/reader/GLView$11;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v1}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v1

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$202(Lcom/radaee/reader/GLView;I)I

    return-void
.end method
