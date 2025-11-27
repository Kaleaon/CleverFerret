.class final Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;
.super Lio/opencensus/metrics/MetricsComponent;
.source "MetricsComponent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/MetricsComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopMetricsComponent"
.end annotation


# static fields
.field private static final EXPORT_COMPONENT:Lio/opencensus/metrics/export/ExportComponent;

.field private static final METRIC_REGISTRY:Lio/opencensus/metrics/MetricRegistry;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    invoke-static {}, Lio/opencensus/metrics/export/ExportComponent;->newNoopExportComponent()Lio/opencensus/metrics/export/ExportComponent;

    move-result-object v0

    sput-object v0, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;->EXPORT_COMPONENT:Lio/opencensus/metrics/export/ExportComponent;

    .line 59
    invoke-static {}, Lio/opencensus/metrics/MetricRegistry;->newNoopMetricRegistry()Lio/opencensus/metrics/MetricRegistry;

    move-result-object v0

    sput-object v0, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;->METRIC_REGISTRY:Lio/opencensus/metrics/MetricRegistry;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Lio/opencensus/metrics/MetricsComponent;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/metrics/MetricsComponent$1;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getExportComponent()Lio/opencensus/metrics/export/ExportComponent;
    .locals 1

    .line 63
    sget-object v0, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;->EXPORT_COMPONENT:Lio/opencensus/metrics/export/ExportComponent;

    return-object v0
.end method

.method public getMetricRegistry()Lio/opencensus/metrics/MetricRegistry;
    .locals 1

    .line 68
    sget-object v0, Lio/opencensus/metrics/MetricsComponent$NoopMetricsComponent;->METRIC_REGISTRY:Lio/opencensus/metrics/MetricRegistry;

    return-object v0
.end method
