.class final Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;
.super Lio/opencensus/metrics/MetricOptions$Builder;
.source "AutoValue_MetricOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/AutoValue_MetricOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private constantLabels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation
.end field

.field private description:Ljava/lang/String;

.field private labelKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;"
        }
    .end annotation
.end field

.field private unit:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Lio/opencensus/metrics/MetricOptions$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method autoBuild()Lio/opencensus/metrics/MetricOptions;
    .locals 8

    .line 142
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->description:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 143
    const-string v0, " description"

    goto :goto_0

    .line 142
    :cond_0
    const-string v0, ""

    .line 145
    :goto_0
    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->unit:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " unit"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 148
    :cond_1
    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->labelKeys:Ljava/util/List;

    if-nez v1, :cond_2

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " labelKeys"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 151
    :cond_2
    iget-object v1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->constantLabels:Ljava/util/Map;

    if-nez v1, :cond_3

    .line 152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " constantLabels"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 154
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 157
    new-instance v2, Lio/opencensus/metrics/AutoValue_MetricOptions;

    iget-object v3, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->description:Ljava/lang/String;

    iget-object v4, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->unit:Ljava/lang/String;

    iget-object v5, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->labelKeys:Ljava/util/List;

    iget-object v6, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->constantLabels:Ljava/util/Map;

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lio/opencensus/metrics/AutoValue_MetricOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lio/opencensus/metrics/AutoValue_MetricOptions$1;)V

    return-object v2

    .line 155
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Missing required properties:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getConstantLabels()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->constantLabels:Ljava/util/Map;

    if-eqz v0, :cond_0

    return-object v0

    .line 135
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Property \"constantLabels\" has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getLabelKeys()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;"
        }
    .end annotation

    .line 119
    iget-object v0, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->labelKeys:Ljava/util/List;

    if-eqz v0, :cond_0

    return-object v0

    .line 120
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Property \"labelKeys\" has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setConstantLabels(Ljava/util/Map;)Lio/opencensus/metrics/MetricOptions$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)",
            "Lio/opencensus/metrics/MetricOptions$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 129
    iput-object p1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->constantLabels:Ljava/util/Map;

    return-object p0

    .line 127
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null constantLabels"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDescription(Ljava/lang/String;)Lio/opencensus/metrics/MetricOptions$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 98
    iput-object p1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->description:Ljava/lang/String;

    return-object p0

    .line 96
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null description"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLabelKeys(Ljava/util/List;)Lio/opencensus/metrics/MetricOptions$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)",
            "Lio/opencensus/metrics/MetricOptions$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 114
    iput-object p1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->labelKeys:Ljava/util/List;

    return-object p0

    .line 112
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null labelKeys"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setUnit(Ljava/lang/String;)Lio/opencensus/metrics/MetricOptions$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 106
    iput-object p1, p0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->unit:Ljava/lang/String;

    return-object p0

    .line 104
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null unit"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
