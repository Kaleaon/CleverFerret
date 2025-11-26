.class public Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;
.super Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;
.source "AnimatedZoomJob.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# static fields
.field private static pool:Lcom/github/mikephil/charting/utils/ObjectPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/github/mikephil/charting/utils/ObjectPool<",
            "Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mOnAnimationUpdateMatrixBuffer:Landroid/graphics/Matrix;

.field protected xAxisRange:F

.field protected yAxis:Lcom/github/mikephil/charting/components/YAxis;

.field protected zoomCenterX:F

.field protected zoomCenterY:F

.field protected zoomOriginX:F

.field protected zoomOriginY:F


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 24
    new-instance v0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v0 .. v15}, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Landroid/view/View;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis;FFFFFFFFFJ)V

    const/16 v1, 0x8

    invoke-static {v1, v0}, Lcom/github/mikephil/charting/utils/ObjectPool;->create(ILcom/github/mikephil/charting/utils/ObjectPool$Poolable;)Lcom/github/mikephil/charting/utils/ObjectPool;

    move-result-object v0

    sput-object v0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pool:Lcom/github/mikephil/charting/utils/ObjectPool;

    return-void
.end method

.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Landroid/view/View;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis;FFFFFFFFFJ)V
    .locals 10

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    move-object v4, p3

    move/from16 v2, p6

    move/from16 v3, p7

    move/from16 v6, p8

    move/from16 v7, p9

    move-wide/from16 v8, p14

    .line 55
    invoke-direct/range {v0 .. v9}, Lcom/github/mikephil/charting/jobs/AnimatedViewPortJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    .line 66
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mOnAnimationUpdateMatrixBuffer:Landroid/graphics/Matrix;

    move/from16 p1, p10

    .line 57
    iput p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterX:F

    move/from16 p1, p11

    .line 58
    iput p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterY:F

    move/from16 p1, p12

    .line 59
    iput p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginX:F

    move/from16 p1, p13

    .line 60
    iput p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginY:F

    .line 61
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 62
    iput-object p4, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yAxis:Lcom/github/mikephil/charting/components/YAxis;

    .line 63
    iput p5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xAxisRange:F

    return-void
.end method

.method public static getInstance(Lcom/github/mikephil/charting/utils/ViewPortHandler;Landroid/view/View;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis;FFFFFFFFFJ)Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;
    .locals 0

    .line 28
    sget-object p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pool:Lcom/github/mikephil/charting/utils/ObjectPool;

    invoke-virtual {p9}, Lcom/github/mikephil/charting/utils/ObjectPool;->get()Lcom/github/mikephil/charting/utils/ObjectPool$Poolable;

    move-result-object p9

    check-cast p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;

    .line 29
    iput-object p0, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 30
    iput p5, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xValue:F

    .line 31
    iput p6, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yValue:F

    .line 32
    iput-object p2, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    .line 33
    iput-object p1, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    .line 34
    iput p7, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xOrigin:F

    .line 35
    iput p8, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yOrigin:F

    .line 36
    iput-object p3, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yAxis:Lcom/github/mikephil/charting/components/YAxis;

    .line 37
    iput p4, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xAxisRange:F

    .line 38
    invoke-virtual {p9}, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->resetAnimator()V

    .line 39
    iget-object p0, p9, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, p13, p14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    return-object p9
.end method


# virtual methods
.method protected instantiate()Lcom/github/mikephil/charting/utils/ObjectPool$Poolable;
    .locals 16

    .line 117
    new-instance v0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v0 .. v15}, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Landroid/view/View;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis;FFFFFFFFFJ)V

    return-object v0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 91
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    check-cast p1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 92
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 7

    .line 70
    iget p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xOrigin:F

    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xValue:F

    iget v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xOrigin:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float v0, v0, v1

    add-float/2addr p1, v0

    .line 71
    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yOrigin:F

    iget v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yValue:F

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yOrigin:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    .line 73
    iget-object v1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mOnAnimationUpdateMatrixBuffer:Landroid/graphics/Matrix;

    .line 74
    iget-object v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2, p1, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setZoom(FFLandroid/graphics/Matrix;)V

    .line 75
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 77
    iget-object p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->yAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget p1, p1, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v0

    div-float/2addr p1, v0

    .line 78
    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->xAxisRange:F

    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v3

    div-float/2addr v0, v3

    .line 80
    iget-object v3, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    iget v4, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginX:F

    iget v5, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterX:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v0, v6

    sub-float/2addr v5, v0

    sub-float/2addr v5, v4

    iget v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float v5, v5, v0

    add-float/2addr v4, v5

    aput v4, v3, v2

    .line 81
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    iget v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomOriginY:F

    iget v3, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->zoomCenterY:F

    div-float/2addr p1, v6

    add-float/2addr v3, p1

    sub-float/2addr v3, v2

    iget p1, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->phase:F

    mul-float v3, v3, p1

    add-float/2addr v2, v3

    const/4 p1, 0x1

    aput v2, v0, p1

    .line 83
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 85
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->pts:[F

    invoke-virtual {v0, v2, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->translate([FLandroid/graphics/Matrix;)V

    .line 86
    iget-object v0, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;->view:Landroid/view/View;

    invoke-virtual {v0, v1, v2, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    return-void
.end method

.method public recycleSelf()V
    .locals 0

    return-void
.end method
