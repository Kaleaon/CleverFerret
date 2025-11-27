.class final Lio/opencensus/metrics/export/ExportComponent$NoopExportComponent;
.super Lio/opencensus/metrics/export/ExportComponent;
.source "ExportComponent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/ExportComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopExportComponent"
.end annotation


# static fields
.field private static final METRIC_PRODUCER_MANAGER:Lio/opencensus/metrics/export/MetricProducerManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    invoke-static {}, Lio/opencensus/metrics/export/MetricProducerManager;->newNoopMetricProducerManager()Lio/opencensus/metrics/export/MetricProducerManager;

    move-result-object v0

    sput-object v0, Lio/opencensus/metrics/export/ExportComponent$NoopExportComponent;->METRIC_PRODUCER_MANAGER:Lio/opencensus/metrics/export/MetricProducerManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Lio/opencensus/metrics/export/ExportComponent;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/metrics/export/ExportComponent$1;)V
    .locals 0

    .line 50
    invoke-direct {p0}, Lio/opencensus/metrics/export/ExportComponent$NoopExportComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getMetricProducerManager()Lio/opencensus/metrics/export/MetricProducerManager;
    .locals 1

    .line 57
    sget-object v0, Lio/opencensus/metrics/export/ExportComponent$NoopExportComponent;->METRIC_PRODUCER_MANAGER:Lio/opencensus/metrics/export/MetricProducerManager;

    return-object v0
.end method
