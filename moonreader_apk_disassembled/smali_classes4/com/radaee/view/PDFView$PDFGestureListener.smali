.class Lcom/radaee/view/PDFView$PDFGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PDFView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PDFGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/PDFView;


# direct methods
.method constructor <init>(Lcom/radaee/view/PDFView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 490
    iput-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

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
    .locals 4

    .line 517
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget v0, v0, Lcom/radaee/view/PDFView;->m_status:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 519
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v0, v3, p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFDoubleTapped(FF)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 521
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iput v1, p1, Lcom/radaee/view/PDFView;->m_status:I

    return v2

    :cond_0
    return v1
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 5

    .line 495
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget v0, v0, Lcom/radaee/view/PDFView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_4

    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget v0, v0, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    goto :goto_0

    .line 496
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v0, v3

    .line 497
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr p2, p1

    .line 498
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget p1, p1, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 v3, 0x0

    if-ne p1, v2, :cond_1

    const/4 p3, 0x0

    const/4 v0, 0x0

    .line 499
    :cond_1
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget p1, p1, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 v4, 0x2

    if-ne p1, v4, :cond_2

    const/4 p2, 0x0

    const/4 p4, 0x0

    .line 500
    :cond_2
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    invoke-virtual {p1, v0, p2, p3, p4}, Lcom/radaee/view/PDFView;->vOnFling(FFFF)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 502
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iput v1, p1, Lcom/radaee/view/PDFView;->m_status:I

    .line 503
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object p1, p1, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object p1, p1, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_3
    return v2

    :cond_4
    :goto_0
    return v1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2

    .line 537
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_0

    .line 538
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFLongPressed(FF)V

    :cond_0
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 2

    .line 548
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_0

    .line 549
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFShowPressed(FF)V

    :cond_0
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 559
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/radaee/view/PDFView;->vSingleTap(FF)V

    .line 560
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget v0, v0, Lcom/radaee/view/PDFView;->m_status:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 562
    iget-object v0, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iget-object v0, v0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-interface {v0, v3, p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFSingleTapped(FF)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 564
    iget-object p1, p0, Lcom/radaee/view/PDFView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFView;

    iput v1, p1, Lcom/radaee/view/PDFView;->m_status:I

    return v2

    :cond_0
    return v1
.end method
