.class public Lcom/github/mikephil/charting/renderer/PieChartRenderer;
.super Lcom/github/mikephil/charting/renderer/DataRenderer;
.source "PieChartRenderer.java"


# instance fields
.field protected mBitmapCanvas:Landroid/graphics/Canvas;

.field private mCenterTextLastBounds:Landroid/graphics/RectF;

.field private mCenterTextLastValue:Ljava/lang/CharSequence;

.field private mCenterTextLayout:Landroid/text/StaticLayout;

.field private mCenterTextPaint:Landroid/text/TextPaint;

.field protected mChart:Lcom/github/mikephil/charting/charts/PieChart;

.field protected mDrawBitmap:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field protected mDrawCenterTextPathBuffer:Landroid/graphics/Path;

.field protected mDrawHighlightedRectF:Landroid/graphics/RectF;

.field private mEntryLabelsPaint:Landroid/graphics/Paint;

.field private mHoleCirclePath:Landroid/graphics/Path;

.field protected mHolePaint:Landroid/graphics/Paint;

.field private mInnerRectBuffer:Landroid/graphics/RectF;

.field private mPathBuffer:Landroid/graphics/Path;

.field private mRectBuffer:[Landroid/graphics/RectF;

.field protected mTransparentCirclePaint:Landroid/graphics/Paint;

.field protected mValueLinePaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/charts/PieChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .locals 3

    .line 72
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/DataRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 60
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    .line 61
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    const/4 v1, 0x3

    new-array v1, v1, [Landroid/graphics/RectF;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p3, 0x2

    aput-object v0, v1, p3

    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRectBuffer:[Landroid/graphics/RectF;

    .line 153
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    .line 154
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    .line 673
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    .line 716
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawCenterTextPathBuffer:Landroid/graphics/Path;

    .line 789
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawHighlightedRectF:Landroid/graphics/RectF;

    .line 73
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 75
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    const/4 p3, -0x1

    .line 76
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    .line 80
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 81
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 82
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    const/16 v0, 0x69

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 84
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    const/high16 v0, -0x1000000

    .line 85
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 86
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 88
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const/high16 v0, 0x41500000    # 13.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 89
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 92
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    .line 93
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 94
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    sget-object p3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 95
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result p3

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 97
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    .line 98
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method protected calculateMinimumRadiusForSpacedSlice(Lcom/github/mikephil/charting/utils/MPPointF;FFFFFF)F
    .locals 15

    move-object/from16 v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, p7, v1

    add-float v2, p6, v2

    .line 167
    iget v3, v0, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float v4, p6, p7

    const v5, 0x3c8efa35

    mul-float v4, v4, v5

    float-to-double v6, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    double-to-float v4, v8

    mul-float v4, v4, p2

    add-float/2addr v3, v4

    .line 168
    iget v4, v0, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float v6, v6, p2

    add-float/2addr v4, v6

    .line 171
    iget v6, v0, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v2, v2, v5

    float-to-double v7, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    double-to-float v2, v9

    mul-float v2, v2, p2

    add-float/2addr v6, v2

    .line 172
    iget v0, v0, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    double-to-float v2, v7

    mul-float v2, v2, p2

    add-float/2addr v0, v2

    sub-float v2, v3, p4

    float-to-double v7, v2

    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 176
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    sub-float v2, v4, p5

    float-to-double v11, v2

    .line 177
    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    add-double/2addr v7, v11

    .line 175
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    div-double/2addr v7, v9

    const-wide v11, 0x4066800000000000L    # 180.0

    move/from16 v2, p3

    float-to-double v13, v2

    sub-double/2addr v11, v13

    div-double/2addr v11, v9

    const-wide v13, 0x3f91df46a2529d39L    # 0.017453292519943295

    mul-double v11, v11, v13

    .line 183
    invoke-static {v11, v12}, Ljava/lang/Math;->tan(D)D

    move-result-wide v11

    mul-double v7, v7, v11

    double-to-float v2, v7

    sub-float v2, p2, v2

    float-to-double v7, v2

    add-float v3, v3, p4

    div-float/2addr v3, v1

    sub-float/2addr v6, v3

    float-to-double v2, v6

    .line 190
    invoke-static {v2, v3, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-float v4, v4, p5

    div-float/2addr v4, v1

    sub-float/2addr v0, v4

    float-to-double v0, v0

    .line 191
    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    add-double/2addr v2, v0

    .line 189
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    sub-double/2addr v7, v0

    double-to-float v0, v7

    return v0
.end method

.method protected drawCenterText(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 723
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterText()Ljava/lang/CharSequence;

    move-result-object v4

    .line 725
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawCenterTextEnabled()Z

    move-result v2

    if-eqz v2, :cond_4

    if-eqz v4, :cond_4

    .line 727
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v2

    .line 728
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterTextOffset()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v13

    .line 730
    iget v3, v2, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v5, v13, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v3, v5

    .line 731
    iget v5, v2, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    iget v6, v13, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v5, v6

    .line 733
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v6

    const/high16 v7, 0x42c80000    # 100.0f

    if-eqz v6, :cond_0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 734
    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v6

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v8

    div-float/2addr v8, v7

    mul-float v6, v6, v8

    goto :goto_0

    :cond_0
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 735
    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v6

    .line 737
    :goto_0
    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRectBuffer:[Landroid/graphics/RectF;

    const/4 v9, 0x0

    aget-object v14, v8, v9

    sub-float v8, v3, v6

    .line 738
    iput v8, v14, Landroid/graphics/RectF;->left:F

    sub-float v8, v5, v6

    .line 739
    iput v8, v14, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v6

    .line 740
    iput v3, v14, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v6

    .line 741
    iput v5, v14, Landroid/graphics/RectF;->bottom:F

    .line 742
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRectBuffer:[Landroid/graphics/RectF;

    const/4 v5, 0x1

    aget-object v15, v3, v5

    .line 743
    invoke-virtual {v15, v14}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 745
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterTextRadiusPercent()F

    move-result v3

    div-float/2addr v3, v7

    float-to-double v5, v3

    const-wide/16 v7, 0x0

    const/high16 v16, 0x40000000    # 2.0f

    cmpl-double v9, v5, v7

    if-lez v9, :cond_1

    .line 748
    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    move-result v5

    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    move-result v6

    mul-float v6, v6, v3

    sub-float/2addr v5, v6

    div-float v5, v5, v16

    .line 749
    invoke-virtual {v15}, Landroid/graphics/RectF;->height()F

    move-result v6

    invoke-virtual {v15}, Landroid/graphics/RectF;->height()F

    move-result v7

    mul-float v7, v7, v3

    sub-float/2addr v6, v7

    div-float v6, v6, v16

    .line 747
    invoke-virtual {v15, v5, v6}, Landroid/graphics/RectF;->inset(FF)V

    .line 753
    :cond_1
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastValue:Ljava/lang/CharSequence;

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    invoke-virtual {v15, v3}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 756
    :cond_2
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v15}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 757
    iput-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastValue:Ljava/lang/CharSequence;

    .line 759
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    .line 762
    new-instance v5, Landroid/text/StaticLayout;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v6

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    float-to-double v8, v3

    .line 764
    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v8

    double-to-int v8, v8

    sget-object v9, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v3, v5

    const/4 v5, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct/range {v3 .. v12}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLayout:Landroid/text/StaticLayout;

    .line 769
    :cond_3
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLayout:Landroid/text/StaticLayout;

    invoke-virtual {v3}, Landroid/text/StaticLayout;->getHeight()I

    move-result v3

    int-to-float v3, v3

    .line 771
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 773
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawCenterTextPathBuffer:Landroid/graphics/Path;

    .line 774
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 775
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v4, v14, v5}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 776
    invoke-virtual {v1, v4}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 779
    iget v4, v15, Landroid/graphics/RectF;->left:F

    iget v5, v15, Landroid/graphics/RectF;->top:F

    invoke-virtual {v15}, Landroid/graphics/RectF;->height()F

    move-result v6

    sub-float/2addr v6, v3

    div-float v6, v6, v16

    add-float/2addr v5, v6

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 780
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLayout:Landroid/text/StaticLayout;

    invoke-virtual {v3, v1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 782
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 784
    invoke-static {v2}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    .line 785
    invoke-static {v13}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    :cond_4
    return-void
.end method

.method public drawData(Landroid/graphics/Canvas;)V
    .locals 4

    .line 125
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v0

    float-to-int v0, v0

    .line 126
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v1

    float-to-int v1, v1

    .line 128
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    :goto_0
    if-eqz v2, :cond_1

    .line 131
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    if-ne v3, v0, :cond_1

    .line 132
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-eq v3, v1, :cond_2

    :cond_1
    if-lez v0, :cond_4

    if-lez v1, :cond_4

    .line 135
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 136
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    .line 137
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    :cond_2
    const/4 v0, 0x0

    .line 142
    invoke-virtual {v2, v0}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 144
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/PieData;

    .line 146
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/PieData;->getDataSets()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .line 148
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v2

    if-lez v2, :cond_3

    .line 149
    invoke-virtual {p0, p1, v1}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)V

    goto :goto_1

    :cond_4
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)V
    .locals 35

    move-object/from16 v0, p0

    move-object/from16 v8, p2

    .line 218
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v9

    .line 220
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v10

    .line 221
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    .line 223
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getCircleBox()Landroid/graphics/RectF;

    move-result-object v12

    .line 225
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v13

    .line 226
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v14

    .line 227
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v1

    .line 228
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v2

    .line 229
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v3

    if-nez v3, :cond_0

    const/16 v16, 0x1

    goto :goto_0

    :cond_0
    const/16 v16, 0x0

    :goto_0
    const/high16 v3, 0x42c80000    # 100.0f

    const/16 v17, 0x0

    if-eqz v16, :cond_1

    .line 230
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 231
    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v5

    div-float/2addr v5, v3

    mul-float v5, v5, v2

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    .line 233
    :goto_1
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v6

    mul-float v6, v6, v2

    div-float/2addr v6, v3

    sub-float v3, v2, v6

    const/high16 v18, 0x40000000    # 2.0f

    div-float v19, v3, v18

    .line 234
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    if-eqz v16, :cond_2

    .line 235
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawRoundedSlicesEnabled()Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v20, 0x1

    goto :goto_2

    :cond_2
    const/16 v20, 0x0

    :goto_2
    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_3
    if-ge v6, v13, :cond_4

    .line 240
    invoke-interface {v8, v6}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v21

    check-cast v21, Lcom/github/mikephil/charting/data/PieEntry;

    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/data/PieEntry;->getY()F

    move-result v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->abs(F)F

    move-result v21

    sget v22, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpl-float v21, v21, v22

    if-lez v21, :cond_3

    add-int/lit8 v7, v7, 0x1

    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    :cond_4
    if-gt v7, v4, :cond_5

    const/16 v21, 0x0

    goto :goto_4

    .line 245
    :cond_5
    invoke-virtual {v0, v8}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getSliceSpace(Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)F

    move-result v6

    move/from16 v21, v6

    :goto_4
    const/4 v6, 0x0

    const/16 v22, 0x0

    :goto_5
    if-ge v6, v13, :cond_19

    .line 249
    aget v23, v14, v6

    .line 252
    invoke-interface {v8, v6}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v24

    .line 255
    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/data/Entry;->getY()F

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Math;->abs(F)F

    move-result v24

    sget v25, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpl-float v24, v24, v25

    if-gtz v24, :cond_6

    :goto_6
    mul-float v23, v23, v10

    add-float v22, v22, v23

    move-object v15, v3

    move/from16 v25, v5

    move/from16 v31, v6

    move/from16 v26, v9

    move/from16 v28, v10

    move/from16 v29, v11

    move v9, v7

    goto/16 :goto_11

    .line 261
    :cond_6
    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15, v6}, Lcom/github/mikephil/charting/charts/PieChart;->needsHighlight(I)Z

    move-result v15

    if-eqz v15, :cond_7

    if-nez v20, :cond_7

    goto :goto_6

    :cond_7
    const/high16 v15, 0x43340000    # 180.0f

    cmpl-float v24, v21, v17

    if-lez v24, :cond_8

    cmpg-float v24, v23, v15

    if-gtz v24, :cond_8

    const/16 v24, 0x1

    goto :goto_7

    :cond_8
    const/16 v24, 0x0

    :goto_7
    const/high16 v25, 0x43340000    # 180.0f

    .line 268
    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {v8, v6}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v4

    invoke-virtual {v15, v4}, Landroid/graphics/Paint;->setColor(I)V

    const v15, 0x3c8efa35

    const/4 v4, 0x1

    if-ne v7, v4, :cond_9

    const/16 v26, 0x0

    goto :goto_8

    :cond_9
    mul-float v26, v2, v15

    div-float v26, v21, v26

    :goto_8
    div-float v27, v26, v18

    add-float v27, v22, v27

    mul-float v27, v27, v11

    add-float v4, v9, v27

    sub-float v26, v23, v26

    mul-float v26, v26, v11

    cmpg-float v27, v26, v17

    if-gez v27, :cond_a

    const/4 v15, 0x0

    move/from16 v26, v5

    const v27, 0x3c8efa35

    goto :goto_9

    :cond_a
    move/from16 v15, v26

    const v27, 0x3c8efa35

    move/from16 v26, v5

    .line 279
    :goto_9
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    if-eqz v20, :cond_b

    .line 282
    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    sub-float v29, v2, v19

    move/from16 v30, v5

    mul-float v5, v4, v27

    move/from16 v31, v6

    float-to-double v5, v5

    move-wide/from16 v32, v5

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v5, v5, v29

    add-float v5, v30, v5

    .line 283
    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    move/from16 v30, v5

    move/from16 v34, v6

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v29, v29, v5

    add-float v6, v34, v29

    sub-float v5, v30, v19

    move/from16 v29, v6

    sub-float v6, v29, v19

    move/from16 v32, v7

    add-float v7, v30, v19

    add-float v8, v29, v19

    .line 284
    invoke-virtual {v3, v5, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_a

    :cond_b
    move/from16 v31, v6

    move/from16 v32, v7

    .line 287
    :goto_a
    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v6, v4, v27

    float-to-double v6, v6

    move v8, v5

    move-wide/from16 v29, v6

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v5, v5, v2

    add-float/2addr v5, v8

    .line 288
    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v7, v7, v2

    add-float/2addr v6, v7

    const/high16 v8, 0x43b40000    # 360.0f

    cmpl-float v29, v15, v8

    if-ltz v29, :cond_c

    rem-float v7, v15, v8

    .line 290
    sget v30, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpg-float v7, v7, v30

    if-gtz v7, :cond_c

    .line 292
    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    const/high16 v30, 0x43b40000    # 360.0f

    iget v8, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    move/from16 v33, v5

    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    move/from16 v34, v6

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v7, v8, v5, v2, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    goto :goto_b

    :cond_c
    move/from16 v33, v5

    move/from16 v34, v6

    const/high16 v30, 0x43b40000    # 360.0f

    if-eqz v20, :cond_d

    .line 296
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    add-float v6, v4, v25

    const/high16 v7, -0x3ccc0000    # -180.0f

    invoke-virtual {v5, v3, v6, v7}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 299
    :cond_d
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v5, v12, v4, v15}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 307
    :goto_b
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    sub-float v6, v6, v26

    iget v7, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    sub-float v7, v7, v26

    iget v8, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float v8, v8, v26

    iget v0, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float v0, v0, v26

    invoke-virtual {v5, v6, v7, v8, v0}, Landroid/graphics/RectF;->set(FFFF)V

    if-eqz v16, :cond_16

    cmpl-float v0, v26, v17

    if-gtz v0, :cond_e

    if-eqz v24, :cond_16

    :cond_e
    if-eqz v24, :cond_10

    move-object v0, v3

    mul-float v3, v23, v11

    move v6, v4

    move/from16 v28, v10

    move v7, v15

    move/from16 v8, v26

    move/from16 v4, v33

    move/from16 v5, v34

    const/4 v10, 0x1

    move-object v15, v0

    move/from16 v26, v9

    move/from16 v9, v32

    move-object/from16 v0, p0

    .line 317
    invoke-virtual/range {v0 .. v7}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->calculateMinimumRadiusForSpacedSlice(Lcom/github/mikephil/charting/utils/MPPointF;FFFFFF)F

    move-result v3

    cmpg-float v4, v3, v17

    if-gez v4, :cond_f

    neg-float v3, v3

    .line 327
    :cond_f
    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v5

    goto :goto_c

    :cond_10
    move-object/from16 v0, p0

    move/from16 v28, v10

    move v7, v15

    move/from16 v8, v26

    const/4 v10, 0x1

    move-object v15, v3

    move/from16 v26, v9

    move/from16 v9, v32

    move v5, v8

    :goto_c
    if-eq v9, v10, :cond_12

    cmpl-float v3, v5, v17

    if-nez v3, :cond_11

    goto :goto_d

    :cond_11
    mul-float v3, v5, v27

    div-float v3, v21, v3

    goto :goto_e

    :cond_12
    :goto_d
    const/4 v3, 0x0

    :goto_e
    div-float v4, v3, v18

    add-float v4, v22, v4

    mul-float v4, v4, v11

    add-float v4, v26, v4

    sub-float v3, v23, v3

    mul-float v3, v3, v11

    cmpg-float v6, v3, v17

    if-gez v6, :cond_13

    const/4 v3, 0x0

    :cond_13
    add-float/2addr v4, v3

    if-ltz v29, :cond_14

    rem-float v6, v7, v30

    .line 340
    sget v7, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_14

    .line 342
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v4, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    sget-object v7, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v4, v6, v5, v7}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    move/from16 v25, v8

    move/from16 v29, v11

    goto/16 :goto_10

    :cond_14
    if-eqz v20, :cond_15

    .line 346
    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    sub-float v6, v2, v19

    mul-float v7, v4, v27

    move/from16 v29, v11

    float-to-double v10, v7

    move v7, v5

    move/from16 v24, v6

    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v6, v24, v5

    add-float v5, v7, v6

    .line 347
    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    double-to-float v7, v10

    mul-float v7, v7, v24

    add-float/2addr v6, v7

    sub-float v7, v5, v19

    sub-float v10, v6, v19

    add-float v5, v5, v19

    add-float v6, v6, v19

    .line 348
    invoke-virtual {v15, v7, v10, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 349
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    const/high16 v6, 0x43340000    # 180.0f

    invoke-virtual {v5, v15, v4, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    move/from16 v25, v8

    goto :goto_f

    :cond_15
    move/from16 v29, v11

    .line 351
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v7, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v10, v4, v27

    float-to-double v10, v10

    move/from16 v24, v7

    move/from16 v25, v8

    .line 352
    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v7, v7, v5

    add-float v7, v24, v7

    iget v8, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 353
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    double-to-float v10, v10

    mul-float v5, v5, v10

    add-float/2addr v8, v5

    .line 351
    invoke-virtual {v6, v7, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 355
    :goto_f
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    neg-float v3, v3

    invoke-virtual {v5, v6, v4, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto :goto_10

    :cond_16
    move-object/from16 v0, p0

    move v6, v4

    move/from16 v28, v10

    move/from16 v29, v11

    move v7, v15

    move/from16 v25, v26

    move/from16 v4, v33

    move/from16 v5, v34

    move-object v15, v3

    move/from16 v26, v9

    move/from16 v9, v32

    rem-float v3, v7, v30

    .line 363
    sget v8, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpl-float v3, v3, v8

    if-lez v3, :cond_18

    if-eqz v24, :cond_17

    div-float v3, v7, v18

    add-float v8, v6, v3

    mul-float v3, v23, v29

    .line 369
    invoke-virtual/range {v0 .. v7}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->calculateMinimumRadiusForSpacedSlice(Lcom/github/mikephil/charting/utils/MPPointF;FFFFFF)F

    move-result v3

    .line 378
    iget v4, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v8, v8, v27

    float-to-double v5, v8

    .line 379
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v7, v7, v3

    add-float/2addr v4, v7

    .line 380
    iget v7, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 381
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v3, v3, v5

    add-float/2addr v7, v3

    .line 383
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3, v4, v7}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_10

    .line 388
    :cond_17
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v4, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 396
    :cond_18
    :goto_10
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 398
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    mul-float v23, v23, v28

    add-float v22, v22, v23

    :goto_11
    add-int/lit8 v6, v31, 0x1

    move-object/from16 v8, p2

    move v7, v9

    move-object v3, v15

    move/from16 v5, v25

    move/from16 v9, v26

    move/from16 v10, v28

    move/from16 v11, v29

    const/4 v4, 0x1

    goto/16 :goto_5

    .line 403
    :cond_19
    invoke-static {v1}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    return-void
.end method

.method protected drawEntryLabel(Landroid/graphics/Canvas;Ljava/lang/String;FF)V
    .locals 1

    .line 663
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .locals 3

    .line 668
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawHole(Landroid/graphics/Canvas;)V

    .line 669
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 670
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawCenterText(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .locals 34

    move-object/from16 v0, p0

    move-object/from16 v8, p2

    .line 798
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v11, 0x1

    goto :goto_0

    :cond_0
    const/4 v11, 0x0

    :goto_0
    if-eqz v11, :cond_1

    .line 799
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawRoundedSlicesEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 802
    :cond_1
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v12

    .line 803
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v13

    .line 806
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v14

    .line 808
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v15

    .line 809
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getAbsoluteAngles()[F

    move-result-object v16

    .line 810
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v1

    .line 811
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v2

    const/4 v3, 0x0

    if-eqz v11, :cond_2

    .line 812
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 813
    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v4

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    mul-float v4, v4, v2

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    .line 816
    :goto_1
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawHighlightedRectF:Landroid/graphics/RectF;

    .line 817
    invoke-virtual {v5, v3, v3, v3, v3}, Landroid/graphics/RectF;->set(FFFF)V

    const/4 v6, 0x0

    .line 819
    :goto_2
    array-length v7, v8

    if-ge v6, v7, :cond_1b

    .line 822
    aget-object v7, v8, v6

    invoke-virtual {v7}, Lcom/github/mikephil/charting/highlight/Highlight;->getX()F

    move-result v7

    float-to-int v7, v7

    const/16 p1, 0x0

    .line 824
    array-length v3, v15

    if-lt v7, v3, :cond_3

    goto/16 :goto_10

    .line 827
    :cond_3
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/PieData;

    aget-object v17, v8, v6

    .line 829
    invoke-virtual/range {v17 .. v17}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v9

    .line 828
    invoke-virtual {v3, v9}, Lcom/github/mikephil/charting/data/PieData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    move-result-object v3

    if-eqz v3, :cond_1a

    .line 831
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isHighlightEnabled()Z

    move-result v9

    if-nez v9, :cond_4

    goto/16 :goto_10

    .line 834
    :cond_4
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v9

    const/4 v8, 0x0

    const/4 v10, 0x0

    :goto_3
    if-ge v10, v9, :cond_6

    .line 838
    invoke-interface {v3, v10}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v18

    check-cast v18, Lcom/github/mikephil/charting/data/PieEntry;

    invoke-virtual/range {v18 .. v18}, Lcom/github/mikephil/charting/data/PieEntry;->getY()F

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Math;->abs(F)F

    move-result v18

    sget v19, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpl-float v18, v18, v19

    if-lez v18, :cond_5

    add-int/lit8 v8, v8, 0x1

    :cond_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_6
    if-nez v7, :cond_7

    const/4 v9, 0x0

    goto :goto_4

    :cond_7
    add-int/lit8 v9, v7, -0x1

    .line 846
    aget v9, v16, v9

    mul-float v9, v9, v12

    :goto_4
    const/4 v10, 0x1

    if-gt v8, v10, :cond_8

    const/4 v10, 0x0

    goto :goto_5

    .line 848
    :cond_8
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result v10

    .line 850
    :goto_5
    aget v18, v15, v7

    move/from16 v19, v2

    .line 853
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSelectionShift()F

    move-result v2

    move/from16 v20, v4

    add-float v4, v19, v2

    move/from16 v21, v6

    .line 855
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->getCircleBox()Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    neg-float v2, v2

    .line 856
    invoke-virtual {v5, v2, v2}, Landroid/graphics/RectF;->inset(FF)V

    cmpl-float v2, v10, p1

    if-lez v2, :cond_9

    const/high16 v2, 0x43340000    # 180.0f

    cmpg-float v2, v18, v2

    if-gtz v2, :cond_9

    const/16 v22, 0x1

    goto :goto_6

    :cond_9
    const/16 v22, 0x0

    .line 860
    :goto_6
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {v3, v7}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    const v23, 0x3c8efa35

    const/4 v2, 0x1

    if-ne v8, v2, :cond_a

    const/4 v3, 0x0

    goto :goto_7

    :cond_a
    mul-float v3, v19, v23

    div-float v3, v10, v3

    :goto_7
    if-ne v8, v2, :cond_b

    const/4 v2, 0x0

    goto :goto_8

    :cond_b
    mul-float v2, v4, v23

    div-float v2, v10, v2

    :goto_8
    const/high16 v24, 0x40000000    # 2.0f

    div-float v6, v3, v24

    add-float/2addr v6, v9

    mul-float v6, v6, v13

    add-float/2addr v6, v14

    sub-float v3, v18, v3

    mul-float v3, v3, v13

    cmpg-float v7, v3, p1

    if-gez v7, :cond_c

    const/4 v7, 0x0

    goto :goto_9

    :cond_c
    move v7, v3

    :goto_9
    div-float v3, v2, v24

    add-float/2addr v3, v9

    mul-float v3, v3, v13

    add-float/2addr v3, v14

    sub-float v2, v18, v2

    mul-float v2, v2, v13

    cmpg-float v25, v2, p1

    if-gez v25, :cond_d

    const/4 v2, 0x0

    :cond_d
    move/from16 v25, v6

    .line 882
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v6}, Landroid/graphics/Path;->reset()V

    const/high16 v26, 0x43b40000    # 360.0f

    cmpl-float v27, v7, v26

    if-ltz v27, :cond_e

    rem-float v6, v7, v26

    .line 884
    sget v28, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpg-float v6, v6, v28

    if-gtz v6, :cond_e

    .line 886
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v3, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    move/from16 v28, v7

    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v3, v6, v4, v7}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    move/from16 v30, v9

    move/from16 v31, v10

    goto :goto_a

    :cond_e
    move/from16 v28, v7

    .line 889
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v7, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    move/from16 v29, v4

    mul-float v4, v3, v23

    move/from16 v30, v9

    move/from16 v31, v10

    float-to-double v9, v4

    move-wide/from16 v32, v9

    .line 890
    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    double-to-float v4, v9

    mul-float v4, v4, v29

    add-float/2addr v7, v4

    iget v4, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 891
    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    double-to-float v9, v9

    mul-float v9, v9, v29

    add-float/2addr v4, v9

    .line 889
    invoke-virtual {v6, v7, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 893
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v4, v5, v3, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    :goto_a
    if-eqz v22, :cond_f

    mul-float v3, v18, v13

    .line 902
    iget v2, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v6, v25, v23

    float-to-double v6, v6

    .line 906
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    double-to-float v4, v9

    mul-float v4, v4, v19

    add-float/2addr v4, v2

    iget v2, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 907
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float v6, v6, v19

    add-float/2addr v2, v6

    move-object v6, v5

    move v5, v2

    move/from16 v2, v19

    move-object/from16 v19, v6

    move/from16 v10, v20

    move/from16 v6, v25

    move/from16 v7, v28

    const/4 v9, 0x0

    .line 903
    invoke-virtual/range {v0 .. v7}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->calculateMinimumRadiusForSpacedSlice(Lcom/github/mikephil/charting/utils/MPPointF;FFFFFF)F

    move-result v3

    goto :goto_b

    :cond_f
    move/from16 v2, v19

    move/from16 v10, v20

    move/from16 v6, v25

    const/4 v9, 0x0

    move-object/from16 v19, v5

    const/4 v3, 0x0

    .line 913
    :goto_b
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    sub-float/2addr v5, v10

    iget v7, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    sub-float/2addr v7, v10

    const/16 p1, 0x0

    iget v9, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v9, v10

    move/from16 v20, v2

    iget v2, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v2, v10

    invoke-virtual {v4, v5, v7, v9, v2}, Landroid/graphics/RectF;->set(FFFF)V

    if-eqz v11, :cond_17

    cmpl-float v2, v10, p1

    if-gtz v2, :cond_10

    if-eqz v22, :cond_17

    :cond_10
    if-eqz v22, :cond_12

    cmpg-float v2, v3, p1

    if-gez v2, :cond_11

    neg-float v3, v3

    .line 928
    :cond_11
    invoke-static {v10, v3}, Ljava/lang/Math;->max(FF)F

    move-result v4

    goto :goto_c

    :cond_12
    move v4, v10

    :goto_c
    const/4 v2, 0x1

    if-eq v8, v2, :cond_14

    cmpl-float v3, v4, p1

    if-nez v3, :cond_13

    goto :goto_d

    :cond_13
    mul-float v3, v4, v23

    div-float v3, v31, v3

    goto :goto_e

    :cond_14
    :goto_d
    const/4 v3, 0x0

    :goto_e
    div-float v5, v3, v24

    add-float v9, v30, v5

    mul-float v9, v9, v13

    add-float/2addr v9, v14

    sub-float v18, v18, v3

    mul-float v3, v18, v13

    cmpg-float v5, v3, p1

    if-gez v5, :cond_15

    const/4 v3, 0x0

    :cond_15
    add-float/2addr v9, v3

    if-ltz v27, :cond_16

    rem-float v7, v28, v26

    .line 941
    sget v5, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpg-float v5, v7, v5

    if-gtz v5, :cond_16

    .line 943
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v5, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    sget-object v7, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v5, v6, v4, v7}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    goto :goto_f

    .line 946
    :cond_16
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v7, v9, v23

    float-to-double v7, v7

    move/from16 v18, v3

    .line 947
    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float v2, v2, v4

    add-float/2addr v6, v2

    iget v2, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 948
    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    double-to-float v3, v7

    mul-float v4, v4, v3

    add-float/2addr v2, v4

    .line 946
    invoke-virtual {v5, v6, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 950
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    move/from16 v4, v18

    neg-float v4, v4

    invoke-virtual {v2, v3, v9, v4}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto :goto_f

    :cond_17
    rem-float v7, v28, v26

    .line 958
    sget v2, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpl-float v2, v7, v2

    if-lez v2, :cond_19

    if-eqz v22, :cond_18

    div-float v7, v28, v24

    add-float/2addr v6, v7

    .line 963
    iget v2, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    mul-float v6, v6, v23

    float-to-double v4, v6

    .line 964
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float v6, v6, v3

    add-float/2addr v2, v6

    .line 965
    iget v6, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 966
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v3, v3, v4

    add-float/2addr v6, v3

    .line 968
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_f

    .line 974
    :cond_18
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v3, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v4, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 983
    :cond_19
    :goto_f
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 985
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_11

    :cond_1a
    :goto_10
    move/from16 v20, v2

    move v10, v4

    move-object/from16 v19, v5

    move/from16 v21, v6

    :goto_11
    add-int/lit8 v6, v21, 0x1

    move-object/from16 v8, p2

    move v4, v10

    move-object/from16 v5, v19

    move/from16 v2, v20

    const/4 v3, 0x0

    goto/16 :goto_2

    .line 988
    :cond_1b
    invoke-static {v1}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    return-void
.end method

.method protected drawHole(Landroid/graphics/Canvas;)V
    .locals 7

    .line 681
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    if-eqz p1, :cond_2

    .line 683
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result p1

    .line 684
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    mul-float v0, v0, p1

    .line 685
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v2

    .line 687
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    if-lez v3, :cond_0

    .line 689
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget v4, v2, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v5, v2, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5, v0, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 695
    :cond_0
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    if-lez v3, :cond_1

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 696
    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getTransparentCircleRadius()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1

    .line 698
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v3

    .line 699
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->getTransparentCircleRadius()F

    move-result v4

    div-float/2addr v4, v1

    mul-float p1, p1, v4

    .line 701
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    int-to-float v4, v3

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v5

    mul-float v4, v4, v5

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v5

    mul-float v4, v4, v5

    float-to-int v4, v4

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 704
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 705
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    iget v4, v2, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v5, v2, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v4, v5, p1, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 706
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    iget v1, v2, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v4, v2, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    sget-object v5, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {p1, v1, v4, v0, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 707
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 710
    iget-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 712
    :cond_1
    invoke-static {v2}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    :cond_2
    return-void
.end method

.method protected drawRoundedSlices(Landroid/graphics/Canvas;)V
    .locals 18

    move-object/from16 v0, p0

    .line 998
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawRoundedSlicesEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1001
    :cond_0
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/PieData;->getDataSet()Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    move-result-object v1

    .line 1003
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isVisible()Z

    move-result v2

    if-nez v2, :cond_1

    :goto_0
    return-void

    .line 1006
    :cond_1
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v2

    .line 1007
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v3

    .line 1009
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v4

    .line 1010
    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v5

    .line 1013
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v6

    mul-float v6, v6, v5

    const/high16 v7, 0x42c80000    # 100.0f

    div-float/2addr v6, v7

    sub-float v6, v5, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    .line 1015
    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v7

    .line 1016
    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v8

    const/4 v9, 0x0

    .line 1018
    :goto_1
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v10

    if-ge v9, v10, :cond_3

    .line 1020
    aget v10, v7, v9

    .line 1022
    invoke-interface {v1, v9}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    .line 1025
    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getY()F

    move-result v11

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    sget v12, Lcom/github/mikephil/charting/utils/Utils;->FLOAT_EPSILON:F

    cmpl-float v11, v11, v12

    if-lez v11, :cond_2

    sub-float v11, v5, v6

    float-to-double v11, v11

    add-float v13, v8, v10

    mul-float v13, v13, v3

    float-to-double v13, v13

    .line 1028
    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v15

    mul-double v15, v15, v11

    move/from16 p1, v2

    iget v2, v4, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    move/from16 v17, v3

    float-to-double v2, v2

    add-double/2addr v2, v15

    double-to-float v2, v2

    .line 1031
    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    mul-double v11, v11, v13

    iget v3, v4, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    float-to-double v13, v3

    add-double/2addr v11, v13

    double-to-float v3, v11

    .line 1034
    iget-object v11, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {v1, v9}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 1035
    iget-object v11, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v11, v2, v3, v6, v12}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_2

    :cond_2
    move/from16 p1, v2

    move/from16 v17, v3

    :goto_2
    mul-float v10, v10, p1

    add-float/2addr v8, v10

    add-int/lit8 v9, v9, 0x1

    move/from16 v2, p1

    move/from16 v3, v17

    goto :goto_1

    .line 1040
    :cond_3
    invoke-static {v4}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    return-void
.end method

.method public drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V
    .locals 1

    .line 650
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 651
    iget-object p5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .locals 49

    move-object/from16 v0, p0

    .line 409
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v7

    .line 412
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v8

    .line 413
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v1

    .line 414
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v9

    .line 415
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getAbsoluteAngles()[F

    move-result-object v10

    .line 417
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v11

    .line 418
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v12

    .line 420
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v2

    mul-float v2, v2, v8

    const/high16 v13, 0x42c80000    # 100.0f

    div-float/2addr v2, v13

    sub-float v2, v8, v2

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v2, v14

    .line 421
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v3

    div-float v15, v3, v13

    const/high16 v3, 0x41200000    # 10.0f

    div-float v3, v8, v3

    const v4, 0x40666666    # 3.6f

    mul-float v3, v3, v4

    .line 424
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    mul-float v3, v8, v15

    sub-float v3, v8, v3

    div-float/2addr v3, v14

    .line 427
    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawRoundedSlicesEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    float-to-double v4, v1

    const/high16 v1, 0x43b40000    # 360.0f

    mul-float v2, v2, v1

    float-to-double v1, v2

    const-wide v16, 0x401921fb54442d18L    # 6.283185307179586

    const/high16 v18, 0x42c80000    # 100.0f

    const/high16 v19, 0x40000000    # 2.0f

    float-to-double v13, v8

    mul-double v13, v13, v16

    div-double/2addr v1, v13

    add-double/2addr v4, v1

    double-to-float v1, v4

    goto :goto_0

    :cond_0
    const/high16 v18, 0x42c80000    # 100.0f

    const/high16 v19, 0x40000000    # 2.0f

    :goto_0
    move v13, v1

    sub-float v14, v8, v3

    .line 435
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lcom/github/mikephil/charting/data/PieData;

    .line 436
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/PieData;->getDataSets()Ljava/util/List;

    move-result-object v1

    .line 438
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/PieData;->getYValueSum()F

    move-result v17

    .line 440
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawEntryLabelsEnabled()Z

    move-result v20

    .line 445
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    const/high16 v2, 0x40a00000    # 5.0f

    .line 447
    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v21

    const/16 v22, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 449
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1a

    .line 451
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .line 453
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isDrawValuesEnabled()Z

    move-result v23

    if-nez v23, :cond_1

    if-nez v20, :cond_1

    move-object/from16 v24, v1

    move/from16 v25, v2

    move/from16 v28, v8

    move-object/from16 v31, v9

    move-object/from16 v33, v10

    move/from16 v46, v11

    goto/16 :goto_10

    .line 458
    :cond_1
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getXValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-result-object v5

    .line 459
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getYValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-result-object v6

    .line 462
    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    move-object/from16 v24, v1

    .line 464
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move/from16 v25, v2

    const-string v2, "Q"

    invoke-static {v1, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40800000    # 4.0f

    .line 465
    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    add-float v26, v1, v2

    .line 467
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v1

    .line 469
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v2

    move/from16 v27, v3

    .line 471
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    move/from16 v28, v8

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLineColor()I

    move-result v8

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 472
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLineWidth()F

    move-result v8

    invoke-static {v8}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v8

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 474
    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getSliceSpace(Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)F

    move-result v8

    .line 476
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getIconsOffset()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v3

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/MPPointF;->getInstance(Lcom/github/mikephil/charting/utils/MPPointF;)Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v3

    move/from16 v29, v8

    .line 477
    iget v8, v3, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    invoke-static {v8}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v8

    iput v8, v3, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    .line 478
    iget v8, v3, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-static {v8}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v8

    iput v8, v3, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    const/4 v8, 0x0

    :goto_2
    if-ge v8, v2, :cond_19

    .line 482
    invoke-interface {v4, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v30

    move-object/from16 v31, v9

    move-object/from16 v9, v30

    check-cast v9, Lcom/github/mikephil/charting/data/PieEntry;

    if-nez v27, :cond_2

    const/16 v30, 0x0

    goto :goto_3

    :cond_2
    add-int/lit8 v30, v27, -0x1

    .line 487
    aget v30, v10, v30

    mul-float v30, v30, v11

    .line 489
    :goto_3
    aget v32, v31, v27

    const v33, 0x3c8efa35

    mul-float v34, v14, v33

    div-float v34, v29, v34

    div-float v34, v34, v19

    sub-float v32, v32, v34

    div-float v32, v32, v19

    add-float v30, v30, v32

    mul-float v30, v30, v12

    move/from16 v32, v2

    add-float v2, v13, v30

    move-object/from16 v30, v3

    .line 499
    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isUsePercentValuesEnabled()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v9}, Lcom/github/mikephil/charting/data/PieEntry;->getY()F

    move-result v3

    div-float v3, v3, v17

    mul-float v3, v3, v18

    goto :goto_4

    .line 500
    :cond_3
    invoke-virtual {v9}, Lcom/github/mikephil/charting/data/PieEntry;->getY()F

    move-result v3

    .line 501
    :goto_4
    invoke-virtual {v1, v3, v9}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getPieLabel(FLcom/github/mikephil/charting/data/PieEntry;)Ljava/lang/String;

    move-result-object v34

    .line 502
    invoke-virtual {v9}, Lcom/github/mikephil/charting/data/PieEntry;->getLabel()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v35, v1

    mul-float v1, v2, v33

    move-object/from16 v36, v9

    move-object/from16 v33, v10

    float-to-double v9, v1

    move-wide/from16 v37, v9

    .line 504
    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    double-to-float v9, v9

    move/from16 v39, v9

    .line 505
    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    double-to-float v9, v9

    if-eqz v20, :cond_4

    .line 507
    sget-object v10, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->OUTSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    if-ne v5, v10, :cond_4

    const/4 v10, 0x1

    goto :goto_5

    :cond_4
    const/4 v10, 0x0

    :goto_5
    if-eqz v23, :cond_5

    .line 509
    sget-object v1, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->OUTSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    if-ne v6, v1, :cond_5

    const/16 v41, 0x1

    goto :goto_6

    :cond_5
    const/16 v41, 0x0

    :goto_6
    if-eqz v20, :cond_6

    .line 511
    sget-object v1, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    if-ne v5, v1, :cond_6

    const/16 v42, 0x1

    goto :goto_7

    :cond_6
    const/16 v42, 0x0

    :goto_7
    if-eqz v23, :cond_7

    .line 513
    sget-object v1, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    if-ne v6, v1, :cond_7

    const/16 v40, 0x1

    goto :goto_8

    :cond_7
    const/16 v40, 0x0

    :goto_8
    if-nez v10, :cond_9

    if-eqz v41, :cond_8

    goto :goto_9

    :cond_8
    move-object/from16 v38, v5

    move-object/from16 v44, v6

    move/from16 v46, v11

    move-object/from16 v10, v30

    move-object/from16 v2, v34

    move-object v11, v3

    move/from16 v30, v9

    move-object v9, v4

    goto/16 :goto_e

    .line 518
    :cond_9
    :goto_9
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLinePart1Length()F

    move-result v1

    .line 519
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLinePart2Length()F

    move-result v43

    .line 520
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLinePart1OffsetPercentage()F

    move-result v44

    div-float v44, v44, v18

    move/from16 v45, v1

    .line 527
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v1

    if-eqz v1, :cond_a

    mul-float v1, v28, v15

    sub-float v46, v28, v1

    mul-float v46, v46, v44

    add-float v46, v46, v1

    goto :goto_a

    :cond_a
    mul-float v46, v28, v44

    .line 534
    :goto_a
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isValueLineVariableLength()Z

    move-result v1

    if-eqz v1, :cond_b

    mul-float v43, v43, v14

    .line 535
    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->sin(D)D

    move-result-wide v37

    move-object v1, v5

    move-object/from16 v44, v6

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->abs(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v43, v43, v5

    goto :goto_b

    :cond_b
    move-object v1, v5

    move-object/from16 v44, v6

    mul-float v43, v43, v14

    :goto_b
    mul-float v5, v46, v39

    .line 539
    iget v6, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v5, v6

    mul-float v46, v46, v9

    .line 540
    iget v6, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float v46, v46, v6

    const/high16 v6, 0x3f800000    # 1.0f

    add-float v6, v45, v6

    mul-float v6, v6, v14

    mul-float v37, v6, v39

    move-object/from16 v38, v1

    .line 542
    iget v1, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float v37, v37, v1

    mul-float v6, v6, v9

    .line 543
    iget v1, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v6, v1

    float-to-double v1, v2

    const-wide v47, 0x4076800000000000L    # 360.0

    rem-double v1, v1, v47

    const-wide v47, 0x4056800000000000L    # 90.0

    cmpl-double v45, v1, v47

    if-ltz v45, :cond_d

    const-wide v47, 0x4070e00000000000L    # 270.0

    cmpg-double v45, v1, v47

    if-gtz v45, :cond_d

    sub-float v1, v37, v43

    .line 549
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move/from16 v43, v1

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    if-eqz v10, :cond_c

    .line 552
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    :cond_c
    sub-float v1, v43, v21

    goto :goto_c

    :cond_d
    add-float v1, v37, v43

    .line 559
    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move/from16 v43, v1

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    if-eqz v10, :cond_e

    .line 562
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    :cond_e
    add-float v1, v43, v21

    :goto_c
    move/from16 v45, v1

    .line 568
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLineColor()I

    move-result v1

    const v2, 0x112233

    if-eq v1, v2, :cond_10

    .line 570
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isUsingSliceColorAsValueLineColor()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 571
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    invoke-interface {v4, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_f
    move v2, v5

    move v5, v6

    .line 574
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    move v1, v11

    move-object v11, v3

    move/from16 v3, v46

    move/from16 v46, v1

    move v1, v9

    move-object v9, v4

    move/from16 v4, v37

    move/from16 v37, v10

    move-object/from16 v10, v30

    move/from16 v30, v1

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v2, v4

    .line 575
    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    move v3, v5

    move/from16 v4, v43

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_d

    :cond_10
    move v5, v6

    move/from16 v37, v10

    move/from16 v46, v11

    move-object/from16 v10, v30

    move-object v11, v3

    move/from16 v30, v9

    move-object v9, v4

    :goto_d
    if-eqz v37, :cond_11

    if-eqz v41, :cond_11

    move v3, v5

    .line 581
    invoke-interface {v9, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v5

    move-object/from16 v1, p1

    move v4, v3

    move-object/from16 v2, v34

    move/from16 v3, v45

    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    move v5, v4

    .line 583
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/PieData;->getEntryCount()I

    move-result v4

    if-ge v8, v4, :cond_13

    if-eqz v11, :cond_13

    add-float v6, v5, v26

    .line 584
    invoke-virtual {v0, v1, v11, v3, v6}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawEntryLabel(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    goto :goto_e

    :cond_11
    move-object/from16 v1, p1

    move-object/from16 v2, v34

    move/from16 v3, v45

    if-eqz v37, :cond_12

    .line 588
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/PieData;->getEntryCount()I

    move-result v4

    if-ge v8, v4, :cond_13

    if-eqz v11, :cond_13

    div-float v4, v26, v19

    add-float v6, v5, v4

    .line 589
    invoke-virtual {v0, v1, v11, v3, v6}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawEntryLabel(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    goto :goto_e

    :cond_12
    if-eqz v41, :cond_13

    div-float v4, v26, v19

    add-float/2addr v4, v5

    .line 593
    invoke-interface {v9, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v5

    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    :cond_13
    :goto_e
    if-nez v42, :cond_14

    if-eqz v40, :cond_17

    :cond_14
    mul-float v1, v14, v39

    .line 599
    iget v3, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v3, v1

    mul-float v1, v14, v30

    .line 600
    iget v4, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v4, v1

    .line 602
    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    if-eqz v42, :cond_15

    if-eqz v40, :cond_15

    .line 607
    invoke-interface {v9, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v5

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 609
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/PieData;->getEntryCount()I

    move-result v2

    if-ge v8, v2, :cond_17

    if-eqz v11, :cond_17

    add-float v4, v4, v26

    .line 610
    invoke-virtual {v0, v1, v11, v3, v4}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawEntryLabel(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    goto :goto_f

    :cond_15
    move-object/from16 v1, p1

    if-eqz v42, :cond_16

    .line 614
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/PieData;->getEntryCount()I

    move-result v2

    if-ge v8, v2, :cond_17

    if-eqz v11, :cond_17

    div-float v2, v26, v19

    add-float/2addr v4, v2

    .line 615
    invoke-virtual {v0, v1, v11, v3, v4}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawEntryLabel(Landroid/graphics/Canvas;Ljava/lang/String;FF)V

    goto :goto_f

    :cond_16
    if-eqz v40, :cond_17

    div-float v5, v26, v19

    add-float/2addr v4, v5

    .line 618
    invoke-interface {v9, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v5

    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 622
    :cond_17
    :goto_f
    invoke-virtual/range {v36 .. v36}, Lcom/github/mikephil/charting/data/PieEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isDrawIconsEnabled()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 624
    invoke-virtual/range {v36 .. v36}, Lcom/github/mikephil/charting/data/PieEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 626
    iget v0, v10, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v0, v14

    mul-float v0, v0, v39

    iget v2, v7, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v0, v2

    .line 627
    iget v2, v10, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v2, v14

    mul-float v2, v2, v30

    iget v3, v7, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr v2, v3

    .line 628
    iget v3, v10, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v2, v3

    float-to-int v0, v0

    float-to-int v3, v2

    .line 635
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    .line 636
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    move v2, v0

    move-object/from16 v0, p1

    .line 630
    invoke-static/range {v0 .. v5}, Lcom/github/mikephil/charting/utils/Utils;->drawImage(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    :cond_18
    add-int/lit8 v27, v27, 0x1

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p0

    move-object v4, v9

    move-object v3, v10

    move-object/from16 v9, v31

    move/from16 v2, v32

    move-object/from16 v10, v33

    move-object/from16 v1, v35

    move-object/from16 v5, v38

    move-object/from16 v6, v44

    move/from16 v11, v46

    goto/16 :goto_2

    :cond_19
    move-object/from16 v31, v9

    move-object/from16 v33, v10

    move/from16 v46, v11

    move-object v10, v3

    .line 642
    invoke-static {v10}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    move/from16 v3, v27

    :goto_10
    add-int/lit8 v2, v25, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v8, v28

    move-object/from16 v9, v31

    move-object/from16 v10, v33

    move/from16 v11, v46

    goto/16 :goto_1

    .line 644
    :cond_1a
    invoke-static {v7}, Lcom/github/mikephil/charting/utils/MPPointF;->recycleInstance(Lcom/github/mikephil/charting/utils/MPPointF;)V

    .line 645
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getPaintCenterText()Landroid/text/TextPaint;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    return-object v0
.end method

.method public getPaintEntryLabels()Landroid/graphics/Paint;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mEntryLabelsPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getPaintHole()Landroid/graphics/Paint;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getPaintTransparentCircle()Landroid/graphics/Paint;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method protected getSliceSpace(Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)F
    .locals 3

    .line 204
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isAutomaticallyDisableSliceSpacingEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 205
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result p1

    return p1

    .line 207
    :cond_0
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getSmallestContentExtension()F

    move-result v1

    div-float/2addr v0, v1

    .line 208
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getYMin()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/PieData;->getYValueSum()F

    move-result v2

    div-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v1, v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 210
    :cond_1
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result p1

    return p1
.end method

.method public initBuffers()V
    .locals 0

    return-void
.end method

.method public releaseBitmap()V
    .locals 2

    .line 1047
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1048
    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 1049
    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    .line 1051
    :cond_0
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2

    .line 1052
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 1054
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1056
    :cond_1
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1057
    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    :cond_2
    return-void
.end method
