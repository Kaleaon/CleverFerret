.class final Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;
.super Lio/opencensus/metrics/LongCumulative;
.source "LongCumulative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/LongCumulative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopLongCumulative"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;
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

    .line 161
    invoke-direct {p0}, Lio/opencensus/metrics/LongCumulative;-><init>()V

    .line 162
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;->labelKeysSize:I

    return-void
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;
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
            "Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;"
        }
    .end annotation

    .line 157
    new-instance v0, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public bridge synthetic getDefaultTimeSeries()Lio/opencensus/metrics/LongCumulative$LongPoint;
    .locals 1

    .line 152
    invoke-virtual {p0}, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;->getDefaultTimeSeries()Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultTimeSeries()Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;
    .locals 1

    .line 175
    invoke-static {}, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;->access$000()Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongCumulative$LongPoint;
    .locals 0

    .line 152
    invoke-virtual {p0, p1}, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;->getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

    move-result-object p1

    return-object p1
.end method

.method public getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)",
            "Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;"
        }
    .end annotation

    .line 167
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const-string v1, "labelValue"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 168
    iget v0, p0, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;->labelKeysSize:I

    .line 169
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v0, "Label Keys and Label Values don\'t have same size."

    .line 168
    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 170
    invoke-static {}, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;->access$000()Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

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

    .line 180
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
