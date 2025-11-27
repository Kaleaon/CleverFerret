.class public abstract Lio/opencensus/stats/Measurement$MeasurementDouble;
.super Lio/opencensus/stats/Measurement;
.source "Measurement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/Measurement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "MeasurementDouble"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, v0}, Lio/opencensus/stats/Measurement;-><init>(Lio/opencensus/stats/Measurement$1;)V

    return-void
.end method

.method public static create(Lio/opencensus/stats/Measure$MeasureDouble;D)Lio/opencensus/stats/Measurement$MeasurementDouble;
    .locals 1

    .line 69
    new-instance v0, Lio/opencensus/stats/AutoValue_Measurement_MeasurementDouble;

    invoke-direct {v0, p0, p1, p2}, Lio/opencensus/stats/AutoValue_Measurement_MeasurementDouble;-><init>(Lio/opencensus/stats/Measure$MeasureDouble;D)V

    return-object v0
.end method


# virtual methods
.method public abstract getMeasure()Lio/opencensus/stats/Measure$MeasureDouble;
.end method

.method public bridge synthetic getMeasure()Lio/opencensus/stats/Measure;
    .locals 1

    .line 58
    invoke-virtual {p0}, Lio/opencensus/stats/Measurement$MeasurementDouble;->getMeasure()Lio/opencensus/stats/Measure$MeasureDouble;

    move-result-object v0

    return-object v0
.end method

.method public abstract getValue()D
.end method

.method public match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Measurement$MeasurementDouble;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Measurement$MeasurementLong;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Measurement;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 88
    invoke-interface {p1, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
