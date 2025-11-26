.class Lio/opencensus/stats/ViewData$1;
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
        "Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;",
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

    .line 136
    iput-object p1, p0, Lio/opencensus/stats/ViewData$1;->val$view:Lio/opencensus/stats/View;

    iput-object p2, p0, Lio/opencensus/stats/ViewData$1;->val$deepCopy:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;)Lio/opencensus/stats/ViewData;
    .locals 4

    .line 139
    iget-object v0, p0, Lio/opencensus/stats/ViewData$1;->val$view:Lio/opencensus/stats/View;

    iget-object v1, p0, Lio/opencensus/stats/ViewData$1;->val$deepCopy:Ljava/util/Map;

    .line 140
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p1}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;->getStart()Lio/opencensus/common/Timestamp;

    move-result-object v2

    invoke-virtual {p1}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;->getEnd()Lio/opencensus/common/Timestamp;

    move-result-object v3

    .line 139
    invoke-static {v0, v1, p1, v2, v3}, Lio/opencensus/stats/ViewData;->access$000(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 136
    check-cast p1, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$1;->apply(Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;)Lio/opencensus/stats/ViewData;

    move-result-object p1

    return-object p1
.end method
