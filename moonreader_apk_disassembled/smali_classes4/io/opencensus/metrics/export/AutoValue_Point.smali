.class final Lio/opencensus/metrics/export/AutoValue_Point;
.super Lio/opencensus/metrics/export/Point;
.source "AutoValue_Point.java"


# instance fields
.field private final timestamp:Lio/opencensus/common/Timestamp;

.field private final value:Lio/opencensus/metrics/export/Value;


# direct methods
.method constructor <init>(Lio/opencensus/metrics/export/Value;Lio/opencensus/common/Timestamp;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lio/opencensus/metrics/export/Point;-><init>()V

    if-eqz p1, :cond_1

    .line 19
    iput-object p1, p0, Lio/opencensus/metrics/export/AutoValue_Point;->value:Lio/opencensus/metrics/export/Value;

    if-eqz p2, :cond_0

    .line 23
    iput-object p2, p0, Lio/opencensus/metrics/export/AutoValue_Point;->timestamp:Lio/opencensus/common/Timestamp;

    return-void

    .line 21
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null timestamp"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 17
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null value"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 49
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/export/Point;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 50
    check-cast p1, Lio/opencensus/metrics/export/Point;

    .line 51
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Point;->value:Lio/opencensus/metrics/export/Value;

    invoke-virtual {p1}, Lio/opencensus/metrics/export/Point;->getValue()Lio/opencensus/metrics/export/Value;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Point;->timestamp:Lio/opencensus/common/Timestamp;

    .line 52
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Point;->getTimestamp()Lio/opencensus/common/Timestamp;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getTimestamp()Lio/opencensus/common/Timestamp;
    .locals 1

    .line 33
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Point;->timestamp:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public getValue()Lio/opencensus/metrics/export/Value;
    .locals 1

    .line 28
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Point;->value:Lio/opencensus/metrics/export/Value;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 61
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Point;->value:Lio/opencensus/metrics/export/Value;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 63
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Point;->timestamp:Lio/opencensus/common/Timestamp;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Point{value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Point;->value:Lio/opencensus/metrics/export/Value;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Point;->timestamp:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
