.class public abstract Lio/opencensus/trace/config/TraceConfig;
.super Ljava/lang/Object;
.source "TraceConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/config/TraceConfig$NoopTraceConfig;
    }
.end annotation


# static fields
.field private static final NOOP_TRACE_CONFIG:Lio/opencensus/trace/config/TraceConfig$NoopTraceConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 26
    new-instance v0, Lio/opencensus/trace/config/TraceConfig$NoopTraceConfig;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/config/TraceConfig$NoopTraceConfig;-><init>(Lio/opencensus/trace/config/TraceConfig$1;)V

    sput-object v0, Lio/opencensus/trace/config/TraceConfig;->NOOP_TRACE_CONFIG:Lio/opencensus/trace/config/TraceConfig$NoopTraceConfig;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNoopTraceConfig()Lio/opencensus/trace/config/TraceConfig;
    .locals 1

    .line 51
    sget-object v0, Lio/opencensus/trace/config/TraceConfig;->NOOP_TRACE_CONFIG:Lio/opencensus/trace/config/TraceConfig$NoopTraceConfig;

    return-object v0
.end method


# virtual methods
.method public abstract getActiveTraceParams()Lio/opencensus/trace/config/TraceParams;
.end method

.method public abstract updateActiveTraceParams(Lio/opencensus/trace/config/TraceParams;)V
.end method
