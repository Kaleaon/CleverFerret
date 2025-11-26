.class abstract Lio/opencensus/metrics/export/Value$ValueSummary;
.super Lio/opencensus/metrics/export/Value;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/Value;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ValueSummary"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 217
    invoke-direct {p0}, Lio/opencensus/metrics/export/Value;-><init>()V

    return-void
.end method

.method static create(Lio/opencensus/metrics/export/Summary;)Lio/opencensus/metrics/export/Value$ValueSummary;
    .locals 1

    .line 236
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Value_ValueSummary;

    invoke-direct {v0, p0}, Lio/opencensus/metrics/export/AutoValue_Value_ValueSummary;-><init>(Lio/opencensus/metrics/export/Summary;)V

    return-object v0
.end method


# virtual methods
.method abstract getValue()Lio/opencensus/metrics/export/Summary;
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

    .line 226
    invoke-virtual {p0}, Lio/opencensus/metrics/export/Value$ValueSummary;->getValue()Lio/opencensus/metrics/export/Summary;

    move-result-object p1

    invoke-interface {p4, p1}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
