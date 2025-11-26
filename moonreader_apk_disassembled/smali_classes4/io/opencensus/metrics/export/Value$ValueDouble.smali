.class abstract Lio/opencensus/metrics/export/Value$ValueDouble;
.super Lio/opencensus/metrics/export/Value;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/Value;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ValueDouble"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 106
    invoke-direct {p0}, Lio/opencensus/metrics/export/Value;-><init>()V

    return-void
.end method

.method static create(D)Lio/opencensus/metrics/export/Value$ValueDouble;
    .locals 1

    .line 125
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Value_ValueDouble;

    invoke-direct {v0, p0, p1}, Lio/opencensus/metrics/export/AutoValue_Value_ValueDouble;-><init>(D)V

    return-object v0
.end method


# virtual methods
.method abstract getValue()D
.end method

.method public final match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
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

    .line 115
    invoke-virtual {p0}, Lio/opencensus/metrics/export/Value$ValueDouble;->getValue()D

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
