.class public abstract Lio/opencensus/metrics/export/Summary;
.super Ljava/lang/Object;
.source "Summary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/export/Summary$Snapshot;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Long;Ljava/lang/Double;)V
    .locals 0

    .line 38
    invoke-static {p0, p1}, Lio/opencensus/metrics/export/Summary;->checkCountAndSum(Ljava/lang/Long;Ljava/lang/Double;)V

    return-void
.end method

.method private static checkCountAndSum(Ljava/lang/Long;Ljava/lang/Double;)V
    .locals 9
    .param p0    # Ljava/lang/Long;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Double;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p0, :cond_1

    .line 181
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v6, v4, v0

    if-ltz v6, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v4, 0x1

    :goto_1
    const-string v5, "count must be non-negative."

    invoke-static {v4, v5}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    const-wide/16 v4, 0x0

    if-eqz p1, :cond_3

    .line 182
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpl-double v8, v6, v4

    if-ltz v8, :cond_2

    goto :goto_2

    :cond_2
    const/4 v6, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v6, 0x1

    :goto_3
    const-string v7, "sum must be non-negative."

    invoke-static {v6, v7}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    if-eqz p0, :cond_6

    .line 183
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long p0, v6, v0

    if-nez p0, :cond_6

    if-eqz p1, :cond_4

    .line 184
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    cmpl-double v0, p0, v4

    if-nez v0, :cond_5

    :cond_4
    const/4 v2, 0x1

    :cond_5
    const-string p0, "sum must be 0 if count is 0."

    invoke-static {v2, p0}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    :cond_6
    return-void
.end method

.method public static create(Ljava/lang/Long;Ljava/lang/Double;Lio/opencensus/metrics/export/Summary$Snapshot;)Lio/opencensus/metrics/export/Summary;
    .locals 1
    .param p0    # Ljava/lang/Long;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Double;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-static {p0, p1}, Lio/opencensus/metrics/export/Summary;->checkCountAndSum(Ljava/lang/Long;Ljava/lang/Double;)V

    .line 52
    const-string v0, "snapshot"

    invoke-static {p2, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Summary;

    invoke-direct {v0, p0, p1, p2}, Lio/opencensus/metrics/export/AutoValue_Summary;-><init>(Ljava/lang/Long;Ljava/lang/Double;Lio/opencensus/metrics/export/Summary$Snapshot;)V

    return-object v0
.end method


# virtual methods
.method public abstract getCount()Ljava/lang/Long;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract getSnapshot()Lio/opencensus/metrics/export/Summary$Snapshot;
.end method

.method public abstract getSum()Ljava/lang/Double;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
