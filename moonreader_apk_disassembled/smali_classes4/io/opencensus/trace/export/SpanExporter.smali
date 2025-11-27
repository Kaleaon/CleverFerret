.class public abstract Lio/opencensus/trace/export/SpanExporter;
.super Ljava/lang/Object;
.source "SpanExporter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/export/SpanExporter$NoopSpanExporter;,
        Lio/opencensus/trace/export/SpanExporter$Handler;
    }
.end annotation


# static fields
.field private static final NOOP_SPAN_EXPORTER:Lio/opencensus/trace/export/SpanExporter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 32
    new-instance v0, Lio/opencensus/trace/export/SpanExporter$NoopSpanExporter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/export/SpanExporter$NoopSpanExporter;-><init>(Lio/opencensus/trace/export/SpanExporter$1;)V

    sput-object v0, Lio/opencensus/trace/export/SpanExporter;->NOOP_SPAN_EXPORTER:Lio/opencensus/trace/export/SpanExporter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNoopSpanExporter()Lio/opencensus/trace/export/SpanExporter;
    .locals 1

    .line 41
    sget-object v0, Lio/opencensus/trace/export/SpanExporter;->NOOP_SPAN_EXPORTER:Lio/opencensus/trace/export/SpanExporter;

    return-object v0
.end method


# virtual methods
.method public abstract registerHandler(Ljava/lang/String;Lio/opencensus/trace/export/SpanExporter$Handler;)V
.end method

.method public abstract unregisterHandler(Ljava/lang/String;)V
.end method
