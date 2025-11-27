.class abstract Lio/opencensus/contrib/http/AbstractHttpHandler;
.super Ljava/lang/Object;
.source "AbstractHttpHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Q:",
        "Ljava/lang/Object;",
        "P:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final extractor:Lio/opencensus/contrib/http/HttpExtractor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/opencensus/contrib/http/HttpExtractor<",
            "TQ;TP;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/opencensus/contrib/http/HttpExtractor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/contrib/http/HttpExtractor<",
            "TQ;TP;>;)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const-string v0, "extractor"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    iput-object p1, p0, Lio/opencensus/contrib/http/AbstractHttpHandler;->extractor:Lio/opencensus/contrib/http/HttpExtractor;

    return-void
.end method

.method private static putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p2, :cond_0

    .line 64
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    invoke-static {p2}, Lio/opencensus/trace/AttributeValue;->stringAttributeValue(Ljava/lang/String;)Lio/opencensus/trace/AttributeValue;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/opencensus/trace/Span;->putAttribute(Ljava/lang/String;Lio/opencensus/trace/AttributeValue;)V

    :cond_0
    return-void
.end method

.method static recordMessageEvent(Lio/opencensus/trace/Span;JLio/opencensus/trace/MessageEvent$Type;JJ)V
    .locals 0

    .line 56
    invoke-static {p3, p1, p2}, Lio/opencensus/trace/MessageEvent;->builder(Lio/opencensus/trace/MessageEvent$Type;J)Lio/opencensus/trace/MessageEvent$Builder;

    move-result-object p1

    .line 57
    invoke-virtual {p1, p4, p5}, Lio/opencensus/trace/MessageEvent$Builder;->setUncompressedMessageSize(J)Lio/opencensus/trace/MessageEvent$Builder;

    move-result-object p1

    .line 58
    invoke-virtual {p1, p6, p7}, Lio/opencensus/trace/MessageEvent$Builder;->setCompressedMessageSize(J)Lio/opencensus/trace/MessageEvent$Builder;

    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lio/opencensus/trace/MessageEvent$Builder;->build()Lio/opencensus/trace/MessageEvent;

    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Lio/opencensus/trace/Span;->addMessageEvent(Lio/opencensus/trace/MessageEvent;)V

    return-void
.end method


