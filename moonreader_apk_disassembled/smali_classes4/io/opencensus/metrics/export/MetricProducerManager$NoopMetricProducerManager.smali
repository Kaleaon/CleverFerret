.class final Lio/opencensus/metrics/export/MetricProducerManager$NoopMetricProducerManager;
.super Lio/opencensus/metrics/export/MetricProducerManager;
.source "MetricProducerManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/MetricProducerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopMetricProducerManager"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Lio/opencensus/metrics/export/MetricProducerManager;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/metrics/export/MetricProducerManager$1;)V
    .locals 0

    .line 71
    invoke-direct {p0}, Lio/opencensus/metrics/export/MetricProducerManager$NoopMetricProducerManager;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Lio/opencensus/metrics/export/MetricProducer;)V
    .locals 1

    .line 75
    const-string v0, "metricProducer"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public getAllMetricProducer()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lio/opencensus/metrics/export/MetricProducer;",
            ">;"
        }
    .end annotation

    .line 85
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public remove(Lio/opencensus/metrics/export/MetricProducer;)V
    .locals 1

    .line 80
    const-string v0, "metricProducer"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
