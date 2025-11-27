.class public abstract Lio/opencensus/stats/AggregationData$SumDataDouble;
.super Lio/opencensus/stats/AggregationData;
.source "AggregationData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/AggregationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SumDataDouble"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, v0}, Lio/opencensus/stats/AggregationData;-><init>(Lio/opencensus/stats/AggregationData$1;)V

    return-void
.end method

.method public static create(D)Lio/opencensus/stats/AggregationData$SumDataDouble;
    .locals 1

    .line 86
    new-instance v0, Lio/opencensus/stats/AutoValue_AggregationData_SumDataDouble;

    invoke-direct {v0, p0, p1}, Lio/opencensus/stats/AutoValue_AggregationData_SumDataDouble;-><init>(D)V

    return-object v0
.end method


# virtual methods
.method public abstract getSum()D
.end method

.method public final match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData$SumDataDouble;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData$SumDataLong;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData$CountData;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData$DistributionData;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData$LastValueDataDouble;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData$LastValueDataLong;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/AggregationData;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 106
    invoke-interface {p1, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