# virtual methods
.method final addSpanRequestAttributes(Lio/opencensus/trace/Span;Ljava/lang/Object;Lio/opencensus/contrib/http/HttpExtractor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/Span;",
            "TQ;",
            "Lio/opencensus/contrib/http/HttpExtractor<",
            "TQ;TP;>;)V"
        }
    .end annotation

    .line 127
    const-string v0, "http.user_agent"

    .line 128
    invoke-virtual {p3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getUserAgent(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 127
    invoke-static {p1, v0, v1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    const-string v0, "http.host"

    .line 130
    invoke-virtual {p3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getHost(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 129
    invoke-static {p1, v0, v1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const-string v0, "http.method"

    .line 132
    invoke-virtual {p3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getMethod(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 131
    invoke-static {p1, v0, v1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const-string v0, "http.path"

    .line 134
    invoke-virtual {p3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getPath(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 133
    invoke-static {p1, v0, v1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    const-string v0, "http.route"

    .line 136
    invoke-virtual {p3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getRoute(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 135
    invoke-static {p1, v0, v1}, Lio/opencensus/contrib/http/AbstractHttpHandler;->putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    const-string v0, "http.url"

    .line 138
    invoke-virtual {p3, p2}, Lio/opencensus/contrib/http/HttpExtractor;->getUrl(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 137
    invoke-static {p1, v0, p2}, Lio/opencensus/contrib/http/AbstractHttpHandler;->putAttributeIfNotEmptyOrNull(Lio/opencensus/trace/Span;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method getNewContext(Lio/opencensus/trace/Span;Lio/opencensus/tags/TagContext;)Lio/opencensus/contrib/http/HttpRequestContext;
    .locals 1

    .line 154
    new-instance v0, Lio/opencensus/contrib/http/HttpRequestContext;

    invoke-direct {v0, p1, p2}, Lio/opencensus/contrib/http/HttpRequestContext;-><init>(Lio/opencensus/trace/Span;Lio/opencensus/tags/TagContext;)V

    return-object v0
.end method

.method public getSpanFromContext(Lio/opencensus/contrib/http/HttpRequestContext;)Lio/opencensus/trace/Span;
    .locals 1

    .line 149
    const-string v0, "context"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    return-object p1
.end method

.method final getSpanName(Ljava/lang/Object;Lio/opencensus/contrib/http/HttpExtractor;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TQ;",
            "Lio/opencensus/contrib/http/HttpExtractor<",
            "TQ;TP;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 116
    invoke-virtual {p2, p1}, Lio/opencensus/contrib/http/HttpExtractor;->getPath(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 117
    const-string p2, "/"

    if-nez p1, :cond_0

    move-object p1, p2

    .line 120
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public final handleMessageReceived(Lio/opencensus/contrib/http/HttpRequestContext;J)V
    .locals 9

    .line 95
    const-string v0, "context"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v0, p1, Lio/opencensus/contrib/http/HttpRequestContext;->receiveMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 97
    iget-object v0, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    invoke-virtual {v0}, Lio/opencensus/trace/Span;->getOptions()Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lio/opencensus/trace/Span$Options;->RECORD_EVENTS:Lio/opencensus/trace/Span$Options;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->receviedSeqId:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x1

    .line 100
    invoke-virtual {p1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v2

    sget-object v4, Lio/opencensus/trace/MessageEvent$Type;->RECEIVED:Lio/opencensus/trace/MessageEvent$Type;

    const-wide/16 v7, 0x0

    move-wide v5, p2

    .line 99
    invoke-static/range {v1 .. v8}, Lio/opencensus/contrib/http/AbstractHttpHandler;->recordMessageEvent(Lio/opencensus/trace/Span;JLio/opencensus/trace/MessageEvent$Type;JJ)V

    :cond_0
    return-void
.end method

.method public final handleMessageSent(Lio/opencensus/contrib/http/HttpRequestContext;J)V
    .locals 9

    .line 78
    const-string v0, "context"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    iget-object v0, p1, Lio/opencensus/contrib/http/HttpRequestContext;->sentMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 80
    iget-object v0, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    invoke-virtual {v0}, Lio/opencensus/trace/Span;->getOptions()Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lio/opencensus/trace/Span$Options;->RECORD_EVENTS:Lio/opencensus/trace/Span$Options;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    iget-object v1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    iget-object p1, p1, Lio/opencensus/contrib/http/HttpRequestContext;->sentSeqId:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v2

    sget-object v4, Lio/opencensus/trace/MessageEvent$Type;->SENT:Lio/opencensus/trace/MessageEvent$Type;

    const-wide/16 v7, 0x0

    move-wide v5, p2

    invoke-static/range {v1 .. v8}, Lio/opencensus/contrib/http/AbstractHttpHandler;->recordMessageEvent(Lio/opencensus/trace/Span;JLio/opencensus/trace/MessageEvent$Type;JJ)V

    :cond_0
    return-void
.end method

.method spanEnd(Lio/opencensus/trace/Span;ILjava/lang/Throwable;)V
    .locals 2
    .param p3    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 105
    invoke-virtual {p1}, Lio/opencensus/trace/Span;->getOptions()Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lio/opencensus/trace/Span$Options;->RECORD_EVENTS:Lio/opencensus/trace/Span$Options;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    int-to-long v0, p2

    .line 108
    invoke-static {v0, v1}, Lio/opencensus/trace/AttributeValue;->longAttributeValue(J)Lio/opencensus/trace/AttributeValue;

    move-result-object v0

    .line 106
    const-string v1, "http.status_code"

    invoke-virtual {p1, v1, v0}, Lio/opencensus/trace/Span;->putAttribute(Ljava/lang/String;Lio/opencensus/trace/AttributeValue;)V

    .line 109
    invoke-static {p2, p3}, Lio/opencensus/contrib/http/util/HttpTraceUtil;->parseResponseStatus(ILjava/lang/Throwable;)Lio/opencensus/trace/Status;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/opencensus/trace/Span;->setStatus(Lio/opencensus/trace/Status;)V

    .line 111
    :cond_0
    invoke-virtual {p1}, Lio/opencensus/trace/Span;->end()V

    return-void
.end method
