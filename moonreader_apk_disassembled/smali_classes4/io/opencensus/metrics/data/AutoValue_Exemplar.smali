.class final Lio/opencensus/metrics/data/AutoValue_Exemplar;
.super Lio/opencensus/metrics/data/Exemplar;
.source "AutoValue_Exemplar.java"


# instance fields
.field private final attachments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/metrics/data/AttachmentValue;",
            ">;"
        }
    .end annotation
.end field

.field private final timestamp:Lio/opencensus/common/Timestamp;

.field private final value:D


# direct methods
.method constructor <init>(DLio/opencensus/common/Timestamp;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D",
            "Lio/opencensus/common/Timestamp;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/metrics/data/AttachmentValue;",
            ">;)V"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Lio/opencensus/metrics/data/Exemplar;-><init>()V

    .line 19
    iput-wide p1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->value:D

    if-eqz p3, :cond_1

    .line 23
    iput-object p3, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->timestamp:Lio/opencensus/common/Timestamp;

    if-eqz p4, :cond_0

    .line 27
    iput-object p4, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->attachments:Ljava/util/Map;

    return-void

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null attachments"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 21
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null timestamp"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 59
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/data/Exemplar;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 60
    check-cast p1, Lio/opencensus/metrics/data/Exemplar;

    .line 61
    iget-wide v3, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->value:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-virtual {p1}, Lio/opencensus/metrics/data/Exemplar;->getValue()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->timestamp:Lio/opencensus/common/Timestamp;

    .line 62
    invoke-virtual {p1}, Lio/opencensus/metrics/data/Exemplar;->getTimestamp()Lio/opencensus/common/Timestamp;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->attachments:Ljava/util/Map;

    .line 63
    invoke-virtual {p1}, Lio/opencensus/metrics/data/Exemplar;->getAttachments()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getAttachments()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/metrics/data/AttachmentValue;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->attachments:Ljava/util/Map;

    return-object v0
.end method

.method public getTimestamp()Lio/opencensus/common/Timestamp;
    .locals 1

    .line 37
    iget-object v0, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->timestamp:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public getValue()D
    .locals 2

    .line 32
    iget-wide v0, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->value:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 7

    const v0, 0xf4243

    int-to-long v1, v0

    .line 72
    iget-wide v3, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->value:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    const/16 v5, 0x20

    ushr-long/2addr v3, v5

    iget-wide v5, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->value:D

    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    xor-long/2addr v3, v5

    xor-long/2addr v1, v3

    long-to-int v2, v1

    mul-int v2, v2, v0

    .line 74
    iget-object v1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->timestamp:Lio/opencensus/common/Timestamp;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v1, v2

    mul-int v1, v1, v0

    .line 76
    iget-object v0, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->attachments:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Exemplar{value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->value:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->timestamp:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", attachments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/data/AutoValue_Exemplar;->attachments:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
