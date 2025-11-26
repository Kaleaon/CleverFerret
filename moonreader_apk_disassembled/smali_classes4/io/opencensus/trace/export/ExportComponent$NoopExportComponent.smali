.class final Lio/opencensus/trace/export/ExportComponent$NoopExportComponent;
.super Lio/opencensus/trace/export/ExportComponent;
.source "ExportComponent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/ExportComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopExportComponent"
.end annotation


# instance fields
.field private final noopSampledSpanStore:Lio/opencensus/trace/export/SampledSpanStore;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 76
    invoke-direct {p0}, Lio/opencensus/trace/export/ExportComponent;-><init>()V

    .line 78
    invoke-static {}, Lio/opencensus/trace/export/SampledSpanStore;->newNoopSampledSpanStore()Lio/opencensus/trace/export/SampledSpanStore;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/trace/export/ExportComponent$NoopExportComponent;->noopSampledSpanStore:Lio/opencensus/trace/export/SampledSpanStore;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/export/ExportComponent$1;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lio/opencensus/trace/export/ExportComponent$NoopExportComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getRunningSpanStore()Lio/opencensus/trace/export/RunningSpanStore;
    .locals 1

    .line 87
    invoke-static {}, Lio/opencensus/trace/export/RunningSpanStore;->getNoopRunningSpanStore()Lio/opencensus/trace/export/RunningSpanStore;

    move-result-object v0

    return-object v0
.end method

.method public getSampledSpanStore()Lio/opencensus/trace/export/SampledSpanStore;
    .locals 1

    .line 92
    iget-object v0, p0, Lio/opencensus/trace/export/ExportComponent$NoopExportComponent;->noopSampledSpanStore:Lio/opencensus/trace/export/SampledSpanStore;

    return-object v0
.end method

.method public getSpanExporter()Lio/opencensus/trace/export/SpanExporter;
    .locals 1

    .line 82
    invoke-static {}, Lio/opencensus/trace/export/SpanExporter;->getNoopSpanExporter()Lio/opencensus/trace/export/SpanExporter;

    move-result-object v0

    return-object v0
.end method
