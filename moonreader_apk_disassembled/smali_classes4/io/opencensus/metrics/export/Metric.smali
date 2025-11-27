.class public abstract Lio/opencensus/metrics/export/Metric;
.super Ljava/lang/Object;
.source "Metric.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkTypeMatch(Lio/opencensus/metrics/export/MetricDescriptor$Type;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/metrics/export/MetricDescriptor$Type;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/TimeSeries;",
            ">;)V"
        }
    .end annotation

    .line 106
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/opencensus/metrics/export/TimeSeries;

    .line 107
    invoke-virtual {v0}, Lio/opencensus/metrics/export/TimeSeries;->getPoints()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/metrics/export/Point;

    .line 108
    invoke-virtual {v1}, Lio/opencensus/metrics/export/Point;->getValue()Lio/opencensus/metrics/export/Value;

    move-result-object v1

    .line 110
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 112
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 110
    :cond_1
    const-string v2, ""

    .line 114
    :goto_1
    sget-object v3, Lio/opencensus/metrics/export/Metric$1;->$SwitchMap$io$opencensus$metrics$export$MetricDescriptor$Type:[I

    invoke-virtual {p0}, Lio/opencensus/metrics/export/MetricDescriptor$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    const-string v7, "Type mismatch: %s, %s."

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 131
    :pswitch_0
    instance-of v1, v1, Lio/opencensus/metrics/export/Value$ValueSummary;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p0, v3, v5

    aput-object v2, v3, v4

    invoke-static {v1, v7, v3}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 127
    :pswitch_1
    instance-of v1, v1, Lio/opencensus/metrics/export/Value$ValueDistribution;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p0, v3, v5

    aput-object v2, v3, v4

    invoke-static {v1, v7, v3}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 122
    :pswitch_2
    instance-of v1, v1, Lio/opencensus/metrics/export/Value$ValueDouble;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p0, v3, v5

    aput-object v2, v3, v4

    invoke-static {v1, v7, v3}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 117
    :pswitch_3
    instance-of v1, v1, Lio/opencensus/metrics/export/Value$ValueLong;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p0, v3, v5

    aput-object v2, v3, v4

    invoke-static {v1, v7, v3}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static create(Lio/opencensus/metrics/export/MetricDescriptor;Ljava/util/List;)Lio/opencensus/metrics/export/Metric;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/metrics/export/MetricDescriptor;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/TimeSeries;",
            ">;)",
            "Lio/opencensus/metrics/export/Metric;"
        }
    .end annotation

    .line 52
    const-string v0, "timeSeriesList"

    .line 53
    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const-string v1, "timeSeries"

    .line 52
    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 55
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 54
    invoke-static {p0, p1}, Lio/opencensus/metrics/export/Metric;->createInternal(Lio/opencensus/metrics/export/MetricDescriptor;Ljava/util/List;)Lio/opencensus/metrics/export/Metric;

    move-result-object p0

    return-object p0
.end method

.method private static createInternal(Lio/opencensus/metrics/export/MetricDescriptor;Ljava/util/List;)Lio/opencensus/metrics/export/Metric;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/metrics/export/MetricDescriptor;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/TimeSeries;",
            ">;)",
            "Lio/opencensus/metrics/export/Metric;"
        }
    .end annotation

    .line 82
    const-string v0, "metricDescriptor"

    invoke-static {p0, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    invoke-virtual {p0}, Lio/opencensus/metrics/export/MetricDescriptor;->getType()Lio/opencensus/metrics/export/MetricDescriptor$Type;

    move-result-object v0

    invoke-static {v0, p1}, Lio/opencensus/metrics/export/Metric;->checkTypeMatch(Lio/opencensus/metrics/export/MetricDescriptor$Type;Ljava/util/List;)V

    .line 84
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Metric;

    invoke-direct {v0, p0, p1}, Lio/opencensus/metrics/export/AutoValue_Metric;-><init>(Lio/opencensus/metrics/export/MetricDescriptor;Ljava/util/List;)V

    return-object v0
.end method

.method public static createWithOneTimeSeries(Lio/opencensus/metrics/export/MetricDescriptor;Lio/opencensus/metrics/export/TimeSeries;)Lio/opencensus/metrics/export/Metric;
    .locals 1

    .line 68
    const-string v0, "timeSeries"

    .line 69
    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 68
    invoke-static {p0, p1}, Lio/opencensus/metrics/export/Metric;->createInternal(Lio/opencensus/metrics/export/MetricDescriptor;Ljava/util/List;)Lio/opencensus/metrics/export/Metric;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract getMetricDescriptor()Lio/opencensus/metrics/export/MetricDescriptor;
.end method

.method public abstract getTimeSeriesList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/TimeSeries;",
            ">;"
        }
    .end annotation
.end method
