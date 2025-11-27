.class final Lio/opencensus/common/AutoValue_ServerStats;
.super Lio/opencensus/common/ServerStats;
.source "AutoValue_ServerStats.java"


# instance fields
.field private final lbLatencyNs:J

.field private final serviceLatencyNs:J

.field private final traceOption:B


# direct methods
.method constructor <init>(JJB)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lio/opencensus/common/ServerStats;-><init>()V

    .line 17
    iput-wide p1, p0, Lio/opencensus/common/AutoValue_ServerStats;->lbLatencyNs:J

    .line 18
    iput-wide p3, p0, Lio/opencensus/common/AutoValue_ServerStats;->serviceLatencyNs:J

    .line 19
    iput-byte p5, p0, Lio/opencensus/common/AutoValue_ServerStats;->traceOption:B

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 51
    :cond_0
    instance-of v1, p1, Lio/opencensus/common/ServerStats;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 52
    check-cast p1, Lio/opencensus/common/ServerStats;

    .line 53
    iget-wide v3, p0, Lio/opencensus/common/AutoValue_ServerStats;->lbLatencyNs:J

    invoke-virtual {p1}, Lio/opencensus/common/ServerStats;->getLbLatencyNs()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lio/opencensus/common/AutoValue_ServerStats;->serviceLatencyNs:J

    .line 54
    invoke-virtual {p1}, Lio/opencensus/common/ServerStats;->getServiceLatencyNs()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-byte v1, p0, Lio/opencensus/common/AutoValue_ServerStats;->traceOption:B

    .line 55
    invoke-virtual {p1}, Lio/opencensus/common/ServerStats;->getTraceOption()B

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getLbLatencyNs()J
    .locals 2

    .line 24
    iget-wide v0, p0, Lio/opencensus/common/AutoValue_ServerStats;->lbLatencyNs:J

    return-wide v0
.end method

.method public getServiceLatencyNs()J
    .locals 2

    .line 29
    iget-wide v0, p0, Lio/opencensus/common/AutoValue_ServerStats;->serviceLatencyNs:J

    return-wide v0
.end method

.method public getTraceOption()B
    .locals 1

    .line 34
    iget-byte v0, p0, Lio/opencensus/common/AutoValue_ServerStats;->traceOption:B

    return v0
.end method

.method public hashCode()I
    .locals 8

    const v0, 0xf4243

    int-to-long v1, v0

    .line 64
    iget-wide v3, p0, Lio/opencensus/common/AutoValue_ServerStats;->lbLatencyNs:J

    const/16 v5, 0x20

    ushr-long v6, v3, v5

    xor-long/2addr v3, v6

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    int-to-long v1, v2

    .line 66
    iget-wide v3, p0, Lio/opencensus/common/AutoValue_ServerStats;->serviceLatencyNs:J

    ushr-long v5, v3, v5

    xor-long/2addr v3, v5

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    .line 68
    iget-byte v0, p0, Lio/opencensus/common/AutoValue_ServerStats;->traceOption:B

    xor-int/2addr v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ServerStats{lbLatencyNs="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/opencensus/common/AutoValue_ServerStats;->lbLatencyNs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", serviceLatencyNs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/common/AutoValue_ServerStats;->serviceLatencyNs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", traceOption="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-byte v1, p0, Lio/opencensus/common/AutoValue_ServerStats;->traceOption:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
