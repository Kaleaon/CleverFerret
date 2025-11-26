.class Lcom/radaee/reader/GLView$10;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->onTouchEditbox(Landroid/view/MotionEvent;)Z
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

    .line 1041
    iput-object p1, p0, Lcom/radaee/reader/GLView$10;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v0, 0x2

    .line 1044
    new-array v0, v0, [I

    .line 1045
    iget-object v1, p0, Lcom/radaee/reader/GLView$10;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1, v0}, Lcom/radaee/reader/GLView;->getLocationOnScreen([I)V

    .line 1046
    iget-object v1, p0, Lcom/radaee/reader/GLView$10;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2300(Lcom/radaee/reader/GLView;)Lcom/radaee/annotui/UIAnnotPopEdit;

    move-result-object v1

    iget-object v2, p0, Lcom/radaee/reader/GLView$10;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v3

    const/4 v4, 0x0

    aget v3, v3, v4

    float-to-int v3, v3

    aget v4, v0, v4

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/radaee/reader/GLView$10;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v4

    const/4 v5, 0x1

    aget v4, v4, v5

    aget v0, v0, v5

    int-to-float v0, v0

    add-float/2addr v4, v0

    float-to-int v0, v4

    invoke-virtual {v1, v2, v3, v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->show(Landroid/view/View;II)V

    return-void
.end method
