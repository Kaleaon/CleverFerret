.class final Lio/opencensus/metrics/AutoValue_MetricOptions;
.super Lio/opencensus/metrics/MetricOptions;
.source "AutoValue_MetricOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;
    }
.end annotation


# instance fields
.field private final constantLabels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation
.end field

.field private final description:Ljava/lang/String;

.field private final labelKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;"
        }
    .end annotation
.end field

.field private final unit:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;",
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Lio/opencensus/metrics/MetricOptions;-><init>()V

    .line 21
    iput-object p1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->description:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->unit:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->labelKeys:Ljava/util/List;

    .line 24
    iput-object p4, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->constantLabels:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lio/opencensus/metrics/AutoValue_MetricOptions$1;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3, p4}, Lio/opencensus/metrics/AutoValue_MetricOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 62
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/MetricOptions;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 63
    check-cast p1, Lio/opencensus/metrics/MetricOptions;

    .line 64
    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->description:Ljava/lang/String;

    invoke-virtual {p1}, Lio/opencensus/metrics/MetricOptions;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->unit:Ljava/lang/String;

    .line 65
    invoke-virtual {p1}, Lio/opencensus/metrics/MetricOptions;->getUnit()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->labelKeys:Ljava/util/List;

    .line 66
    invoke-virtual {p1}, Lio/opencensus/metrics/MetricOptions;->getLabelKeys()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->constantLabels:Ljava/util/Map;

    .line 67
    invoke-virtual {p1}, Lio/opencensus/metrics/MetricOptions;->getConstantLabels()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getConstantLabels()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->constantLabels:Ljava/util/Map;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getLabelKeys()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->labelKeys:Ljava/util/List;

    return-object v0
.end method

.method public getUnit()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->unit:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 76
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->description:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 78
    iget-object v2, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->unit:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 80
    iget-object v2, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->labelKeys:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 82
    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->constantLabels:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MetricOptions{description="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", unit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->unit:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", labelKeys="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->labelKeys:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", constantLabels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions;->constantLabels:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
