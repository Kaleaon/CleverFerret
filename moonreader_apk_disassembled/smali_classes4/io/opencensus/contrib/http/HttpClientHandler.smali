.class public Lio/opencensus/contrib/http/HttpClientHandler;
.super Lio/opencensus/contrib/http/AbstractHttpHandler;
.source "HttpClientHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Q:",
        "Ljava/lang/Object;",
        "P:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Lio/opencensus/contrib/http/AbstractHttpHandler<",
        "TQ;TP;>;"
    }
.end annotation


# instance fields
.field private final setter:Lio/opencensus/trace/propagation/TextFormat$Setter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/trace/propagation/TextFormat$Setter<",
            "TC;>;"
        }
    .end annotation
.end field

.field private final statsRecorder:Lio/opencensus/stats/StatsRecorder;

.field private final tagger:Lio/opencensus/tags/Tagger;

.field private final textFormat:Lio/opencensus/trace/propagation/TextFormat;

.field private final tracer:Lio/opencensus/trace/Tracer;


# direct methods
.method public constructor <init>(Lio/opencensus/trace/Tracer;Lio/opencensus/contrib/http/HttpExtractor;Lio/opencensus/trace/propagation/TextFormat;Lio/opencensus/trace/propagation/TextFormat$Setter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/Tracer;",
            "Lio/opencensus/contrib/http/HttpExtractor<",
            "TQ;TP;>;",
            "Lio/opencensus/trace/propagation/TextFormat;",
            "Lio/opencensus/trace/propagation/TextFormat$Setter<",
            "TC;>;)V"
        }
    .end annotation

    .line 82
    invoke-direct {p0, p2}, Lio/opencensus/contrib/http/AbstractHttpHandler;-><init>(Lio/opencensus/contrib/http/HttpExtractor;)V

    .line 83
    const-string p2, "setter"

    invoke-static {p4, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    const-string p2, "textFormat"

    invoke-static {p3, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string p2, "tracer"

    invoke-static {p1, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    iput-object p4, p0, Lio/opencensus/contrib/http/HttpClientHandler;->setter:Lio/opencensus/trace/propagation/TextFormat$Setter;

    .line 87
    iput-object p3, p0, Lio/opencensus/contrib/http/HttpClientHandler;->textFormat:Lio/opencensus/trace/propagation/TextFormat;

    .line 88
    iput-object p1, p0, Lio/opencensus/contrib/http/HttpClientHandler;->tracer:Lio/opencensus/trace/Tracer;

    .line 89
    invoke-static {}, Lio/opencensus/stats/Stats;->getStatsRecorder()Lio/opencensus/stats/StatsRecorder;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/contrib/http/HttpClientHandler;->statsRecorder:Lio/opencensus/stats/StatsRecorder;

    .line 90
    invoke-static {}, Lio/opencensus/tags/Tags;->getTagger()Lio/opencensus/tags/Tagger;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/contrib/http/HttpClientHandler;->tagger:Lio/opencensus/tags/Tagger;

    return-void
.end method

.method private recordStats(Lio/opencensus/contrib/http/HttpRequestContext;Ljava/lang/Object;I)V
    .locals 5
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/contrib/http/HttpRequestContext;",
            "TQ;I)V"
        }
    .end annotation

    .line 156
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iget-wide v3, p1, Lio/opencensus/contrib/http/HttpRequestContext;->requestStartTime:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-double v0, v0

    .line 158
    const-string v2, ""

    if-nez p2, :cond_0

    move-object p2, v2

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lio/opencensus/contrib/http/HttpClientHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {v3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getMethod(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 159
    :goto_0
    iget-object v3, p0, Lio/opencensus/contrib/http/HttpClientHandler;->tagger:Lio/opencensus/tags/Tagger;

    iget-object v4, p1, Lio/opencensus/contrib/http/HttpRequestContext;->tagContext:Lio/opencensus/tags/TagContext;

    .line 161
    invoke-virtual {v3, v4}, Lio/opencensus/tags/Tagger;->toBuilder(Lio/opencensus/tags/TagContext;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object v3

    sget-object v4, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_METHOD:Lio/opencensus/tags/TagKey;

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    move-object v2, p2

    .line 164
    :goto_1
    invoke-static {v2}, Lio/opencensus/tags/TagValue;->create(Ljava/lang/String;)Lio/opencensus/tags/TagValue;

    move-result-object p2

    sget-object v2, Lio/opencensus/contrib/http/HttpRequestContext;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    .line 162
    invoke-virtual {v3, v4, p2, v2}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p2

    sget-object v2, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_STATUS:Lio/opencensus/tags/TagKey;

    if-nez p3, :cond_2

    .line 168
    const-string p3, "error"

    goto :goto_2

    :cond_2
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    :goto_2
    invoke-static {p3}, Lio/opencensus/tags/TagValue;->create(Ljava/lang/String;)Lio/opencensus/tags/TagValue;

    move-result-object p3

    sget-object v3, Lio/opencensus/contrib/http/HttpRequestContext;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    .line 166
    invoke-virtual {p2, v2, p3, v3}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p2

    .line 170
    invoke-virtual {p2}, Lio/opencensus/tags/TagContextBuilder;->build()Lio/opencensus/tags/TagContext;

    move-result-object p2

    .line 172
    iget-object p3, p0, Lio/opencensus/contrib/http/HttpClientHandler;->statsRecorder:Lio/opencensus/stats/StatsRecorder;

    .line 173
    invoke-virtual {p3}, Lio/opencensus/stats/StatsRecorder;->newMeasureMap()Lio/opencensus/stats/MeasureMap;

    move-result-object p3

    sget-object v2, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_ROUNDTRIP_LATENCY:Lio/opencensus/stats/Measure$MeasureDouble;

    .line 174
    invoke-virtual {p3, v2, v0, v1}, Lio/opencensus/stats/MeasureMap;->put(Lio/opencensus/stats/Measure$MeasureDouble;D)Lio/opencensus/stats/MeasureMap;

    move-result-object p3

    sget-object v0, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_SENT_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    iget-object v1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->sentMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 175
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    invoke-virtual {p3, v0, v1, v2}, Lio/opencensus/stats/MeasureMap;->put(Lio/opencensus/stats/Measure$MeasureLong;J)Lio/opencensus/stats/MeasureMap;

    move-result-object p3

    sget-object v0, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_CLIENT_RECEIVED_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->receiveMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 176
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    invoke-virtual {p3, v0, v1, v2}, Lio/opencensus/stats/MeasureMap;->put(Lio/opencensus/stats/Measure$MeasureLong;J)Lio/opencensus/stats/MeasureMap;

    move-result-object p1

    .line 177
    invoke-virtual {p1, p2}, Lio/opencensus/stats/MeasureMap;->record(Lio/opencensus/tags/TagContext;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getSpanFromContext(Lio/opencensus/contrib/http/HttpRequestContext;)Lio/opencensus/trace/Span;
    .locals 0

    .line 56
    invoke-super {p0, p1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->getSpanFromContext(Lio/opencensus/contrib/http/HttpRequestContext;)Lio/opencensus/trace/Span;

    move-result-object p1

    return-object p1
.end method

.method public handleEnd(Lio/opencensus/contrib/http/HttpRequestContext;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/contrib/http/HttpRequestContext;",
            "TQ;TP;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 149
    const-string v0, "context"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    iget-object v0, p0, Lio/opencensus/contrib/http/HttpClientHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {v0, p3}, Lio/opencensus/contrib/http/HttpExtractor;->getStatusCode(Ljava/lang/Object;)I

    move-result p3

    .line 151
    invoke-direct {p0, p1, p2, p3}, Lio/opencensus/contrib/http/HttpClientHandler;->recordStats(Lio/opencensus/contrib/http/HttpRequestContext;Ljava/lang/Object;I)V

    .line 152
    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    invoke-virtual {p0, p1, p3, p4}, Lio/opencensus/contrib/http/HttpClientHandler;->spanEnd(Lio/opencensus/trace/Span;ILjava/lang/Throwable;)V

    return-void
.end method

.method public handleStart(Lio/opencensus/trace/Span;Ljava/lang/Object;Ljava/lang/Object;)Lio/opencensus/contrib/http/HttpRequestContext;
    .locals 2
    .param p1    # Lio/opencensus/trace/Span;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/Span;",
            "TC;TQ;)",
            "Lio/opencensus/contrib/http/HttpRequestContext;"
        }
    .end annotation

    .line 110
    const-string v0, "carrier"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v0, "request"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    .line 113
    iget-object p1, p0, Lio/opencensus/contrib/http/HttpClientHandler;->tracer:Lio/opencensus/trace/Tracer;

    invoke-virtual {p1}, Lio/opencensus/trace/Tracer;->getCurrentSpan()Lio/opencensus/trace/Span;

    move-result-object p1

    .line 115
    :cond_0
    iget-object v0, p0, Lio/opencensus/contrib/http/HttpClientHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {p0, p3, v0}, Lio/opencensus/contrib/http/HttpClientHandler;->getSpanName(Ljava/lang/Object;Lio/opencensus/contrib/http/HttpExtractor;)Ljava/lang/String;

    move-result-object v0

    .line 116
    iget-object v1, p0, Lio/opencensus/contrib/http/HttpClientHandler;->tracer:Lio/opencensus/trace/Tracer;

    invoke-virtual {v1, v0, p1}, Lio/opencensus/trace/Tracer;->spanBuilderWithExplicitParent(Ljava/lang/String;Lio/opencensus/trace/Span;)Lio/opencensus/trace/SpanBuilder;

    move-result-object p1

    .line 117
    sget-object v0, Lio/opencensus/trace/Span$Kind;->CLIENT:Lio/opencensus/trace/Span$Kind;

    invoke-virtual {p1, v0}, Lio/opencensus/trace/SpanBuilder;->setSpanKind(Lio/opencensus/trace/Span$Kind;)Lio/opencensus/trace/SpanBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lio/opencensus/trace/SpanBuilder;->startSpan()Lio/opencensus/trace/Span;

    move-result-object p1

    .line 119
    invoke-virtual {p1}, Lio/opencensus/trace/Span;->getOptions()Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lio/opencensus/trace/Span$Options;->RECORD_EVENTS:Lio/opencensus/trace/Span$Options;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lio/opencensus/contrib/http/HttpClientHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {p0, p1, p3, v0}, Lio/opencensus/contrib/http/HttpClientHandler;->addSpanRequestAttributes(Lio/opencensus/trace/Span;Ljava/lang/Object;Lio/opencensus/contrib/http/HttpExtractor;)V

    .line 124
    :cond_1
    invoke-virtual {p1}, Lio/opencensus/trace/Span;->getContext()Lio/opencensus/trace/SpanContext;

    move-result-object p3

    .line 125
    sget-object v0, Lio/opencensus/trace/SpanContext;->INVALID:Lio/opencensus/trace/SpanContext;

    invoke-virtual {p3, v0}, Lio/opencensus/trace/SpanContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 126
    iget-object v0, p0, Lio/opencensus/contrib/http/HttpClientHandler;->textFormat:Lio/opencensus/trace/propagation/TextFormat;

    iget-object v1, p0, Lio/opencensus/contrib/http/HttpClientHandler;->setter:Lio/opencensus/trace/propagation/TextFormat$Setter;

    invoke-virtual {v0, p3, p2, v1}, Lio/opencensus/trace/propagation/TextFormat;->inject(Lio/opencensus/trace/SpanContext;Ljava/lang/Object;Lio/opencensus/trace/propagation/TextFormat$Setter;)V

    .line 128
    :cond_2
    iget-object p2, p0, Lio/opencensus/contrib/http/HttpClientHandler;->tagger:Lio/opencensus/tags/Tagger;

    invoke-virtual {p2}, Lio/opencensus/tags/Tagger;->getCurrentTagContext()Lio/opencensus/tags/TagContext;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/opencensus/contrib/http/HttpClientHandler;->getNewContext(Lio/opencensus/trace/Span;Lio/opencensus/tags/TagContext;)Lio/opencensus/contrib/http/HttpRequestContext;

    move-result-object p1

    return-object p1
.end method
