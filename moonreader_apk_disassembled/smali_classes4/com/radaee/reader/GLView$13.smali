.class Lcom/radaee/reader/GLView$13;
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

    .line 1122
    iput-object p1, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Lcom/radaee/reader/GLView$TouchRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1125
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$13;->get_x()F

    move-result v0

    .line 1126
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$13;->get_y()F

    move-result v1

    .line 1127
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$13;->next()V

    .line 1128
    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v2, :cond_0

    return-void

    .line 1131
    :cond_0
    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean v2, v2, Lcom/radaee/reader/GLView;->scoll_lock:Z

    if-eqz v2, :cond_2

    .line 1132
    sget v2, Lcom/radaee/pdf/Global;->def_view:I

    if-nez v2, :cond_1

    .line 1133
    iget-object v0, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$200(Lcom/radaee/reader/GLView;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v2, v1

    float-to-int v1, v2

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vSetY(I)V

    goto :goto_0

    .line 1134
    :cond_1
    sget v1, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    .line 1135
    iget-object v1, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$100(Lcom/radaee/reader/GLView;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v2, v0

    float-to-int v0, v2

    invoke-virtual {v1, v0}, Lcom/radaee/view/GLLayout;->vSetX(I)V

    goto :goto_0

    .line 1137
    :cond_2
    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1138
    :cond_3
    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$100(Lcom/radaee/reader/GLView;)I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v4

    add-float/2addr v3, v4

    sub-float/2addr v3, v0

    float-to-int v0, v3

    invoke-virtual {v2, v0}, Lcom/radaee/view/GLLayout;->vSetX(I)V

    .line 1139
    :cond_4
    iget-object v0, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$200(Lcom/radaee/reader/GLView;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v2, v1

    float-to-int v1, v2

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vSetY(I)V

    .line 1142
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->gl_move_end()V

    .line 1143
    iget-object v0, p0, Lcom/radaee/reader/GLView$13;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
