.class final Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;
.super Lio/opencensus/stats/AggregationData$DistributionData;
.source "AutoValue_AggregationData_DistributionData.java"


# instance fields
.field private final bucketCounts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final count:J

.field private final exemplars:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/metrics/data/Exemplar;",
            ">;"
        }
    .end annotation
.end field

.field private final mean:D

.field private final sumOfSquaredDeviations:D


# direct methods
.method constructor <init>(DJDLjava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DJD",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/data/Exemplar;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Lio/opencensus/stats/AggregationData$DistributionData;-><init>()V

    .line 23
    iput-wide p1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->mean:D

    .line 24
    iput-wide p3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->count:J

    .line 25
    iput-wide p5, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->sumOfSquaredDeviations:D

    if-eqz p7, :cond_1

    .line 29
    iput-object p7, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->bucketCounts:Ljava/util/List;

    if-eqz p8, :cond_0

    .line 33
    iput-object p8, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->exemplars:Ljava/util/List;

    return-void

    .line 31
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null exemplars"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 27
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null bucketCounts"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 77
    :cond_0
    instance-of v1, p1, Lio/opencensus/stats/AggregationData$DistributionData;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 78
    check-cast p1, Lio/opencensus/stats/AggregationData$DistributionData;

    .line 79
    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->mean:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$DistributionData;->getMean()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->count:J

    .line 80
    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$DistributionData;->getCount()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->sumOfSquaredDeviations:D

    .line 81
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$DistributionData;->getSumOfSquaredDeviations()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->bucketCounts:Ljava/util/List;

    .line 82
    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$DistributionData;->getBucketCounts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->exemplars:Ljava/util/List;

    .line 83
    invoke-virtual {p1}, Lio/opencensus/stats/AggregationData$DistributionData;->getExemplars()Ljava/util/List;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getBucketCounts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->bucketCounts:Ljava/util/List;

    return-object v0
.end method

.method public getCount()J
    .locals 2

    .line 43
    iget-wide v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->count:J

    return-wide v0
.end method

.method public getExemplars()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/data/Exemplar;",
            ">;"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->exemplars:Ljava/util/List;

    return-object v0
.end method

.method public getMean()D
    .locals 2

    .line 38
    iget-wide v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->mean:D

    return-wide v0
.end method

.method public getSumOfSquaredDeviations()D
    .locals 2

    .line 48
    iget-wide v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->sumOfSquaredDeviations:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 8

    const v0, 0xf4243

    int-to-long v1, v0

    .line 92
    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->mean:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    const/16 v5, 0x20

    ushr-long/2addr v3, v5

    iget-wide v6, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->mean:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    xor-long/2addr v3, v6

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    int-to-long v1, v2

    .line 94
    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->count:J

    ushr-long v6, v3, v5

    xor-long/2addr v3, v6

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    int-to-long v1, v2

    .line 96
    iget-wide v3, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->sumOfSquaredDeviations:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    ushr-long/2addr v3, v5

    iget-wide v5, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->sumOfSquaredDeviations:D

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    xor-long/2addr v3, v5

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    .line 98
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->bucketCounts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    xor-int/2addr v1, v2

    mul-int v1, v1, v0

    .line 100
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->exemplars:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DistributionData{mean="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->mean:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", count="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->count:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", sumOfSquaredDeviations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->sumOfSquaredDeviations:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", bucketCounts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->bucketCounts:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", exemplars="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_AggregationData_DistributionData;->exemplars:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
