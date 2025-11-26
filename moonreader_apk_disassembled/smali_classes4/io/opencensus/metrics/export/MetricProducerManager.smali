.class public abstract Lio/opencensus/metrics/export/MetricProducerManager;
.super Ljava/lang/Object;
.source "MetricProducerManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/export/MetricProducerManager$NoopMetricProducerManager;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newNoopMetricProducerManager()Lio/opencensus/metrics/export/MetricProducerManager;
    .locals 2

    .line 68
    new-instance v0, Lio/opencensus/metrics/export/MetricProducerManager$NoopMetricProducerManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/metrics/export/MetricProducerManager$NoopMetricProducerManager;-><init>(Lio/opencensus/metrics/export/MetricProducerManager$1;)V

    return-object v0
.end method


# virtual methods
.method public abstract add(Lio/opencensus/metrics/export/MetricProducer;)V
.end method

.method public abstract getAllMetricProducer()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lio/opencensus/metrics/export/MetricProducer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract remove(Lio/opencensus/metrics/export/MetricProducer;)V
.end method
