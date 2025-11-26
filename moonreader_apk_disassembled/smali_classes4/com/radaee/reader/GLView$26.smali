.class Lcom/radaee/reader/GLView$26;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->PDFSetZoom(IILcom/radaee/view/GLLayout$PDFPos;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;

.field final synthetic val$pos:Lcom/radaee/view/GLLayout$PDFPos;

.field final synthetic val$vx:I

.field final synthetic val$vy:I

.field final synthetic val$zoom:F


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;FIILcom/radaee/view/GLLayout$PDFPos;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3129
    iput-object p1, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    iput p2, p0, Lcom/radaee/reader/GLView$26;->val$zoom:F

    iput p3, p0, Lcom/radaee/reader/GLView$26;->val$vx:I

    iput p4, p0, Lcom/radaee/reader/GLView$26;->val$vy:I

    iput-object p5, p0, Lcom/radaee/reader/GLView$26;->val$pos:Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 3132
    iget-object v0, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_zoom_start(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 3133
    iget-object v0, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v1, p0, Lcom/radaee/reader/GLView$26;->val$zoom:F

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_zoom_set(F)V

    .line 3134
    iget-object v0, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v1, p0, Lcom/radaee/reader/GLView$26;->val$vx:I

    iget v2, p0, Lcom/radaee/reader/GLView$26;->val$vy:I

    iget-object v3, p0, Lcom/radaee/reader/GLView$26;->val$pos:Lcom/radaee/view/GLLayout$PDFPos;

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/GLLayout;->gl_zoom_set_pos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 3135
    iget-object v0, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_zoom_confirm(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 3136
    iget-object v0, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 3137
    iget-object v0, p0, Lcom/radaee/reader/GLView$26;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$2200(Lcom/radaee/reader/GLView;)V

    return-void
.end method
