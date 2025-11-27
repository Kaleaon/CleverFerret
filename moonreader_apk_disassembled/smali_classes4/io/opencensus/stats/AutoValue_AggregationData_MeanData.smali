.class final Lio/opencensus/stats/AutoValue_AggregationData_MeanData;
.super Lio/opencensus/stats/AggregationData$MeanData;
.source "AutoValue_AggregationData_MeanData.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final count:J

.field private final mean:D


# direct methods
.method constructor <init>(DJ)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lio/opencensus/stats/AggregationData$MeanData;-><init>()V

    .line 17
    iput-wide p1, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->mean:D

    .line 18
    iput-wide p3, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->count:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 44
    :cond_0
    instance-of v1, p1, Lio/opencensus/stats/AggregationData$MeanData;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 45
    check-cast p1, Lio/opencensus/stats/AggregationData$MeanData;

    .line 46
    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->mean:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$MeanData;->getMean()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->count:J

    .line 47
    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$MeanData;->getCount()J

    move-result-wide v5

    cmp-long p1, v3, v5

    if-nez p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getCount()J
    .locals 2

    .line 28
    iget-wide v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->count:J

    return-wide v0
.end method

.method public getMean()D
    .locals 2

    .line 23
    iget-wide v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->mean:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 8

    const v0, 0xf4243

    int-to-long v1, v0

    .line 56
    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->mean:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    const/16 v5, 0x20

    ushr-long/2addr v3, v5

    iget-wide v6, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->mean:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    xor-long/2addr v3, v6

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    int-to-long v0, v2

    .line 58
    iget-wide v2, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->count:J

    ushr-long v4, v2, v5

    xor-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MeanData{mean="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->mean:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", count="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_MeanData;->count:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
