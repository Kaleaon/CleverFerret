.class final Lio/opencensus/trace/Tracer$NoopTracer;
.super Lio/opencensus/trace/Tracer;
.source "Tracer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/Tracer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTracer"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 366
    invoke-direct {p0}, Lio/opencensus/trace/Tracer;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/Tracer$1;)V
    .locals 0

    .line 353
    invoke-direct {p0}, Lio/opencensus/trace/Tracer$NoopTracer;-><init>()V

    return-void
.end method


# virtual methods
.method public spanBuilderWithExplicitParent(Ljava/lang/String;Lio/opencensus/trace/Span;)Lio/opencensus/trace/SpanBuilder;
    .locals 0
    .param p2    # Lio/opencensus/trace/Span;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 357
    invoke-static {p1, p2}, Lio/opencensus/trace/SpanBuilder$NoopSpanBuilder;->createWithParent(Ljava/lang/String;Lio/opencensus/trace/Span;)Lio/opencensus/trace/SpanBuilder$NoopSpanBuilder;

    move-result-object p1

    return-object p1
.end method

.method public spanBuilderWithRemoteParent(Ljava/lang/String;Lio/opencensus/trace/SpanContext;)Lio/opencensus/trace/SpanBuilder;
    .locals 0
    .param p2    # Lio/opencensus/trace/SpanContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 363
    invoke-static {p1, p2}, Lio/opencensus/trace/SpanBuilder$NoopSpanBuilder;->createWithRemoteParent(Ljava/lang/String;Lio/opencensus/trace/SpanContext;)Lio/opencensus/trace/SpanBuilder$NoopSpanBuilder;

    move-result-object p1

    return-object p1
.end method
