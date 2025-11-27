.class Lcom/radaee/reader/GLView$18;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->onTouchZoom(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;

.field final synthetic val$dis1:F


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;F)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1256
    iput-object p1, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    iput p2, p0, Lcom/radaee/reader/GLView$18;->val$dis1:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1259
    iget-object v0, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2700(Lcom/radaee/reader/GLView;)F

    move-result v1

    iget v2, p0, Lcom/radaee/reader/GLView$18;->val$dis1:F

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$2800(Lcom/radaee/reader/GLView;)F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_zoom_set(F)V

    .line 1260
    iget-object v0, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2400(Lcom/radaee/reader/GLView;)F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$2500(Lcom/radaee/reader/GLView;)F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2600(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 1261
    iget-object v0, p0, Lcom/radaee/reader/GLView$18;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
