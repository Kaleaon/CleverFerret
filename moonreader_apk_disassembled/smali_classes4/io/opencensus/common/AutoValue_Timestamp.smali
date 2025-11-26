.class final Lio/opencensus/common/AutoValue_Timestamp;
.super Lio/opencensus/common/Timestamp;
.source "AutoValue_Timestamp.java"


# instance fields
.field private final nanos:I

.field private final seconds:J


# direct methods
.method constructor <init>(JI)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lio/opencensus/common/Timestamp;-><init>()V

    .line 15
    iput-wide p1, p0, Lio/opencensus/common/AutoValue_Timestamp;->seconds:J

    .line 16
    iput p3, p0, Lio/opencensus/common/AutoValue_Timestamp;->nanos:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 42
    :cond_0
    instance-of v1, p1, Lio/opencensus/common/Timestamp;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 43
    check-cast p1, Lio/opencensus/common/Timestamp;

    .line 44
    iget-wide v3, p0, Lio/opencensus/common/AutoValue_Timestamp;->seconds:J

    invoke-virtual {p1}, Lio/opencensus/common/Timestamp;->getSeconds()J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget v1, p0, Lio/opencensus/common/AutoValue_Timestamp;->nanos:I

    .line 45
    invoke-virtual {p1}, Lio/opencensus/common/Timestamp;->getNanos()I

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getNanos()I
    .locals 1

    .line 26
    iget v0, p0, Lio/opencensus/common/AutoValue_Timestamp;->nanos:I

    return v0
.end method

.method public getSeconds()J
    .locals 2

    .line 21
    iget-wide v0, p0, Lio/opencensus/common/AutoValue_Timestamp;->seconds:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 7

    const v0, 0xf4243

    int-to-long v1, v0

    .line 54
    iget-wide v3, p0, Lio/opencensus/common/AutoValue_Timestamp;->seconds:J

    const/16 v5, 0x20

    ushr-long v5, v3, v5

    xor-long/2addr v3, v5

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    .line 56
    iget v0, p0, Lio/opencensus/common/AutoValue_Timestamp;->nanos:I

    xor-int/2addr v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Timestamp{seconds="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/opencensus/common/AutoValue_Timestamp;->seconds:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", nanos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/common/AutoValue_Timestamp;->nanos:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
