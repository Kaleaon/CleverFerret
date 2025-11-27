.class abstract Lio/opencensus/trace/samplers/ProbabilitySampler;
.super Lio/opencensus/trace/Sampler;
.source "ProbabilitySampler.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lio/opencensus/trace/Sampler;-><init>()V

    return-void
.end method

.method static create(D)Lio/opencensus/trace/samplers/ProbabilitySampler;
    .locals 5

    const-wide/16 v0, 0x0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v4, p0, v0

    if-ltz v4, :cond_0

    cmpg-double v0, p0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 56
    :goto_0
    const-string v1, "probability must be in range [0.0, 1.0]"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    if-nez v4, :cond_1

    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_1

    :cond_1
    cmpl-double v0, p0, v2

    if-nez v0, :cond_2

    const-wide v0, 0x7fffffffffffffffL

    goto :goto_1

    :cond_2
    const-wide/high16 v0, 0x43e0000000000000L    # 9.223372036854776E18

    mul-double v0, v0, p0

    double-to-long v0, v0

    .line 70
    :goto_1
    new-instance v2, Lio/opencensus/trace/samplers/AutoValue_ProbabilitySampler;

    invoke-direct {v2, p0, p1, v0, v1}, Lio/opencensus/trace/samplers/AutoValue_ProbabilitySampler;-><init>(DJ)V

    return-object v2
.end method


# virtual methods
.method public final getDescription()Ljava/lang/String;
    .locals 3

    .line 105
    invoke-virtual {p0}, Lio/opencensus/trace/samplers/ProbabilitySampler;->getProbability()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "ProbabilitySampler{%.6f}"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method abstract getIdUpperBound()J
.end method

.method abstract getProbability()D
.end method

.method public final shouldSample(Lio/opencensus/trace/SpanContext;Ljava/lang/Boolean;Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Ljava/lang/String;Ljava/util/List;)Z
    .locals 0
    .param p1    # Lio/opencensus/trace/SpanContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/SpanContext;",
            "Ljava/lang/Boolean;",
            "Lio/opencensus/trace/TraceId;",
            "Lio/opencensus/trace/SpanId;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Span;",
            ">;)Z"
        }
    .end annotation

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    .line 82
    invoke-virtual {p1}, Lio/opencensus/trace/SpanContext;->getTraceOptions()Lio/opencensus/trace/TraceOptions;

    move-result-object p1

    invoke-virtual {p1}, Lio/opencensus/trace/TraceOptions;->isSampled()Z

    move-result p1

    if-eqz p1, :cond_0

    return p2

    :cond_0
    if-eqz p6, :cond_2

    .line 87
    invoke-interface {p6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lio/opencensus/trace/Span;

    .line 88
    invoke-virtual {p4}, Lio/opencensus/trace/Span;->getContext()Lio/opencensus/trace/SpanContext;

    move-result-object p4

    invoke-virtual {p4}, Lio/opencensus/trace/SpanContext;->getTraceOptions()Lio/opencensus/trace/TraceOptions;

    move-result-object p4

    invoke-virtual {p4}, Lio/opencensus/trace/TraceOptions;->isSampled()Z

    move-result p4

    if-eqz p4, :cond_1

    return p2

    .line 100
    :cond_2
    invoke-virtual {p3}, Lio/opencensus/trace/TraceId;->getLowerLong()J

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/Math;->abs(J)J

    move-result-wide p3

    invoke-virtual {p0}, Lio/opencensus/trace/samplers/ProbabilitySampler;->getIdUpperBound()J

    move-result-wide p5

    cmp-long p1, p3, p5

    if-gez p1, :cond_3

    return p2

    :cond_3
    const/4 p1, 0x0

    return p1
.end method
