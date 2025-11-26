.class final Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;
.super Lio/opencensus/stats/View$AggregationWindow$Interval;
.source "AutoValue_View_AggregationWindow_Interval.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final duration:Lio/opencensus/common/Duration;


# direct methods
.method constructor <init>(Lio/opencensus/common/Duration;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Lio/opencensus/stats/View$AggregationWindow$Interval;-><init>()V

    if-eqz p1, :cond_0

    .line 19
    iput-object p1, p0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;->duration:Lio/opencensus/common/Duration;

    return-void

    .line 17
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null duration"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 39
    :cond_0
    instance-of v0, p1, Lio/opencensus/stats/View$AggregationWindow$Interval;

    if-eqz v0, :cond_1

    .line 40
    check-cast p1, Lio/opencensus/stats/View$AggregationWindow$Interval;

    .line 41
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;->duration:Lio/opencensus/common/Duration;

    invoke-virtual {p1}, Lio/opencensus/stats/View$AggregationWindow$Interval;->getDuration()Lio/opencensus/common/Duration;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getDuration()Lio/opencensus/common/Duration;
    .locals 1

    .line 24
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;->duration:Lio/opencensus/common/Duration;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 50
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;->duration:Lio/opencensus/common/Duration;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Interval{duration="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;->duration:Lio/opencensus/common/Duration;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
