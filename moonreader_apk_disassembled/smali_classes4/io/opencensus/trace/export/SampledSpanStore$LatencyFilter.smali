.class public abstract Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;
.super Ljava/lang/Object;
.source "SampledSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/SampledSpanStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "LatencyFilter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 350
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;JJI)Lio/opencensus/trace/export/SampledSpanStore$LatencyFilter;
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p5, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 370
    :goto_0
    const-string v3, "Negative maxSpansToReturn."

    invoke-static {v2, v3}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    const-wide/16 v2, 0x0

    cmp-long v4, p1, v2

    if-ltz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    .line 371
    :goto_1
    const-string v5, "Negative latencyLowerNs"

    invoke-static {v4, v5}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    cmp-long v4, p3, v2

    if-ltz v4, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 372
    :goto_2
    const-string v1, "Negative latencyUpperNs"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 373
    new-instance v2, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;

    move-object v3, p0

    move-wide v4, p1

    move-wide v6, p3

    move v8, p5

    invoke-direct/range {v2 .. v8}, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_LatencyFilter;-><init>(Ljava/lang/String;JJI)V

    return-object v2
.end method


# virtual methods
.method public abstract getLatencyLowerNs()J
.end method

.method public abstract getLatencyUpperNs()J
.end method

.method public abstract getMaxSpansToReturn()I
.end method

.method public abstract getSpanName()Ljava/lang/String;
.end method
