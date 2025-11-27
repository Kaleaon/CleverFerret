.class public Lio/opencensus/contrib/http/HttpRequestContext;
.super Ljava/lang/Object;
.source "HttpRequestContext.java"


# static fields
.field static final INVALID_STARTTIME:J = -0x1L

.field static final METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;


# instance fields
.field receiveMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

.field receviedSeqId:Ljava/util/concurrent/atomic/AtomicLong;

.field final requestStartTime:J

.field sentMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

.field sentSeqId:Ljava/util/concurrent/atomic/AtomicLong;

.field final span:Lio/opencensus/trace/Span;

.field final tagContext:Lio/opencensus/tags/TagContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    sget-object v0, Lio/opencensus/tags/TagMetadata$TagTtl;->NO_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;

    invoke-static {v0}, Lio/opencensus/tags/TagMetadata;->create(Lio/opencensus/tags/TagMetadata$TagTtl;)Lio/opencensus/tags/TagMetadata;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/HttpRequestContext;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    return-void
.end method

.method constructor <init>(Lio/opencensus/trace/Span;Lio/opencensus/tags/TagContext;)V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/opencensus/contrib/http/HttpRequestContext;->sentMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/opencensus/contrib/http/HttpRequestContext;->receiveMessageSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 44
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/opencensus/contrib/http/HttpRequestContext;->sentSeqId:Ljava/util/concurrent/atomic/AtomicLong;

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/opencensus/contrib/http/HttpRequestContext;->receviedSeqId:Ljava/util/concurrent/atomic/AtomicLong;

    .line 49
    const-string v0, "span"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    const-string v0, "tagContext"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    iput-object p1, p0, Lio/opencensus/contrib/http/HttpRequestContext;->span:Lio/opencensus/trace/Span;

    .line 52
    iput-object p2, p0, Lio/opencensus/contrib/http/HttpRequestContext;->tagContext:Lio/opencensus/tags/TagContext;

    .line 53
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide p1

    iput-wide p1, p0, Lio/opencensus/contrib/http/HttpRequestContext;->requestStartTime:J

    return-void
.end method
