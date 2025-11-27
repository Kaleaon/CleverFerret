.class final Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;
.super Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;
.source "AutoValue_SampledSpanStore_PerSpanNameSummary.java"


# instance fields
.field private final numbersOfErrorSampledSpans:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/opencensus/trace/Status$CanonicalCode;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final numbersOfLatencySampledSpans:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/opencensus/trace/export/SampledSpanStore$LatencyBucketBoundaries;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lio/opencensus/trace/export/SampledSpanStore$LatencyBucketBoundaries;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map<",
            "Lio/opencensus/trace/Status$CanonicalCode;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;-><init>()V

    if-eqz p1, :cond_1

    .line 20
    iput-object p1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfLatencySampledSpans:Ljava/util/Map;

    if-eqz p2, :cond_0

    .line 24
    iput-object p2, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfErrorSampledSpans:Ljava/util/Map;

    return-void

    .line 22
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null numbersOfErrorSampledSpans"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null numbersOfLatencySampledSpans"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 50
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 51
    check-cast p1, Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;

    .line 52
    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfLatencySampledSpans:Ljava/util/Map;

    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;->getNumbersOfLatencySampledSpans()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfErrorSampledSpans:Ljava/util/Map;

    .line 53
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;->getNumbersOfErrorSampledSpans()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getNumbersOfErrorSampledSpans()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lio/opencensus/trace/Status$CanonicalCode;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfErrorSampledSpans:Ljava/util/Map;

    return-object v0
.end method

.method public getNumbersOfLatencySampledSpans()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lio/opencensus/trace/export/SampledSpanStore$LatencyBucketBoundaries;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 29
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfLatencySampledSpans:Ljava/util/Map;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 62
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfLatencySampledSpans:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 64
    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfErrorSampledSpans:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PerSpanNameSummary{numbersOfLatencySampledSpans="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfLatencySampledSpans:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", numbersOfErrorSampledSpans="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_PerSpanNameSummary;->numbersOfErrorSampledSpans:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
