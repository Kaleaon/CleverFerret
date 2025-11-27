.class final Lio/opencensus/metrics/LongGauge$NoopLongGauge;
.super Lio/opencensus/metrics/LongGauge;
.source "LongGauge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/LongGauge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopLongGauge"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;
    }
.end annotation


# instance fields
.field private final labelKeysSize:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
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

    .line 167
    invoke-direct {p0}, Lio/opencensus/metrics/LongGauge;-><init>()V

    .line 168
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lio/opencensus/metrics/LongGauge$NoopLongGauge;->labelKeysSize:I

    return-void
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/LongGauge$NoopLongGauge;
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
            "Lio/opencensus/metrics/LongGauge$NoopLongGauge;"
        }
    .end annotation

    .line 163
    new-instance v0, Lio/opencensus/metrics/LongGauge$NoopLongGauge;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/opencensus/metrics/LongGauge$NoopLongGauge;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public bridge synthetic getDefaultTimeSeries()Lio/opencensus/metrics/LongGauge$LongPoint;
    .locals 1

    .line 158
    invoke-virtual {p0}, Lio/opencensus/metrics/LongGauge$NoopLongGauge;->getDefaultTimeSeries()Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultTimeSeries()Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;
    .locals 1

    .line 181
    invoke-static {}, Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;->access$000()Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongGauge$LongPoint;
    .locals 0

    .line 158
    invoke-virtual {p0, p1}, Lio/opencensus/metrics/LongGauge$NoopLongGauge;->getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

    move-result-object p1

    return-object p1
.end method

.method public getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)",
            "Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;"
        }
    .end annotation

    .line 173
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const-string v1, "labelValue"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 174
    iget v0, p0, Lio/opencensus/metrics/LongGauge$NoopLongGauge;->labelKeysSize:I

    .line 175
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v0, "Label Keys and Label Values don\'t have same size."

    .line 174
    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 176
    invoke-static {}, Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;->access$000()Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

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

    .line 186
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
