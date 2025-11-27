.class final Lio/opencensus/stats/AutoValue_ViewData;
.super Lio/opencensus/stats/ViewData;
.source "AutoValue_ViewData.java"


# instance fields
.field private final aggregationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;",
            "Lio/opencensus/stats/AggregationData;",
            ">;"
        }
    .end annotation
.end field

.field private final end:Lio/opencensus/common/Timestamp;

.field private final start:Lio/opencensus/common/Timestamp;

.field private final view:Lio/opencensus/stats/View;

.field private final windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;


# direct methods
.method constructor <init>(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View;",
            "Ljava/util/Map<",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;",
            "Lio/opencensus/stats/AggregationData;",
            ">;",
            "Lio/opencensus/stats/ViewData$AggregationWindowData;",
            "Lio/opencensus/common/Timestamp;",
            "Lio/opencensus/common/Timestamp;",
            ")V"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Lio/opencensus/stats/ViewData;-><init>()V

    if-eqz p1, :cond_4

    .line 30
    iput-object p1, p0, Lio/opencensus/stats/AutoValue_ViewData;->view:Lio/opencensus/stats/View;

    if-eqz p2, :cond_3

    .line 34
    iput-object p2, p0, Lio/opencensus/stats/AutoValue_ViewData;->aggregationMap:Ljava/util/Map;

    if-eqz p3, :cond_2

    .line 38
    iput-object p3, p0, Lio/opencensus/stats/AutoValue_ViewData;->windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    if-eqz p4, :cond_1

    .line 42
    iput-object p4, p0, Lio/opencensus/stats/AutoValue_ViewData;->start:Lio/opencensus/common/Timestamp;

    if-eqz p5, :cond_0

    .line 46
    iput-object p5, p0, Lio/opencensus/stats/AutoValue_ViewData;->end:Lio/opencensus/common/Timestamp;

    return-void

    .line 44
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null end"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null start"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 36
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null windowData"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null aggregationMap"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null view"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 91
    :cond_0
    instance-of v1, p1, Lio/opencensus/stats/ViewData;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 92
    check-cast p1, Lio/opencensus/stats/ViewData;

    .line 93
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->view:Lio/opencensus/stats/View;

    invoke-virtual {p1}, Lio/opencensus/stats/ViewData;->getView()Lio/opencensus/stats/View;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->aggregationMap:Ljava/util/Map;

    .line 94
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData;->getAggregationMap()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    .line 95
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData;->getWindowData()Lio/opencensus/stats/ViewData$AggregationWindowData;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->start:Lio/opencensus/common/Timestamp;

    .line 96
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData;->getStart()Lio/opencensus/common/Timestamp;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->end:Lio/opencensus/common/Timestamp;

    .line 97
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData;->getEnd()Lio/opencensus/common/Timestamp;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getAggregationMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;",
            "Lio/opencensus/stats/AggregationData;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData;->aggregationMap:Ljava/util/Map;

    return-object v0
.end method

.method public getEnd()Lio/opencensus/common/Timestamp;
    .locals 1

    .line 72
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData;->end:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public getStart()Lio/opencensus/common/Timestamp;
    .locals 1

    .line 67
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData;->start:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public getView()Lio/opencensus/stats/View;
    .locals 1

    .line 51
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData;->view:Lio/opencensus/stats/View;

    return-object v0
.end method

.method public getWindowData()Lio/opencensus/stats/ViewData$AggregationWindowData;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 62
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData;->windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 106
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData;->view:Lio/opencensus/stats/View;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 108
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_ViewData;->aggregationMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 110
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_ViewData;->windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 112
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_ViewData;->start:Lio/opencensus/common/Timestamp;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 114
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->end:Lio/opencensus/common/Timestamp;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ViewData{view="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->view:Lio/opencensus/stats/View;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", aggregationMap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->aggregationMap:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", windowData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", start="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->start:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", end="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData;->end:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
