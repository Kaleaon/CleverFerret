.class Lio/opencensus/stats/ViewData$9;
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
        "Lio/opencensus/stats/Aggregation;",
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

    .line 313
    iput-object p1, p0, Lio/opencensus/stats/ViewData$9;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    iput-object p2, p0, Lio/opencensus/stats/ViewData$9;->val$aggregation:Lio/opencensus/stats/Aggregation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 313
    check-cast p1, Lio/opencensus/stats/Aggregation;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$9;->apply(Lio/opencensus/stats/Aggregation;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/opencensus/stats/Aggregation;)Ljava/lang/Void;
    .locals 2

    .line 319
    instance-of p1, p1, Lio/opencensus/stats/Aggregation$Mean;

    if-eqz p1, :cond_0

    .line 320
    iget-object p1, p0, Lio/opencensus/stats/ViewData$9;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    instance-of v0, p1, Lio/opencensus/stats/AggregationData$MeanData;

    iget-object v1, p0, Lio/opencensus/stats/ViewData$9;->val$aggregation:Lio/opencensus/stats/Aggregation;

    invoke-static {v0, v1, p1}, Lio/opencensus/stats/ViewData;->access$200(ZLio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)V

    const/4 p1, 0x0

    return-object p1

    .line 326
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method
