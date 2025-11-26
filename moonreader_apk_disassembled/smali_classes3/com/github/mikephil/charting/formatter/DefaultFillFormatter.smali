.class public Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;
.super Ljava/lang/Object;
.source "DefaultFillFormatter.java"

# interfaces
.implements Lcom/github/mikephil/charting/formatter/IFillFormatter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFillLinePosition(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;)F
    .locals 4

    .line 20
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getYChartMax()F

    move-result v0

    .line 21
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getYChartMin()F

    move-result v1

    .line 23
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object p2

    .line 25
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYMax()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYMin()F

    move-result v2

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    return v3

    .line 31
    :cond_0
    invoke-virtual {p2}, Lcom/github/mikephil/charting/data/LineData;->getYMax()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    const/4 v0, 0x0

    .line 35
    :cond_1
    invoke-virtual {p2}, Lcom/github/mikephil/charting/data/LineData;->getYMin()F

    move-result p2

    cmpg-float p2, p2, v3

    if-gez p2, :cond_2

    const/4 v1, 0x0

    .line 40
    :cond_2
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYMin()F

    move-result p1

    cmpl-float p1, p1, v3

    if-ltz p1, :cond_3

    return v1

    :cond_3
    return v0
.end method
