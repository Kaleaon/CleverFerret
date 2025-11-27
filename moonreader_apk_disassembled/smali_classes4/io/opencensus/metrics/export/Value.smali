.class public abstract Lio/opencensus/metrics/export/Value;
.super Ljava/lang/Object;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/export/Value$ValueSummary;,
        Lio/opencensus/metrics/export/Value$ValueDistribution;,
        Lio/opencensus/metrics/export/Value$ValueLong;,
        Lio/opencensus/metrics/export/Value$ValueDouble;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static distributionValue(Lio/opencensus/metrics/export/Distribution;)Lio/opencensus/metrics/export/Value;
    .locals 0

    .line 75
    invoke-static {p0}, Lio/opencensus/metrics/export/Value$ValueDistribution;->create(Lio/opencensus/metrics/export/Distribution;)Lio/opencensus/metrics/export/Value$ValueDistribution;

    move-result-object p0

    return-object p0
.end method

.method public static doubleValue(D)Lio/opencensus/metrics/export/Value;
    .locals 0

    .line 53
    invoke-static {p0, p1}, Lio/opencensus/metrics/export/Value$ValueDouble;->create(D)Lio/opencensus/metrics/export/Value$ValueDouble;

    move-result-object p0

    return-object p0
.end method

.method public static longValue(J)Lio/opencensus/metrics/export/Value;
    .locals 0

    .line 64
    invoke-static {p0, p1}, Lio/opencensus/metrics/export/Value$ValueLong;->create(J)Lio/opencensus/metrics/export/Value$ValueLong;

    move-result-object p0

    return-object p0
.end method

.method public static summaryValue(Lio/opencensus/metrics/export/Summary;)Lio/opencensus/metrics/export/Value;
    .locals 0

    .line 86
    invoke-static {p0}, Lio/opencensus/metrics/export/Value$ValueSummary;->create(Lio/opencensus/metrics/export/Summary;)Lio/opencensus/metrics/export/Value$ValueSummary;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Double;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Long;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/metrics/export/Distribution;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/metrics/export/Summary;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/metrics/export/Value;",
            "TT;>;)TT;"
        }
    .end annotation
.end method
