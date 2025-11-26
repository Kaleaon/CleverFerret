.class Lcom/radaee/reader/GLView$3;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->surfaceCreated(Landroid/view/SurfaceHolder;)V
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

    .line 637
    iput-object p1, p0, Lcom/radaee/reader/GLView$3;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 640
    iget-object v0, p0, Lcom/radaee/reader/GLView$3;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/GLView$3;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    .line 641
    iget-object v0, p0, Lcom/radaee/reader/GLView$3;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$3;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V

    :cond_0
    return-void
.end method
