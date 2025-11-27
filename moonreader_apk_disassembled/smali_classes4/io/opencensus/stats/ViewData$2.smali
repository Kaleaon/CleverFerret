.class Lio/opencensus/stats/ViewData$2;
.super Ljava/lang/Object;
.source "ViewData.java"

# interfaces
.implements Lio/opencensus/common/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/opencensus/stats/ViewData;->create(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;)Lio/opencensus/stats/ViewData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/opencensus/common/Function<",
        "Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;",
        "Lio/opencensus/stats/ViewData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$deepCopy:Ljava/util/Map;

.field final synthetic val$view:Lio/opencensus/stats/View;


# direct methods
.method constructor <init>(Lio/opencensus/stats/View;Ljava/util/Map;)V
    .locals 0

    .line 143
    iput-object p1, p0, Lio/opencensus/stats/ViewData$2;->val$view:Lio/opencensus/stats/View;

    iput-object p2, p0, Lio/opencensus/stats/ViewData$2;->val$deepCopy:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;)Lio/opencensus/stats/ViewData;
    .locals 6

    .line 146
    iget-object v0, p0, Lio/opencensus/stats/ViewData$2;->val$view:Lio/opencensus/stats/View;

    invoke-virtual {v0}, Lio/opencensus/stats/View;->getWindow()Lio/opencensus/stats/View$AggregationWindow;

    move-result-object v0

    check-cast v0, Lio/opencensus/stats/View$AggregationWindow$Interval;

    invoke-virtual {v0}, Lio/opencensus/stats/View$AggregationWindow$Interval;->getDuration()Lio/opencensus/common/Duration;

    move-result-object v0

    .line 147
    iget-object v1, p0, Lio/opencensus/stats/ViewData$2;->val$view:Lio/opencensus/stats/View;

    iget-object v2, p0, Lio/opencensus/stats/ViewData$2;->val$deepCopy:Ljava/util/Map;

    .line 149
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    .line 151
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;->getEnd()Lio/opencensus/common/Timestamp;

    move-result-object v3

    .line 152
    invoke-virtual {v0}, Lio/opencensus/common/Duration;->getSeconds()J

    move-result-wide v4

    neg-long v4, v4

    invoke-virtual {v0}, Lio/opencensus/common/Duration;->getNanos()I

    move-result v0

    neg-int v0, v0

    invoke-static {v4, v5, v0}, Lio/opencensus/common/Duration;->create(JI)Lio/opencensus/common/Duration;

    move-result-object v0

    invoke-virtual {v3, v0}, Lio/opencensus/common/Timestamp;->addDuration(Lio/opencensus/common/Duration;)Lio/opencensus/common/Timestamp;

    move-result-object v0

    .line 153
    invoke-virtual {p1}, Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;->getEnd()Lio/opencensus/common/Timestamp;

    move-result-object v3

    .line 147
    invoke-static {v1, v2, p1, v0, v3}, Lio/opencensus/stats/ViewData;->access$000(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 143
    check-cast p1, Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$2;->apply(Lio/opencensus/stats/ViewData$AggregationWindowData$IntervalData;)Lio/opencensus/stats/ViewData;

    move-result-object p1

    return-object p1
.end method
