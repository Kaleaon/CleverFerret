.class public abstract Lio/opencensus/metrics/DerivedLongCumulative;
.super Ljava/lang/Object;
.source "DerivedLongCumulative.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newNoopDerivedLongCumulative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/DerivedLongCumulative;
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
            "Lio/opencensus/metrics/DerivedLongCumulative;"
        }
    .end annotation

    .line 109
    invoke-static {p0, p1, p2, p3}, Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract createTimeSeries(Ljava/util/List;Ljava/lang/Object;Lio/opencensus/common/ToLongFunction;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;TT;",
            "Lio/opencensus/common/ToLongFunction<",
            "TT;>;)V"
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
