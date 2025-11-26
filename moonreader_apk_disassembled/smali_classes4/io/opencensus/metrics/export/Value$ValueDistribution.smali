.class abstract Lio/opencensus/metrics/export/Value$ValueDistribution;
.super Lio/opencensus/metrics/export/Value;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/Value;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ValueDistribution"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 179
    invoke-direct {p0}, Lio/opencensus/metrics/export/Value;-><init>()V

    return-void
.end method

.method static create(Lio/opencensus/metrics/export/Distribution;)Lio/opencensus/metrics/export/Value$ValueDistribution;
    .locals 1

    .line 198
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Value_ValueDistribution;

    invoke-direct {v0, p0}, Lio/opencensus/metrics/export/AutoValue_Value_ValueDistribution;-><init>(Lio/opencensus/metrics/export/Distribution;)V

    return-object v0
.end method


# virtual methods
.method abstract getValue()Lio/opencensus/metrics/export/Distribution;
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

    .line 188
    invoke-virtual {p0}, Lio/opencensus/metrics/export/Value$ValueDistribution;->getValue()Lio/opencensus/metrics/export/Distribution;

    move-result-object p1

    invoke-interface {p3, p1}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
