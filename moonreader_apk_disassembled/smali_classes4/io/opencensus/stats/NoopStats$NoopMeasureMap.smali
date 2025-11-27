.class final Lio/opencensus/stats/NoopStats$NoopMeasureMap;
.super Lio/opencensus/stats/MeasureMap;
.source "NoopStats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/NoopStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopMeasureMap"
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private hasUnsupportedValues:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 126
    const-class v0, Lio/opencensus/stats/NoopStats$NoopMeasureMap;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/opencensus/stats/NoopStats$NoopMeasureMap;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 125
    invoke-direct {p0}, Lio/opencensus/stats/MeasureMap;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/stats/NoopStats$1;)V
    .locals 0

    .line 125
    invoke-direct {p0}, Lio/opencensus/stats/NoopStats$NoopMeasureMap;-><init>()V

    return-void
.end method


# virtual methods
.method public put(Lio/opencensus/stats/Measure$MeasureDouble;D)Lio/opencensus/stats/MeasureMap;
    .locals 2

    const-wide/16 v0, 0x0

    cmpg-double p1, p2, v0

    if-gez p1, :cond_0

    const/4 p1, 0x1

    .line 132
    iput-boolean p1, p0, Lio/opencensus/stats/NoopStats$NoopMeasureMap;->hasUnsupportedValues:Z

    :cond_0
    return-object p0
.end method

.method public put(Lio/opencensus/stats/Measure$MeasureLong;J)Lio/opencensus/stats/MeasureMap;
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-gez p1, :cond_0

    const/4 p1, 0x1

    .line 140
    iput-boolean p1, p0, Lio/opencensus/stats/NoopStats$NoopMeasureMap;->hasUnsupportedValues:Z

    :cond_0
    return-object p0
.end method

.method public record()V
    .locals 0

    return-void
.end method

.method public record(Lio/opencensus/tags/TagContext;)V
    .locals 2

    .line 150
    const-string v0, "tags"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    iget-boolean p1, p0, Lio/opencensus/stats/NoopStats$NoopMeasureMap;->hasUnsupportedValues:Z

    if-eqz p1, :cond_0

    .line 154
    sget-object p1, Lio/opencensus/stats/NoopStats$NoopMeasureMap;->logger:Ljava/util/logging/Logger;

    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v1, "Dropping values, value to record must be non-negative."

    invoke-virtual {p1, v0, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
