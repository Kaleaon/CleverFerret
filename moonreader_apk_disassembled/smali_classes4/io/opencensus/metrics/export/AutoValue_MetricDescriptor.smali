.class final Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;
.super Lio/opencensus/metrics/export/MetricDescriptor;
.source "AutoValue_MetricDescriptor.java"


# instance fields
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

.field private final name:Ljava/lang/String;

.field private final type:Lio/opencensus/metrics/export/MetricDescriptor$Type;

.field private final unit:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/opencensus/metrics/export/MetricDescriptor$Type;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/opencensus/metrics/export/MetricDescriptor$Type;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Lio/opencensus/metrics/export/MetricDescriptor;-><init>()V

    if-eqz p1, :cond_4

    .line 26
    iput-object p1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->name:Ljava/lang/String;

    if-eqz p2, :cond_3

    .line 30
    iput-object p2, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->description:Ljava/lang/String;

    if-eqz p3, :cond_2

    .line 34
    iput-object p3, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->unit:Ljava/lang/String;

    if-eqz p4, :cond_1

    .line 38
    iput-object p4, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->type:Lio/opencensus/metrics/export/MetricDescriptor$Type;

    if-eqz p5, :cond_0

    .line 42
    iput-object p5, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->labelKeys:Ljava/util/List;

    return-void

    .line 40
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null labelKeys"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 36
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null type"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null unit"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null description"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 24
    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null name"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 86
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/export/MetricDescriptor;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 87
    check-cast p1, Lio/opencensus/metrics/export/MetricDescriptor;

    .line 88
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lio/opencensus/metrics/export/MetricDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->description:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Lio/opencensus/metrics/export/MetricDescriptor;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->unit:Ljava/lang/String;

    .line 90
    invoke-virtual {p1}, Lio/opencensus/metrics/export/MetricDescriptor;->getUnit()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->type:Lio/opencensus/metrics/export/MetricDescriptor$Type;

    .line 91
    invoke-virtual {p1}, Lio/opencensus/metrics/export/MetricDescriptor;->getType()Lio/opencensus/metrics/export/MetricDescriptor$Type;

    move-result-object v3

    invoke-virtual {v1, v3}, Lio/opencensus/metrics/export/MetricDescriptor$Type;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->labelKeys:Ljava/util/List;

    .line 92
    invoke-virtual {p1}, Lio/opencensus/metrics/export/MetricDescriptor;->getLabelKeys()Ljava/util/List;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->description:Ljava/lang/String;

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

    .line 67
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->labelKeys:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lio/opencensus/metrics/export/MetricDescriptor$Type;
    .locals 1

    .line 62
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->type:Lio/opencensus/metrics/export/MetricDescriptor$Type;

    return-object v0
.end method

.method public getUnit()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->unit:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 101
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 103
    iget-object v2, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->description:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 105
    iget-object v2, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->unit:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 107
    iget-object v2, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->type:Lio/opencensus/metrics/export/MetricDescriptor$Type;

    invoke-virtual {v2}, Lio/opencensus/metrics/export/MetricDescriptor$Type;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 109
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->labelKeys:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MetricDescriptor{name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", unit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->unit:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->type:Lio/opencensus/metrics/export/MetricDescriptor$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", labelKeys="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_MetricDescriptor;->labelKeys:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
