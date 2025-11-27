.class Lio/opencensus/stats/ViewData$7;
.super Ljava/lang/Object;
.source "ViewData.java"

# interfaces
.implements Lio/opencensus/common/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/opencensus/stats/ViewData;->checkAggregation(Lio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Measure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/opencensus/common/Function<",
        "Lio/opencensus/stats/Aggregation$Distribution;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$aggregation:Lio/opencensus/stats/Aggregation;

.field final synthetic val$aggregationData:Lio/opencensus/stats/AggregationData;


# direct methods
.method constructor <init>(Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V
    .locals 0

    .line 279
    iput-object p1, p0, Lio/opencensus/stats/ViewData$7;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    iput-object p2, p0, Lio/opencensus/stats/ViewData$7;->val$aggregation:Lio/opencensus/stats/Aggregation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 279
    check-cast p1, Lio/opencensus/stats/Aggregation$Distribution;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$7;->apply(Lio/opencensus/stats/Aggregation$Distribution;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/opencensus/stats/Aggregation$Distribution;)Ljava/lang/Void;
    .locals 2

    .line 282
    iget-object p1, p0, Lio/opencensus/stats/ViewData$7;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    instance-of v0, p1, Lio/opencensus/stats/AggregationData$DistributionData;

    iget-object v1, p0, Lio/opencensus/stats/ViewData$7;->val$aggregation:Lio/opencensus/stats/Aggregation;

    invoke-static {v0, v1, p1}, Lio/opencensus/stats/ViewData;->access$200(ZLio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)V

    const/4 p1, 0x0

    return-object p1
.end method
