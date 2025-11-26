.class public Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;
.super Lcom/github/mikephil/charting/renderer/BarChartRenderer;
.source "HorizontalBarChartRenderer.java"


# instance fields
.field private mBarShadowRectBuffer:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 52
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    .line 36
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    return-void
.end method


# virtual methods
.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    .line 57
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v3

    .line 59
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderColor()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderWidth()F

    move-result v5

    invoke-static {v5}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 62
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderWidth()F

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 64
    :goto_0
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v5

    .line 65
    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v8

    .line 68
    iget-object v9, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawBarShadowEnabled()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 69
    iget-object v9, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarShadowColor()I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    iget-object v9, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v9

    .line 73
    invoke-virtual {v9}, Lcom/github/mikephil/charting/data/BarData;->getBarWidth()F

    move-result v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    .line 77
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v10

    int-to-float v10, v10

    mul-float v10, v10, v5

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v10, v10

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    const/4 v11, 0x0

    :goto_1
    if-ge v11, v10, :cond_3

    .line 81
    invoke-interface {v1, v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    check-cast v12, Lcom/github/mikephil/charting/data/BarEntry;

    .line 83
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/BarEntry;->getX()F

    move-result v12

    .line 85
    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    sub-float v14, v12, v9

    iput v14, v13, Landroid/graphics/RectF;->top:F

    .line 86
    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    add-float/2addr v12, v9

    iput v12, v13, Landroid/graphics/RectF;->bottom:F

    .line 88
    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    invoke-virtual {v3, v12}, Lcom/github/mikephil/charting/utils/Transformer;->rectValueToPixel(Landroid/graphics/RectF;)V

    .line 90
    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v12, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v12

    if-nez v12, :cond_1

    move-object/from16 v14, p1

    goto :goto_2

    .line 93
    :cond_1
    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->top:F

    invoke-virtual {v12, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v12

    if-nez v12, :cond_2

    goto :goto_3

    .line 96
    :cond_2
    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v13

    iput v13, v12, Landroid/graphics/RectF;->left:F

    .line 97
    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v13

    iput v13, v12, Landroid/graphics/RectF;->right:F

    .line 99
    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarShadowRectBuffer:Landroid/graphics/RectF;

    iget-object v13, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v14, p1

    invoke-virtual {v14, v12, v13}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_3
    :goto_3
    move-object/from16 v14, p1

    .line 104
    iget-object v9, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    aget-object v9, v9, v2

    .line 105
    invoke-virtual {v9, v5, v8}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setPhases(FF)V

    .line 106
    invoke-virtual {v9, v2}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setDataSet(I)V

    .line 107
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v5

    invoke-interface {v2, v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v2

    invoke-virtual {v9, v2}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setInverted(Z)V

    .line 108
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarData;->getBarWidth()F

    move-result v2

    invoke-virtual {v9, v2}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setBarWidth(F)V

    .line 110
    invoke-virtual {v9, v1}, Lcom/github/mikephil/charting/buffer/BarBuffer;->feed(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;)V

    .line 112
    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 114
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColors()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v7, :cond_4

    goto :goto_4

    :cond_4
    const/4 v7, 0x0

    :goto_4
    if-eqz v7, :cond_5

    .line 117
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    :cond_5
    :goto_5
    invoke-virtual {v9}, Lcom/github/mikephil/charting/buffer/BarBuffer;->size()I

    move-result v2

    if-ge v6, v2, :cond_a

    .line 122
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v5, v6, 0x3

    aget v3, v3, v5

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_7

    .line 125
    :cond_6
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v8, v6, 0x1

    aget v3, v3, v8

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v2

    if-nez v2, :cond_7

    goto :goto_6

    :cond_7
    if-nez v7, :cond_8

    .line 131
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v3, v6, 0x4

    invoke-interface {v1, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 134
    :cond_8
    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v15, v2, v6

    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v16, v2, v8

    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v6, 0x2

    aget v17, v2, v3

    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v18, v2, v5

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v2

    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    if-eqz v4, :cond_9

    .line 138
    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v15, v2, v6

    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v16, v2, v8

    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v17, v2, v3

    iget-object v2, v9, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v18, v2, v5

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    move-object/from16 v14, p1

    move-object/from16 v19, v2

    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_9
    :goto_6
    add-int/lit8 v6, v6, 0x4

    move-object/from16 v14, p1

    goto :goto_5

    :cond_a
    :goto_7
    return-void
.end method

.method public drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 398
    iget-object p5, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .locals 32

    move-object/from16 v0, p0

    .line 147
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->isDrawingValuesAllowed(Lcom/github/mikephil/charting/interfaces/dataprovider/ChartInterface;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 149
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/BarData;->getDataSets()Ljava/util/List;

    move-result-object v6

    const/high16 v1, 0x40a00000    # 5.0f

    .line 151
    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v7

    .line 154
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawValueAboveBarEnabled()Z

    move-result v8

    const/4 v10, 0x0

    .line 156
    :goto_0
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v1

    if-ge v10, v1, :cond_2b

    .line 158
    invoke-interface {v6, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 160
    invoke-virtual {v0, v11}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->shouldDrawValues(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)Z

    move-result v1

    if-nez v1, :cond_0

    move-object/from16 v22, v6

    move/from16 v19, v7

    move/from16 v23, v8

    move/from16 v21, v10

    goto/16 :goto_1c

    .line 163
    :cond_0
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v12

    .line 166
    invoke-virtual {v0, v11}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 167
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const-string v2, "10"

    invoke-static {v1, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v1

    int-to-float v1, v1

    const/high16 v13, 0x40000000    # 2.0f

    div-float v14, v1, v13

    .line 169
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v15

    .line 172
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    aget-object v1, v1, v10

    .line 174
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v16

    .line 176
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getIconsOffset()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/MPPointF;->getInstance(Lcom/github/mikephil/charting/utils/MPPointF;)Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v2

    .line 177
    iget v3, v2, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v3

    iput v3, v2, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    .line 178
    iget v3, v2, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v3

    iput v3, v2, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 181
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v3

    const/16 v17, 0x0

    if-nez v3, :cond_c

    const/4 v3, 0x0

    :goto_1
    int-to-float v4, v3

    .line 183
    iget-object v5, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    array-length v5, v5

    int-to-float v5, v5

    iget-object v9, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v9

    mul-float v5, v5, v9

    cmpg-float v4, v4, v5

    if-gez v4, :cond_b

    .line 185
    iget-object v4, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v5, v3, 0x1

    aget v4, v4, v5

    iget-object v9, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v16, v3, 0x3

    aget v9, v9, v16

    add-float/2addr v4, v9

    div-float v9, v4, v13

    .line 187
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/high16 v18, 0x40000000    # 2.0f

    iget-object v13, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v13, v13, v5

    invoke-virtual {v4, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v4

    if-nez v4, :cond_1

    goto/16 :goto_9

    .line 190
    :cond_1
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v13, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v13, v13, v3

    invoke-virtual {v4, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v4

    if-nez v4, :cond_2

    :goto_2
    move/from16 v23, v3

    move-object/from16 v22, v6

    move/from16 v19, v7

    move-object v6, v1

    move-object v7, v2

    goto/16 :goto_8

    .line 193
    :cond_2
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v13, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v5, v13, v5

    invoke-virtual {v4, v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_2

    .line 196
    :cond_3
    div-int/lit8 v4, v3, 0x4

    invoke-interface {v11, v4}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lcom/github/mikephil/charting/data/BarEntry;

    .line 197
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/BarEntry;->getY()F

    move-result v16

    move-object v4, v2

    .line 198
    invoke-virtual {v15, v13}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getBarLabel(Lcom/github/mikephil/charting/data/BarEntry;)Ljava/lang/String;

    move-result-object v2

    .line 201
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-static {v5, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v5

    int-to-float v5, v5

    if-eqz v8, :cond_4

    move v0, v7

    goto :goto_3

    :cond_4
    add-float v0, v5, v7

    neg-float v0, v0

    :goto_3
    move-object/from16 v19, v2

    if-eqz v8, :cond_5

    add-float v2, v5, v7

    neg-float v2, v2

    goto :goto_4

    :cond_5
    move v2, v7

    :goto_4
    if-eqz v12, :cond_6

    neg-float v0, v0

    sub-float/2addr v0, v5

    neg-float v2, v2

    sub-float/2addr v2, v5

    :cond_6
    move/from16 v20, v0

    move/from16 v21, v2

    .line 210
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawValuesEnabled()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 211
    iget-object v0, v1, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v3, 0x2

    aget v0, v0, v2

    cmpl-float v2, v16, v17

    if-ltz v2, :cond_7

    move/from16 v2, v20

    goto :goto_5

    :cond_7
    move/from16 v2, v21

    :goto_5
    add-float/2addr v0, v2

    move-object v2, v4

    add-float v4, v9, v14

    div-int/lit8 v5, v3, 0x2

    .line 215
    invoke-interface {v11, v5}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v5

    move/from16 v22, v7

    move-object v7, v2

    move-object/from16 v2, v19

    move/from16 v19, v22

    move/from16 v23, v3

    move-object/from16 v22, v6

    move v3, v0

    move-object v6, v1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 211
    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    goto :goto_6

    :cond_8
    move-object/from16 v0, p0

    move/from16 v23, v3

    move-object/from16 v22, v6

    move/from16 v19, v7

    move-object v6, v1

    move-object v7, v4

    .line 218
    :goto_6
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/BarEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_a

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawIconsEnabled()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 220
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/BarEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v25

    .line 222
    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v23, 0x2

    aget v1, v1, v3

    cmpl-float v2, v16, v17

    if-ltz v2, :cond_9

    goto :goto_7

    :cond_9
    move/from16 v20, v21

    :goto_7
    add-float v1, v1, v20

    .line 225
    iget v2, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v1, v2

    .line 226
    iget v2, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v9, v2

    float-to-int v1, v1

    float-to-int v2, v9

    .line 233
    invoke-virtual/range {v25 .. v25}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v28

    .line 234
    invoke-virtual/range {v25 .. v25}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v29

    move-object/from16 v24, p1

    move/from16 v26, v1

    move/from16 v27, v2

    .line 228
    invoke-static/range {v24 .. v29}, Lcom/github/mikephil/charting/utils/Utils;->drawImage(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    :cond_a
    :goto_8
    add-int/lit8 v3, v23, 0x4

    move-object v1, v6

    move-object v2, v7

    move/from16 v7, v19

    move-object/from16 v6, v22

    const/high16 v13, 0x40000000    # 2.0f

    goto/16 :goto_1

    :cond_b
    :goto_9
    move-object/from16 v22, v6

    move/from16 v19, v7

    move-object v7, v2

    goto/16 :goto_1b

    :cond_c
    move-object/from16 v22, v6

    move/from16 v19, v7

    const/high16 v18, 0x40000000    # 2.0f

    move-object v6, v1

    move-object v7, v2

    .line 241
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v9

    const/4 v13, 0x0

    const/16 v20, 0x0

    :goto_a
    int-to-float v1, v13

    .line 246
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v3

    mul-float v2, v2, v3

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2a

    .line 248
    invoke-interface {v11, v13}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/BarEntry;

    .line 250
    invoke-interface {v11, v13}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v5

    .line 251
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/BarEntry;->getYVals()[F

    move-result-object v2

    if-nez v2, :cond_17

    .line 258
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v4, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v21, v20, 0x1

    aget v4, v4, v21

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v3

    if-nez v3, :cond_d

    goto/16 :goto_1b

    .line 261
    :cond_d
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v4, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v4, v4, v20

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v3

    if-nez v3, :cond_e

    goto :goto_a

    .line 264
    :cond_e
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v4, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v4, v4, v21

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v3

    if-nez v3, :cond_f

    goto :goto_a

    :cond_f
    move-object v3, v2

    .line 267
    invoke-virtual {v15, v1}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getBarLabel(Lcom/github/mikephil/charting/data/BarEntry;)Ljava/lang/String;

    move-result-object v2

    .line 270
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-static {v4, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v4

    int-to-float v4, v4

    if-eqz v8, :cond_10

    move/from16 v0, v19

    goto :goto_b

    :cond_10
    add-float v0, v4, v19

    neg-float v0, v0

    :goto_b
    move-object/from16 v23, v1

    if-eqz v8, :cond_11

    add-float v1, v4, v19

    neg-float v1, v1

    goto :goto_c

    :cond_11
    move/from16 v1, v19

    :goto_c
    if-eqz v12, :cond_12

    neg-float v0, v0

    sub-float/2addr v0, v4

    neg-float v1, v1

    sub-float/2addr v1, v4

    :cond_12
    move/from16 v24, v0

    move/from16 v25, v1

    .line 279
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawValuesEnabled()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 280
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v1, v20, 0x2

    aget v0, v0, v1

    .line 282
    invoke-virtual/range {v23 .. v23}, Lcom/github/mikephil/charting/data/BarEntry;->getY()F

    move-result v1

    cmpl-float v1, v1, v17

    if-ltz v1, :cond_13

    move/from16 v1, v24

    goto :goto_d

    :cond_13
    move/from16 v1, v25

    :goto_d
    add-float/2addr v0, v1

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v1, v21

    add-float v4, v1, v14

    move-object/from16 v1, p1

    move-object/from16 v26, v23

    move/from16 v23, v8

    move-object v8, v3

    move v3, v0

    move-object/from16 v0, p0

    .line 280
    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    goto :goto_e

    :cond_14
    move-object/from16 v26, v23

    move/from16 v23, v8

    move-object v8, v3

    .line 286
    :goto_e
    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/data/BarEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawIconsEnabled()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 288
    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/data/BarEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 290
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v20, 0x2

    aget v0, v0, v2

    .line 291
    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/data/BarEntry;->getY()F

    move-result v2

    cmpl-float v2, v2, v17

    if-ltz v2, :cond_15

    goto :goto_f

    :cond_15
    move/from16 v24, v25

    :goto_f
    add-float v0, v0, v24

    .line 292
    iget-object v2, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v2, v2, v21

    .line 294
    iget v3, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v0, v3

    .line 295
    iget v3, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v2, v3

    float-to-int v0, v0

    float-to-int v3, v2

    .line 302
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    .line 303
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    move v2, v0

    move/from16 v21, v10

    move-object/from16 v10, p0

    move-object/from16 v0, p1

    .line 297
    invoke-static/range {v0 .. v5}, Lcom/github/mikephil/charting/utils/Utils;->drawImage(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    goto/16 :goto_19

    :cond_16
    move/from16 v21, v10

    move-object/from16 v10, p0

    goto/16 :goto_19

    :cond_17
    move-object/from16 v26, v1

    move/from16 v23, v8

    move/from16 v21, v10

    move-object v10, v0

    move-object v8, v2

    .line 308
    array-length v0, v8

    mul-int/lit8 v0, v0, 0x2

    new-array v1, v0, [F

    .line 311
    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v2

    neg-float v2, v2

    move/from16 v24, v2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/16 v25, 0x0

    :goto_10
    if-ge v2, v0, :cond_1b

    .line 315
    aget v4, v8, v3

    cmpl-float v27, v4, v17

    if-nez v27, :cond_19

    cmpl-float v28, v25, v17

    if-eqz v28, :cond_18

    cmpl-float v28, v24, v17

    if-nez v28, :cond_19

    :cond_18
    move/from16 v31, v24

    move/from16 v24, v4

    move/from16 v4, v31

    goto :goto_11

    :cond_19
    if-ltz v27, :cond_1a

    add-float v25, v25, v4

    move/from16 v4, v24

    move/from16 v24, v25

    goto :goto_11

    :cond_1a
    sub-float v4, v24, v4

    :goto_11
    mul-float v24, v24, v16

    .line 329
    aput v24, v1, v2

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v3, v3, 0x1

    move/from16 v24, v4

    goto :goto_10

    .line 332
    :cond_1b
    invoke-virtual {v9, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    const/4 v2, 0x0

    :goto_12
    if-ge v2, v0, :cond_28

    .line 336
    div-int/lit8 v3, v2, 0x2

    aget v3, v8, v3

    move-object/from16 v4, v26

    move/from16 v26, v2

    .line 337
    invoke-virtual {v15, v3, v4}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getBarStackedLabel(FLcom/github/mikephil/charting/data/BarEntry;)Ljava/lang/String;

    move-result-object v2

    move/from16 v27, v0

    .line 340
    iget-object v0, v10, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-static {v0, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v0

    int-to-float v0, v0

    move/from16 v28, v0

    if-eqz v23, :cond_1c

    move/from16 v0, v19

    goto :goto_13

    :cond_1c
    add-float v0, v28, v19

    neg-float v0, v0

    :goto_13
    move-object/from16 v29, v1

    if-eqz v23, :cond_1d

    add-float v1, v28, v19

    neg-float v1, v1

    goto :goto_14

    :cond_1d
    move/from16 v1, v19

    :goto_14
    if-eqz v12, :cond_1e

    neg-float v0, v0

    sub-float v0, v0, v28

    neg-float v1, v1

    sub-float v1, v1, v28

    :cond_1e
    cmpl-float v28, v3, v17

    if-nez v28, :cond_1f

    cmpl-float v28, v24, v17

    if-nez v28, :cond_1f

    cmpl-float v28, v25, v17

    if-gtz v28, :cond_20

    :cond_1f
    cmpg-float v3, v3, v17

    if-gez v3, :cond_21

    :cond_20
    const/4 v3, 0x1

    goto :goto_15

    :cond_21
    const/4 v3, 0x0

    .line 353
    :goto_15
    aget v28, v29, v26

    if-eqz v3, :cond_22

    move v0, v1

    :cond_22
    add-float v3, v28, v0

    .line 355
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v1, v20, 0x1

    aget v0, v0, v1

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v28, v20, 0x3

    aget v1, v1, v28

    add-float/2addr v0, v1

    div-float v0, v0, v18

    .line 357
    iget-object v1, v10, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v1

    if-nez v1, :cond_23

    goto/16 :goto_19

    .line 360
    :cond_23
    iget-object v1, v10, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v1

    if-nez v1, :cond_24

    :goto_16
    move/from16 v30, v5

    move/from16 v10, v26

    move-object/from16 v26, v4

    goto :goto_18

    .line 363
    :cond_24
    iget-object v1, v10, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v1

    if-nez v1, :cond_25

    goto :goto_16

    .line 366
    :cond_25
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawValuesEnabled()Z

    move-result v1

    if-eqz v1, :cond_26

    move-object v1, v4

    add-float v4, v0, v14

    move/from16 v28, v0

    move-object v0, v10

    move/from16 v10, v26

    move-object/from16 v26, v1

    move-object/from16 v1, p1

    .line 367
    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    goto :goto_17

    :cond_26
    move/from16 v28, v0

    move/from16 v10, v26

    move-object/from16 v26, v4

    :goto_17
    move/from16 v30, v5

    .line 370
    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/data/BarEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_27

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawIconsEnabled()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 372
    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/data/BarEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 374
    iget v0, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v3, v0

    float-to-int v2, v3

    iget v0, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float v0, v28, v0

    float-to-int v3, v0

    .line 379
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    .line 380
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    move-object/from16 v0, p1

    .line 374
    invoke-static/range {v0 .. v5}, Lcom/github/mikephil/charting/utils/Utils;->drawImage(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    :cond_27
    :goto_18
    add-int/lit8 v2, v10, 0x2

    move-object/from16 v10, p0

    move/from16 v0, v27

    move-object/from16 v1, v29

    move/from16 v5, v30

    goto/16 :goto_12

    :cond_28
    :goto_19
    if-nez v8, :cond_29

    add-int/lit8 v20, v20, 0x4

    goto :goto_1a

    .line 385
    :cond_29
    array-length v0, v8

    mul-int/lit8 v0, v0, 0x4

    add-int v20, v20, v0

    :goto_1a
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    move/from16 v10, v21

    move/from16 v8, v23

    goto/16 :goto_a

    :cond_2a
    :goto_1b
    move/from16 v23, v8

    move/from16 v21, v10

    .line 390
    invoke-static {v7}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    :goto_1c
    add-int/lit8 v10, v21, 0x1

    move-object/from16 v0, p0

    move/from16 v7, v19

    move-object/from16 v6, v22

    move/from16 v8, v23

    goto/16 :goto_0

    :cond_2b
    return-void
.end method

.method public initBuffers()V
    .locals 7

    .line 42
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v1

    new-array v1, v1, [Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;

    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    const/4 v1, 0x0

    .line 45
    :goto_0
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 46
    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 47
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    new-instance v4, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v5

    mul-int/lit8 v5, v5, 0x4

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getStackSize()I

    move-result v6

    goto :goto_1

    :cond_0
    const/4 v6, 0x1

    :goto_1
    mul-int v5, v5, v6

    .line 48
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v6

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v2

    invoke-direct {v4, v5, v6, v2}, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;-><init>(IIZ)V

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected isDrawingValuesAllowed(Lcom/github/mikephil/charting/interfaces/dataprovider/ChartInterface;)Z
    .locals 2

    .line 421
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/dataprovider/ChartInterface;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getEntryCount()I

    move-result v0

    int-to-float v0, v0

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/dataprovider/ChartInterface;->getMaxVisibleCount()I

    move-result p1

    int-to-float p1, p1

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 422
    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v1

    mul-float p1, p1, v1

    cmpg-float p1, v0, p1

    if-gez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected prepareBarHighlight(FFFFLcom/github/mikephil/charting/utils/Transformer;)V
    .locals 1

    sub-float v0, p1, p4

    add-float/2addr p1, p4

    .line 409
    iget-object p4, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    invoke-virtual {p4, p2, v0, p3, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 411
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result p2

    invoke-virtual {p5, p1, p2}, Lcom/github/mikephil/charting/utils/Transformer;->rectToPixelPhaseHorizontal(Landroid/graphics/RectF;F)V

    return-void
.end method

.method protected setHighlightDrawPos(Lcom/github/mikephil/charting/highlight/Highlight;Landroid/graphics/RectF;)V
    .locals 1

    .line 416
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    iget p2, p2, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, v0, p2}, Lcom/github/mikephil/charting/highlight/Highlight;->setDraw(FF)V

    return-void
.end method
