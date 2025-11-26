.class public Lcom/github/mikephil/charting/formatter/PercentFormatter;
.super Lcom/github/mikephil/charting/formatter/ValueFormatter;
.source "PercentFormatter.java"


# instance fields
.field public mFormat:Ljava/text/DecimalFormat;

.field private pieChart:Lcom/github/mikephil/charting/charts/PieChart;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Lcom/github/mikephil/charting/formatter/ValueFormatter;-><init>()V

    .line 21
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "###,###,##0.0"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(Lcom/github/mikephil/charting/charts/PieChart;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/github/mikephil/charting/formatter/PercentFormatter;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->pieChart:Lcom/github/mikephil/charting/charts/PieChart;

    return-void
.end method


# virtual methods
.method public getFormattedValue(F)Ljava/lang/String;
    .locals 4

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    float-to-double v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " %"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPieLabel(FLcom/github/mikephil/charting/data/PieEntry;)Ljava/lang/String;
    .locals 2

    .line 37
    iget-object p2, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->pieChart:Lcom/github/mikephil/charting/charts/PieChart;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/github/mikephil/charting/charts/PieChart;->isUsePercentValuesEnabled()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 39
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/formatter/PercentFormatter;->getFormattedValue(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 42
    :cond_0
    iget-object p2, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    float-to-double v0, p1

    invoke-virtual {p2, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
