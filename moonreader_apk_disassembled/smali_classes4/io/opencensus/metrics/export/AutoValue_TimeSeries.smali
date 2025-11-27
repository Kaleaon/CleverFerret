.class final Lio/opencensus/metrics/export/AutoValue_TimeSeries;
.super Lio/opencensus/metrics/export/TimeSeries;
.source "AutoValue_TimeSeries.java"


# instance fields
.field private final labelValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation
.end field

.field private final points:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Point;",
            ">;"
        }
    .end annotation
.end field

.field private final startTimestamp:Lio/opencensus/common/Timestamp;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Lio/opencensus/common/Timestamp;)V
    .locals 0
    .param p3    # Lio/opencensus/common/Timestamp;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Point;",
            ">;",
            "Lio/opencensus/common/Timestamp;",
            ")V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Lio/opencensus/metrics/export/TimeSeries;-><init>()V

    if-eqz p1, :cond_1

    .line 24
    iput-object p1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->labelValues:Ljava/util/List;

    if-eqz p2, :cond_0

    .line 28
    iput-object p2, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->points:Ljava/util/List;

    .line 29
    iput-object p3, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->startTimestamp:Lio/opencensus/common/Timestamp;

    return-void

    .line 26
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null points"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 22
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null labelValues"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 62
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/export/TimeSeries;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 63
    check-cast p1, Lio/opencensus/metrics/export/TimeSeries;

    .line 64
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->labelValues:Ljava/util/List;

    invoke-virtual {p1}, Lio/opencensus/metrics/export/TimeSeries;->getLabelValues()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->points:Ljava/util/List;

    .line 65
    invoke-virtual {p1}, Lio/opencensus/metrics/export/TimeSeries;->getPoints()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->startTimestamp:Lio/opencensus/common/Timestamp;

    if-nez v1, :cond_1

    .line 66
    invoke-virtual {p1}, Lio/opencensus/metrics/export/TimeSeries;->getStartTimestamp()Lio/opencensus/common/Timestamp;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lio/opencensus/metrics/export/TimeSeries;->getStartTimestamp()Lio/opencensus/common/Timestamp;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getLabelValues()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->labelValues:Ljava/util/List;

    return-object v0
.end method

.method public getPoints()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Point;",
            ">;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->points:Ljava/util/List;

    return-object v0
.end method

.method public getStartTimestamp()Lio/opencensus/common/Timestamp;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 45
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->startTimestamp:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 75
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->labelValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 77
    iget-object v2, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->points:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 79
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->startTimestamp:Lio/opencensus/common/Timestamp;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TimeSeries{labelValues="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->labelValues:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", points="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->points:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", startTimestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_TimeSeries;->startTimestamp:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
