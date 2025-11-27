.class public abstract Lio/opencensus/metrics/export/Summary$Snapshot$ValueAtPercentile;
.super Ljava/lang/Object;
.source "Summary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/Summary$Snapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ValueAtPercentile"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(DD)Lio/opencensus/metrics/export/Summary$Snapshot$ValueAtPercentile;
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    cmpg-double v4, v2, p0

    if-gez v4, :cond_0

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    cmpg-double v6, p0, v4

    if-gtz v6, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 171
    :goto_0
    const-string v5, "percentile must be in the interval (0.0, 100.0]"

    invoke-static {v4, v5}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    cmpl-double v4, p2, v2

    if-ltz v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 174
    :goto_1
    const-string v1, "value must be non-negative"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 175
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Summary_Snapshot_ValueAtPercentile;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/opencensus/metrics/export/AutoValue_Summary_Snapshot_ValueAtPercentile;-><init>(DD)V

    return-object v0
.end method


# virtual methods
.method public abstract getPercentile()D
.end method

.method public abstract getValue()D
.end method
