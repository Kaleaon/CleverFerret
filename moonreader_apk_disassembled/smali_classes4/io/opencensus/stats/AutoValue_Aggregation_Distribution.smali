.class final Lio/opencensus/stats/AutoValue_Aggregation_Distribution;
.super Lio/opencensus/stats/Aggregation$Distribution;
.source "AutoValue_Aggregation_Distribution.java"


# instance fields
.field private final bucketBoundaries:Lio/opencensus/stats/BucketBoundaries;


# direct methods
.method constructor <init>(Lio/opencensus/stats/BucketBoundaries;)V
    .locals 1

    .line 12
    invoke-direct {p0}, Lio/opencensus/stats/Aggregation$Distribution;-><init>()V

    if-eqz p1, :cond_0

    .line 16
    iput-object p1, p0, Lio/opencensus/stats/AutoValue_Aggregation_Distribution;->bucketBoundaries:Lio/opencensus/stats/BucketBoundaries;

    return-void

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null bucketBoundaries"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 36
    :cond_0
    instance-of v0, p1, Lio/opencensus/stats/Aggregation$Distribution;

    if-eqz v0, :cond_1

    .line 37
    check-cast p1, Lio/opencensus/stats/Aggregation$Distribution;

    .line 38
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_Aggregation_Distribution;->bucketBoundaries:Lio/opencensus/stats/BucketBoundaries;

    invoke-virtual {p1}, Lio/opencensus/stats/Aggregation$Distribution;->getBucketBoundaries()Lio/opencensus/stats/BucketBoundaries;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getBucketBoundaries()Lio/opencensus/stats/BucketBoundaries;
    .locals 1

    .line 21
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_Aggregation_Distribution;->bucketBoundaries:Lio/opencensus/stats/BucketBoundaries;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 47
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_Aggregation_Distribution;->bucketBoundaries:Lio/opencensus/stats/BucketBoundaries;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Distribution{bucketBoundaries="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_Aggregation_Distribution;->bucketBoundaries:Lio/opencensus/stats/BucketBoundaries;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
