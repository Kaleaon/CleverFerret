.class public abstract Lio/opencensus/stats/Measure;
.super Ljava/lang/Object;
.source "Measure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/stats/Measure$MeasureLong;,
        Lio/opencensus/stats/Measure$MeasureDouble;
    }
.end annotation


# static fields
.field private static final ERROR_MESSAGE_INVALID_NAME:Ljava/lang/String; = "Name should be a ASCII string with a length no greater than 255 characters."

.field static final NAME_MAX_LENGTH:I = 0xff


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/stats/Measure$1;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lio/opencensus/stats/Measure;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getDescription()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getUnit()Ljava/lang/String;
.end method

.method public abstract match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Measure$MeasureDouble;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Measure$MeasureLong;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Measure;",
            "TT;>;)TT;"
        }
    .end annotation
.end method
