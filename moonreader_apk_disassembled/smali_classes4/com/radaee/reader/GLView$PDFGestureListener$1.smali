.class Lcom/radaee/reader/GLView$PDFGestureListener$1;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView$PDFGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

.field final synthetic val$dx:F

.field final synthetic val$dy:F

.field final synthetic val$vx:F

.field final synthetic val$vy:F


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView$PDFGestureListener;FFFF)V
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

    .line 153
    iput-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iput p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$dx:F

    iput p3, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$dy:F

    iput p4, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$vx:F

    iput p5, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$vy:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 156
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$100(Lcom/radaee/reader/GLView;)I

    move-result v2

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$200(Lcom/radaee/reader/GLView;)I

    move-result v3

    iget v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$dx:F

    iget v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$dy:F

    iget v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$vx:F

    iget v7, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->val$vy:F

    invoke-virtual/range {v1 .. v7}, Lcom/radaee/view/GLLayout;->gl_fling(IIFFFF)Z

    .line 157
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener$1;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    return-void
.end method
