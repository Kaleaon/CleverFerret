.class Lcom/radaee/reader/GLView$16;
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

    .line 1207
    iput-object p1, p0, Lcom/radaee/reader/GLView$16;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1210
    iget-object v0, p0, Lcom/radaee/reader/GLView$16;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$16;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_zoom_confirm(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1211
    iget-object v0, p0, Lcom/radaee/reader/GLView$16;->this$0:Lcom/radaee/reader/GLView;

    const v1, -0x39e3c000    # -10000.0f

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$2402(Lcom/radaee/reader/GLView;F)F

    .line 1212
    iget-object v0, p0, Lcom/radaee/reader/GLView$16;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$2502(Lcom/radaee/reader/GLView;F)F

    .line 1213
    iget-object v0, p0, Lcom/radaee/reader/GLView$16;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
