.class final Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;
.super Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;
.source "AutoValue_SampledSpanStore_LatencyFilter.java"


# instance fields
.field private final latencyLowerNs:J

.field private final latencyUpperNs:J

.field private final maxSpansToReturn:I

.field private final spanName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JJI)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;-><init>()V

    if-eqz p1, :cond_0

    .line 22
    iput-object p1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->spanName:Ljava/lang/String;

    .line 23
    iput-wide p2, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyLowerNs:J

    .line 24
    iput-wide p4, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyUpperNs:J

    .line 25
    iput p6, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->maxSpansToReturn:I

    return-void

    .line 20
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null spanName"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 63
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 64
    check-cast p1, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;

    .line 65
    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->spanName:Ljava/lang/String;

    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;->getSpanName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-wide v3, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyLowerNs:J

    .line 66
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;->getLatencyLowerNs()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyUpperNs:J

    .line 67
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;->getLatencyUpperNs()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->maxSpansToReturn:I

    .line 68
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;->getMaxSpansToReturn()I

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getLatencyLowerNs()J
    .locals 2

    .line 35
    iget-wide v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyLowerNs:J

    return-wide v0
.end method

.method public getLatencyUpperNs()J
    .locals 2

    .line 40
    iget-wide v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyUpperNs:J

    return-wide v0
.end method

.method public getMaxSpansToReturn()I
    .locals 1

    .line 45
    iget v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->maxSpansToReturn:I

    return v0
.end method

.method public getSpanName()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->spanName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 77
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->spanName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    int-to-long v2, v0

    .line 79
    iget-wide v4, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyLowerNs:J

    const/16 v0, 0x20

    ushr-long v6, v4, v0

    xor-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v3, v2

    mul-int v3, v3, v1

    int-to-long v2, v3

    .line 81
    iget-wide v4, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyUpperNs:J

    ushr-long v6, v4, v0

    xor-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v0, v2

    mul-int v0, v0, v1

    .line 83
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->maxSpansToReturn:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LatencyFilter{spanName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->spanName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", latencyLowerNs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyLowerNs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", latencyUpperNs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->latencyUpperNs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", maxSpansToReturn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;->maxSpansToReturn:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
