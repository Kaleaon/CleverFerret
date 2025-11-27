.class public Lio/opencensus/contrib/http/HttpServerHandler;
.super Lio/opencensus/contrib/http/AbstractHttpHandler;
.source "HttpServerHandler.java"


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
.field private final getter:Lio/opencensus/trace/propagation/TextFormat$Getter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/trace/propagation/TextFormat$Getter<",
            "TC;>;"
        }
    .end annotation
.end field

.field private final publicEndpoint:Ljava/lang/Boolean;

.field private final statsRecorder:Lio/opencensus/stats/StatsRecorder;

.field private final tagger:Lio/opencensus/tags/Tagger;

.field private final textFormat:Lio/opencensus/trace/propagation/TextFormat;

.field private final tracer:Lio/opencensus/trace/Tracer;


# direct methods
.method public constructor <init>(Lio/opencensus/trace/Tracer;Lio/opencensus/contrib/http/HttpExtractor;Lio/opencensus/trace/propagation/TextFormat;Lio/opencensus/trace/propagation/TextFormat$Getter;Ljava/lang/Boolean;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/Tracer;",
            "Lio/opencensus/contrib/http/HttpExtractor<",
            "TQ;TP;>;",
            "Lio/opencensus/trace/propagation/TextFormat;",
            "Lio/opencensus/trace/propagation/TextFormat$Getter<",
            "TC;>;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 90
    invoke-direct {p0, p2}, Lio/opencensus/contrib/http/AbstractHttpHandler;-><init>(Lio/opencensus/contrib/http/HttpExtractor;)V

    .line 91
    const-string p2, "tracer"

    invoke-static {p1, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string p2, "textFormat"

    invoke-static {p3, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string p2, "getter"

    invoke-static {p4, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string p2, "publicEndpoint"

    invoke-static {p5, p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iput-object p1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->tracer:Lio/opencensus/trace/Tracer;

    .line 96
    iput-object p3, p0, Lio/opencensus/contrib/http/HttpServerHandler;->textFormat:Lio/opencensus/trace/propagation/TextFormat;

    .line 97
    iput-object p4, p0, Lio/opencensus/contrib/http/HttpServerHandler;->getter:Lio/opencensus/trace/propagation/TextFormat$Getter;

    .line 98
    iput-object p5, p0, Lio/opencensus/contrib/http/HttpServerHandler;->publicEndpoint:Ljava/lang/Boolean;

    .line 99
    invoke-static {}, Lio/opencensus/stats/Stats;->getStatsRecorder()Lio/opencensus/stats/StatsRecorder;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->statsRecorder:Lio/opencensus/stats/StatsRecorder;

    .line 100
    invoke-static {}, Lio/opencensus/tags/Tags;->getTagger()Lio/opencensus/tags/Tagger;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->tagger:Lio/opencensus/tags/Tagger;

    return-void
.end method

.method private recordStats(Lio/opencensus/contrib/http/HttpRequestContext;Ljava/lang/Object;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/contrib/http/HttpRequestContext;",
            "TQ;I)V"
        }
    .end annotation

    .line 172
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iget-wide v3, p1, Lio/opencensus/contrib/http/HttpRequestContext;->requestStartTime:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-double v0, v0

    .line 174
    iget-object v2, p0, Lio/opencensus/contrib/http/HttpServerHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {v2, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getMethod(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 175
    iget-object v3, p0, Lio/opencensus/contrib/http/HttpServerHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {v3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getRoute(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 176
    iget-object v3, p0, Lio/opencensus/contrib/http/HttpServerHandler;->tagger:Lio/opencensus/tags/Tagger;

    iget-object v4, p1, Lio/opencensus/contrib/http/HttpRequestContext;->tagContext:Lio/opencensus/tags/TagContext;

    .line 178
    invoke-virtual {v3, v4}, Lio/opencensus/tags/Tagger;->toBuilder(Lio/opencensus/tags/TagContext;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object v3

    sget-object v4, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_METHOD:Lio/opencensus/tags/TagKey;

    .line 181
    const-string v5, ""

    if-nez v2, :cond_0

    move-object v2, v5

    :cond_0
    invoke-static {v2}, Lio/opencensus/tags/TagValue;->create(Ljava/lang/String;)Lio/opencensus/tags/TagValue;

    move-result-object v2

    sget-object v6, Lio/opencensus/contrib/http/HttpRequestContext;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    .line 179
    invoke-virtual {v3, v4, v2, v6}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object v2

    sget-object v3, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_ROUTE:Lio/opencensus/tags/TagKey;

    if-nez p2, :cond_1

    move-object p2, v5

    .line 185
    :cond_1
    invoke-static {p2}, Lio/opencensus/tags/TagValue;->create(Ljava/lang/String;)Lio/opencensus/tags/TagValue;

    move-result-object p2

    sget-object v4, Lio/opencensus/contrib/http/HttpRequestContext;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    .line 183
    invoke-virtual {v2, v3, p2, v4}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p2

    sget-object v2, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_STATUS:Lio/opencensus/tags/TagKey;

    if-nez p3, :cond_2

    .line 189
    const-string p3, "error"

    goto :goto_0

    :cond_2
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    :goto_0
    invoke-static {p3}, Lio/opencensus/tags/TagValue;->create(Ljava/lang/String;)Lio/opencensus/tags/TagValue;

    move-result-object p3

    sget-object v3, Lio/opencensus/contrib/http/HttpRequestContext;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    .line 187
    invoke-virtual {p2, v2, p3, v3}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p2

    .line 191
    invoke-virtual {p2}, Lio/opencensus/tags/TagContextBuilder;->build()Lio/opencensus/tags/TagContext;

    move-result-object p2

    .line 193
    iget-object p3, p0, Lio/opencensus/contrib/http/HttpServerHandler;->statsRecorder:Lio/opencensus/stats/StatsRecorder;

    .line 194
    invoke-virtual {p3}, Lio/opencensus/stats/StatsRecorder;->newMeasureMap()Lio/opencensus/stats/MeasureMap;

    move-result-object p3

    sget-object v2, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_LATENCY:Lio/opencensus/stats/Measure$MeasureDouble;

    .line 195
    invoke-virtual {p3, v2, v0, v1}, Lio/opencensus/stats/MeasureMap;->put(Lio/opencensus/stats/Measure$MeasureDouble;D)Lio/opencensus/stats/MeasureMap;

    move-result-object p3

    sget-object v0, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_RECEIVED_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    iget-object v1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->receiveMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 196
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    invoke-virtual {p3, v0, v1, v2}, Lio/opencensus/stats/MeasureMap;->put(Lio/opencensus/stats/Measure$MeasureLong;J)Lio/opencensus/stats/MeasureMap;

    move-result-object p3

    sget-object v0, Lio/opencensus/contrib/http/util/HttpMeasureConstants;->HTTP_SERVER_SENT_BYTES:Lio/opencensus/stats/Measure$MeasureLong;

    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->sentMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 197
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    invoke-virtual {p3, v0, v1, v2}, Lio/opencensus/stats/MeasureMap;->put(Lio/opencensus/stats/Measure$MeasureLong;J)Lio/opencensus/stats/MeasureMap;

    move-result-object p1

    .line 198
    invoke-virtual {p1, p2}, Lio/opencensus/stats/MeasureMap;->record(Lio/opencensus/tags/TagContext;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getSpanFromContext(Lio/opencensus/contrib/http/HttpRequestContext;)Lio/opencensus/trace/Span;
    .locals 0

    .line 60
    invoke-super {p0, p1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->getSpanFromContext(Lio/opencensus/contrib/http/HttpRequestContext;)Lio/opencensus/trace/Span;

    move-result-object p1

    return-object p1
.end method

.method public handleEnd(Lio/opencensus/contrib/http/HttpRequestContext;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1
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

    .line 164
    const-string v0, "context"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const-string v0, "request"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    iget-object v0, p0, Lio/opencensus/contrib/http/HttpServerHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {v0, p3}, Lio/opencensus/contrib/http/HttpExtractor;->getStatusCode(Ljava/lang/Object;)I

    move-result p3

    .line 167
    invoke-direct {p0, p1, p2, p3}, Lio/opencensus/contrib/http/HttpServerHandler;->recordStats(Lio/opencensus/contrib/http/HttpRequestContext;Ljava/lang/Object;I)V

    .line 168
    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    invoke-virtual {p0, p1, p3, p4}, Lio/opencensus/contrib/http/HttpServerHandler;->spanEnd(Lio/opencensus/trace/Span;ILjava/lang/Throwable;)V

    return-void
.end method

.method public handleStart(Ljava/lang/Object;Ljava/lang/Object;)Lio/opencensus/contrib/http/HttpRequestContext;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;TQ;)",
            "Lio/opencensus/contrib/http/HttpRequestContext;"
        }
    .end annotation

    .line 119
    const-string v0, "carrier"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const-string v0, "request"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    iget-object v0, p0, Lio/opencensus/contrib/http/HttpServerHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {p0, p2, v0}, Lio/opencensus/contrib/http/HttpServerHandler;->getSpanName(Ljava/lang/Object;Lio/opencensus/contrib/http/HttpExtractor;)Ljava/lang/String;

    move-result-object v0

    .line 126
    :try_start_0
    iget-object v1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->textFormat:Lio/opencensus/trace/propagation/TextFormat;

    iget-object v2, p0, Lio/opencensus/contrib/http/HttpServerHandler;->getter:Lio/opencensus/trace/propagation/TextFormat$Getter;

    invoke-virtual {v1, p1, v2}, Lio/opencensus/trace/propagation/TextFormat;->extract(Ljava/lang/Object;Lio/opencensus/trace/propagation/TextFormat$Getter;)Lio/opencensus/trace/SpanContext;

    move-result-object p1
    :try_end_0
    .catch Lio/opencensus/trace/propagation/SpanContextParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 131
    iget-object v1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->publicEndpoint:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 134
    :cond_0
    iget-object v1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->tracer:Lio/opencensus/trace/Tracer;

    invoke-virtual {v1, v0, p1}, Lio/opencensus/trace/Tracer;->spanBuilderWithRemoteParent(Ljava/lang/String;Lio/opencensus/trace/SpanContext;)Lio/opencensus/trace/SpanBuilder;

    move-result-object v0

    goto :goto_2

    .line 132
    :cond_1
    :goto_1
    iget-object v1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->tracer:Lio/opencensus/trace/Tracer;

    invoke-virtual {v1, v0}, Lio/opencensus/trace/Tracer;->spanBuilder(Ljava/lang/String;)Lio/opencensus/trace/SpanBuilder;

    move-result-object v0

    .line 137
    :goto_2
    sget-object v1, Lio/opencensus/trace/Span$Kind;->SERVER:Lio/opencensus/trace/Span$Kind;

    invoke-virtual {v0, v1}, Lio/opencensus/trace/SpanBuilder;->setSpanKind(Lio/opencensus/trace/Span$Kind;)Lio/opencensus/trace/SpanBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lio/opencensus/trace/SpanBuilder;->startSpan()Lio/opencensus/trace/Span;

    move-result-object v0

    .line 138
    iget-object v1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->publicEndpoint:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz p1, :cond_2

    .line 139
    sget-object v1, Lio/opencensus/trace/Link$Type;->PARENT_LINKED_SPAN:Lio/opencensus/trace/Link$Type;

    invoke-static {p1, v1}, Lio/opencensus/trace/Link;->fromSpanContext(Lio/opencensus/trace/SpanContext;Lio/opencensus/trace/Link$Type;)Lio/opencensus/trace/Link;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/opencensus/trace/Span;->addLink(Lio/opencensus/trace/Link;)V

    .line 142
    :cond_2
    invoke-virtual {v0}, Lio/opencensus/trace/Span;->getOptions()Ljava/util/Set;

    move-result-object p1

    sget-object v1, Lio/opencensus/trace/Span$Options;->RECORD_EVENTS:Lio/opencensus/trace/Span$Options;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 143
    iget-object p1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    invoke-virtual {p0, v0, p2, p1}, Lio/opencensus/contrib/http/HttpServerHandler;->addSpanRequestAttributes(Lio/opencensus/trace/Span;Ljava/lang/Object;Lio/opencensus/contrib/http/HttpExtractor;)V

    .line 146
    :cond_3
    iget-object p1, p0, Lio/opencensus/contrib/http/HttpServerHandler;->tagger:Lio/opencensus/tags/Tagger;

    invoke-virtual {p1}, Lio/opencensus/tags/Tagger;->getCurrentTagContext()Lio/opencensus/tags/TagContext;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lio/opencensus/contrib/http/HttpServerHandler;->getNewContext(Lio/opencensus/trace/Span;Lio/opencensus/tags/TagContext;)Lio/opencensus/contrib/http/HttpRequestContext;

    move-result-object p1

    return-object p1
.end method
