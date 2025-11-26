.class public abstract Lio/opencensus/trace/Tracer;
.super Ljava/lang/Object;
.source "Tracer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/Tracer$NoopTracer;
    }
.end annotation


# static fields
.field private static final noopTracer:Lio/opencensus/trace/Tracer$NoopTracer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 73
    new-instance v0, Lio/opencensus/trace/Tracer$NoopTracer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/Tracer$NoopTracer;-><init>(Lio/opencensus/trace/Tracer$1;)V

    sput-object v0, Lio/opencensus/trace/Tracer;->noopTracer:Lio/opencensus/trace/Tracer$NoopTracer;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getNoopTracer()Lio/opencensus/trace/Tracer;
    .locals 1

    .line 81
    sget-object v0, Lio/opencensus/trace/Tracer;->noopTracer:Lio/opencensus/trace/Tracer$NoopTracer;

    return-object v0
.end method


# virtual methods
.method public final getCurrentSpan()Lio/opencensus/trace/Span;
    .locals 1

    .line 98
    invoke-static {}, Lio/opencensus/trace/CurrentSpanUtils;->getCurrentSpan()Lio/opencensus/trace/Span;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 99
    :cond_0
    sget-object v0, Lio/opencensus/trace/BlankSpan;->INSTANCE:Lio/opencensus/trace/BlankSpan;

    return-object v0
.end method

.method public final spanBuilder(Ljava/lang/String;)Lio/opencensus/trace/SpanBuilder;
    .locals 1

    .line 308
    invoke-static {}, Lio/opencensus/trace/CurrentSpanUtils;->getCurrentSpan()Lio/opencensus/trace/Span;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lio/opencensus/trace/Tracer;->spanBuilderWithExplicitParent(Ljava/lang/String;Lio/opencensus/trace/Span;)Lio/opencensus/trace/SpanBuilder;

    move-result-object p1

    return-object p1
.end method

.method public abstract spanBuilderWithExplicitParent(Ljava/lang/String;Lio/opencensus/trace/Span;)Lio/opencensus/trace/SpanBuilder;
    .param p2    # Lio/opencensus/trace/Span;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract spanBuilderWithRemoteParent(Ljava/lang/String;Lio/opencensus/trace/SpanContext;)Lio/opencensus/trace/SpanBuilder;
    .param p2    # Lio/opencensus/trace/SpanContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public final withSpan(Lio/opencensus/trace/Span;)Lio/opencensus/common/Scope;
    .locals 1

    .line 154
    const-string v0, "span"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/opencensus/trace/Span;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lio/opencensus/trace/CurrentSpanUtils;->withSpan(Lio/opencensus/trace/Span;Z)Lio/opencensus/common/Scope;

    move-result-object p1

    return-object p1
.end method

.method public final withSpan(Lio/opencensus/trace/Span;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 1

    const/4 v0, 0x0

    .line 219
    invoke-static {p1, v0, p2}, Lio/opencensus/trace/CurrentSpanUtils;->withSpan(Lio/opencensus/trace/Span;ZLjava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    return-object p1
.end method

.method public final withSpan(Lio/opencensus/trace/Span;Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Callable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/trace/Span;",
            "Ljava/util/concurrent/Callable<",
            "TC;>;)",
            "Ljava/util/concurrent/Callable<",
            "TC;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 284
    invoke-static {p1, v0, p2}, Lio/opencensus/trace/CurrentSpanUtils;->withSpan(Lio/opencensus/trace/Span;ZLjava/util/concurrent/Callable;)Ljava/util/concurrent/Callable;

    move-result-object p1

    return-object p1
.end method
