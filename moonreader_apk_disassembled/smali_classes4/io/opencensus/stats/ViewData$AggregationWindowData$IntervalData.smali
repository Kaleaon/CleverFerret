.class public abstract Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;
.super Lio/opencensus/stats/ViewData$AggregationWindowData;
.source "ViewData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/ViewData$AggregationWindowData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "IntervalData"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 433
    invoke-direct {p0, v0}, Lio/opencensus/stats/ViewData$AggregationWindowData;-><init>(Lio/opencensus/stats/ViewData$1;)V

    return-void
.end method

.method public static create(Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;
    .locals 1

    .line 457
    new-instance v0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_IntervalData;

    invoke-direct {v0, p0}, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_IntervalData;-><init>(Lio/opencensus/common/Timestamp;)V

    return-object v0
.end method


# virtual methods
.method public abstract getEnd()Lio/opencensus/common/Timestamp;
.end method

.method public final match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/ViewData$AggregationWindowData;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 448
    invoke-interface {p2, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
