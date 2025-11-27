.class public Lcom/github/mikephil/charting/highlight/RadarHighlighter;
.super Lcom/github/mikephil/charting/highlight/PieRadarHighlighter;
.source "RadarHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/highlight/PieRadarHighlighter<",
        "Lcom/github/mikephil/charting/charts/RadarChart;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/charts/RadarChart;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/highlight/PieRadarHighlighter;-><init>(Lcom/github/mikephil/charting/charts/PieRadarChartBase;)V

    return-void
.end method


# virtual methods
.method protected getClosestHighlight(IFF)Lcom/github/mikephil/charting/highlight/Highlight;
    .locals 5

    .line 23
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->getHighlightsAtIndex(I)Ljava/util/List;

    move-result-object p1

    .line 25
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v0, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v0, p2, p3}, Lcom/github/mikephil/charting/charts/RadarChart;->distanceToCenter(FF)F

    move-result p2

    iget-object p3, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast p3, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {p3}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result p3

    div-float/2addr p2, p3

    const/4 p3, 0x0

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 32
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/highlight/Highlight;

    .line 34
    invoke-virtual {v2}, Lcom/github/mikephil/charting/highlight/Highlight;->getY()F

    move-result v3

    sub-float/2addr v3, p2

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v4, v3, v0

    if-gez v4, :cond_0

    move-object p3, v2

    move v0, v3

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p3
.end method

.method protected getHighlightsAtIndex(I)Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/github/mikephil/charting/highlight/Highlight;",
            ">;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mHighlightBuffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 56
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v0, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/RadarChart;->getAnimator()Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v0

    .line 57
    iget-object v1, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v1, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getAnimator()Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v1

    .line 58
    iget-object v2, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v2, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v2

    .line 59
    iget-object v3, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v3, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v3

    const/4 v4, 0x0

    .line 61
    invoke-static {v4, v4}, Lcom/github/mikephil/charting/utils/MPPointF;->getInstance(FF)Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v11, 0x0

    .line 62
    :goto_0
    iget-object v5, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v5, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/RadarData;->getDataSetCount()I

    move-result v5

    if-ge v11, v5, :cond_0

    .line 64
    iget-object v5, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v5, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v5, v11}, Lcom/github/mikephil/charting/data/RadarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v5

    .line 66
    invoke-interface {v5, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v6

    .line 68
    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/Entry;->getY()F

    move-result v7

    iget-object v8, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v8, Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/charts/RadarChart;->getYChartMin()F

    move-result v8

    sub-float/2addr v7, v8

    .line 70
    iget-object v8, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v8, Lcom/github/mikephil/charting/charts/RadarChart;

    .line 71
    invoke-virtual {v8}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v8

    mul-float v7, v7, v3

    mul-float v7, v7, v1

    move v9, v7

    int-to-float v7, p1

    mul-float v10, v2, v7

    mul-float v10, v10, v0

    iget-object v12, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mChart:Lcom/github/mikephil/charting/charts/PieRadarChartBase;

    check-cast v12, Lcom/github/mikephil/charting/charts/RadarChart;

    .line 72
    invoke-virtual {v12}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v12

    add-float/2addr v10, v12

    .line 70
    invoke-static {v8, v9, v10, v4}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Lcom/github/mikephil/charting/utils/MPPointF;FFLcom/github/mikephil/charting/utils/MPPointF;)V

    .line 74
    iget-object v13, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mHighlightBuffer:Ljava/util/List;

    move-object v8, v6

    new-instance v6, Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/data/Entry;->getY()F

    move-result v8

    iget v9, v4, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iget v10, v4, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v12

    invoke-direct/range {v6 .. v12}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(FFFFILcom/github/mikephil/charting/components/YAxis$AxisDependency;)V

    invoke-interface {v13, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 77
    :cond_0
    iget-object p1, p0, Lcom/github/mikephil/charting/highlight/RadarHighlighter;->mHighlightBuffer:Ljava/util/List;

    return-object p1
.end method
