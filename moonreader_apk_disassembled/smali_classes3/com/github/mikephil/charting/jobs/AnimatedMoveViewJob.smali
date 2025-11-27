.class public Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;
.super Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;
.source "AnimatedMoveViewJob.java"


# static fields
.field private static pool:Lcom/github/mikephil/charting/utils/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/github/mikephil/charting/utils/ObjectPool<",
            "Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 20
    new-instance v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/github/mikephil/charting/utils/ObjectPool;->create(ILcom/github/mikephil/charting/utils/ObjectPool$Poolable;)Lcom/github/mikephil/charting/utils/ObjectPool;

    move-result-object v0

    sput-object v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pool:Lcom/github/mikephil/charting/utils/ObjectPool;

    const/high16 v1, 0x3f000000    # 0.5f

    .line 21
    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ObjectPool;->setReplenishPercentage(F)V

    return-void
.end method

.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V
    .locals 0

    .line 44
    invoke-direct/range {p0 .. p9}, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    return-void
.end method

.method public static getInstance(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;
    .locals 1

    .line 25
    sget-object v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pool:Lcom/github/mikephil/charting/utils/ObjectPool;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ObjectPool;->get()Lcom/github/mikephil/charting/utils/ObjectPool$Poolable;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;

    .line 26
    iput-object p0, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 27
    iput p1, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xValue:F

    .line 28
    iput p2, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yValue:F

    .line 29
    iput-object p3, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    .line 30
    iput-object p4, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->view:Landroid/view/View;

    .line 31
    iput p5, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xOrigin:F

    .line 32
    iput p6, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yOrigin:F

    .line 34
    iget-object p0, v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, p7, p8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    return-object v0
.end method

.method public static recycleInstance(Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;)V
    .locals 1

    .line 39
    sget-object v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pool:Lcom/github/mikephil/charting/utils/ObjectPool;

    invoke-virtual {v0, p0}, Lcom/github/mikephil/charting/utils/ObjectPool;->recycle(Lcom/github/mikephil/charting/utils/ObjectPool$Poolable;)V

    return-void
.end method


# virtual methods
.method protected instantiate()Lcom/github/mikephil/charting/utils/ObjectPool$Poolable;
    .locals 10

    .line 63
    new-instance v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    return-object v0
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 50
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xOrigin:F

    iget v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xValue:F

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->xOrigin:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->phase:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    const/4 v1, 0x0

    aput v0, p1, v1

    .line 51
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yOrigin:F

    iget v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yValue:F

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->yOrigin:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->phase:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    const/4 v1, 0x1

    aput v0, p1, v1

    .line 53
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    invoke-virtual {p1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 54
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->pts:[F

    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->view:Landroid/view/View;

    invoke-virtual {p1, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->centerViewPort([FLandroid/view/View;)V

    return-void
.end method

.method public recycleSelf()V
    .locals 0

    .line 58
    invoke-static {p0}, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;->recycleInstance(Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;)V

    return-void
.end method
