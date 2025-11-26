.class final Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;
.super Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;
.source "AutoValue_ViewData_AggregationWindowData_CumulativeData.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final end:Lio/opencensus/common/Timestamp;

.field private final start:Lio/opencensus/common/Timestamp;


# direct methods
.method constructor <init>(Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;-><init>()V

    if-eqz p1, :cond_1

    .line 21
    iput-object p1, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->start:Lio/opencensus/common/Timestamp;

    if-eqz p2, :cond_0

    .line 25
    iput-object p2, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->end:Lio/opencensus/common/Timestamp;

    return-void

    .line 23
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null end"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 19
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null start"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 51
    :cond_0
    instance-of v1, p1, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 52
    check-cast p1, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;

    .line 53
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->start:Lio/opencensus/common/Timestamp;

    invoke-virtual {p1}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;->getStart()Lio/opencensus/common/Timestamp;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->end:Lio/opencensus/common/Timestamp;

    .line 54
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;->getEnd()Lio/opencensus/common/Timestamp;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getEnd()Lio/opencensus/common/Timestamp;
    .locals 1

    .line 35
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->end:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public getStart()Lio/opencensus/common/Timestamp;
    .locals 1

    .line 30
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->start:Lio/opencensus/common/Timestamp;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 63
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->start:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 65
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->end:Lio/opencensus/common/Timestamp;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CumulativeData{start="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->start:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", end="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;->end:Lio/opencensus/common/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
