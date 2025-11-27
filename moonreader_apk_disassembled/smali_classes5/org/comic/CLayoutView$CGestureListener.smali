.class Lorg/comic/CLayoutView$CGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "CLayoutView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/comic/CLayoutView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/comic/CLayoutView;


# direct methods
.method constructor <init>(Lorg/comic/CLayoutView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 327
    iput-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 345
    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 346
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget v0, v0, Lorg/comic/CLayoutView;->m_status:I

    if-nez v0, :cond_2

    .line 348
    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_listener:Lorg/comic/ICLayoutView$CLayoutListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v0, v2, p1}, Lorg/comic/ICLayoutView$CLayoutListener;->OnDoubleTapped(FF)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_0
    return v1
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 10

    .line 330
    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-boolean v0, v0, Lorg/comic/CLayoutView;->scoll_lock:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget v0, v0, Lorg/comic/CLayoutView;->def_view:I

    if-le v0, v1, :cond_0

    return v2

    .line 332
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-nez v0, :cond_1

    return v2

    .line 333
    :cond_1
    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget v0, v0, Lorg/comic/CLayoutView;->m_status:I

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-boolean v0, v0, Lorg/comic/CLayoutView;->m_hold:Z

    if-eqz v0, :cond_4

    .line 334
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float v6, v0, v2

    .line 335
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float v7, p2, p1

    .line 336
    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-boolean p1, p1, Lorg/comic/CLayoutView;->scoll_lock:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_2

    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget p1, p1, Lorg/comic/CLayoutView;->def_view:I

    if-nez p1, :cond_2

    const/4 v8, 0x0

    goto :goto_0

    :cond_2
    move v8, p3

    .line 337
    :goto_0
    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-boolean p1, p1, Lorg/comic/CLayoutView;->scoll_lock:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget p1, p1, Lorg/comic/CLayoutView;->def_view:I

    if-ne p1, v1, :cond_3

    const/4 v9, 0x0

    goto :goto_1

    :cond_3
    move v9, p4

    .line 338
    :goto_1
    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    iget-object v3, p1, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    invoke-static {p1}, Lorg/comic/CLayoutView;->-$$Nest$fgetm_hold_docx(Lorg/comic/CLayoutView;)I

    move-result v4

    iget-object p1, p0, Lorg/comic/CLayoutView$CGestureListener;->this$0:Lorg/comic/CLayoutView;

    invoke-static {p1}, Lorg/comic/CLayoutView;->-$$Nest$fgetm_hold_docy(Lorg/comic/CLayoutView;)I

    move-result v5

    invoke-virtual/range {v3 .. v9}, Lorg/comic/CLayout;->vFling(IIFFFF)Z

    move-result p1

    return p1

    :cond_4
    return v2
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
