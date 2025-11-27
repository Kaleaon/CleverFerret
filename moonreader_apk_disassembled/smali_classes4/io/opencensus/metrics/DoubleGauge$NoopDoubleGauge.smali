.class final Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;
.super Lio/opencensus/metrics/DoubleGauge;
.source "DoubleGauge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/DoubleGauge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopDoubleGauge"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;
    }
.end annotation


# instance fields
.field private final labelKeysSize:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)V"
        }
    .end annotation

    .line 170
    invoke-direct {p0}, Lio/opencensus/metrics/DoubleGauge;-><init>()V

    .line 171
    const-string v0, "name"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const-string p1, "description"

    invoke-static {p2, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string p1, "unit"

    invoke-static {p3, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    const-string p1, "labelKeys"

    invoke-static {p4, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    const-string p2, "labelKey"

    invoke-static {p1, p2}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 175
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;->labelKeysSize:I

    return-void
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)",
            "Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;"
        }
    .end annotation

    .line 166
    new-instance v0, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public bridge synthetic getDefaultTimeSeries()Lio/opencensus/metrics/DoubleGauge$DoublePoint;
    .locals 1

    .line 161
    invoke-virtual {p0}, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;->getDefaultTimeSeries()Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultTimeSeries()Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;
    .locals 1

    .line 188
    invoke-static {}, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;->access$000()Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/DoubleGauge$DoublePoint;
    .locals 0

    .line 161
    invoke-virtual {p0, p1}, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;->getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    move-result-object p1

    return-object p1
.end method

.method public getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)",
            "Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;"
        }
    .end annotation

    .line 180
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const-string v1, "labelValue"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 181
    iget v0, p0, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;->labelKeysSize:I

    .line 182
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v0, "Label Keys and Label Values don\'t have same size."

    .line 181
    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 183
    invoke-static {}, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;->access$000()Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    move-result-object p1

    return-object p1
.end method

.method public removeTimeSeries(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)V"
        }
    .end annotation

    .line 193
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
