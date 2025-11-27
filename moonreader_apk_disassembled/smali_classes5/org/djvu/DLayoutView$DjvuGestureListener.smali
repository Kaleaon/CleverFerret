.class Lorg/djvu/DLayoutView$DjvuGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "DLayoutView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/djvu/DLayoutView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DjvuGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/djvu/DLayoutView;


# direct methods
.method constructor <init>(Lorg/djvu/DLayoutView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 380
    iput-object p1, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
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

    .line 383
    iget-object v0, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget-boolean v0, v0, Lorg/djvu/DLayoutView;->scoll_lock:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget v0, Lorg/djvu/DLayoutView;->def_view:I

    if-le v0, v1, :cond_0

    return v2

    .line 385
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-nez v0, :cond_1

    return v2

    .line 386
    :cond_1
    iget-object v0, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget v0, v0, Lorg/djvu/DLayoutView;->m_status:I

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget-boolean v0, v0, Lorg/djvu/DLayoutView;->m_hold:Z

    if-eqz v0, :cond_4

    .line 387
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float v6, v0, v2

    .line 388
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float v7, p2, p1

    .line 389
    iget-object p1, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget-boolean p1, p1, Lorg/djvu/DLayoutView;->scoll_lock:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_2

    sget p1, Lorg/djvu/DLayoutView;->def_view:I

    if-nez p1, :cond_2

    const/4 v8, 0x0

    goto :goto_0

    :cond_2
    move v8, p3

    .line 390
    :goto_0
    iget-object p1, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget-boolean p1, p1, Lorg/djvu/DLayoutView;->scoll_lock:Z

    if-eqz p1, :cond_3

    sget p1, Lorg/djvu/DLayoutView;->def_view:I

    if-ne p1, v1, :cond_3

    const/4 v9, 0x0

    goto :goto_1

    :cond_3
    move v9, p4

    .line 391
    :goto_1
    iget-object p1, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    iget-object v3, p1, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget-object p1, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    invoke-static {p1}, Lorg/djvu/DLayoutView;->-$$Nest$fgetm_hold_docx(Lorg/djvu/DLayoutView;)I

    move-result v4

    iget-object p1, p0, Lorg/djvu/DLayoutView$DjvuGestureListener;->this$0:Lorg/djvu/DLayoutView;

    invoke-static {p1}, Lorg/djvu/DLayoutView;->-$$Nest$fgetm_hold_docy(Lorg/djvu/DLayoutView;)I

    move-result v5

    invoke-virtual/range {v3 .. v9}, Lorg/djvu/DLayout;->vFling(IIFFFF)Z

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
