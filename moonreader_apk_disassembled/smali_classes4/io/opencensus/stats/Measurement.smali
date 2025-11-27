.class public abstract Lio/opencensus/stats/Measurement;
.super Ljava/lang/Object;
.source "Measurement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/stats/Measurement$MeasurementLong;,
        Lio/opencensus/stats/Measurement$MeasurementDouble;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/stats/Measurement$1;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lio/opencensus/stats/Measurement;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getMeasure()Lio/opencensus/stats/Measure;
.end method

.method public abstract match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
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
.end method
