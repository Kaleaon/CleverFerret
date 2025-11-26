.class public abstract Lio/opencensus/metrics/DoubleCumulative;
.super Ljava/lang/Object;
.source "DoubleCumulative.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative;,
        Lio/opencensus/metrics/DoubleCumulative$DoublePoint;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newNoopDoubleCumulative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/DoubleCumulative;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)",
            "Lio/opencensus/metrics/DoubleCumulative;"
        }
    .end annotation

    .line 133
    invoke-static {p0, p1, p2, p3}, Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract getDefaultTimeSeries()Lio/opencensus/metrics/DoubleCumulative$DoublePoint;
.end method

.method public abstract getOrCreateTimeSeries(Ljava/util/List;)Lio/opencensus/metrics/DoubleCumulative$DoublePoint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)",
            "Lio/opencensus/metrics/DoubleCumulative$DoublePoint;"
        }
    .end annotation
.end method

.method public abstract removeTimeSeries(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)V"
        }
    .end annotation
.end method
