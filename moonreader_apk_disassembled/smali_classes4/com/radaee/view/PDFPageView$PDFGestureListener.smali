.class Lcom/radaee/view/PDFPageView$PDFGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PDFPageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFPageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PDFGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/PDFPageView;


# direct methods
.method constructor <init>(Lcom/radaee/view/PDFPageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 368
    iput-object p1, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

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
    .locals 9

    .line 373
    iget-object v0, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {v0}, Lcom/radaee/view/PDFPageView;->access$000(Lcom/radaee/view/PDFPageView;)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 375
    iget-object v0, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {v0}, Lcom/radaee/view/PDFPageView;->access$100(Lcom/radaee/view/PDFPageView;)I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {v0}, Lcom/radaee/view/PDFPageView;->access$100(Lcom/radaee/view/PDFPageView;)I

    move-result v0

    iget-object v2, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {v2}, Lcom/radaee/view/PDFPageView;->access$200(Lcom/radaee/view/PDFPageView;)I

    move-result v2

    iget-object v3, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {v3}, Lcom/radaee/view/PDFPageView;->access$300(Lcom/radaee/view/PDFPageView;)I

    move-result v3

    sub-int/2addr v2, v3

    if-lt v0, v2, :cond_0

    goto :goto_0

    .line 377
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 378
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 379
    iget-object p1, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {p1}, Lcom/radaee/view/PDFPageView;->access$600(Lcom/radaee/view/PDFPageView;)Landroid/widget/Scroller;

    move-result-object v0

    iget-object p1, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {p1}, Lcom/radaee/view/PDFPageView;->access$100(Lcom/radaee/view/PDFPageView;)I

    move-result v1

    iget-object p1, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {p1}, Lcom/radaee/view/PDFPageView;->access$400(Lcom/radaee/view/PDFPageView;)I

    move-result v2

    neg-float p1, p3

    float-to-int v3, p1

    neg-float p1, p4

    float-to-int v4, p1

    iget-object p1, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {p1}, Lcom/radaee/view/PDFPageView;->access$200(Lcom/radaee/view/PDFPageView;)I

    move-result v6

    iget-object p1, p0, Lcom/radaee/view/PDFPageView$PDFGestureListener;->this$0:Lcom/radaee/view/PDFPageView;

    invoke-static {p1}, Lcom/radaee/view/PDFPageView;->access$500(Lcom/radaee/view/PDFPageView;)I

    move-result v8

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    return v1
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
