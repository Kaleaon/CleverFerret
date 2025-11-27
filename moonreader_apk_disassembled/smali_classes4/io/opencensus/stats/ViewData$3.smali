.class Lio/opencensus/stats/ViewData$3;
.super Ljava/lang/Object;
.source "ViewData.java"

# interfaces
.implements Lio/opencensus/common/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/opencensus/stats/ViewData;->checkWindow(Lio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/opencensus/common/Function<",
        "Lio/opencensus/stats/View$AggregationWindow$Cumulative;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;


# direct methods
.method constructor <init>(Lio/opencensus/stats/ViewData$AggregationWindowData;)V
    .locals 0

    .line 209
    iput-object p1, p0, Lio/opencensus/stats/ViewData$3;->val$windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 209
    check-cast p1, Lio/opencensus/stats/View$AggregationWindow$Cumulative;

    invoke-virtual {p0, p1}, Lio/opencensus/stats/ViewData$3;->apply(Lio/opencensus/stats/View$AggregationWindow$Cumulative;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/opencensus/stats/View$AggregationWindow$Cumulative;)Ljava/lang/Void;
    .locals 2

    .line 212
    iget-object v0, p0, Lio/opencensus/stats/ViewData$3;->val$windowData:Lio/opencensus/stats/ViewData$AggregationWindowData;

    instance-of v1, v0, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;

    invoke-static {v1, p1, v0}, Lio/opencensus/stats/ViewData;->access$100(ZLio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V

    const/4 p1, 0x0

    return-object p1
.end method
