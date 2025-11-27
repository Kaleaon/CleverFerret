.class Lcom/flyersoft/views/RulerView$3;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->setRulerTouchEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field downX:F

.field downY:F

.field final synthetic this$0:Lcom/flyersoft/views/RulerView;

.field xMoved:F

.field yMoved:F


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RulerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 347
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8

    .line 351
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    .line 352
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    .line 353
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    .line 354
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v1, Lcom/flyersoft/views/RulerView;->rLeft:I

    int-to-float v4, v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v4, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget-object v5, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v5, Lcom/flyersoft/views/RulerView;->width:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    cmpg-float v4, p1, v4

    if-gez v4, :cond_0

    iget-object v4, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v4, Lcom/flyersoft/views/RulerView;->rTop:I

    int-to-float v4, v4

    cmpl-float v4, v0, v4

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v4, Lcom/flyersoft/views/RulerView;->rTop:I

    iget-object v5, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v5, Lcom/flyersoft/views/RulerView;->rHeight:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    cmpg-float v4, v0, v4

    if-gez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    iput-boolean v4, v1, Lcom/flyersoft/views/RulerView;->touchOnRuler:Z

    .line 357
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-boolean v1, v1, Lcom/flyersoft/views/RulerView;->touchOnRuler:Z

    if-nez v1, :cond_2

    return v2

    .line 360
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v1, v1, Lcom/flyersoft/views/RulerView;->rulerGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_3

    return v3

    .line 362
    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v4, 0x0

    if-nez v1, :cond_6

    .line 363
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v1, v1, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_4

    .line 364
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v1, v1, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v1, v3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 365
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v1, Lcom/flyersoft/views/RulerView;->rLeft:I

    iput v5, v1, Lcom/flyersoft/views/RulerView;->downLeftMargin:I

    .line 366
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v1, Lcom/flyersoft/views/RulerView;->rTop:I

    iput v5, v1, Lcom/flyersoft/views/RulerView;->downTopMargin:I

    .line 367
    iput p1, p0, Lcom/flyersoft/views/RulerView$3;->downX:F

    .line 368
    iput v0, p0, Lcom/flyersoft/views/RulerView$3;->downY:F

    .line 369
    iput v4, p0, Lcom/flyersoft/views/RulerView$3;->yMoved:F

    iput v4, p0, Lcom/flyersoft/views/RulerView$3;->xMoved:F

    .line 370
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    sget-boolean v5, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    iput-boolean v5, v1, Lcom/flyersoft/views/RulerView;->disableX:Z

    .line 371
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    sget v5, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    if-nez v5, :cond_5

    const/4 v5, 0x1

    goto :goto_1

    :cond_5
    const/4 v5, 0x0

    :goto_1
    iput-boolean v5, v1, Lcom/flyersoft/views/RulerView;->startAtEdge:Z

    .line 372
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v5, v1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    move-result v5

    iput-boolean v5, v1, Lcom/flyersoft/views/RulerView;->ignoreRulerTap:Z

    .line 374
    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    const/4 v1, 0x2

    if-ne p2, v1, :cond_14

    .line 375
    iget-object p2, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-boolean p2, p2, Lcom/flyersoft/views/RulerView;->disableX:Z

    if-eqz p2, :cond_7

    const/4 p2, 0x0

    goto :goto_2

    :cond_7
    iget p2, p0, Lcom/flyersoft/views/RulerView$3;->downX:F

    sub-float p2, p1, p2

    float-to-int p2, p2

    .line 376
    :goto_2
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 377
    iget v5, p0, Lcom/flyersoft/views/RulerView$3;->downY:F

    sub-float/2addr v0, v5

    float-to-int v0, v0

    .line 378
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v5

    const/high16 v6, 0x43960000    # 300.0f

    if-lez v1, :cond_8

    .line 380
    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    if-lt v1, v7, :cond_9

    :cond_8
    if-lez v5, :cond_14

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    if-ge v5, v6, :cond_14

    .line 381
    :cond_9
    iget-object v6, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-boolean v6, v6, Lcom/flyersoft/views/RulerView;->startAtEdge:Z

    if-eqz v6, :cond_a

    iget v6, p0, Lcom/flyersoft/views/RulerView$3;->xMoved:F

    cmpl-float v6, v6, v4

    if-nez v6, :cond_a

    iget v6, p0, Lcom/flyersoft/views/RulerView$3;->yMoved:F

    cmpl-float v4, v6, v4

    if-nez v4, :cond_a

    if-le v5, v1, :cond_a

    .line 382
    iget-object p2, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iput-boolean v3, p2, Lcom/flyersoft/views/RulerView;->disableX:Z

    const/4 p2, 0x0

    .line 386
    :cond_a
    iget-object v1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v1, v1, Lcom/flyersoft/views/RulerView;->downLeftMargin:I

    add-int/2addr v1, p2

    .line 387
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v4, Lcom/flyersoft/views/RulerView;->downTopMargin:I

    add-int/2addr v4, v0

    .line 388
    iget-object v5, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v5, Lcom/flyersoft/views/RulerView;->EDGE:I

    neg-int v5, v5

    if-le v1, v5, :cond_b

    iget-object v5, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v5, Lcom/flyersoft/views/RulerView;->EDGE:I

    if-ge v1, v5, :cond_b

    const/4 v5, 0x1

    goto :goto_3

    :cond_b
    const/4 v5, 0x0

    :goto_3
    if-eqz v5, :cond_c

    .line 390
    iget v6, p0, Lcom/flyersoft/views/RulerView$3;->xMoved:F

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget-object v7, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v7, v7, Lcom/flyersoft/views/RulerView;->EDGE:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_c

    .line 391
    iget-object v6, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iput-boolean v3, v6, Lcom/flyersoft/views/RulerView;->disableX:Z

    .line 394
    :cond_c
    iget-object v6, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v6, v6, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    if-ge v1, v6, :cond_d

    .line 395
    iget-object v6, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v6, v6, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    goto :goto_4

    :cond_d
    move v6, v1

    .line 396
    :goto_4
    iget-object v7, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v7, v7, Lcom/flyersoft/views/RulerView;->LEFT_MAX:I

    if-le v6, v7, :cond_e

    .line 397
    iget-object v6, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v6, v6, Lcom/flyersoft/views/RulerView;->LEFT_MAX:I

    .line 398
    :cond_e
    iget-object v7, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v7, v7, Lcom/flyersoft/views/RulerView;->TOP_MIN:I

    if-ge v4, v7, :cond_f

    .line 399
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v4, Lcom/flyersoft/views/RulerView;->TOP_MIN:I

    .line 400
    :cond_f
    iget-object v7, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v7, v7, Lcom/flyersoft/views/RulerView;->TOP_MAX:I

    if-le v4, v7, :cond_10

    .line 401
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget v4, v4, Lcom/flyersoft/views/RulerView;->TOP_MAX:I

    :cond_10
    if-eqz v5, :cond_11

    const/4 v6, 0x0

    :cond_11
    if-eq v1, v6, :cond_12

    .line 406
    iput p1, p0, Lcom/flyersoft/views/RulerView$3;->downX:F

    .line 407
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iput v6, p1, Lcom/flyersoft/views/RulerView;->downLeftMargin:I

    .line 410
    :cond_12
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-virtual {p1, v6, v4, v2}, Lcom/flyersoft/views/RulerView;->setRulerPos(IIZ)V

    .line 412
    iget p1, p0, Lcom/flyersoft/views/RulerView$3;->xMoved:F

    int-to-float p2, p2

    add-float/2addr p1, p2

    iput p1, p0, Lcom/flyersoft/views/RulerView$3;->xMoved:F

    .line 413
    iget p2, p0, Lcom/flyersoft/views/RulerView$3;->yMoved:F

    int-to-float v0, v0

    add-float/2addr p2, v0

    iput p2, p0, Lcom/flyersoft/views/RulerView$3;->yMoved:F

    .line 414
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 p2, 0x41200000    # 10.0f

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-gtz p1, :cond_13

    iget p1, p0, Lcom/flyersoft/views/RulerView$3;->yMoved:F

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_14

    .line 415
    :cond_13
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 416
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$3;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    :cond_14
    return v3
.end method
