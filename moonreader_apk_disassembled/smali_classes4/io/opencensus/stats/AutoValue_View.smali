.class final Lio/opencensus/stats/AutoValue_View;
.super Lio/opencensus/stats/View;
.source "AutoValue_View.java"


# instance fields
.field private final aggregation:Lio/opencensus/stats/Aggregation;

.field private final columns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagKey;",
            ">;"
        }
    .end annotation
.end field

.field private final description:Ljava/lang/String;

.field private final measure:Lio/opencensus/stats/Measure;

.field private final name:Lio/opencensus/stats/View$Name;

.field private final window:Lio/opencensus/stats/View$AggregationWindow;


# direct methods
.method constructor <init>(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;Lio/opencensus/stats/View$AggregationWindow;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View$Name;",
            "Ljava/lang/String;",
            "Lio/opencensus/stats/Measure;",
            "Lio/opencensus/stats/Aggregation;",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagKey;",
            ">;",
            "Lio/opencensus/stats/View$AggregationWindow;",
            ")V"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Lio/opencensus/stats/View;-><init>()V

    if-eqz p1, :cond_5

    .line 30
    iput-object p1, p0, Lio/opencensus/stats/AutoValue_View;->name:Lio/opencensus/stats/View$Name;

    if-eqz p2, :cond_4

    .line 34
    iput-object p2, p0, Lio/opencensus/stats/AutoValue_View;->description:Ljava/lang/String;

    if-eqz p3, :cond_3

    .line 38
    iput-object p3, p0, Lio/opencensus/stats/AutoValue_View;->measure:Lio/opencensus/stats/Measure;

    if-eqz p4, :cond_2

    .line 42
    iput-object p4, p0, Lio/opencensus/stats/AutoValue_View;->aggregation:Lio/opencensus/stats/Aggregation;

    if-eqz p5, :cond_1

    .line 46
    iput-object p5, p0, Lio/opencensus/stats/AutoValue_View;->columns:Ljava/util/List;

    if-eqz p6, :cond_0

    .line 50
    iput-object p6, p0, Lio/opencensus/stats/AutoValue_View;->window:Lio/opencensus/stats/View$AggregationWindow;

    return-void

    .line 48
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null window"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 44
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null columns"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 40
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null aggregation"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 36
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null measure"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null description"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_5
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

    .line 101
    :cond_0
    instance-of v1, p1, Lio/opencensus/stats/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 102
    check-cast p1, Lio/opencensus/stats/View;

    .line 103
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->name:Lio/opencensus/stats/View$Name;

    invoke-virtual {p1}, Lio/opencensus/stats/View;->getName()Lio/opencensus/stats/View$Name;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->description:Ljava/lang/String;

    .line 104
    invoke-virtual {p1}, Lio/opencensus/stats/View;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->measure:Lio/opencensus/stats/Measure;

    .line 105
    invoke-virtual {p1}, Lio/opencensus/stats/View;->getMeasure()Lio/opencensus/stats/Measure;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->aggregation:Lio/opencensus/stats/Aggregation;

    .line 106
    invoke-virtual {p1}, Lio/opencensus/stats/View;->getAggregation()Lio/opencensus/stats/Aggregation;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->columns:Ljava/util/List;

    .line 107
    invoke-virtual {p1}, Lio/opencensus/stats/View;->getColumns()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->window:Lio/opencensus/stats/View$AggregationWindow;

    .line 108
    invoke-virtual {p1}, Lio/opencensus/stats/View;->getWindow()Lio/opencensus/stats/View$AggregationWindow;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getAggregation()Lio/opencensus/stats/Aggregation;
    .locals 1

    .line 70
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->aggregation:Lio/opencensus/stats/Aggregation;

    return-object v0
.end method

.method public getColumns()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagKey;",
            ">;"
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->columns:Ljava/util/List;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getMeasure()Lio/opencensus/stats/Measure;
    .locals 1

    .line 65
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->measure:Lio/opencensus/stats/Measure;

    return-object v0
.end method

.method public getName()Lio/opencensus/stats/View$Name;
    .locals 1

    .line 55
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->name:Lio/opencensus/stats/View$Name;

    return-object v0
.end method

.method public getWindow()Lio/opencensus/stats/View$AggregationWindow;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 81
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->window:Lio/opencensus/stats/View$AggregationWindow;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 117
    iget-object v0, p0, Lio/opencensus/stats/AutoValue_View;->name:Lio/opencensus/stats/View$Name;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 119
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_View;->description:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 121
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_View;->measure:Lio/opencensus/stats/Measure;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 123
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_View;->aggregation:Lio/opencensus/stats/Aggregation;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 125
    iget-object v2, p0, Lio/opencensus/stats/AutoValue_View;->columns:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 127
    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->window:Lio/opencensus/stats/View$AggregationWindow;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "View{name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->name:Lio/opencensus/stats/View$Name;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", measure="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->measure:Lio/opencensus/stats/Measure;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", aggregation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->aggregation:Lio/opencensus/stats/Aggregation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", columns="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->columns:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", window="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/stats/AutoValue_View;->window:Lio/opencensus/stats/View$AggregationWindow;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
