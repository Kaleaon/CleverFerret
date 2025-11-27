.class final Lio/opencensus/trace/samplers/NeverSampleSampler;
.super Lio/opencensus/trace/Sampler;
.source "NeverSampleSampler.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lio/opencensus/trace/Sampler;-><init>()V

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 48
    invoke-virtual {p0}, Lio/opencensus/trace/samplers/NeverSampleSampler;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public shouldSample(Lio/opencensus/trace/SpanContext;Ljava/lang/Boolean;Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Ljava/lang/String;Ljava/util/List;)Z
    .locals 0
    .param p1    # Lio/opencensus/trace/SpanContext;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Boolean;
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

    const/4 p1, 0x0

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 53
    const-string v0, "NeverSampleSampler"

    return-object v0
.end method
