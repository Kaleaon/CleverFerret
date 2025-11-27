.class final Lio/opencensus/metrics/export/AutoValue_Distribution;
.super Lio/opencensus/metrics/export/Distribution;
.source "AutoValue_Distribution.java"


# instance fields
.field private final bucketOptions:Lio/opencensus/metrics/export/Distribution$BucketOptions;

.field private final buckets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Distribution$Bucket;",
            ">;"
        }
    .end annotation
.end field

.field private final count:J

.field private final sum:D

.field private final sumOfSquaredDeviations:D


# direct methods
.method constructor <init>(JDDLio/opencensus/metrics/export/Distribution$BucketOptions;Ljava/util/List;)V
    .locals 0
    .param p7    # Lio/opencensus/metrics/export/Distribution$BucketOptions;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JDD",
            "Lio/opencensus/metrics/export/Distribution$BucketOptions;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Distribution$Bucket;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Lio/opencensus/metrics/export/Distribution;-><init>()V

    .line 23
    iput-wide p1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->count:J

    .line 24
    iput-wide p3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sum:D

    .line 25
    iput-wide p5, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sumOfSquaredDeviations:D

    .line 26
    iput-object p7, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->bucketOptions:Lio/opencensus/metrics/export/Distribution$BucketOptions;

    if-eqz p8, :cond_0

    .line 30
    iput-object p8, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->buckets:Ljava/util/List;

    return-void

    .line 28
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null buckets"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 75
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/export/Distribution;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 76
    check-cast p1, Lio/opencensus/metrics/export/Distribution;

    .line 77
    iget-wide v3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->count:J

    invoke-virtual {p1}, Lio/opencensus/metrics/export/Distribution;->getCount()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-wide v3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sum:D

    .line 78
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-virtual {p1}, Lio/opencensus/metrics/export/Distribution;->getSum()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-wide v3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sumOfSquaredDeviations:D

    .line 79
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-virtual {p1}, Lio/opencensus/metrics/export/Distribution;->getSumOfSquaredDeviations()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->bucketOptions:Lio/opencensus/metrics/export/Distribution$BucketOptions;

    if-nez v1, :cond_1

    .line 80
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Distribution;->getBucketOptions()Lio/opencensus/metrics/export/Distribution$BucketOptions;

    move-result-object v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Distribution;->getBucketOptions()Lio/opencensus/metrics/export/Distribution$BucketOptions;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :goto_0
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->buckets:Ljava/util/List;

    .line 81
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Distribution;->getBuckets()Ljava/util/List;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public getBucketOptions()Lio/opencensus/metrics/export/Distribution$BucketOptions;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 51
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->bucketOptions:Lio/opencensus/metrics/export/Distribution$BucketOptions;

    return-object v0
.end method

.method public getBuckets()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Distribution$Bucket;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->buckets:Ljava/util/List;

    return-object v0
.end method

.method public getCount()J
    .locals 2

    .line 35
    iget-wide v0, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->count:J

    return-wide v0
.end method

.method public getSum()D
    .locals 2

    .line 40
    iget-wide v0, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sum:D

    return-wide v0
.end method

.method public getSumOfSquaredDeviations()D
    .locals 2

    .line 45
    iget-wide v0, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sumOfSquaredDeviations:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 8

    const v0, 0xf4243

    int-to-long v1, v0

    .line 90
    iget-wide v3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->count:J

    const/16 v5, 0x20

    ushr-long v6, v3, v5

    xor-long/2addr v3, v6

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    int-to-long v1, v2

    .line 92
    iget-wide v3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sum:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    ushr-long/2addr v3, v5

    iget-wide v6, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sum:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    xor-long/2addr v3, v6

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    int-to-long v1, v2

    .line 94
    iget-wide v3, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sumOfSquaredDeviations:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    ushr-long/2addr v3, v5

    iget-wide v5, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sumOfSquaredDeviations:D

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    xor-long/2addr v3, v5

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    .line 96
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->bucketOptions:Lio/opencensus/metrics/export/Distribution$BucketOptions;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v1, v2

    mul-int v1, v1, v0

    .line 98
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->buckets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Distribution{count="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->count:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", sum="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sum:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", sumOfSquaredDeviations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->sumOfSquaredDeviations:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", bucketOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->bucketOptions:Lio/opencensus/metrics/export/Distribution$BucketOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", buckets="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Distribution;->buckets:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
