.class public abstract Lio/opencensus/metrics/MetricOptions$Builder;
.super Ljava/lang/Object;
.source "MetricOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/MetricOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Builder"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract autoBuild()Lio/opencensus/metrics/MetricOptions;
.end method

.method public build()Lio/opencensus/metrics/MetricOptions;
    .locals 5

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lio/opencensus/metrics/MetricOptions$Builder;->getLabelKeys()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/opencensus/metrics/MetricOptions$Builder;->setLabelKeys(Ljava/util/List;)Lio/opencensus/metrics/MetricOptions$Builder;

    .line 150
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 152
    invoke-virtual {p0}, Lio/opencensus/metrics/MetricOptions$Builder;->getConstantLabels()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 151
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 150
    invoke-virtual {p0, v0}, Lio/opencensus/metrics/MetricOptions$Builder;->setConstantLabels(Ljava/util/Map;)Lio/opencensus/metrics/MetricOptions$Builder;

    .line 153
    invoke-virtual {p0}, Lio/opencensus/metrics/MetricOptions$Builder;->autoBuild()Lio/opencensus/metrics/MetricOptions;

    move-result-object v0

    .line 154
    invoke-virtual {v0}, Lio/opencensus/metrics/MetricOptions;->getLabelKeys()Ljava/util/List;

    move-result-object v1

    const-string v2, "labelKeys elements"

    invoke-static {v1, v2}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 155
    invoke-virtual {v0}, Lio/opencensus/metrics/MetricOptions;->getConstantLabels()Ljava/util/Map;

    move-result-object v1

    const-string v2, "constantLabels elements"

    invoke-static {v1, v2}, Lio/opencensus/internal/Utils;->checkMapElementNotNull(Ljava/util/Map;Ljava/lang/Object;)V

    .line 157
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 158
    invoke-virtual {v0}, Lio/opencensus/metrics/MetricOptions;->getLabelKeys()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/opencensus/metrics/LabelKey;

    .line 159
    invoke-virtual {v3}, Lio/opencensus/metrics/LabelKey;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 162
    invoke-virtual {v3}, Lio/opencensus/metrics/LabelKey;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid LabelKey in labelKeys"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_1
    invoke-virtual {v0}, Lio/opencensus/metrics/MetricOptions;->getConstantLabels()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 165
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/opencensus/metrics/LabelKey;

    invoke-virtual {v4}, Lio/opencensus/metrics/LabelKey;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 168
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/opencensus/metrics/LabelKey;

    invoke-virtual {v3}, Lio/opencensus/metrics/LabelKey;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 166
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid LabelKey in constantLabels"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    return-object v0
.end method

.method abstract getConstantLabels()Ljava/util/Map;
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

.method abstract getLabelKeys()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setConstantLabels(Ljava/util/Map;)Lio/opencensus/metrics/MetricOptions$Builder;
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
.end method

.method public abstract setDescription(Ljava/lang/String;)Lio/opencensus/metrics/MetricOptions$Builder;
.end method

.method public abstract setLabelKeys(Ljava/util/List;)Lio/opencensus/metrics/MetricOptions$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)",
            "Lio/opencensus/metrics/MetricOptions$Builder;"
        }
    .end annotation
.end method

.method public abstract setUnit(Ljava/lang/String;)Lio/opencensus/metrics/MetricOptions$Builder;
.end method
