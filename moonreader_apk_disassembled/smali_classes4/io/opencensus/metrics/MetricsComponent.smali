.class public abstract Lio/opencensus/metrics/MetricsComponent;
.super Ljava/lang/Object;
.source "MetricsComponent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newNoopMetricsComponent()Lio/opencensus/metrics/MetricsComponent;
    .locals 2

    .line 53
    new-instance v0, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;-><init>(Lio/opencensus/metrics/MetricsComponent$1;)V

    return-object v0
.end method


# virtual methods
.method public abstract getExportComponent()Lio/opencensus/metrics/export/ExportComponent;
.end method

.method public abstract getMetricRegistry()Lio/opencensus/metrics/MetricRegistry;
.end method
