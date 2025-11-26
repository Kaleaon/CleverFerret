.class public abstract Lio/opencensus/stats/AggregationData;
.super Ljava/lang/Object;
.source "AggregationData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/stats/AggregationData$LastValueDataLong;,
        Lio/opencensus/stats/AggregationData$LastValueDataDouble;,
        Lio/opencensus/stats/AggregationData$DistributionData;,
        Lio/opencensus/stats/AggregationData$MeanData;,
        Lio/opencensus/stats/AggregationData$CountData;,
        Lio/opencensus/stats/AggregationData$SumDataLong;,
        Lio/opencensus/stats/AggregationData$SumDataDouble;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/stats/AggregationData$1;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lio/opencensus/stats/AggregationData;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
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
.end method
