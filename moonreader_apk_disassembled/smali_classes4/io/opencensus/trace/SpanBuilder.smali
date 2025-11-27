.class public abstract Lio/opencensus/trace/SpanBuilder;
.super Ljava/lang/Object;
.source "SpanBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/SpanBuilder$NoopSpanBuilder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract setParentLinks(Ljava/util/List;)Lio/opencensus/trace/SpanBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Span;",
            ">;)",
            "Lio/opencensus/trace/SpanBuilder;"
        }
    .end annotation
.end method

.method public abstract setRecordEvents(Z)Lio/opencensus/trace/SpanBuilder;
.end method

.method public abstract setSampler(Lio/opencensus/trace/Sampler;)Lio/opencensus/trace/SpanBuilder;
.end method

.method public setSpanKind(Lio/opencensus/trace/Span$Kind;)Lio/opencensus/trace/SpanBuilder;
    .locals 0
    .param p1    # Lio/opencensus/trace/Span$Kind;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    return-object p0
.end method

.method public final startScopedSpan()Lio/opencensus/common/Scope;
    .locals 2

    .line 252
    invoke-virtual {p0}, Lio/opencensus/trace/SpanBuilder;->startSpan()Lio/opencensus/trace/Span;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lio/opencensus/trace/CurrentSpanUtils;->withSpan(Lio/opencensus/trace/Span;Z)Lio/opencensus/common/Scope;

    move-result-object v0

    return-object v0
.end method

.method public abstract startSpan()Lio/opencensus/trace/Span;
.end method

.method public final startSpanAndCall(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 313
    invoke-virtual {p0}, Lio/opencensus/trace/SpanBuilder;->startSpan()Lio/opencensus/trace/Span;

    move-result-object v0

    const/4 v1, 0x1

    .line 314
    invoke-static {v0, v1, p1}, Lio/opencensus/trace/CurrentSpanUtils;->withSpan(Lio/opencensus/trace/Span;ZLjava/util/concurrent/Callable;)Ljava/util/concurrent/Callable;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final startSpanAndRun(Ljava/lang/Runnable;)V
    .locals 2

    .line 281
    invoke-virtual {p0}, Lio/opencensus/trace/SpanBuilder;->startSpan()Lio/opencensus/trace/Span;

    move-result-object v0

    const/4 v1, 0x1

    .line 282
    invoke-static {v0, v1, p1}, Lio/opencensus/trace/CurrentSpanUtils;->withSpan(Lio/opencensus/trace/Span;ZLjava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method
