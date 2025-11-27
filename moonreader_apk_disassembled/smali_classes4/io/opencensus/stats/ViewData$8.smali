.class Lio/opencensus/stats/ViewData$8;
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
        "Lio/opencensus/stats/Aggregation$LastValue;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$aggregation:Lio/opencensus/stats/Aggregation;

.field final synthetic val$aggregationData:Lio/opencensus/stats/AggregationData;

.field final synthetic val$measure:Lio/opencensus/stats/Measure;


# direct methods
.method constructor <init>(Lio/opencensus/stats/Measure;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V
    .locals 0

    .line 287
    iput-object p1, p0, Lio/opencensus/stats/ViewData$8;->val$measure:Lio/opencensus/stats/Measure;

    iput-object p2, p0, Lio/opencensus/stats/ViewData$8;->val$aggregationData:Lio/opencensus/stats/AggregationData;

    iput-object p3, p0, Lio/opencensus/stats/ViewData$8;->val$aggregation:Lio/opencensus/stats/Aggregation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 287
    check-cast p1, Lio/opencensus/stats/Aggregation$LastValue;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$8;->apply(Lio/opencensus/stats/Aggregation$LastValue;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/opencensus/stats/Aggregation$LastValue;)Ljava/lang/Void;
    .locals 3

    .line 290
    iget-object p1, p0, Lio/opencensus/stats/ViewData$8;->val$measure:Lio/opencensus/stats/Measure;

    new-instance v0, Lio/opencensus/stats/ViewData$8$1;

    invoke-direct {v0, p0}, Lio/opencensus/stats/ViewData$8$1;-><init>(Lio/opencensus/stats/ViewData$8;)V

    new-instance v1, Lio/opencensus/stats/ViewData$8$2;

    invoke-direct {v1, p0}, Lio/opencensus/stats/ViewData$8$2;-><init>(Lio/opencensus/stats/ViewData$8;)V

    .line 309
    invoke-static {}, Lio/opencensus/common/Functions;->throwAssertionError()Lio/opencensus/common/Function;

    move-result-object v2

    .line 290
    invoke-virtual {p1, v0, v1, v2}, Lio/opencensus/stats/Measure;->match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;

    const/4 p1, 0x0

    return-object p1
.end method
