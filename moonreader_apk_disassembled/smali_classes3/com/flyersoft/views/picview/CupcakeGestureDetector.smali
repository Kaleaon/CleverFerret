.class public Lcom/flyersoft/views/picview/CupcakeGestureDetector;
.super Ljava/lang/Object;
.source "CupcakeGestureDetector.java"

# interfaces
.implements Lcom/flyersoft/views/picview/GestureDetector;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "CupcakeGestureDetector"


# instance fields
.field private mIsDragging:Z

.field mLastTouchX:F

.field mLastTouchY:F

.field protected mListener:Lcom/flyersoft/views/picview/OnGestureListener;

.field final mMinimumVelocity:F

.field final mTouchSlop:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mMinimumVelocity:F

    .line 43
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mTouchSlop:F

    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .locals 0

    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    return p1
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .locals 0

    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    return p1
.end method

.method public isDragging()Z
    .locals 1

    .line 64
    iget-boolean v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mIsDragging:Z

    return v0
.end method

.method public isScaling()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11

    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_6

    const/4 v3, 0x0

    if-eq v0, v2, :cond_4

    const/4 v4, 0x2

    if-eq v0, v4, :cond_1

    const/4 p1, 0x3

    if-eq v0, p1, :cond_0

    goto/16 :goto_1

    .line 109
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_8

    .line 110
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 111
    iput-object v3, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_1

    .line 85
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v0

    .line 86
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v3

    .line 87
    iget v4, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchX:F

    sub-float v4, v0, v4

    iget v5, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchY:F

    sub-float v5, v3, v5

    .line 89
    iget-boolean v6, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mIsDragging:Z

    if-nez v6, :cond_3

    mul-float v6, v4, v4

    mul-float v7, v5, v5

    add-float/2addr v6, v7

    float-to-double v6, v6

    .line 92
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    iget v8, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mTouchSlop:F

    float-to-double v8, v8

    cmpl-double v10, v6, v8

    if-ltz v10, :cond_2

    const/4 v1, 0x1

    :cond_2
    iput-boolean v1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mIsDragging:Z

    .line 95
    :cond_3
    iget-boolean v1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mIsDragging:Z

    if-eqz v1, :cond_8

    .line 96
    iget-object v1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mListener:Lcom/flyersoft/views/picview/OnGestureListener;

    invoke-interface {v1, v4, v5}, Lcom/flyersoft/views/picview/OnGestureListener;->onDrag(FF)V

    .line 97
    iput v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchX:F

    .line 98
    iput v3, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchY:F

    .line 100
    iget-object v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_8

    .line 101
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 117
    :cond_4
    iget-boolean v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mIsDragging:Z

    if-eqz v0, :cond_5

    .line 118
    iget-object v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_5

    .line 119
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchX:F

    .line 120
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchY:F

    .line 123
    iget-object v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 124
    iget-object p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v0, 0x3e8

    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 126
    iget-object p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result p1

    iget-object v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 127
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v0

    .line 131
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget v4, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mMinimumVelocity:F

    cmpl-float v1, v1, v4

    if-ltz v1, :cond_5

    .line 132
    iget-object v1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mListener:Lcom/flyersoft/views/picview/OnGestureListener;

    iget v4, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchX:F

    iget v5, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchY:F

    neg-float p1, p1

    neg-float v0, v0

    invoke-interface {v1, v4, v5, p1, v0}, Lcom/flyersoft/views/picview/OnGestureListener;->onFling(FFFF)V

    .line 139
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_8

    .line 140
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 141
    iput-object v3, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_1

    .line 71
    :cond_6
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_7

    .line 73
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 75
    :cond_7
    new-array v0, v2, [Ljava/lang/Object;

    const-string v3, "Velocity tracker is null"

    aput-object v3, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 78
    :goto_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchX:F

    .line 79
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mLastTouchY:F

    .line 80
    iput-boolean v1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mIsDragging:Z

    :cond_8
    :goto_1
    return v2
.end method

.method public setOnGestureListener(Lcom/flyersoft/views/picview/OnGestureListener;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->mListener:Lcom/flyersoft/views/picview/OnGestureListener;

    return-void
.end method
