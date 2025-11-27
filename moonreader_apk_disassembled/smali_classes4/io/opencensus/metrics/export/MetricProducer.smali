.class public abstract Lio/opencensus/metrics/export/MetricProducer;
.super Ljava/lang/Object;
.source "MetricProducer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getMetrics()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lio/opencensus/metrics/export/Metric;",
            ">;"
        }
    .end annotation
.end method
