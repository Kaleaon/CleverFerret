.class public abstract Lio/opencensus/metrics/MetricOptions;
.super Ljava/lang/Object;
.source "MetricOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/MetricOptions$Builder;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static builder()Lio/opencensus/metrics/MetricOptions$Builder;
    .locals 2

    .line 85
    new-instance v0, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;

    invoke-direct {v0}, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;-><init>()V

    const-string v1, ""

    .line 86
    invoke-virtual {v0, v1}, Lio/opencensus/metrics/AutoValue_MetricOptions$Builder;->setDescription(Ljava/lang/String;)Lio/opencensus/metrics/MetricOptions$Builder;

    move-result-object v0

    const-string v1, "1"

    .line 87
    invoke-virtual {v0, v1}, Lio/opencensus/metrics/MetricOptions$Builder;->setUnit(Ljava/lang/String;)Lio/opencensus/metrics/MetricOptions$Builder;

    move-result-object v0

    .line 88
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/opencensus/metrics/MetricOptions$Builder;->setLabelKeys(Ljava/util/List;)Lio/opencensus/metrics/MetricOptions$Builder;

    move-result-object v0

    .line 89
    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lio/opencensus/metrics/MetricOptions$Builder;->setConstantLabels(Ljava/util/Map;)Lio/opencensus/metrics/MetricOptions$Builder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract getConstantLabels()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lio/opencensus/metrics/LabelKey;",
            "Lio/opencensus/metrics/LabelValue;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDescription()Ljava/lang/String;
.end method

.method public abstract getLabelKeys()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUnit()Ljava/lang/String;
.end method
