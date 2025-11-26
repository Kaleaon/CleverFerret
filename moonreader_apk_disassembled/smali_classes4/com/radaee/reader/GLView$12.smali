.class Lcom/radaee/reader/GLView$12;
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

    .line 1097
    iput-object p1, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Lcom/radaee/reader/GLView$TouchRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1100
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$12;->get_x()F

    move-result v0

    .line 1101
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$12;->get_y()F

    move-result v1

    .line 1102
    invoke-virtual {p0}, Lcom/radaee/reader/GLView$12;->next()V

    .line 1103
    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    float-to-int v3, v0

    float-to-int v4, v1

    invoke-virtual {v2, v3, v4}, Lcom/radaee/view/GLLayout;->gl_move(II)V

    .line 1105
    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean v2, v2, Lcom/radaee/reader/GLView;->scoll_lock:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 1106
    sget v2, Lcom/radaee/pdf/Global;->def_view:I

    if-nez v2, :cond_0

    .line 1107
    iget-object v0, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$200(Lcom/radaee/reader/GLView;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v2, v1

    float-to-int v1, v2

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vSetY(I)V

    goto/16 :goto_1

    .line 1108
    :cond_0
    sget v1, Lcom/radaee/pdf/Global;->def_view:I

    if-ne v1, v3, :cond_5

    .line 1109
    iget-object v1, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$100(Lcom/radaee/reader/GLView;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v2, v0

    float-to-int v0, v2

    invoke-virtual {v1, v0}, Lcom/radaee/view/GLLayout;->vSetX(I)V

    goto :goto_1

    .line 1111
    :cond_1
    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    if-nez v2, :cond_3

    .line 1112
    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    sget v4, Lcom/radaee/pdf/Global;->def_view:I

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    .line 1113
    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v4

    sub-float v4, v1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    float-to-double v4, v4

    iget-object v6, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v6}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v6

    sub-float v6, v0, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    float-to-double v6, v6

    const-wide v8, 0x3fe6666666666666L    # 0.7

    mul-double v6, v6, v8

    cmpl-double v8, v4, v6

    if-lez v8, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 1112
    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    .line 1114
    :cond_3
    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1115
    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$100(Lcom/radaee/reader/GLView;)I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v4

    add-float/2addr v3, v4

    sub-float/2addr v3, v0

    float-to-int v0, v3

    invoke-virtual {v2, v0}, Lcom/radaee/view/GLLayout;->vSetX(I)V

    .line 1116
    :cond_4
    iget-object v0, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$200(Lcom/radaee/reader/GLView;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v2, v1

    float-to-int v1, v2

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vSetY(I)V

    .line 1119
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/radaee/reader/GLView$12;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
