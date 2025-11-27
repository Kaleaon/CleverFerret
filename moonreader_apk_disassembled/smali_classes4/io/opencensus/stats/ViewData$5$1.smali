.class Lio/opencensus/stats/ViewData$5$1;
.super Ljava/lang/Object;
.source "ViewData.java"

# interfaces
.implements Lio/opencensus/common/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/opencensus/stats/ViewData$5;->apply(Lio/opencensus/stats/Aggregation$Sum;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/opencensus/common/Function<",
        "Lio/opencensus/stats/Measure$MeasureDouble;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/opencensus/stats/ViewData$5;


# direct methods
.method constructor <init>(Lio/opencensus/stats/ViewData$5;)V
    .locals 0

    .line 251
    iput-object p1, p0, Lio/opencensus/stats/ViewData$5$1;->this$0:Lio/opencensus/stats/ViewData$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 251
    check-cast p1, Lio/opencensus/stats/Measure$MeasureDouble;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$5$1;->apply(Lio/opencensus/stats/Measure$MeasureDouble;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/opencensus/stats/Measure$MeasureDouble;)Ljava/lang/Void;
    .locals 2

    .line 254
    iget-object p1, p0, Lio/opencensus/stats/ViewData$5$1;->this$0:Lio/opencensus/stats/ViewData$5;

    iget-object p1, p1, Lio/opencensus/stats/ViewData$5;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    instance-of p1, p1, Lio/opencensus/stats/AggregationData$SumDataDouble;

    iget-object v0, p0, Lio/opencensus/stats/ViewData$5$1;->this$0:Lio/opencensus/stats/ViewData$5;

    iget-object v0, v0, Lio/opencensus/stats/ViewData$5;->val$aggregation:Lio/opencensus/stats/Aggregation;

    iget-object v1, p0, Lio/opencensus/stats/ViewData$5$1;->this$0:Lio/opencensus/stats/ViewData$5;

    iget-object v1, v1, Lio/opencensus/stats/ViewData$5;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    invoke-static {p1, v0, v1}, Lio/opencensus/stats/ViewData;->access$200(ZLio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)V

    const/4 p1, 0x0

    return-object p1
.end method
