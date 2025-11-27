.class final Lio/opencensus/trace/TraceComponent$NoopTraceComponent;
.super Lio/opencensus/trace/TraceComponent;
.source "TraceComponent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/TraceComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTraceComponent"
.end annotation


# instance fields
.field private final noopExportComponent:Lio/opencensus/trace/export/ExportComponent;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 116
    invoke-direct {p0}, Lio/opencensus/trace/TraceComponent;-><init>()V

    .line 89
    invoke-static {}, Lio/opencensus/trace/export/ExportComponent;->newNoopExportComponent()Lio/opencensus/trace/export/ExportComponent;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/trace/TraceComponent$NoopTraceComponent;->noopExportComponent:Lio/opencensus/trace/export/ExportComponent;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/TraceComponent$1;)V
    .locals 0

    .line 88
    invoke-direct {p0}, Lio/opencensus/trace/TraceComponent$NoopTraceComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getClock()Lio/opencensus/common/Clock;
    .locals 1

    .line 103
    invoke-static {}, Lio/opencensus/internal/ZeroTimeClock;->getInstance()Lio/opencensus/internal/ZeroTimeClock;

    move-result-object v0

    return-object v0
.end method

.method public getExportComponent()Lio/opencensus/trace/export/ExportComponent;
    .locals 1

    .line 108
    iget-object v0, p0, Lio/opencensus/trace/TraceComponent$NoopTraceComponent;->noopExportComponent:Lio/opencensus/trace/export/ExportComponent;

    return-object v0
.end method

.method public getPropagationComponent()Lio/opencensus/trace/propagation/PropagationComponent;
    .locals 1

    .line 98
    invoke-static {}, Lio/opencensus/trace/propagation/PropagationComponent;->getNoopPropagationComponent()Lio/opencensus/trace/propagation/PropagationComponent;

    move-result-object v0

    return-object v0
.end method

.method public getTraceConfig()Lio/opencensus/trace/config/TraceConfig;
    .locals 1

    .line 113
    invoke-static {}, Lio/opencensus/trace/config/TraceConfig;->getNoopTraceConfig()Lio/opencensus/trace/config/TraceConfig;

    move-result-object v0

    return-object v0
.end method

.method public getTracer()Lio/opencensus/trace/Tracer;
    .locals 1

    .line 93
    invoke-static {}, Lio/opencensus/trace/Tracer;->getNoopTracer()Lio/opencensus/trace/Tracer;

    move-result-object v0

    return-object v0
.end method
