.class Lcom/radaee/reader/GLView$6;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->PDFSaveView()V
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

    .line 736
    iput-object p1, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 739
    iget-object v0, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_0

    .line 740
    iget-object v0, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    .line 741
    iget-object v1, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    .line 742
    iget-object v1, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_close(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 744
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    monitor-enter v0

    .line 745
    :try_start_0
    iget-object v1, p0, Lcom/radaee/reader/GLView$6;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 746
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
