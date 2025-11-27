.class public Lcom/flyersoft/views/picview/EclairGestureDetector;
.super Lcom/flyersoft/views/picview/CupcakeGestureDetector;
.source "EclairGestureDetector.java"


# static fields
.field private static final INVALID_POINTER_ID:I = -0x1


# instance fields
.field private mActivePointerId:I

.field private mActivePointerIndex:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 26
    iput p1, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerId:I

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerIndex:I

    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .locals 1

    .line 36
    :try_start_0
    iget v0, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 38
    :catch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    return p1
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .locals 1

    .line 45
    :try_start_0
    iget v0, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 47
    :catch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 53
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_3

    if-eq v0, v3, :cond_2

    const/4 v4, 0x3

    if-eq v0, v4, :cond_2

    const/4 v4, 0x6

    if-eq v0, v4, :cond_0

    goto :goto_1

    .line 66
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/views/picview/Compat;->getPointerIndex(I)I

    move-result v0

    .line 67
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 68
    iget v5, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerId:I

    if-ne v4, v5, :cond_4

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 72
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    iput v4, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerId:I

    .line 73
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    iput v4, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mLastTouchX:F

    .line 74
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mLastTouchY:F

    goto :goto_1

    .line 60
    :cond_2
    iput v1, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerId:I

    goto :goto_1

    .line 56
    :cond_3
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerId:I

    .line 80
    :cond_4
    :goto_1
    iget v0, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerId:I

    if-eq v0, v1, :cond_5

    move v2, v0

    :cond_5
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/picview/EclairGestureDetector;->mActivePointerIndex:I

    .line 83
    :try_start_0
    invoke-super {p0, p1}, Lcom/flyersoft/views/picview/CupcakeGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return v3
.end method
