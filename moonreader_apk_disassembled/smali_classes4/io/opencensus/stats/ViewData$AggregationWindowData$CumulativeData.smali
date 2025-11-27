.class public abstract Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;
.super Lio/opencensus/stats/ViewData$AggregationWindowData;
.source "ViewData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/ViewData$AggregationWindowData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CumulativeData"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 382
    invoke-direct {p0, v0}, Lio/opencensus/stats/ViewData$AggregationWindowData;-><init>(Lio/opencensus/stats/ViewData$1;)V

    return-void
.end method

.method public static create(Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;
    .locals 1

    .line 414
    invoke-virtual {p0, p1}, Lio/opencensus/common/Timestamp;->compareTo(Lio/opencensus/common/Timestamp;)I

    move-result v0

    if-gtz v0, :cond_0

    .line 417
    new-instance v0, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;

    invoke-direct {v0, p0, p1}, Lio/opencensus/stats/AutoValue_ViewData_AggregationWindowData_CumulativeData;-><init>(Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)V

    return-object v0

    .line 415
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Start time is later than end time."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public abstract getEnd()Lio/opencensus/common/Timestamp;
.end method

.method public abstract getStart()Lio/opencensus/common/Timestamp;
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

    .line 405
    invoke-interface {p1, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
