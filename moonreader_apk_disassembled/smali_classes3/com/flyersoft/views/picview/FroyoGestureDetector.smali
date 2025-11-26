.class public Lcom/flyersoft/views/picview/FroyoGestureDetector;
.super Lcom/flyersoft/views/picview/EclairGestureDetector;
.source "FroyoGestureDetector.java"


# instance fields
.field protected final mDetector:Landroid/view/ScaleGestureDetector;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 29
    invoke-direct {p0, p1}, Lcom/flyersoft/views/picview/EclairGestureDetector;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance v0, Lcom/flyersoft/views/picview/FroyoGestureDetector$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/picview/FroyoGestureDetector$1;-><init>(Lcom/flyersoft/views/picview/FroyoGestureDetector;)V

    .line 54
    new-instance v1, Landroid/view/ScaleGestureDetector;

    invoke-direct {v1, p1, v0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v1, p0, Lcom/flyersoft/views/picview/FroyoGestureDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    return-void
.end method


# virtual methods
.method public isScaling()Z
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/flyersoft/views/picview/FroyoGestureDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 65
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/picview/FroyoGestureDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 66
    invoke-super {p0, p1}, Lcom/flyersoft/views/picview/EclairGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    const/4 p1, 0x1

    return p1
.end method
